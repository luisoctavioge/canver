-- Canver — corregir la línea propia
--
-- Quien escribe se equivoca, y una errata no debería quedarse para siempre en
-- un texto de muchas manos. Pero una línea que alguien ya continuó dejó de ser
-- solo tuya: la siguiente persona le contestó a esas palabras, y cambiarlas
-- cambiaría lo que ella dijo. Así que se corrige mientras nadie haya escrito
-- después, y ni un momento más.
--
-- Corregir no gasta turno: no es una línea nueva, es la misma.
--
-- La tabla sigue sin política de update. Solo esta función toca el texto, y
-- ella es la que comprueba que la línea sea tuya y siga suelta.

create or replace function edit_line(
  p_person text,
  p_id     uuid,
  p_text   text
) returns fragments
language plpgsql
security definer
set search_path = public
as $$
declare
  v_frag fragments;
begin
  if p_text is null or char_length(btrim(p_text)) = 0 then
    raise exception 'la línea viene vacía';
  end if;

  select * into v_frag from fragments where id = p_id for update;
  if v_frag.id is null then
    raise exception 'no existe esa línea';
  end if;
  if v_frag.author_id <> p_person then
    raise exception 'esa línea no es tuya';
  end if;
  if exists (select 1 from fragments where parent_id = p_id) then
    raise exception 'alguien ya continuó tu línea';
  end if;

  update fragments set text = btrim(p_text)
    where id = p_id
    returning * into v_frag;

  return v_frag;
end;
$$;

grant execute on function edit_line(text, uuid, text) to anon;
