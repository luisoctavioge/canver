-- Canver — la bienvenida, una sola vez
--
-- La primera vez que alguien abre su link ve dos frases que le dicen qué
-- hacer, y nunca más. El prototipo no guarda nada en el navegador, y la
-- identidad viaja en el link, así que quién ya la vio lo recuerda la base: la
-- misma persona en otro teléfono no la vuelve a ver.
--
-- welcome() la marca y contesta si era la primera vez, en un solo paso: dos
-- pestañas abiertas a la vez no la muestran dos veces.

alter table people add column if not exists welcomed_at timestamptz;

create or replace function welcome(p_person text)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
begin
  update people set welcomed_at = now()
   where id = p_person and welcomed_at is null;
  return found;
end;
$$;

grant execute on function welcome(text) to anon;
