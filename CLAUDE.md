# Canver — project context

> Read this file before touching anything. It is the entry point: if you are only going to read one document, make it this one.

---

## What it is

A social platform where **you cannot publish: you can only continue**. Every text you write answers someone else's fragment. The resulting threads read as one continuous text —a scroll, not a feed— built by many hands.

**Origin:** the schoolyard folded-paper game. You write a sentence, pass the sheet to the person behind you, and receive another sheet you have to continue. Nobody controls the story; everybody writes it.

**Guiding principle:** *You don't publish. You continue.* The unit of value is not the post: it is the link. Every product decision exists to protect one single thing — that continuing someone else's work is more desirable than talking about yourself.

---

## Non-negotiable rules

If any of these breaks, it stops being Canver and turns into one more social network.

1. **You can only publish by answering.** There is no standalone post. Seeding a new story is possible but expensive.
2. **Answers are scarce.** 3 turns a week. Scarcity is not a limitation: it is what turns every answer into an editorial decision.
3. **Seeding costs more than continuing.** 3 turns against 1, and the right to seed is unlocked by having continued. Without this, everybody seeds and nobody continues.
4. **There are no likes and no votes.** The only metric is **fecundity**: how many continuations were born from your fragment. It is unfalsifiable because every point costs another person one of their scarce turns, and it rewards the open fragment instead of the brilliant closed one.
5. **When writing you see two fragments; when reading you see everything.** A translation of the Japanese renga rule (*link and shift*). It produces local coherence and global drift.
6. **Reading has two axes.** Vertical is the time of the story: one paragraph per screen, from beginning to end. Horizontal is the other versions of that same moment. No cards, no avatars, no timestamps, no counters. What is forbidden is not scrolling: it is *infinite* scrolling. A route is finite and has a visible ending; a feed never ends. The seam between fragments is a space, never a visible line.
7. **Authorship is off by default.** First you read a text; then, if you turn on authorship mode, you watch it break into many hands, and tapping a fragment tells you whose it is. That revelation is the emotional moment of the product and it burns out if authorship is visible all the time.
8. **AI does not write fragments.** It would destroy scarcity, which is the entire asset of the system. *(Amended 03-sep-2026 for the prototype only: the sample fiction was translated into English on the owner's explicit instruction. The rule stands for the product.)*

---

## Decisions taken

| Decision | Value | Note |
|---|---|---|
| Topology | **Legible tree** | Anyone continues from any point; when reading, every fork gets resolved. |
| Canon | **Subtree weight** | The branch with the most accumulated fragments wins: each one is a turn somebody spent. It is recalculated. Ties → the older branch. |
| Resolving a fork | **Canon, by hand, or by chance** | A single primitive. Canon by default, the horizontal axis by hand, Drift with the die. |
| Unit | **Text, ~100 characters** | A fragment, also called a line. Short ones weave paragraphs; long ones read as separate voices and fall back into the shape of a list. |
| Paragraph | **Five lines, five hands** | Exactly five, never fewer once closed, and nobody twice in the same one. The count decides the break, not the writer. |
| Media | **Text only in the MVP** | Image, audio, code and video come later. |
| Typography | **IBM Plex Sans** (reading) + **IBM Plex Mono** (apparatus) | One superfamily, two roles. 18px on a 32px grid. |
| Sustaining it | Subscription, not advertising | Advertising breaks the attention economy of the product. |
| Language | **English**, in the product and the documentation | *(Changed 03-sep-2026. It used to be Spanish.)* |

---

## What NOT to do

Mistakes a new assistant makes by default and that are forbidden here:

- Adding likes, hearts, votes, view counters or popularity rankings.
- Turning reading into cards, chat bubbles, a timeline, or a feed that loads without end. The continuous scroll of a finite route is the correct form.
- Showing avatars, names or timestamps inside the text.
- Sorting the feed by popularity (anti-Matthew rule: fresh and orphaned leaves are always mixed together).
- Adding frameworks, build steps or dependencies to the prototype: it is **one single HTML file with no build**.
- Using `localStorage` or any browser storage in the prototype. State lives in memory.
- Generating fragments with AI.
- Writing long copy. The product has almost no interface text, and that is how it stays.

---

## Repo status

```
CLAUDE.md               this file
README.md               short presentation
docs/01-references.md   map of references and what to learn from each
docs/02-system-v0.md    the whole system: primitives, economy, visual layer
prototype/index.html    static prototype, one file, no dependencies
DIAGRAM 1.png           the reading model as it stands
DIAGRAM 2.png           stories chained in one stream, still to be designed
```

**Current phase:** 1 — static prototype finished. It simulates the whole product with no backend: two-axis reading (vertical one paragraph per screen, horizontal the alternate versions), canon computed by subtree weight, fork marks in the margin, authorship mode, Drift, story index, and the turn flow with a 100-character limit. State lives in memory; reloading returns to the beginning.

**Phase 2 (next):** real persistence and a shareable link, to run a one-week test with 20–30 people.

**What that test measures:**

| Question | Signal |
|---|---|
| Does scarcity work? | % of turns actually spent |
| Does the text read? | Someone from outside reads the canonical route blind and enjoys it |
| Where does it branch? | Forks per fragment. Almost none = a river in disguise; all of them = no canon is possible. |
| Which fragment wins? | Are open fragments more fecund than brilliant ones? If not, the incentive is miscalibrated. |

---

## Open questions

- How is the horizontal axis announced without adding chrome? Today only a `*` mark in the margin gives it away, and a gesture nobody discovers does not exist.
- Does **reading depth** —how far people got before abandoning a branch— come in as a canon signal alongside fecundity? It would amend rule 4, but it pushes in the same direction, unlike the like. Deferred until the rest is running.
- Is authorship revealed at the end of the reading, or only under authorship mode?
- Is there a profile? Does it show fragments or fecundity?
- Could the character limit be a property of the seed (100 / 280), the way someone picks a poetic form?
- Alternate branches read in grey so you know you are off canon. It bends the "zero chrome" rule a little: does it stay or go?
- The prototype's branches die after 3 or 4 fragments, so the horizontal axis always lands on an abrupt ending. Branches that keep going still need to be written, to find out whether the detour feels like discovery or like punishment.
- Final name. *Canver* is the current placeholder.

---

## How to work here

- **Language:** English, in the product and in the documentation.
- **Before proposing a feature**, check that it does not break the non-negotiable rules or the "what NOT to do" list.
- **Before building**, read `docs/02-system-v0.md`. `docs/01-references.md` explains why each decision is the way it is, and what killed the predecessors (Ficlets, Ficly, FoldingStory, Branch): none of them died of the concept, all of them died of infrastructure and maintenance.
- **The prototype is edited in its own file**, not rewritten from scratch.
- When a decision changes, update this file and `docs/02-system-v0.md` in the same commit.
