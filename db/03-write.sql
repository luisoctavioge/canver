-- Canver — escribir una línea
--
-- Las reglas del sistema viven aquí y no en el navegador. Un cliente se puede
-- manipular; esto no. La función corre como dueña de las tablas, así que puede
-- descontar el turno aunque no exista política de update para nadie más.

create or replace function write_line(
  p_person text,
  p_parent uuid,
  p_text   text
) returns fragments
language plpgsql
security definer
set search_path = public
as $$
declare
  v_turns   int;
  v_story   uuid;
  v_depth   int;      -- profundidad del padre; la raíz es 0
  v_new     int;      -- profundidad de la línea nueva
  v_para    int;      -- en qué párrafo cae
  v_pos     int;      -- qué lugar ocupa dentro de él
  v_hands   text[];
  v_kids    int;
  v_frag    fragments;
begin
  if p_text is null or char_length(btrim(p_text)) = 0 then
    raise exception 'la línea viene vacía';
  end if;

  select turns into v_turns from people where id = p_person;
  if v_turns is null then
    raise exception 'no existe la persona %', p_person;
  end if;
  if v_turns <= 0 then
    raise exception 'sin turnos';
  end if;

  -- el camino desde el padre hasta la raíz, para saber dónde cae la línea
  with recursive path as (
    select id, parent_id, story_id, author_id, 0 as d
      from fragments where id = p_parent
    union all
    select f.id, f.parent_id, f.story_id, f.author_id, path.d + 1
      from fragments f join path on f.id = path.parent_id
  )
  select max(d), min(story_id) into v_depth, v_story from path;

  if v_depth is null then
    raise exception 'no existe el fragmento padre';
  end if;

  v_new  := v_depth + 1;
  v_para := v_new / 5;
  v_pos  := v_new % 5;

  -- una historia son cinco párrafos, y ahí termina
  if v_para > 4 then
    raise exception 'la historia ya está completa';
  end if;

  -- dentro de un párrafo no se bifurca: eso solo pasa en su frontera
  select count(*) into v_kids from fragments where parent_id = p_parent;
  if v_pos <> 0 and v_kids > 0 then
    raise exception 'ese lugar ya está tomado';
  end if;

  -- cinco líneas, cinco manos distintas: nadie escribe dos veces en el mismo
  with recursive path as (
    select id, parent_id, author_id, 0 as d
      from fragments where id = p_parent
    union all
    select f.id, f.parent_id, f.author_id, path.d + 1
      from fragments f join path on f.id = path.parent_id
  )
  select array_agg(author_id) into v_hands
    from path where (v_depth - d) / 5 = v_para;

  if v_pos <> 0 and p_person = any(v_hands) then
    raise exception 'tu línea ya está en este párrafo';
  end if;

  insert into fragments (story_id, parent_id, author_id, text)
    values (v_story, p_parent, p_person, btrim(p_text))
    returning * into v_frag;

  update people set turns = turns - 1 where id = p_person;

  return v_frag;
end;
$$;

-- Sembrar una historia nueva cuesta más que continuar, y por eso va aparte.
-- Todavía no se usa desde el producto; queda escrita para cuando toque.
create or replace function seed_story(
  p_person text,
  p_text   text
) returns fragments
language plpgsql
security definer
set search_path = public
as $$
declare
  v_turns int;
  v_story uuid;
  v_frag  fragments;
begin
  select turns into v_turns from people where id = p_person;
  if v_turns is null then
    raise exception 'no existe la persona %', p_person;
  end if;
  if v_turns < 3 then
    raise exception 'sembrar cuesta tres turnos';
  end if;

  insert into stories (seeded_by) values (p_person) returning id into v_story;
  insert into fragments (story_id, parent_id, author_id, text)
    values (v_story, null, p_person, btrim(p_text))
    returning * into v_frag;

  update people set turns = turns - 3 where id = p_person;
  return v_frag;
end;
$$;

grant execute on function write_line(text, uuid, text) to anon;
grant execute on function seed_story(text, text) to anon;
