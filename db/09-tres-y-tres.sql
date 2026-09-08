-- Canver — tres párrafos, tres versiones
--
-- La historia baja de cinco párrafos a tres: quince líneas por quince manos en
-- vez de veinticinco. Cinco líneas por párrafo se quedan como estaban — lo que
-- sobraba no era el texto de la pantalla, era el camino hasta el final. Una
-- historia que pide veinticinco personas distintas no se termina nunca con
-- veintisiete en la base y dos turnos al día; con quince, sí.
--
-- El eje horizontal baja de cinco versiones a tres por el mismo motivo, al
-- revés: cinco huecos por momento reparten las manos en cinco caminos que no
-- avanzan, y las ramas del prototipo ya se morían a los tres o cuatro
-- fragmentos. Tres versiones concentran, y siguen siendo más de una.
--
-- Solo cambian dos topes dentro de write_line. El resto de la función es la
-- del 06 palabra por palabra, y los /5 y %5 son las cinco líneas del párrafo,
-- que no se tocan.

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

  select story_id into v_story from fragments where id = p_parent;
  if v_story is null then
    raise exception 'no existe el fragmento padre';
  end if;

  -- a qué profundidad cuelga el padre; la raíz es 0
  with recursive path as (
    select id, parent_id, 0 as d
      from fragments where id = p_parent
    union all
    select f.id, f.parent_id, path.d + 1
      from fragments f join path on f.id = path.parent_id
  )
  select max(d) into v_depth from path;

  v_new  := v_depth + 1;
  v_para := v_new / 5;
  v_pos  := v_new % 5;

  if v_para > 2 then
    raise exception 'la historia ya está completa';
  end if;

  select count(*) into v_kids from fragments where parent_id = p_parent;
  if v_pos <> 0 and v_kids > 0 then
    raise exception 'ese lugar ya está tomado';
  end if;
  if v_pos = 0 and v_kids >= 3 then
    raise exception 'este momento ya tiene tres versiones';
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

  if v_pos <> 0 and p_person = any(coalesce(v_hands, array[]::text[])) then
    raise exception 'tu línea ya está en este párrafo';
  end if;

  insert into fragments (story_id, parent_id, author_id, text)
    values (v_story, p_parent, p_person, btrim(p_text))
    returning * into v_frag;

  update people set turns = turns - 1 where id = p_person;

  return v_frag;
end;
$$;

grant execute on function write_line(text, uuid, text) to anon;
