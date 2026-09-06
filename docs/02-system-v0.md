# Canver — System v0

**Date:** 03-sep-2026
**Decisions:** topology = *legible tree*. Unit = text, ~100 characters (text-only MVP). Reading experience = **two axes, not a feed**: vertical is the time of the story (one paragraph per screen), horizontal the alternate versions of that moment.

---

## 0. Guiding principle

> **You don't publish. You continue.**

The unit of value is not the post: it is the **link**. Every rule exists to protect one single thing: that continuing someone else's work is more desirable than talking about yourself.

Formal reference: the Japanese **renga**. Master rule of *link and shift*: each verse connects to the one immediately before it and moves away from the one two back.

---

## 1. Primitives

| Primitive | Definition |
|---|---|
| **Fragment** | The only publishable unit, also called a line. ~100 characters. Every fragment has exactly one parent. |
| **Paragraph** | Exactly five lines by five different hands. Not published by anyone: it closes on the count. |
| **Story** | Five paragraphs at most: twenty-five lines by twenty-five different people, and then it ends. *(Provisional, 05-sep-2026.)* |
| **Seed** | A fragment with no parent. Scarce by design. |
| **Fork** | A fragment with more than one child: that is where the story branches. |
| **Route** | A sequence root → leaf. It is what reads as one continuous text. |
| **Leaf** | A fragment with no continuation yet. It is the only thing that shows up in the feed. |
| **Turn** | The currency of the system. One turn = one published fragment. |

---

## 2. Writing / reading asymmetry *(central mechanism)*

- **When writing** you only see the fragment you are answering and its parent. Two fragments, nothing more.
- **When reading** you see the whole route, with no authorship visible.

Local coherence plus global drift. It is the direct answer to what went wrong in the references: FoldingStory hides everything but the last fold and produces jokes; Ficlets showed everything and produced illegible trees. The window of two is the middle ground, and nobody has taken it.

---

## 3. Turn economy

| Rule | Starting value | Reason |
|---|---|---|
| Turns per period | 3 a week | Enough to have judgement, too few to make noise. Weekly avoids streak anxiety. |
| Accumulation cap | 5 | You can save, not hoard. |
| Cost of continuing | 1 turn | The default action is the cheapest one. |
| Cost of seeding | 3 turns, unlocked after N continuations | **You earn the right to start by having continued.** Without this, everybody seeds and nobody continues. |
| Reward | +1 turn when somebody continues YOUR fragment | See below. |

### Two different jobs: fecundity describes, the like decides

**Fecundity** — how many continuations were born from your fragment — is what describes a hand. It rewards the **open, continuable** fragment rather than the closed and brilliant one, because your reward is that somebody spent a scarce turn following you. It stays unfalsifiable: every point of it costs another person a turn.

**The like** does a different job: it decides which version of a moment is canon. It is free, and that is the risk taken knowingly on 05-sep-2026 — the guard is that **no count is ever shown**. You cannot see how many backed something; you can only see what they made canon. There is no number to chase.

---

## 4. Resolving the tree

Every fork gets **resolved**: somebody decides which branch the reading follows. There is a single primitive and three ways of driving it.

### Canon — resolved by the likes

At every fork the winner is the version with **the most likes on its paragraph**. A heart above each paragraph shows whether you backed it — outline if not, filled if so — and either tapping it or double-tapping the paragraph backs it. No count is shown anywhere: you see what you gave, never how many gave it.

*(Revised 05-sep-2026. It used to be subtree weight — the branch with the most accumulated fragments, each one a turn somebody spent. That was unfalsifiable and paid for; the like is free. What made the change worth it is that the like came from reading, not from theory: swiping through versions of the same moment, some of them make you want to back them.)*

Three properties:

1. **Canon is not permanent.** It is recalculated as people back things. Today's text may not be the text a month from now: that is the work breathing.
2. **Tie → the older one.** Stability. If recency breaks ties, the text trembles every week. In practice the canonical continuation was written first, so with no likes at all nothing moves.
3. **A like can outrank a whole continuation.** At a fork the siblings are the next canonical paragraph and the alternate versions. One like on a version puts it ahead of a continuation that carries the rest of the story — and since a version is a dead end until somebody continues it, the story re-routes and gets shorter by default. Nothing is lost: the displaced continuation is one swipe away. Whether that is the right behaviour is worth watching in the test.

### By hand — resolved by the reader

On the horizontal axis of the reading. Standing on a forked screen, you switch branch and with it everything hanging below.

This is not *choose your own adventure*, and the difference is not one of degree: **the branch is not an offer, it is evidence.** It does not say "choose", it says *here the story also did this*. You are following a road other people walked, not selecting option B. Hence the hard rule: **never present canon and branch as two equivalent options side by side.** That would be a menu. The canon is the text; the branch is a footnote you can step into.

### Drift — resolved by chance

The same action, automatic and all at once: the die resolves every fork on the route. You never read the same story twice. It is a switch: turning it off returns you to canon.

---

## 5. The feed is a decision, not a scroll

It shows **leaves** — open endings waiting for a continuation. Few (3–5) at a time, with their parent as the only context. **Anti-Matthew rule:** the order is not by popularity; fresh and orphaned leaves are mixed together.

---

## 6. Death, pruning and the archive

- **Fossil:** a leaf with no continuation after X time leaves the feed but stays readable. The archive of endings is part of the work.
- **Nobody closes a story.** A route ends when it fossilises.
- **Pruning:** removing a fragment cuts its whole branch and leaves a visible gap.

