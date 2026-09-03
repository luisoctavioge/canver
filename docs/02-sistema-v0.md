# Canver — Sistema v0

**Fecha:** 03-sep-2026
**Decisiones:** topología = *árbol legible*. Unidad = texto, ~100 caracteres (MVP solo texto). Experiencia de lectura = **página, no feed**.

---

## 0. Principio rector

> **No publicas. Continúas.**

La unidad de valor no es la publicación: es el **enlace**. Cada regla existe para proteger una sola cosa: que continuar lo ajeno sea más deseable que hablar de uno mismo.

Referencia formal: el **renga** japonés. Regla maestra de *enlace y cambio*: cada verso conecta con el inmediatamente anterior y se aparta del que estaba dos atrás.

---

## 1. Primitivas

| Primitiva | Definición |
|---|---|
| **Fragmento** | La única unidad publicable. ~100 caracteres. Todo fragmento tiene exactamente un padre. |
| **Semilla** | Fragmento sin padre. Escaso por diseño. |
| **Nudo** | Fragmento con más de un hijo: ahí la historia se bifurca. |
| **Ruta** | Secuencia raíz → hoja. Es lo que se lee como texto continuo. |
| **Hoja** | Fragmento sin continuación todavía. Es lo único que aparece en el feed. |
| **Turno** | La moneda del sistema. Un turno = un fragmento publicado. |

---

## 2. Asimetría escritura / lectura *(mecanismo central)*

- **Al escribir** solo ves el fragmento al que respondes y su padre. Dos fragmentos, nada más.
- **Al leer** ves la ruta completa, sin autoría visible.

Coherencia local + deriva global. Es la respuesta directa al fallo de las referencias: FoldingStory oculta todo salvo el último pliegue y produce chistes; Ficlets mostraba todo y producía árboles ilegibles. La ventana de dos es el punto medio, y no está tomada por nadie.

---

## 3. Economía de turnos

| Regla | Valor de arranque | Razón |
|---|---|---|
| Turnos por periodo | 3 por semana | Suficiente para tener criterio, poco para hacer ruido. Semanal evita la ansiedad de racha. |
| Tope de acumulación | 5 | Se puede ahorrar, no atesorar. |
| Costo de continuar | 1 turno | La acción por defecto es la más barata. |
| Costo de sembrar | 3 turnos, desbloqueable tras N continuaciones | **Ganas el derecho a empezar habiendo continuado.** Sin esto, todos siembran y nadie continúa. |
| Recompensa | +1 turno cuando alguien continúa TU fragmento | Ver abajo. |

### La métrica no es el like: es la fecundidad

El like premia el fragmento **cerrado y brillante**. Aquí se premia el **abierto y continuable**: tu recompensa es que alguien gaste su recurso escaso en seguirte.

1. El incentivo apunta al objetivo del sistema, no en contra.
2. La métrica es infalsificable: cada punto le cuesta un turno a otra persona.

---

## 4. Resolución del árbol

- **Canon** — en cada nudo, la ruta sigue a la rama **más fecunda**. El canon lo escribe el gasto colectivo de turnos, no una votación. No hay botón de voto en ninguna parte del producto.
- **Deriva** — en cada nudo, la ruta se resuelve al azar. Nunca lees la misma historia dos veces.

---

## 5. El feed es una decisión, no un scroll

Muestra **hojas** — finales abiertos esperando continuación. Pocas (3–5) a la vez, con su padre como único contexto. **Regla anti-Mateo:** el orden no es por popularidad; se mezclan hojas frescas y huérfanas.

---

## 6. Muerte, poda y archivo

- **Fósil:** hoja sin continuación tras X tiempo sale del feed pero queda legible. El archivo de finales es parte de la obra.
- **Nadie cierra una historia.** Una ruta termina cuando fosiliza.
- **Poda:** remover un fragmento corta su rama entera y deja un hueco visible.

---

## 7. Capa visual: la página, no el feed

**Principio:** *la escritura es fragmentaria; la lectura es continua.* Si la lectura muestra las costuras, el sistema se delata como red social.

1. **Cero cromo repetido por unidad.** Sin tarjetas, bordes, avatares, timestamps, contadores ni burbujas.
2. **Composición de libro.** Columna única, 60–70 caracteres por línea, interlínea generosa, serif, márgenes reales.
3. **La costura es un espacio, no una línea.** El límite entre fragmentos no coincide con ningún límite visual.
4. **El párrafo es emergente, no publicado.** Cierra cada N fragmentos o al llegar a un nudo.
5. **Paginación, no scroll infinito.** Pasar página es el gesto del libro.
6. **La bifurcación es el único evento visual del texto.** Marca marginal discreta: aparato de libro, no botón.
7. **La autoría vive en el margen, apagada por default.** Un modo *autoría* tiñe cada fragmento por mano: primero lees un texto, luego lo ves romperse en 200 manos.

### Dos objetos, dos lenguajes

| | **Modo lectura** | **Modo turno** |
|---|---|---|
| Qué es | La obra | El juego |
| Forma | Página, tipografía, silencio | Utilitario: tres hojas y un campo |
| Cromo | Ninguno | El mínimo funcional |

### Consecuencia sobre el límite

Fragmentos cortos tejen párrafos; fragmentos largos se leen como voces separadas y regresan a la forma de lista. **Entre más corto el fragmento, más invisible la costura.**

---

## 8. Preguntas abiertas

1. ¿Autoría revelada al final, o solo bajo el modo *autoría*?
2. ¿Existe perfil? ¿Muestra fragmentos o fecundidad?
3. ¿La marca de bifurcación interrumpe la lectura o aparece en un segundo pase?
4. ¿IA participa? Postura de arranque: **no**. Destruye la escasez, que es el activo.
5. Sostenimiento: suscripción. La publicidad rompe la economía de atención del producto.
6. ¿El límite de caracteres podría ser propiedad de la semilla (100 / 280)?

---

## 9. Cómo se valida

Test de una semana con 20–30 personas: un árbol, 3 semillas, 100 caracteres, 3 turnos por persona, ventana de visión de 2.

| Pregunta | Señal |
|---|---|
| ¿La escasez funciona? | % de turnos efectivamente gastados |
| ¿El texto se lee? | Lectura de la ruta canónica a ciegas por alguien externo |
| ¿Dónde ramifica? | Nudos por fragmento. Casi ninguno = río disfrazado; todos = no hay canon posible. |
| ¿Qué fragmento gana? | ¿Los abiertos son más fecundos que los brillantes? Si no, el incentivo está mal calibrado. |
