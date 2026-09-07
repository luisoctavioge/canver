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
2. **Answers are scarce.** One turn a day, five saved at most. Scarcity is not a limitation: it is what turns every answer into an editorial decision. *(Was three a week until 05-sep-2026. A day's cadence is more than double that, so it buys less scarcity; what it buys instead is that people can take part every day of the test rather than run dry on Tuesday. Worth revisiting after the week.)*
3. **Seeding costs more than continuing.** 3 turns against 1, and the right to seed is unlocked by having continued. Without this, everybody seeds and nobody continues.
4. **The like backs a paragraph, and the canon follows it.** More likes, more canon; ties go to the older one. *(Amended 05-sep-2026. The rule used to forbid likes and votes outright, and canon was written by subtree weight — turns spent, not thumbs. The reason for the change is worth keeping: the like was not designed, it was felt while reading versions of the same moment on a phone and wanting to back one.)* **Fecundity** — how many continuations were born from your fragment — is still the metric that describes a hand, and it is still unfalsifiable, because every point of it costs somebody a scarce turn. No count of likes is ever shown: what you see is not how many backed a version, it is which version they made canon.
5. **When writing you see two fragments; when reading you see everything.** A translation of the Japanese renga rule (*link and shift*). It produces local coherence and global drift.
6. **Reading has two axes, and it runs out.** Vertical is the time of the story: one paragraph per screen, from beginning to end, and when a story ends the next one follows if you keep scrolling — until there are no stories left, and then the scroll simply reaches the bottom. Horizontal is the other versions of that same moment. No cards, no avatars, no timestamps, no counters. *(Revised 04-sep-2026 to chain story after story, which this rule used to forbid; 05-sep-2026 dropped the closing screen, so the boundary is carried entirely by the announcement of the next story. Amended 06-sep-2026: **each story appears once and the reading ends.** It used to loop, picking another story at random for as long as you scrolled, and a reel that starts over is a feed under another name. What makes this an anthology is that it can be finished. The order is shuffled, never by age or backing — that is the anti-Matthew rule, so freshly seeded and orphaned stories do not pile up at the end.)* The seam between fragments is a space, never a visible line.
7. **Authorship is off by default.** First you read a text; then, if you turn on authorship mode, you watch it break into many hands, and tapping a fragment tells you whose it is. That revelation is the emotional moment of the product and it burns out if authorship is visible all the time.
8. **AI does not write fragments.** It would destroy scarcity, which is the entire asset of the system. *(It was amended on 03-sep-2026 to translate the sample fiction into English on the owner's explicit instruction; on 05-sep-2026 the original Spanish was restored word for word from the translation table, so no machine-written text is left in the corpus. The rule stands.)*

---

## Decisions taken

| Decision | Value | Note |
|---|---|---|
| Topology | **Legible tree** | Anyone continues from any point; when reading, every fork gets resolved. |
| Canon | **Likes on the paragraph** | At every fork the most backed version goes first. Ties → the older one. It is recalculated, so the default reading changes as people back things. *(Was subtree weight until 05-sep-2026.)* |
| Resolving a fork | **Canon, by hand, or by chance** | A single primitive. Canon by default, the horizontal axis by hand, Drift with the die. |
| Unit | **Text, ~100 characters** | A fragment, also called a line. Short ones weave paragraphs; long ones read as separate voices and fall back into the shape of a list. |
| Story | **Five paragraphs** | Twenty-five lines by twenty-five different people, and it ends. The vertical axis is finite; the horizontal one is not. *(Provisional.)* |
| Paragraph | **Five lines, five hands** | Exactly five, never fewer once closed, and nobody twice in the same one. The count decides the break, not the writer. |
| Media | **Text only in the MVP** | Image, audio, code and video come later. |
| Typography | **IBM Plex Sans** (reading) + **IBM Plex Mono** (apparatus) | One superfamily, two roles. 18px on a 32px grid. |
| Sustaining it | Subscription, not advertising | Advertising breaks the attention economy of the product. |
| Language | **Spanish in the product, English in the docs** | One language at a time, never two: the first test runs with Spanish-speaking friends, so the product speaks Spanish. *(05-sep-2026. It went English on 03-sep and came back; the documentation stayed English, since nobody outside the project reads it.)* |
| Translation | **None** | A machine translation would give twenty-five hands a single voice, and the chain would be built on a text nobody wrote. If it ever comes, it is for reading only — never for writing. |

---

## What NOT to do

Mistakes a new assistant makes by default and that are forbidden here:

- Adding likes, hearts, votes, view counters or popularity rankings.
- Turning reading into cards, chat bubbles, a timeline, or a feed that loads without end. The continuous scroll of a finite route is the correct form: it chains story after story and then it finishes.
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
docs/03-open-threads.md what is still being thought through, nothing decided
prototype/index.html    static prototype, one file, no dependencies
db/01-schema.sql        tables and row policies for the shared database
db/02-seed.sql          five stories, one line each: everything else gets written
db/03-write.sql         first version of write_line and seed_story
db/04-turns.sql         a turn a day, claimed on arrival, no scheduler
db/05-fix-write.sql     a fix that never ran; superseded by the 06
db/06-una-sola-linea.sql  prunes the corpus back to the seed, and fixes write_line
DIAGRAM 1.png           the reading model as it stands
DIAGRAM 2.png           stories chained in one stream, still to be designed
```

**Current phase:** 2 — the prototype reads and writes against a shared Postgres (Supabase), reached over plain `fetch`, so it is still one file with no build. Who you are comes in the link (`…/prototype/#ana`); likes, bookmarks and lines are stored; turns accrue one a day, claimed on arrival. It is live at `luisoctavioge.github.io/canver/prototype/`.

**The corpus starts at one line.** *(06-sep-2026.)* Five stories, one sentence each, nothing continued. Reading something already finished gives you nothing to continue, and continuing is the only thing the test measures — so what the test starts from is five seeds and five turns' worth of appetite. The five sentences were already written, by their own hands, in the sample fiction; choosing which of them open rather than continue was the only editing done, and rule 8 stands.

**Still to run:** `db/06-una-sola-linea.sql`, by hand in the SQL editor. It is a one-time script and deliberately not a migration: it deletes every fragment that hangs off a seed, which is exactly the wrong thing to replay once people have written.

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
- **How many paragraphs at most can a story have?** Pending, and load-bearing: it is what makes a story finite, and a finite story is what keeps an endless scroll from being a feed.
- Could the character limit be a property of the seed (100 / 280), the way someone picks a poetic form?
- Alternate branches read in grey so you know you are off canon. It bends the "zero chrome" rule a little: does it stay or go?
- The prototype's branches die after 3 or 4 fragments, so the horizontal axis always lands on an abrupt ending. Branches that keep going still need to be written, to find out whether the detour feels like discovery or like punishment.
- Final name. *Canver* is the current placeholder.

---

## How to work here

- **Language:** Spanish in the product, English in these documents. One language at a time — mixing them is what the translation decision rules out.
- **Before proposing a feature**, check that it does not break the non-negotiable rules or the "what NOT to do" list.
- **Before building**, read `docs/02-system-v0.md`. `docs/01-references.md` explains why each decision is the way it is, and what killed the predecessors (Ficlets, Ficly, FoldingStory, Branch): none of them died of the concept, all of them died of infrastructure and maintenance.
- **The prototype is edited in its own file**, not rewritten from scratch.
- When a decision changes, update this file and `docs/02-system-v0.md` in the same commit.
- What is not decided yet lives in `docs/03-open-threads.md`. When something there gets decided it moves into `02` and leaves that file.
