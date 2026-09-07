-- Canver — la gente de la primera prueba
--
-- Once personas, y su nombre es su link: quien tenga el link es esa persona.
-- Identidad floja a propósito, que entre amigos alcanza y para abrir al mundo
-- no. Los acentos y las mayúsculas se caen porque el identificador viaja en la
-- URL; el nombre con el que se les llama fuera de aquí no lo decide la base.
--
-- El pronombre queda en null: lo pone cada quien, y un nombre no lo dice.
--
-- Los dieciséis nombres de la ficción se quedan donde están. Cinco de ellos
-- firman las cinco primeras líneas y no se pueden borrar sin borrarlas; los
-- otros once ya no firman nada y tampoco estorban.

insert into people (id) values
  ('iman'),
  ('fany'),
  ('victor'),
  ('pim'),
  ('vladi'),
  ('rene'),
  ('ludo'),
  ('esme'),
  ('monse'),
  ('mathilde'),
  ('jesus')
on conflict (id) do nothing;
