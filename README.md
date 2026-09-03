# Canver

Una plataforma donde **no publicas: continúas**.

Solo puedes escribir respondiendo a otro fragmento. Los hilos se leen como un texto continuo —una página, no un feed— construida por muchas manos.

## Documentos

- [`CLAUDE.md`](CLAUDE.md) — **empieza aquí.** Todo el contexto del proyecto en un solo documento.
- [`docs/01-referencias.md`](docs/01-referencias.md) — mapa de referencias y qué aprender de cada una.
- [`docs/02-sistema-v0.md`](docs/02-sistema-v0.md) — el sistema: primitivas, economía de turnos, resolución del árbol, capa visual.

## Prototipo

- [`prototipo/index.html`](prototipo/index.html) — estático, sin backend, un solo archivo. Ábrelo en el navegador.

Simula el producto completo: modo lectura paginado, marcas de bifurcación, modo autoría, y el flujo de turno (elegir una hoja abierta y continuarla en 100 caracteres). El estado vive en memoria: al recargar vuelve al inicio.

## Estado

Fase 1 — prototipo estático para validar la experiencia de lectura.
Fase 2 — persistencia real y link compartible para el test de una semana con 20–30 personas.
