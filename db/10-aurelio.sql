-- Canver — una persona más para la primera prueba
--
-- Aurelio entra como las otras once: su nombre es su link, y el pronombre
-- queda en null: lo pone cada quien, y un nombre no lo dice.

insert into people (id) values
  ('aurelio')
on conflict (id) do nothing;
