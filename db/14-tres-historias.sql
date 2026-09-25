-- Canver — tres historias para empezar
--
-- UN SOLO USO. No es una migración y no se vuelve a correr: borra historias.
-- Se corrió una vez el 25-sep-2026, a pedido del dueño, cuando las cinco
-- semillas seguían sin continuar.
--
-- La prueba arranca con tres y no con cinco: el resto lo siembra la gente, al
-- final de la lectura. Se quedan el tren (ana), la biblioteca (olga) y
-- noviembre (isis). Se van la sal de la abuela (mireia) y la sopa tibia
-- (cielo). Sus autoras siguen en people, como las otras voces de la ficción.
--
-- Solo borra si nadie las continuó: si alguna ya tiene hijos, no toca nada.

do $$
declare
  v_ids uuid[];
begin
  select array_agg(story_id) into v_ids
    from fragments
   where parent_id is null
     and text in (
       'Mi abuela guardaba la sal en un frasco con la etiqueta de otra cosa.',
       'La sopa estaba tibia, como si alguien acabara de salir por la otra puerta.'
     );

  if exists (select 1 from fragments where story_id = any(v_ids) and parent_id is not null) then
    raise exception 'alguien ya continuó una de las dos: no se borra nada';
  end if;

  delete from stories where id = any(v_ids);   -- fragmentos y guardadas caen en cascada
end $$;
