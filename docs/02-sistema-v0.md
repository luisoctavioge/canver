# Canver — Sistema v0

**Fecha:** 03-sep-2026
**Decisiones:** topología = *árbol legible*. Unidad = texto, ~100 caracteres (MVP solo texto). Experiencia de lectura = **dos ejes, no feed**: vertical el tiempo de la historia (un párrafo por pantalla), horizontal las versiones alternas de ese momento.

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

Todo nudo se **resuelve**: alguien decide por cuál rama sigue la lectura. Hay una sola primitiva y tres maneras de manejarla.

### Canon — lo resuelve el gasto colectivo

En cada nudo gana la rama cuyo **subárbol acumuló más fragmentos**. No los hijos directos —eso es miope: una rama con tres hijos que se mueren le ganaría a una con un hijo que engendró cuarenta—, sino el peso del subárbol completo.

Cada fragmento de ese peso **es un turno que alguien gastó**. Por eso contar el subárbol es literalmente medir el gasto colectivo. El canon no se vota: se paga. No hay botón de voto en ninguna parte del producto.

Tres propiedades que se siguen de ahí:

1. **El canon no es permanente.** Se recalcula al crecer el árbol. Una rama abandonada pierde el canon frente a otra que sigue creciendo. El texto de hoy puede no ser el de dentro de un mes: es la obra respirando.
2. **Empate → la rama más antigua.** Estabilidad. Si desempata la recencia, el texto tiembla cada semana.
3. **Nunca hay arranque en frío.** Un nudo existe *solo si* dos personas ya gastaron turnos ahí. En cada punto de decisión hay datos por construcción.

Queda pendiente el **sesgo de edad**: las ramas viejas acumulan más por haber existido más. Se puede normalizar por tiempo; para el test de una semana se ignora y se mide.

### A mano — lo resuelve el lector

En el eje horizontal de la lectura. Estando en una pantalla bifurcada, cambias de rama y con ella todo lo que cuelga hacia abajo.

No es *elige tu propia aventura*, y la diferencia no es de grado: **la rama no es una oferta, es evidencia.** No dice "elige", dice *aquí la historia también hizo esto*. Estás siguiendo un camino que otras personas recorrieron, no seleccionando la opción B. De ahí la regla dura: **nunca presentar canon y rama como dos opciones equivalentes lado a lado.** Eso sería un menú. El canon es el texto; la rama es una nota al pie en la que puedes meterte.

### Deriva — lo resuelve el azar

La misma acción, automática y de golpe: el dado resuelve todos los nudos de la ruta. Nunca lees la misma historia dos veces. Es un interruptor: al apagarlo vuelves al canon.

---

## 5. El feed es una decisión, no un scroll

Muestra **hojas** — finales abiertos esperando continuación. Pocas (3–5) a la vez, con su padre como único contexto. **Regla anti-Mateo:** el orden no es por popularidad; se mezclan hojas frescas y huérfanas.

---

## 6. Muerte, poda y archivo

- **Fósil:** hoja sin continuación tras X tiempo sale del feed pero queda legible. El archivo de finales es parte de la obra.
- **Nadie cierra una historia.** Una ruta termina cuando fosiliza.
- **Poda:** remover un fragmento corta su rama entera y deja un hueco visible.

---

## 7. Capa visual: el rollo, no el feed

**Principio:** *la escritura es fragmentaria; la lectura es continua.* Si la lectura muestra las costuras, el sistema se delata como red social.

1. **Cero cromo repetido por unidad.** Sin tarjetas, bordes, avatares, timestamps, contadores ni burbujas.
2. **Composición de libro.** Columna única, 60–70 caracteres por línea, interlínea generosa, serif, márgenes reales.
3. **La costura es un espacio, no una línea.** El límite entre fragmentos no coincide con ningún límite visual.
4. **El párrafo es emergente, no publicado.** Cierra cada N fragmentos o al llegar a un nudo.
5. **Dos ejes.** Vertical es el tiempo de la historia: **un párrafo por pantalla**, de principio a fin. Horizontal son las otras versiones de ese mismo momento. Lo prohibido es el scroll *infinito* —el feed que nunca cierra—, no el scroll: una ruta es finita y termina. *(Revisado 03-sep-2026. La versión anterior paginaba y el gesto era tocar para pasar página; en teléfono nadie lo encuentra, porque el gesto aprendido para leer un texto largo es deslizar.)*
6. **Las versiones se ordenan de izquierda a derecha y el canon es la de más a la izquierda.** El gesto es uno solo, de derecha a izquierda, y siempre avanza; al pasar la última se vuelve al canon. Una sola dirección hace el eje aprendible sin explicarlo: no hay que descubrir que también se puede volver.
7. **Arriba asoma la cola del párrafo anterior**, tenue y recortada a dos líneas. Da continuidad al leer y vuelve legible la bifurcación: al cambiar de versión, el de arriba no cambia, así que se ve que las dos continuaciones salen del mismo padre. Al llegar cada pantalla, ese párrafo frena y se apaga mientras el nuevo se aclara.
8. **La bifurcación cae siempre en un cambio de párrafo**, nunca a media frase. La estructura del texto y la del árbol son la misma cosa. Una marca marginal discreta dice que este momento tiene otra versión: aparato de libro, no botón.
9. **La autoría está apagada por default.** Un modo *autoría* tiñe cada fragmento por mano: primero lees un texto, luego lo ves romperse en 200 manos. Tocar un fragmento lo sube de tono y da el nombre de esa mano **abajo, en el aparato** —no en el margen, que en teléfono no existe, y no flotando sobre el texto, que taparía las líneas vecinas.

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
3. ~~¿La marca de bifurcación interrumpe la lectura o aparece en un segundo pase?~~ Resuelto: ni una cosa ni la otra. La marca solo avisa que este momento tiene otra versión; el desvío vive en el eje horizontal. Queda abierto cómo se anuncia ese gesto.
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
