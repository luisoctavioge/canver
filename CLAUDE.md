# Canver — contexto del proyecto

> Lee este archivo antes de tocar nada. Es el punto de entrada: si solo vas a leer un documento, que sea este.

---

## Qué es

Una plataforma social donde **no puedes publicar: solo continuar**. Cada texto que escribes responde al fragmento de alguien más. Los hilos resultantes se leen como un texto continuo —un rollo, no un feed— construido por muchas manos.

**Origen:** el juego escolar del papel doblado. Escribes una oración, pasas la hoja a la persona de atrás, y recibes otra hoja que tienes que continuar. Nadie controla la historia; todos la escriben.

**Principio rector:** *No publicas. Continúas.* La unidad de valor no es la publicación: es el enlace. Cada decisión de producto existe para proteger una sola cosa — que continuar lo ajeno sea más deseable que hablar de uno mismo.

---

## Reglas no negociables

Si alguna de estas se rompe, deja de ser Canver y se vuelve una red social más.

1. **Solo se publica respondiendo.** No existe el post suelto. Sembrar una historia nueva es posible pero caro.
2. **Las respuestas son escasas.** 3 turnos por semana. La escasez no es una limitante: es lo que convierte cada respuesta en una decisión editorial.
3. **Sembrar cuesta más que continuar.** 3 turnos vs 1, y el derecho a sembrar se desbloquea habiendo continuado. Sin esto, todos siembran y nadie continúa.
4. **No hay likes ni votos.** La única métrica es la **fecundidad**: cuántas continuaciones nacieron de tu fragmento. Es infalsificable porque cada punto le cuesta un turno escaso a otra persona, y premia el fragmento abierto en vez del fragmento brillante y cerrado.
5. **Al escribir ves dos fragmentos; al leer ves todo.** Traducción de la regla del renga japonés (*enlace y cambio*). Produce coherencia local y deriva global.
6. **La lectura tiene dos ejes.** Vertical es el tiempo de la historia: un párrafo por pantalla, de principio a fin. Horizontal son las otras versiones de ese mismo momento. Sin tarjetas, sin avatares, sin timestamps, sin contadores. Lo prohibido no es el scroll: es el scroll *infinito*. Una ruta es finita y tiene final visible; un feed no termina nunca. La costura entre fragmentos es un espacio, nunca una línea visible.
7. **La autoría está apagada por default.** Primero lees un texto; luego, si activas el modo autoría, lo ves romperse en muchas manos, y tocando un fragmento sabes de quién es. Esa revelación es el momento emocional del producto y se quema si la autoría es visible todo el tiempo.
8. **La IA no escribe fragmentos.** Destruiría la escasez, que es el activo entero del sistema.

---

## Decisiones tomadas

| Decisión | Valor | Nota |
|---|---|---|
| Topología | **Árbol legible** | Cualquiera continúa desde cualquier punto; al leer, cada nudo se resuelve. |
| Canon | **Peso del subárbol** | Gana la rama con más fragmentos acumulados: cada uno es un turno que alguien gastó. Se recalcula. Empate → la más antigua. |
| Resolver un nudo | **Canon, a mano o al azar** | Una sola primitiva. El canon por defecto, el eje horizontal a mano, Deriva con el dado. |
| Unidad | **Texto, ~100 caracteres** | Fragmentos cortos tejen párrafos; los largos se leen como voces sueltas y regresan a la forma de lista. |
| Medios | **Solo texto en el MVP** | Imagen, audio, código y video quedan para después. |
| Tipografía | **IBM Plex Sans** (lectura) + **IBM Plex Mono** (aparato) | Una superfamilia, dos roles. 18px sobre retícula de 32px. |
| Sostenimiento | Suscripción, no publicidad | La publicidad rompe la economía de atención del producto. |

---

## Qué NO hacer

Errores que un asistente nuevo comete por default y que aquí están prohibidos:

