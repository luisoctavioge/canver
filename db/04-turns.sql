-- Canver — los turnos se reponen solos
--
-- Un turno al día, hasta cinco guardados. No hace falta un programador de
-- tareas: en vez de repartir turnos a todo el mundo cada noche, cada quien
-- cobra los suyos la próxima vez que aparece. Menos maquinaria y menos que
-- mantener, que es lo que mató a los antecesores del proyecto.
--
-- turns_at no se pone en now() al cobrar, sino que avanza tantos días como se
-- cobraron. Así no se pierde el rato que ya llevabas acumulado: si vuelves a
-- las 23 horas y media, esa media hora sigue contando para mañana.

create or replace function refresh_turns(p_person text)
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_cap  constant int := 5;      -- se puede ahorrar, no atesorar
  v_days int;
  v_turns int;
begin
  select floor(extract(epoch from (now() - turns_at)) / 86400)::int
    into v_days
    from people where id = p_person;

  if v_days is null then
    raise exception 'no existe la persona %', p_person;
  end if;

  if v_days > 0 then
    update people
       set turns    = least(v_cap, turns + v_days),
           turns_at = turns_at + make_interval(days => v_days)
     where id = p_person;
  end if;

  select turns into v_turns from people where id = p_person;
  return v_turns;
end;
$$;

-- Escribir cobra primero lo que le toca a la persona: si no, se le negaría un
-- turno que ya se había ganado.
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
  v_depth   int;
  v_new     int;
  v_para    int;
  v_pos     int;
  v_hands   text[];
  v_kids    int;
  v_frag    fragments;
begin
  if p_text is null or char_length(btrim(p_text)) = 0 then
    raise exception 'la línea viene vacía';
  end if;

  v_turns := refresh_turns(p_person);
  if v_turns <= 0 then
    raise exception 'sin turnos';
  end if;

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

  if v_para > 4 then
    raise exception 'la historia ya está completa';
  end if;

  select count(*) into v_kids from fragments where parent_id = p_parent;
  if v_pos <> 0 and v_kids > 0 then
    raise exception 'ese lugar ya está tomado';
  end if;

  -- cinco versiones por momento, y ahí se cierra el eje horizontal
  if v_pos = 0 and v_kids >= 5 then
    raise exception 'este momento ya tiene cinco versiones';
  end if;

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
  v_turns := refresh_turns(p_person);
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

grant execute on function refresh_turns(text) to anon;
grant execute on function write_line(text, uuid, text) to anon;
grant execute on function seed_story(text, text) to anon;
