---
name: side-quest-recommend
description: >
  Run the Side Quest recommend pipeline: build a 1–3 card board (Easy day-start +
  local/seasonal outing) with real web-sourced options, honest hours, and soft exits.
  Use when the user asks for side quests, weekend board, things to do, /side-quest-recommend,
  "recommend quests", dry-run board, or tomorrow/this weekend plans in the Side Quest product sense.
---

# Side Quest — Recommend

**What this is:** The *recommend* step only. Not full app setup, not memory badges, not weekday boards. **Guide-agnostic** — no named character required; output is a plain board anyone can paste into chat or a bot.

**Product one-liner:** Weekend side quests · Easy day-start + local explore · soft exits · dessert not homework.

**Job:** Produce a small board the human can actually follow today/tomorrow — including Easy wins like “sit with the cup 5 min before any app.”

---

## When to use

- “What should I do this weekend / tomorrow?”
- “Dry-run the board” / “suggest side quests”
- `/side-quest-recommend`
- Building or testing the Side Quest **suggest** step

## When not to use

- Full product architecture or plan rewrites
- Weekday commute boards (deferred)
- Journal / Apple Notes / memory-badge generation (later)
- Designing or locking a guide persona (out of scope for this skill)

---

## Defaults (ask only if missing)

| Input | Default if unknown |
|--------|-------------------|
| Home | Ask once, or use last known |
| When | **This weekend** or **tomorrow** if “tmr” — resolve real calendar date |
| Transport | Drive + walk OK |
| Max one-way | **60 min** (75 OK for one Stretch) |
| Tastes | nature, food if unknown |
| Phase | **Weekend only** — no weekday digests |

Example locations in this skill are **illustrations**, not product defaults.

---

## Output shape (always)

Show a **board of up to 3 cards**. Human picks **0–2**. One active at a time.

| Slot | Role | Rules |
|------|------|--------|
| **① Easy · home** | Day-start, zero drive | 5–25 min · free · binary win · **dessert tone** (pleasure, not diet lecture) |
| **② Easy · near** | Short leave | Cheap/free · one clear stop · hours from a real source |
| **③ Stretch** | Optional outing | Within max drive · free/cheap preferred · real event/place · hours honest |

Always include **≥1 zero-drive Easy**. Prefer in-season / dated local when real; else Easy-only is fine.

### Soft exits (always print)

`skip all` · `later` · `mute 3d` · `can't today`  
After a `done` with budget left: **one** residual line only; silence if ignored.

---

## How to recommend (pipeline)

### 1. Context
Date(s), home, max drive, tastes, anything they already did this week (for rotation).

### 2. Pull candidates (parallel is good)

Use **web_search / open_page** for outings. Use **templates** for home Easy (no fake “research”).

Suggested query split:

1. **Easy home catalog** — coffee/tea sit, veg+protein plate, window/air, tiny tidy, first glass of water  
2. **Markets / produce** near home for that day of week  
3. **Events** that date · free/cheap · half-day  
4. **Parks / overlooks** · short loops  
5. **Seasonal U-pick / harvest** · only if actually open  
6. **Free culture** · bands, free tours, free festivals  

You can run fewer if time is tight; never invent venues to fill slots.

### 3. Hard filters (reject if)

| Reject | Why |
|--------|-----|
| Weekday-only event when product is weekend board | Phase 1 is weekend boards |
| Hours made up (“usually 9–5”) | **Never invent open hours** |
| Market wrong day | Wrong day |
| Crop out of season | Dishonest |
| Trail/venue closed | Safety / honesty |
| Expensive tickets as default Easy | Prefer free/cheap |
| “Hydrate / get sunlight” as moral homework | Preachy — reframe as tiny pleasure or skip |

If hours are real but fragile: keep card and mark **check before you go** + link.

### 4. Score & compose

Prefer:

- Free > cheap > paid  
- Closer within slot  
- Verified hours > verify-before-go  
- Novelty vs last 2–4 boards (don’t spam the same Easy every week)  
- Worth the drive for Stretch; **free ≠ free if far** — say gas/parking vibe  

### 5. Write each card

```
① EASY · home · free · ~10 min
Title
Win: <binary, specific>
Hours: n/a or sourced hours + URL

② EASY · near · …
③ STRETCH · …
```

**Win patterns that work:**

- Sit with the cup **5 min before any app**  
- One plate with **any veg + any protein** (leftovers count)  
- Buy **1 fruit** (or free produce) and bring it home  
- Full concert / one set / hilltop turnaround + leave  

### 6. Honesty footer

List **dropped** candidates in one short table when useful (season over, wrong-day market, closed trails) so the human trusts the board.

---

## Easy home catalog (rotate)

Pick **one** for slot ①; don’t always use coffee.

| Family | Title example | Win |
|--------|---------------|-----|
| Coffee/tea | Slow first pour | Brew; sit **5 min before any app** |
| Meal | Two-color plate | Any veg + any protein on one plate |
| Air | One window open | Open one window 3 min; name one outdoor sound/smell |
| Tiny tidy | Five-thing surface | Clear exactly 5 things from one surface |
| Hydrate | First glass | One full glass of water before coffee *or* first scroll |

Tone: soft start, not self-improvement. “The win is the sit, not the caffeine optimize.”

---

## Presentation (neutral, human-readable)

Speak as a short **board drop**, not a research paper and not in-character roleplay unless the user asks for a specific guide voice:

```
Sunday board — pick 0–2. One at a time. Skip free.

① EASY · home · …
② EASY · near · …
③ STRETCH · …

Not tomorrow: …
Soft exits: skip all · later · mute 3d · can't today
```

Optional: one line **why this board** (season, weather, soft Sunday start).

Do **not** dump all raw research unless asked. Keep the board scannable; put sources as links on cards.

---

## Quality bar

Good board:

- At least one home Easy that feels nice, not preachy  
- At least one real near option with a real hours source  
- Stretch is optional and worth it (or omit if nothing honest)  
- Explicit “not recommended” list when you filtered hard  

Bad board:

- Invented hours or “probably open”  
- Three drive quests, no home Easy  
- Diet/wellness lectures  
- Tourist sludge every week with no new reason  
- Locked to a named bot persona or product mascot  

---

## Quick checklist before you send

- [ ] Real date resolved  
- [ ] ≥1 zero-drive Easy  
- [ ] No invented hours  
- [ ] Wrong-day / out-of-season / closed dropped  
- [ ] Pick 0–2 · one active · soft exits printed  
- [ ] Wins are binary and doable  
- [ ] Stretch has link or official place page  
- [ ] No required guide name / persona voice  

---

## Example (pattern only — re-fetch live)

Illustrative pattern (any city; re-fetch for real date/home):

1. **Slow first pour** — sit 5 min before any app  
2. **Local Sunday market or free produce stand** — one fruit (hours from official page)  
3. **Free concert / short hill / dated free festival** — Stretch  
Dropped: out-of-season U-pick, wrong-day neighborhood market, closed trails  

Always re-web for the user’s real date and home — do not paste examples as live truth.
