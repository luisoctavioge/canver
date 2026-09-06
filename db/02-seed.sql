-- Canver — semilla
--
-- Generado desde prototype/index.html. Cada fila es texto ya escrito:
-- ni una palabra nueva. La regla 8 sigue en pie.

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

-- ---------------------------------------------------------------- train-1
insert into stories (id, seeded_by) values ('cf1f0db1-3b43-4102-a866-fa20598a0b38', 'ana');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('6a6c7e3a-2d71-4a43-b01f-cd9c0636a077', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', null, 'ana', 'El último tren salió sin nadie adentro y aun así llegó tarde.'),
  ('a091d392-8382-44d6-a2ef-9e5367d4f779', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '6a6c7e3a-2d71-4a43-b01f-cd9c0636a077', 'bruno', 'En la estación, el jefe anotó la hora exacta en un cuaderno que nadie le había pedido.'),
  ('1a57de0c-f670-4576-9f85-e99094d88824', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'a091d392-8382-44d6-a2ef-9e5367d4f779', 'mireia', 'Llevaba once años anotando trenes vacíos.'),
  ('be86e881-9025-4a0e-a786-c7efc978e532', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '1a57de0c-f670-4576-9f85-e99094d88824', 'kai', 'Su letra se había ido encogiendo hasta que cuatro años cabían en una página.'),
  ('aabdc8b7-0c5b-4196-9d7a-e3c9ac10f5aa', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'be86e881-9025-4a0e-a786-c7efc978e532', 'dana', 'Esa noche escribió algo distinto.'),
  ('b000e6e2-7d41-4466-8dd4-d0d3c58658c0', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'aabdc8b7-0c5b-4196-9d7a-e3c9ac10f5aa', 'dana', 'Una pregunta.'),
  ('e0b0493b-b793-4eca-8531-9457334bbdf5', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'b000e6e2-7d41-4466-8dd4-d0d3c58658c0', 'jonas', '¿Y si el tren sí lleva a alguien, y los que dejamos de ver somos nosotros?'),
  ('310b72ee-c211-4dc7-91de-f308da0e5446', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'e0b0493b-b793-4eca-8531-9457334bbdf5', 'olga', 'Cerró el cuaderno antes de arrepentirse.'),
  ('6ac85ead-3c48-47a7-8e5b-9de6157ca5d0', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '310b72ee-c211-4dc7-91de-f308da0e5446', 'sara', 'Afuera, la nieve caía sin llegar a tocar el suelo.'),
  ('d528b2c8-db6c-4a9b-afa5-0f2af06cafd4', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '6ac85ead-3c48-47a7-8e5b-9de6157ca5d0', 'ruy', 'Un perro cruzó las vías en dirección contraria a la costumbre.'),
  ('4f2c5e14-8bc1-4728-a154-3fb67040b998', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'd528b2c8-db6c-4a9b-afa5-0f2af06cafd4', 'tavo', 'El jefe lo siguió, porque no tenía nada mejor que hacer con el insomnio.'),
  ('42b72b78-7db1-4592-8115-5602b27550ed', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '4f2c5e14-8bc1-4728-a154-3fb67040b998', 'lia', 'El perro se detuvo frente a una puerta que él no recordaba haber visto nunca.'),
  ('43a97335-f6e0-4b1f-a480-132e1141e879', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '42b72b78-7db1-4592-8115-5602b27550ed', 'martin', 'Era la puerta de su casa.'),
  ('84dcbb9c-7d6d-4d0a-a88b-423a3efdc4ef', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '43a97335-f6e0-4b1f-a480-132e1141e879', 'cielo', 'Pero del lado equivocado de la calle.'),
  ('408a5024-e94b-4071-a622-d268596719e2', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '84dcbb9c-7d6d-4d0a-a88b-423a3efdc4ef', 'isis', 'Adentro alguien había dejado la luz encendida y la mesa puesta para dos.'),
  ('df2190ce-dafd-4223-b6ae-05ae41cfe187', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '408a5024-e94b-4071-a622-d268596719e2', 'nube', 'El jefe llevaba veinte años cenando solo.'),
  ('2b2543b9-251c-405b-869e-9e6ce8cf94c0', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'df2190ce-dafd-4223-b6ae-05ae41cfe187', 'bruno', 'Se sentó igual, del lado que no era suyo.'),
  ('0aaaa846-b66d-402a-bbfc-6162334da50d', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '2b2543b9-251c-405b-869e-9e6ce8cf94c0', 'cielo', 'La sopa estaba tibia, como si alguien acabara de salir por la otra puerta.'),
  ('3fd687a9-8573-454f-ad8b-34c2d016b71c', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '0aaaa846-b66d-402a-bbfc-6162334da50d', 'ana', 'No había otra puerta.'),
  ('173a96bc-9361-42b3-a15f-cd7b8232de88', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '3fd687a9-8573-454f-ad8b-34c2d016b71c', 'kai', 'En el cuaderno la pregunta seguía abierta, y las preguntas abiertas pesan.'),
  ('86687ba6-ee9a-4aec-b31c-eb6477c4e854', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '173a96bc-9361-42b3-a15f-cd7b8232de88', 'dana', 'Decidió responderla con los pies.'),
  ('199df929-1c43-4d1c-a7bd-c22d485d657f', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '86687ba6-ee9a-4aec-b31c-eb6477c4e854', 'jonas', 'Volvió a la estación pisando sus propias huellas, que ya no estaban.'),
  ('41c1389d-38b0-4218-9620-1d3841963a43', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '199df929-1c43-4d1c-a7bd-c22d485d657f', 'olga', 'El andén estaba lleno.'),
  ('0c1a4381-2825-495a-ae15-15d3714fcadd', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '41c1389d-38b0-4218-9620-1d3841963a43', 'mireia', 'Gente en abrigo, con boletos, mirando un reloj que él nunca había instalado.'),
  ('866bc36f-d08b-4bf7-a7fa-20ce865ff018', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '0c1a4381-2825-495a-ae15-15d3714fcadd', 'sara', 'Ninguno hacía ruido.'),
  ('bb48e569-3327-4f58-a6e9-316ddf4c13e5', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'aabdc8b7-0c5b-4196-9d7a-e3c9ac10f5aa', 'ruy', 'El cuaderno se quedó abierto toda la noche, y la nieve entró a leerlo.'),
  ('b817be1b-e9db-4d5f-bb2c-f9014387c634', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'bb48e569-3327-4f58-a6e9-316ddf4c13e5', 'dana', 'Por la mañana la tinta se había corrido hasta formar otra pregunta.'),
  ('5700061e-7e06-45d2-b657-794c21856fed', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'b817be1b-e9db-4d5f-bb2c-f9014387c634', 'olga', 'Nadie la leyó nunca, porque el jefe no volvió a la estación.'),
  ('365520f8-9b54-436b-a228-9755ff834f7b', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '408a5024-e94b-4071-a622-d268596719e2', 'cielo', 'Pero él ya no estaba seguro de cuál lado era el suyo.'),
  ('71d120d3-32e4-4f85-afb8-a00245723dc7', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '365520f8-9b54-436b-a228-9755ff834f7b', 'kai', 'Tocó, por si acaso, y le abrió un hombre con su misma cara cansada.'),
  ('d5a7a01f-987c-4628-a3db-1fa655d2a78c', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '71d120d3-32e4-4f85-afb8-a00245723dc7', 'sara', 'Los dos entendieron al mismo tiempo que sobraba uno.'),
  ('f426f946-d6d7-404d-a04c-8dcad8217ef0', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'd5a7a01f-987c-4628-a3db-1fa655d2a78c', 'nube', 'Ninguno se movió.'),
  ('96b33f84-f214-487c-b86d-7d74c4616229', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '173a96bc-9361-42b3-a15f-cd7b8232de88', 'nube', 'La nieve había borrado la estación entera y, aun así, el reloj seguía.'),
  ('c1d20909-66db-40fe-ba9f-852c8ffb1b62', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', '96b33f84-f214-487c-b86d-7d74c4616229', 'martin', 'Anotó la hora en el aire, con el dedo, porque ya no había cuaderno.'),
  ('a0094e61-bf3a-4c39-af20-6c70aaacf800', 'cf1f0db1-3b43-4102-a866-fa20598a0b38', 'c1d20909-66db-40fe-ba9f-852c8ffb1b62', 'lia', 'Fue la primera vez en once años que llegó a tiempo.');

-- ---------------------------------------------------------------- train-2
insert into stories (id, seeded_by) values ('40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'ruy');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('4c457e08-3cf9-4abb-90a7-cf6cf46e2029', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', null, 'ruy', 'Los reconoció a todos: eran las horas que había anotado durante once años.'),
  ('f26d3c0b-64c4-4738-97ca-822696cb0b1c', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '4c457e08-3cf9-4abb-90a7-cf6cf46e2029', 'tavo', 'Una mujer se acercó y le devolvió el cuaderno, que él llevaba en la mano.'),
  ('b987b9f5-0498-4e2f-b8aa-dc846385308f', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'f26d3c0b-64c4-4738-97ca-822696cb0b1c', 'lia', '«Lo estuvimos leyendo», dijo. «Es lo único que llega puntual».'),
  ('bf22e707-7ad4-4016-aba3-aa82f736f563', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'b987b9f5-0498-4e2f-b8aa-dc846385308f', 'martin', 'Él quiso preguntar quiénes eran.'),
  ('ab7a384c-7e3f-43a4-8cfc-73f2a50a2d7b', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'bf22e707-7ad4-4016-aba3-aa82f736f563', 'isis', 'Preguntó otra cosa.'),
  ('3969c95c-e3f8-4ffa-a436-46332293af28', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'ab7a384c-7e3f-43a4-8cfc-73f2a50a2d7b', 'nube', '«¿Y si me subo?»'),
  ('40a13cf7-a290-46f1-b3fb-46e460b3d4ef', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '3969c95c-e3f8-4ffa-a436-46332293af28', 'cielo', 'Nadie contestó, pero todos se hicieron a un lado.'),
  ('6417ecdb-0f4a-4d24-b394-d95134d5ed37', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '40a13cf7-a290-46f1-b3fb-46e460b3d4ef', 'ana', 'El tren llegó vacío, como siempre, y por primera vez eso pareció una invitación.'),
  ('45e834c5-abca-47fa-b277-03532e34a083', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '6417ecdb-0f4a-4d24-b394-d95134d5ed37', 'bruno', 'Subió con el cuaderno bajo el brazo y sin apagar la luz de la estación.'),
  ('6331fae0-14f6-47df-9859-1d157a1f879a', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '45e834c5-abca-47fa-b277-03532e34a083', 'kai', 'Las puertas se cerraron con el sonido de una página al pasar.'),
  ('cac2c2eb-64d3-4c26-9b07-166d6e57d7e2', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '6331fae0-14f6-47df-9859-1d157a1f879a', 'dana', 'Por la ventana vio al jefe de estación anotando la hora exacta.'),
  ('b8cb5726-5bac-4f4c-a5a5-c70f4b29906a', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'cac2c2eb-64d3-4c26-9b07-166d6e57d7e2', 'kai', 'Levantó la mano para saludarse.'),
  ('a7933318-9441-460e-a574-9fa4339e40db', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'b8cb5726-5bac-4f4c-a5a5-c70f4b29906a', 'jonas', 'El vagón olía a papel mojado y a inviernos que no le habían tocado.'),
  ('deed168e-a78f-4419-984d-ba1f63fc798f', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'a7933318-9441-460e-a574-9fa4339e40db', 'olga', 'En cada asiento había un cuaderno distinto, abierto en una pregunta.'),
  ('53806274-7596-42c6-8248-a77e52ba61ce', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'deed168e-a78f-4419-984d-ba1f63fc798f', 'mireia', 'Ninguna era la suya.'),
  ('72e09049-494c-4c79-8891-65e00351ce97', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '53806274-7596-42c6-8248-a77e52ba61ce', 'sara', 'Entendió que le tocaba contestar una.'),
  ('0239b1c2-e791-4e7f-a808-2910dc5fd362', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '72e09049-494c-4c79-8891-65e00351ce97', 'ruy', 'Escogió la más corta, porque el tren no iba a esperar.'),
  ('99de4b96-febf-45af-9b52-4a96092e9e44', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '0239b1c2-e791-4e7f-a808-2910dc5fd362', 'tavo', 'Decía: «¿Quién enciende la luz de las casas vacías?»'),
  ('b881a74c-381f-4627-89e8-6b1c3cce9d83', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '99de4b96-febf-45af-9b52-4a96092e9e44', 'lia', 'Escribió debajo, con su letra encogida: «Alguien que va llegando».'),
  ('6a25960e-2b8f-4a8a-8657-6218e5bad15f', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'b881a74c-381f-4627-89e8-6b1c3cce9d83', 'martin', 'El tren frenó sin estación.'),
  ('cef75d12-7483-4b71-9eb0-2a8883e3972e', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '6a25960e-2b8f-4a8a-8657-6218e5bad15f', 'isis', 'Afuera no había nieve: había noviembre, y una calle con dos aceras iguales.'),
  ('70c09afb-fe11-4638-a504-2bc926675b90', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'cef75d12-7483-4b71-9eb0-2a8883e3972e', 'nube', 'Bajó.'),
  ('d69970b8-b3a2-441e-b3fe-293e459d65c9', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '70c09afb-fe11-4638-a504-2bc926675b90', 'cielo', 'La casa tenía la mesa puesta para dos y la sopa tibia.'),
  ('1ecae655-1696-46bf-aacc-924cc5ed6a32', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'd69970b8-b3a2-441e-b3fe-293e459d65c9', 'ana', 'Esta vez se sentó del lado suyo.'),
  ('197ddfa5-20dd-4a75-afae-344e2a84dcd9', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '1ecae655-1696-46bf-aacc-924cc5ed6a32', 'bruno', 'Dejó el cuaderno abierto en la página que seguía.'),
  ('12968875-bb2a-4c66-a799-e98f38c98a7b', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'ab7a384c-7e3f-43a4-8cfc-73f2a50a2d7b', 'sara', '«Nadie se sube», dijo la mujer. «Uno se queda hasta que el tren se lo lleva».'),
  ('be86d411-1b79-4ae6-a679-63a21ac7b6b3', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '12968875-bb2a-4c66-a799-e98f38c98a7b', 'jonas', 'Él miró el andén lleno y contó: once años, once inviernos, once trenes.'),
  ('e3864dc5-f343-4cde-913a-710eb0437d9c', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', 'be86d411-1b79-4ae6-a679-63a21ac7b6b3', 'isis', 'Se quedó, y siguió anotando, ahora acompañado.'),
  ('471e45ac-c669-4829-b179-e375d76edec8', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '53806274-7596-42c6-8248-a77e52ba61ce', 'isis', 'No contestó ninguna: escribió una nueva y la dejó abierta para el siguiente.'),
  ('38eaee35-1d5b-4382-a963-d0a28617a278', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '471e45ac-c669-4829-b179-e375d76edec8', 'bruno', 'El vagón entero pasó la página al mismo tiempo.'),
  ('cfce7404-0ff6-4d85-893a-3311b4f5042f', '40f70eeb-40c1-45a2-aaa1-e52411148b1c', '38eaee35-1d5b-4382-a963-d0a28617a278', 'ana', 'Y el tren siguió, ya sin destino, recogiendo preguntas.');

-- ---------------------------------------------------------------- train-3
insert into stories (id, seeded_by) values ('7a1ae937-f073-4d78-a2b2-7ba59725efd4', 'kai');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('0fed585b-5ee1-4a69-b3ef-b1270dd5baed', '7a1ae937-f073-4d78-a2b2-7ba59725efd4', null, 'kai', 'Y esperó, sin apuro, a que alguien más llegara tarde.');

-- ---------------------------------------------------------------- library
insert into stories (id, seeded_by) values ('15aa1b67-566b-4e7c-a315-0b645782970b', 'olga');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('92c12564-bc72-44e4-a85f-37dce64a32cd', '15aa1b67-566b-4e7c-a315-0b645782970b', null, 'olga', 'La biblioteca cerró en 1994 y siguió recibiendo devoluciones.'),
  ('2d68cb07-2970-4378-aad7-6ab4098903e9', '15aa1b67-566b-4e7c-a315-0b645782970b', '92c12564-bc72-44e4-a85f-37dce64a32cd', 'ruy', 'Los libros aparecían en el buzón sin remitente, siempre en buen estado.'),
  ('0db2dd18-7b49-416b-a9a3-accbd9153636', '15aa1b67-566b-4e7c-a315-0b645782970b', '2d68cb07-2970-4378-aad7-6ab4098903e9', 'dana', 'Alguien los leía con un cuidado que ya no se estila.'),
  ('1bfe8d48-6076-4cac-8e93-09c14947f976', '15aa1b67-566b-4e7c-a315-0b645782970b', '0db2dd18-7b49-416b-a9a3-accbd9153636', 'lia', 'El bibliotecario nunca fue reemplazado: simplemente dejó de envejecer.');

-- ---------------------------------------------------------------- salt
insert into stories (id, seeded_by) values ('c9f6bb77-b191-45ab-9451-c01feefb1086', 'mireia');
insert into fragments (id, story_id, parent_id, author_id, text) values
  ('f2496e7f-3003-4a19-9c9d-23a9301c2ba0', 'c9f6bb77-b191-45ab-9451-c01feefb1086', null, 'mireia', 'Mi abuela guardaba la sal en un frasco con la etiqueta de otra cosa.'),
  ('fcf6c1de-4b7a-4c0b-93a8-85e0ed39fd1a', 'c9f6bb77-b191-45ab-9451-c01feefb1086', 'f2496e7f-3003-4a19-9c9d-23a9301c2ba0', 'tavo', 'Decía que así la sal no se enteraba de que era sal y duraba más.'),
  ('0ea7f21b-dc5a-477f-955e-f8f7b5d54ff6', 'c9f6bb77-b191-45ab-9451-c01feefb1086', 'fcf6c1de-4b7a-4c0b-93a8-85e0ed39fd1a', 'ana', 'Cuando murió encontramos catorce frascos y ninguna etiqueta correcta.');