- Agregar likes, corazones, votos, contadores de vistas o rankings de popularidad.
- Convertir la lectura en tarjetas, burbujas de chat, timeline, o un feed que carga sin fin. El rollo continuo de una ruta finita sí es la forma correcta.
- Mostrar avatares, nombres o timestamps dentro del texto.
- Ordenar el feed por popularidad (regla anti-Mateo: siempre se mezclan hojas frescas y huérfanas).
- Meter frameworks, build steps o dependencias al prototipo: es **un solo archivo HTML sin build**.
- Usar `localStorage` o cualquier storage del navegador en el prototipo. El estado vive en memoria.
- Generar fragmentos con IA.
- Escribir copy largo. El producto casi no tiene texto de interfaz, y así se queda.

---

## Estado del repo

```
CLAUDE.md               este archivo
README.md               presentación corta
docs/01-referencias.md  mapa de referencias y qué aprender de cada una
docs/02-sistema-v0.md   el sistema completo: primitivas, economía, capa visual
prototipo/index.html    prototipo estático, un solo archivo, sin dependencias
```

**Fase actual:** 1 — prototipo estático terminado. Simula el producto completo sin backend: lectura de dos ejes (vertical un párrafo por pantalla, horizontal las versiones alternas), canon calculado por peso de subárbol, marcas de bifurcación en el margen, modo autoría, Deriva, índice de historias y flujo de turno con límite de 100 caracteres. El estado vive en memoria; al recargar vuelve al inicio.

**Fase 2 (siguiente):** persistencia real y link compartible, para correr un test de una semana con 20–30 personas.

**Qué se mide en ese test:**

| Pregunta | Señal |
|---|---|
| ¿La escasez funciona? | % de turnos efectivamente gastados |
| ¿El texto se lee? | Que alguien externo lea la ruta canónica a ciegas y la disfrute |
| ¿Dónde ramifica? | Nudos por fragmento. Casi ninguno = río disfrazado; todos = no hay canon posible. |
| ¿Qué fragmento gana? | ¿Los abiertos son más fecundos que los brillantes? Si no, el incentivo está mal calibrado. |

---

## Preguntas abiertas

- ¿Cómo se anuncia el eje horizontal sin meter cromo? Hoy solo lo delata una marca `*` en el margen, y un gesto que nadie descubre no existe.
- ¿Entra la **profundidad de lectura** —hasta dónde llegó la gente antes de abandonar una rama— como señal del canon junto a la fecundidad? Sería una enmienda a la regla 4, pero empuja en la misma dirección, a diferencia del like. Aplazado hasta ver correr lo demás.
- ¿La autoría se revela al final de la lectura, o solo bajo el modo autoría?
- ¿Existe perfil? ¿Muestra fragmentos o fecundidad?
- ¿El límite de caracteres podría ser propiedad de la semilla (100 / 280), como quien elige una forma poética?
- Las ramas alternas se leen en gris para que sepas que estás fuera del canon. Rompe un poco la regla de "cero cromo": ¿se queda o se va?
- Las ramas del prototipo mueren a los 3 o 4 fragmentos, así que el eje horizontal siempre desemboca en un final abrupto. Falta escribir ramas que sigan, para saber si el desvío se siente como descubrimiento o como castigo.
- Nombre definitivo. *Canver* es el placeholder actual.

---

## Cómo trabajar aquí

- **Idioma:** español, en el producto y en la documentación.
- **Antes de proponer una feature**, revisa que no viole las reglas no negociables ni la lista de "qué NO hacer".
- **Antes de construir**, lee `docs/02-sistema-v0.md`. `docs/01-referencias.md` explica por qué cada decisión es como es, y qué mató a los antecedentes (Ficlets, Ficly, FoldingStory, Branch): ninguno murió por concepto, todos por infraestructura y mantenimiento.
- **El prototipo se edita en su archivo**, no se reescribe desde cero.
- Cuando una decisión cambie, actualiza este archivo y `docs/02-sistema-v0.md` en el mismo commit.
