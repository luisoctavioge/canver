-- Canver — dos turnos al día, y saber qué llegó desde tu última visita
--
-- Dos cosas que van juntas porque se corren de una sola vez.
--
-- 1. El turno pasa de uno a dos al día. La primera prueba mira cómo escribe
--    la gente, y con un turno diario alguien que entra una vez y se topa con
--    un párrafo donde ya tiene línea se queda sin poder escribir ese día.
--
-- 2. Cada persona guarda cuándo estuvo aquí por última vez. Con eso el lector
--    puede distinguir lo que llegó desde entonces, que es lo único que
--    convierte volver en algo que valga la pena.

-- ---------------------------------------------------------------- 1. turnos

create or replace function refresh_turns(p_person text)
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_cap   constant int := 5;      -- se puede ahorrar, no atesorar
  v_dia   constant int := 2;      -- lo que se cobra por día cumplido
  v_days  int;
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
       set turns    = least(v_cap, turns + v_days * v_dia),
           turns_at = turns_at + make_interval(days => v_days)
     where id = p_person;
  end if;

  select turns into v_turns from people where id = p_person;
  return v_turns;
end;
$$;

-- ---------------------------------------------------------------- 2. lo nuevo

-- Cuándo pasaste por aquí la última vez. Para quien ya existe es ahora mismo:
-- lo que hay escrito hasta hoy no es novedad de nadie, es el punto de partida.
alter table people add column if not exists seen_at timestamptz not null default now();

-- Devuelve el momento de tu visita anterior y apunta esta. No se mueve en cada
-- carga: recargar la página en la misma sentada borraría lo que todavía no has
-- alcanzado a leer, así que solo cuenta como otra visita si pasó media hora.
create or replace function mark_seen(p_person text)
returns timestamptz
language plpgsql
security definer
set search_path = public
as $$
declare
  v_prev timestamptz;
begin
  select seen_at into v_prev from people where id = p_person;
  if v_prev is null then
    raise exception 'no existe la persona %', p_person;
  end if;

  if now() - v_prev > interval '30 minutes' then
    update people set seen_at = now() where id = p_person;
  end if;

  return v_prev;
end;
$$;

grant execute on function refresh_turns(text) to anon;
grant execute on function mark_seen(text) to anon;
