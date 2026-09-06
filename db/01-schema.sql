-- Canver — esquema
--
-- El fragmento es la única unidad publicable y tiene exactamente un padre, así
-- que la base entera es una tabla de fragmentos y poco más. El párrafo no tiene
-- tabla: es emergente, cinco fragmentos, y se identifica por el primero de
-- ellos. Lo mismo el canon, que no se guarda: se cuenta desde `likes`.

-- ---------------------------------------------------------------- personas

create table people (
  id          text primary key,          -- el handle: 'ana', 'bruno'
  pronoun     text,                      -- lo pone cada quien; un nombre no lo dice
  turns       int  not null default 3,
  turns_at    timestamptz not null default now(),
  created_at  timestamptz not null default now()
);

-- ---------------------------------------------------------------- historias

create table stories (
  id          uuid primary key default gen_random_uuid(),
  seeded_by   text references people(id),
  created_at  timestamptz not null default now()
);

-- ---------------------------------------------------------------- fragmentos

create table fragments (
  id          uuid primary key default gen_random_uuid(),
  story_id    uuid not null references stories(id) on delete cascade,
  parent_id   uuid references fragments(id) on delete cascade,
  author_id   text not null references people(id),
  text        text not null check (char_length(text) between 1 and 100),
  created_at  timestamptz not null default now()
);

create index fragments_story on fragments(story_id);
create index fragments_parent on fragments(parent_id);

-- ---------------------------------------------------------------- respaldos

-- Un like por persona y párrafo. El párrafo se nombra por su primer fragmento.
create table likes (
  person_id     text not null references people(id) on delete cascade,
  paragraph_id  uuid not null references fragments(id) on delete cascade,
  created_at    timestamptz not null default now(),
  primary key (person_id, paragraph_id)
);

create index likes_paragraph on likes(paragraph_id);

-- ---------------------------------------------------------------- guardadas

create table bookmarks (
  person_id   text not null references people(id) on delete cascade,
  story_id    uuid not null references stories(id) on delete cascade,
  created_at  timestamptz not null default now(),
  primary key (person_id, story_id)
);

-- ---------------------------------------------------------------- permisos
--
-- El test corre sin sesión: todos entran con la misma llave pública. Lo que
-- protegemos no es la identidad, es el corpus — que nadie pueda borrar ni
-- reescribir lo que otro escribió, ni siquiera sin querer.
--
--   leer            todos
--   escribir        fragmentos, respaldos y guardadas
--   borrar          solo respaldos y guardadas: un like se quita, una línea no
--   modificar       nadie, en ninguna tabla

alter table people    enable row level security;
alter table stories   enable row level security;
alter table fragments enable row level security;
alter table likes     enable row level security;
alter table bookmarks enable row level security;

create policy leer_personas   on people    for select using (true);
create policy leer_historias  on stories   for select using (true);
create policy leer_fragmentos on fragments for select using (true);
create policy leer_respaldos  on likes     for select using (true);
create policy leer_guardadas  on bookmarks for select using (true);

create policy sembrar_historia   on stories   for insert with check (true);
create policy escribir_fragmento on fragments for insert with check (true);
create policy respaldar          on likes     for insert with check (true);
create policy guardar            on bookmarks for insert with check (true);

create policy quitar_respaldo on likes     for delete using (true);
create policy quitar_guardada on bookmarks for delete using (true);

-- Sin política de update en ninguna tabla: nada se reescribe.
-- Los turnos se gastarán con una función, cuando toque escribir desde el
-- producto; una política de update abierta dejaría a cualquiera regalarse
-- turnos, y la escasez es el activo del sistema.