---

## 7. Visual layer: the scroll, not the feed

**Principle:** *writing is fragmentary; reading is continuous.* If the reading shows the seams, the system gives itself away as a social network.

1. **Zero chrome repeated per unit.** No cards, borders, avatars, timestamps, counters or bubbles.
2. **Book composition.** Single column, 60–70 characters per line, generous leading, real margins.
3. **The seam is a space, not a line.** The boundary between fragments does not coincide with any visual boundary.
4. **The paragraph is emergent, not published.** Exactly five lines, by five different hands. Nobody decides where one breaks: the count does. Continuing joins the last paragraph while there is room and opens a new one when it is full, and nobody may write twice inside the same paragraph — five lines are always five people.
5. **Two axes, and the reading does not stop.** Vertical is the time of the story: **one paragraph per screen**, from beginning to end; when a story ends, the next one follows if you keep scrolling, and it announces itself where the echo would be. Horizontal is the other versions of that same moment. *(Revised 03-sep-2026: the previous version paginated, and on a phone nobody found the tap. Revised again 04-sep-2026: the scroll now chains story after story, which §7 used to forbid. What separates this from a feed is not the length of the corpus but that **each story ends, says so, and the next is announced** — the boundary is a threshold, not a hairline. A cap on paragraphs per story is what guarantees it: five.)*
6. **The vertical axis is finite, the horizontal one is not.** A story is five paragraphs; a moment holds as many versions as people care to write. What ends is the story, not the reading. A bookmark on the other side of that same band saves the **story**, not the paragraph — it sits with the spine because the spine is the only thing on screen that belongs to the story as a whole. Five stacked rules above the text — like a hamburger with five lines — say which of the five paragraphs you are standing on; the current one is wider and in the accent colour. One fixed indicator, never repeated per screen. *(Was five dots in the bottom bar until 05-sep-2026; they read as an ellipsis and sat too far from the text.)*
7. **You write inside the text, not on a form.** The last version is always blank: swiping past the ones that exist lands on an empty one, and that is the invitation to write it — reaching the end of the versions and being asked to add one are the same gesture. Any version with fewer than five lines can also take your line. In both cases the caret sits exactly where the line will go, in the same type, under the last line you were reading. No second screen, no field, no counter, no button: the limit simply stops accepting, and Enter publishes. *(Added 05-sep-2026, after a first attempt sent writing to its own screen with labels and dividers. Writing is reading with a caret in it.)*
8. **Versions are ordered left to right and the canon is the leftmost one.** There is a single gesture, right to left, and it always advances; past the last one you come back to the canon. A single direction makes the axis learnable without explaining it: there is no need to discover that you can also go back.
9. **The tail of the previous paragraph shows above**, faint and clipped to two lines. It gives continuity while reading and makes the fork legible: on switching version the one above does not change, so you can see that both continuations come out of the same parent. As each screen arrives, that paragraph brakes and dims while the new one brightens.
10. **A fork does not cut a paragraph short.** It used to, so that the fork would coincide with a paragraph break; but a paragraph is now always five lines, and that takes precedence. *(Revised 04-sep-2026. How a fork opens is still to be designed — see §8.)* A discreet marginal mark says this moment has another version: book apparatus, not a button.
11. **Authorship is off by default.** An *authorship* mode tints every fragment by hand: first you read a text, then you watch it break into 200 hands. Tapping a fragment deepens its tone and gives the name of that hand **below, in the apparatus** — not in the margin, which does not exist on a phone, and not floating over the text, which would cover the neighbouring lines.

*(05-sep-2026: in the prototype the two have collapsed into one. Writing happens inside the reading — a caret where the line will go — so the turn screen has no entry point left. The table below still describes the intended split for when the turn needs more than a line of text.)*

### Two objects, two languages

| | **Reading mode** | **Turn mode** |
|---|---|---|
| What it is | The work | The game |
| Form | Page, typography, silence | Utilitarian: three leaves and a field |
| Chrome | None | The functional minimum |

### Consequence for the limit

Short fragments weave paragraphs; long fragments read as separate voices and fall back into the shape of a list. **The shorter the fragment, the more invisible the seam.**

---

## 8. Open questions

1. Is authorship revealed at the end, or only under *authorship* mode?
2. Is there a profile? Does it show fragments or fecundity?
3. ~~Does the fork mark interrupt the reading or appear on a second pass?~~ Resolved: neither. The mark only warns that this moment has another version; the detour lives on the horizontal axis. How that gesture gets announced is still open.
4. Does AI take part? Starting position: **no**. It destroys scarcity, which is the asset.
5. Sustaining it: subscription. Advertising breaks the attention economy of the product.
6. Could the character limit be a property of the seed (100 / 280)?
7. **How many paragraphs at most can a story have?** It is what makes a story finite, and therefore what keeps the endless scroll from becoming a feed.

---

## 9. How it gets validated

A one-week test with 20–30 people: one tree, 3 seeds, 100 characters, 3 turns per person, a viewing window of 2.

| Question | Signal |
|---|---|
| Does scarcity work? | % of turns actually spent |
| Does the text read? | Someone from outside reads the canonical route blind |
| Where does it branch? | Forks per fragment. Almost none = a river in disguise; all of them = no canon is possible. |
| Which fragment wins? | Are open fragments more fecund than brilliant ones? If not, the incentive is miscalibrated. |
