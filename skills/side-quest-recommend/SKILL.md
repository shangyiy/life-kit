---
name: side-quest-recommend
description: >
  Standalone skill: build a small 1–3 card weekend/things-to-do board (easy day-start at
  home + optional local outing) using real web sources, honest hours, and soft skips.
  Use when the user wants things to do, a weekend board, local suggestions,
  /side-quest-recommend, "recommend quests", or a preview board.
---

# Side quest recommend

Standalone recommend skill. It only builds a short board of optional things to do.
It does **not** depend on any app, bot persona, setup wizard, or product plan.

**Job:** Give the human a board they can actually follow — including easy wins like “sit with the cup 5 min before any app.”

**Tone:** Dessert, not homework. Optional always. No guilt, streaks, or productivity coach voice.

---

## When to use

- “What should I do this weekend / tomorrow?”
- “Suggest side quests” / “weekend board” / “things to do near me”
- `/side-quest-recommend`

## When not to use

- Full product / app architecture design
- Hiring, resume, or unrelated tasks
- Long multi-day itineraries (use a travel planner mindset instead — this skill is 1–3 short cards)

---

## Defaults (ask only if missing)

| Input | Default if unknown |
|--------|-------------------|
| Home / area | Ask once (neighborhood or city is enough) |
| When | **This weekend** or **tomorrow** if they said “tmr” — resolve a real calendar date |
| Transport | Walk + drive OK |
| Max one-way | **60 minutes** (up to ~75 for one Stretch) |
| Interests | nature, food if unknown |

Location examples in this file are **illustrations only**, not fixed defaults.

---

## Output shape (always)

Up to **3 cards**. Human picks **0–2**. One active at a time.

| Slot | Role | Rules |
|------|------|--------|
| **① Easy · home** | Day-start, zero travel | 5–25 min · free · binary win · pleasure, not diet lecture |
| **② Easy · near** | Short leave | Cheap/free · one clear stop · hours from a real source |
| **③ Stretch** | Optional outing | Within max drive · free/cheap preferred · real place/event · honest hours |

Always include **≥1 zero-drive Easy**. Prefer in-season / dated local when real; else home Easy only is fine.

### Soft exits (always print)

`skip all` · `later` · `can't today`  

(If the user is building a bot later they may add `mute` — not required for this skill.)

After they complete one card with room for another: at most **one** residual suggestion; if they ignore it, stop.

---

## Pipeline

### 1. Context

Date(s), home/area, max travel, interests, anything they already did recently (for rotation).

### 2. Pull candidates

- **Home Easy:** templates below (no web needed).
- **Near / Stretch:** `web_search` / `open_page` for markets, events, parks, seasonal U-pick, free culture.

Useful parallel pulls:

1. Easy home catalog  
2. Markets / produce for that day of week near home  
3. Events on that date (free/cheap, half-day)  
4. Parks / short overlooks  
5. Seasonal harvest only if actually open  
6. Free culture (bands, free tours, free festivals)  

Never invent venues to fill a slot.

### 3. Hard filters (reject if)

| Reject | Why |
|--------|-----|
| Hours made up (“usually 9–5”) | **Never invent open hours** |
| Wrong day for a market/event | Dishonest |
| Crop / season closed | Dishonest |
| Venue or trail closed | Safety / honesty |
| Expensive tickets as the Easy default | Prefer free/cheap |
| Moral homework (“hydrate for wellness”) | Reframe as tiny pleasure or drop |

If hours are real but fragile: keep the card, mark **check before you go** + link.

### 4. Score & compose

Prefer free > cheap > paid · closer within slot · verified hours · novelty vs recent suggestions · worth the drive for Stretch. **Free ≠ free if far** — mention gas/parking when relevant.

### 5. Write each card

```
① EASY · home · free · ~10 min
Title
Win: <binary, specific>
Hours: n/a  or  sourced hours + URL

② EASY · near · …
③ STRETCH · …
```

**Win patterns that work:**

- Sit with the cup **5 min before any app**  
- One plate with **any veg + any protein** (leftovers count)  
- Buy **1 fruit** (or free produce) and bring it home  
- Full concert / one set / hilltop turnaround + leave  

### 6. Honesty footer

When you filtered hard, list **dropped** ideas briefly (season over, wrong day, closed trail) so the board is trustworthy.

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

Tone: soft start. “The win is the sit, not the caffeine optimize.”

---

## Presentation

Short board drop — scannable, not a research dump. No required character voice.

```
Sunday board — pick 0–2. One at a time. Skip free.

① EASY · home · …
② EASY · near · …
③ STRETCH · …

Not today: …
Soft exits: skip all · later · can't today
```

Optional one line: why this board (weather, season, soft morning).

Put sources as links on cards. Don’t dump raw research unless asked.

---

## Quality bar

**Good**

- Home Easy feels nice, not preachy  
- Near option has a real hours source  
- Stretch optional and worth it (or omitted)  
- Dropped list when filters fired  

**Bad**

- Invented hours  
- Three drive quests, no home Easy  
- Diet/wellness lectures  
- Same tourist loop every time with no new reason  
- Depends on an app, bot name, or external product doc  

---

## Checklist before you send

- [ ] Real date resolved  
- [ ] ≥1 zero-drive Easy  
- [ ] No invented hours  
- [ ] Wrong-day / out-of-season / closed dropped  
- [ ] Pick 0–2 · soft exits printed  
- [ ] Wins binary and doable  
- [ ] Stretch has a link or official page (if present)  
- [ ] Works without any app setup or guide persona  

---

## Example pattern (not live truth)

1. **Slow first pour** — sit 5 min before any app  
2. **Local market / free produce stand that day** — one fruit (hours from official page)  
3. **Free concert / short hill / dated free festival** — Stretch  

Always re-fetch for the user’s real date and home.
