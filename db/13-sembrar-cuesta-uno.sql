-- Canver — empezar cuesta lo mismo que continuar
--
-- Sembrar costaba tres turnos para que no todos sembraran y nadie continuara.
-- Con dos al día eso era un día entero ahorrando para una sola línea, y la
-- primera prueba empieza con tres historias: si nadie puede abrir otra, el
-- corpus se queda en tres. Todo vale un turno, continuar o comenzar, y la
-- historia nueva aparece al final de la lectura, cuando ya no queda nada que
-- continuar — que es lo que sigue protegiendo a las que ya existen.
--
-- Lo demás es lo de siempre: la línea no viene vacía y la base cobra el turno
-- en la misma transacción que la escribe.

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
  if p_text is null or char_length(btrim(p_text)) = 0 then
    raise exception 'la línea viene vacía';
  end if;

  v_turns := refresh_turns(p_person);
  if v_turns <= 0 then
    raise exception 'sin turnos';
  end if;

  insert into stories (seeded_by) values (p_person) returning id into v_story;
  insert into fragments (story_id, parent_id, author_id, text)
    values (v_story, null, p_person, btrim(p_text))
    returning * into v_frag;

  update people set turns = turns - 1 where id = p_person;
  return v_frag;
end;
$$;

grant execute on function seed_story(text, text) to anon;
