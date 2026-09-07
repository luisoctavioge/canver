-- Canver — semilla
--
-- Todo empieza en una sola línea. Cinco historias sembradas y nada más: ningún
-- párrafo está cerrado, ningún fork está abierto, y el corpus entero cabe en
-- cinco frases. Lo que se lea después lo habrá escrito alguien.
--
-- Las cinco frases ya existían en el prototipo, con su autor original: ni una
-- palabra nueva. La regla 8 sigue en pie. Lo único que se hizo fue elegir, de
-- entre lo escrito, las líneas que abren en vez de continuar.

insert into people (id, pronoun) values
  ('ana', 'ella'),
  ('bruno', 'él'),
  ('mireia', 'elle'),
  ('kai', 'ella'),
  ('dana', 'él'),
  ('jonas', 'elle'),
  ('olga', 'ella'),
  ('sara', 'él'),
  ('ruy', 'elle'),
  ('tavo', 'ella'),
  ('lia', 'él'),
  ('martin', 'elle'),
  ('isis', 'ella'),
  ('nube', 'él'),
  ('cielo', 'elle'),
  ('you', null)
on conflict (id) do nothing;

-- ---------------------------------------------------------------- el tren
insert into stories (id, seeded_by) values ('cf1f0db1-3b43-4102-a866-fa20598a0b38', 'ana');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('6a6c7e3a-2d71-4a43-b01f-cd9c0636a077', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', null, 'ana', 'El último tren salió sin nadie adentro y aun así llegó tarde.');

-- ---------------------------------------------------------------- la biblioteca
insert into stories (id, seeded_by) values ('15aa1b67-566b-4e7c-a315-0b645782970b', 'olga');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('92c12564-bc72-44e4-a85f-37dce64a32cd', '15aa1b67-566b-4e7c-a315-0b645782970b', null, 'olga', 'La biblioteca cerró en 1994 y siguió recibiendo devoluciones.');

-- ---------------------------------------------------------------- la sal
insert into stories (id, seeded_by) values ('c9f6bb77-b191-45ab-9451-c01feefb1086', 'mireia');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('f2496e7f-3003-4a19-9c9d-23a9301c2ba0', 'c9f6bb77-b191-45ab-9451-c01feefb1086', null, 'mireia', 'Mi abuela guardaba la sal en un frasco con la etiqueta de otra cosa.');

-- ---------------------------------------------------------------- noviembre
insert into stories (id, seeded_by) values ('6a117d77-9b1c-44f8-8c4a-002b628c75d6', 'isis');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('08816fc7-9dc6-48bf-a70b-0e20e7c6a94f', '6a117d77-9b1c-44f8-8c4a-002b628c75d6', null, 'isis', 'Afuera no había nieve: había noviembre, y una calle con dos aceras iguales.');

-- ---------------------------------------------------------------- la sopa
insert into stories (id, seeded_by) values ('1793cc2b-a8d0-4c40-9328-22884f22049a', 'cielo');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('d09ece78-6cf8-472a-b54b-44704e825988', '1793cc2b-a8d0-4c40-9328-22884f22049a', null, 'cielo', 'La sopa estaba tibia, como si alguien acabara de salir por la otra puerta.');
