-- Canver — ciento cuarenta caracteres
--
-- Cien alcanzaban para una oración y poco más: una imagen y un giro, nunca
-- dos ideas. Ciento cuarenta dejan que la línea respire sin que se vuelva
-- un párrafo propio. El tope sigue viviendo en la tabla, así que ni
-- write_line ni edit_line necesitan tocarse.

alter table fragments drop constraint fragments_text_check;
alter table fragments add constraint fragments_text_check
  check (char_length(text) between 1 and 140);
