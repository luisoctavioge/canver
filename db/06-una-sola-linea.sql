-- Canver — el corpus vuelve a la primera línea
--
-- Hasta aquí la base traía las cinco historias del prototipo ya escritas, 74
-- fragmentos. Servían para mirar el producto, pero no para probarlo: quien
-- entra a leer algo terminado no tiene nada que continuar, y continuar es lo
-- único que hay que medir. Así que el corpus se poda hasta la semilla. Cinco
-- historias, una línea cada una, y de ahí en adelante lo escribe la gente.
--
-- No se pierde texto de nadie: las frases eran todas del prototipo, y las cinco
-- que quedan siguen siendo de su autor. La regla 8 sigue en pie.
--
-- Este archivo también trae el arreglo de write_line que quedó pendiente en el
-- 05 y nunca llegó a correr: sin él no se puede escribir, y una base sembrada
-- de una línea con la escritura rota no sirve para nada. El 05 queda como
-- estaba, sin correr nunca; lo que vale es esto.
--
-- CORRER UNA SOLA VEZ, a mano, en el editor de SQL. No es una migración y no
-- va en supabase/migrations a propósito: la poda borra todo fragmento que
-- cuelgue de una semilla, y repetirla cuando la gente ya escribió sería borrar
-- justo lo que veníamos a medir.

-- ---------------------------------------------------------------- 1. la poda

begin;

-- Dos de las cinco historias empezaban por una costura —eran el tramo medio de
-- la historia del tren, partida en tres— y como primera línea no abren nada.
delete from stories where id in (
  '40f70eeb-40c1-45a2-aaa1-e52411148b1c',   -- 'Los reconoció a todos…'
  '7a1ae937-f073-4d78-a2b2-7ba59725efd4'    -- 'Y esperó, sin apuro…'
);

-- Y de las que quedan, todo lo que colgaba de la primera línea. Los likes se
-- van solos detrás, por la cascada.
delete from fragments where parent_id is not null;

-- En su lugar, dos frases que sí abren. Ya estaban escritas, por isis y por
-- cielo, dentro de lo que acabamos de podar.
insert into stories (id, seeded_by) values
  ('6a117d77-9b1c-44f8-8c4a-002b628c75d6', 'isis'),
  ('1793cc2b-a8d0-4c40-9328-22884f22049a', 'cielo')
on conflict (id) do nothing;

insert into fragments (id, story_id, parent_id, author_id, text) values
  ('08816fc7-9dc6-48bf-a70b-0e20e7c6a94f', '6a117d77-9b1c-44f8-8c4a-002b628c75d6', null, 'isis', 'Afuera no había nieve: había noviembre, y una calle con dos aceras iguales.'),
  ('d09ece78-6cf8-472a-b54b-44704e825988', '1793cc2b-a8d0-4c40-9328-22884f22049a', null, 'cielo', 'La sopa estaba tibia, como si alguien acabara de salir por la otra puerta.')
on conflict (id) do nothing;

commit;

-- ---------------------------------------------------------------- 2. escribir

-- La versión anterior sacaba la historia con min(story_id) sobre el camino
-- recursivo, y en Postgres no existe min() para uuid: la llamada moría con
-- 42883 antes de escribir nada. La historia no hacía falta agregarla — un hijo
-- está siempre en la misma historia que su padre, así que se lee directo.

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

  if v_para > 4 then
    raise exception 'la historia ya está completa';
  end if;

  select count(*) into v_kids from fragments where parent_id = p_parent;
  if v_pos <> 0 and v_kids > 0 then
    raise exception 'ese lugar ya está tomado';
  end if;
  if v_pos = 0 and v_kids >= 5 then
    raise exception 'este momento ya tiene cinco versiones';
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
