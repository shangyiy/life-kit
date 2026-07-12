---
name: side-quest-recommend
description: >
  Builds a 1–3 card weekend/things-to-do board (easy day-start at home + optional
  local outing) from real web sources with honest hours and soft exits. Use for
  weekend plans, side quests, local outing ideas, things to do tomorrow,
  /side-quest-recommend, or a preview board. Not for multi-day travel itineraries
  or restaurant booking flows.
---

# Side quest recommend

Builds a short board of optional things to do. Standalone: no app, bot persona, or setup wizard.

**Job:** A board the human can follow — e.g. “sit with the cup 5 min before any app.”

**Tone:** Dessert, not homework. Optional always. No guilt or streaks.

Always emit cards in the **Presentation** format below (use `EASY` / `STRETCH` casing).

---

## Defaults (ask only if missing)

| Input | Default if unknown |
|--------|-------------------|
| Home / area | Ask once (neighborhood or city is enough) |
| When | **This weekend** or **tomorrow** if they said “tmr” — resolve a real calendar date |
| Transport | Walk + drive OK |
| Max one-way | **60 minutes** (up to ~75 for one Stretch) |
| Interests | nature, food if unknown |

---

## Output shape

Up to **3 cards**. Human picks **0–2**. One active at a time.

| Slot | Role | Rules |
|------|------|--------|
| **EASY · home** | Day-start, zero travel | 5–25 min · free · binary win · pleasure, not diet lecture |
| **EASY · near** | Short leave | Cheap/free · one stop · hours from a real source |
| **STRETCH** | Optional outing | Within max drive · free/cheap preferred · real place/event · honest hours. **Omit** if nothing honest survives filters. |

Always **≥1 zero-drive EASY**. Prefer in-season / dated local when real; else home only. No account or prior state required.

Always print soft exits (`skip all` · `later` · `can't today`). After one done with room left: at most **one** residual line; silence if ignored.

---

## Pipeline

### 1. Context
Date(s), home/area, max travel, interests. Recent boards: use this thread only if present; else skip novelty scoring.

### 2. Pull candidates
- **Home EASY:** catalog below (no web).
- **Near / Stretch:** search the web and open **official** pages (markets, events, parks, U-pick, free culture). Use whatever search/fetch tools the harness provides.

Default pulls (1–3 first; add 4–6 if gaps):
1. Easy home catalog  
2. Markets / produce for that day near home  
3. Free/cheap events that date  
4. Parks / short overlooks  
5. Seasonal harvest only if open  
6. Free culture (bands, free tours, festivals)  

Never invent venues to fill a slot.

### 3. Hard filters — subagent audit (required)

**Do not self-audit.** The main agent only assembles a candidate packet; a **separate auditor agent** applies the reject table. Main agent must **honor every DROP** (no filling slots by overturning the auditor).

**Main agent before audit**
1. Package each candidate with: proposed slot · title · win · claimed hours · source URL · notes (day, season, cost, drive).
2. Home EASY from the catalog still goes through audit (tone / moral-homework only; hours n/a).
3. Spawn an auditor via the harness subagent/task tool. Prefer **read-only**. Pass the packet + target date + home/area + the reject table below.

**Auditor job**
- Independently re-check near/Stretch claims against sources when possible (open URLs; do not invent hours).
- Apply reject table. Output only structured results — no board prose.

**Reject if**

| Reject | Why |
|--------|-----|
| Hours made up (“usually 9–5”) | **Never invent open hours** |
| Wrong day for market/event | Dishonest |
| Crop / season closed | Dishonest |
| Venue or trail closed | Safety / honesty |
| Expensive tickets as default Easy | Prefer free/cheap |
| Moral homework (“hydrate for wellness”) | Tiny pleasure or drop |

**Auditor output (required shape)**

```
For each candidate:
- KEEP | DROP
- reason (one line; cite source/day/season if DROP)
- hours_ok: yes | no | n/a | check-before-go
- source_url (if any)

Summary: kept N / dropped M
```

**Main agent after audit**
- Compose only from **KEEP** (and `check-before-go` only if hours fragile but real — still mark on card).
- If audit drops a slot empty: leave it empty or omit Stretch; never invent a replacement without re-pull + re-audit.
- Honesty footer uses the auditor’s DROP list.

### 4. Score & compose
Prefer free > cheap > paid · closer within slot · verified hours · novelty vs recent boards (if any) · worth the drive. **Free ≠ free if far** — mention gas/parking when relevant.

### 5. Write each card
Emit each card in the **Presentation** format. Wins should be binary and specific. Near/Stretch hours must match auditor `hours_ok` / source.

**Win patterns:** sit with cup **5 min before any app** · any veg + any protein on a plate · buy **1 fruit** · concert/set or hilltop turnaround + leave.

### 6. Honesty footer
List **dropped** ideas from the auditor briefly (season over, wrong day, closed trail).

---

## Easy home catalog (rotate)

Pick **one** for the home slot.

| Family | Title example | Win |
|--------|---------------|-----|
| Coffee/tea | Slow first pour | Brew; sit **5 min before any app** |
| Meal | Two-color plate | Any veg + any protein on one plate |
| Air | One window open | Open one window 3 min; name one outdoor sound/smell |
| Tiny tidy | Five-thing surface | Clear exactly 5 things from one surface |
| Hydrate | First glass | One full glass of water before coffee *or* first scroll |

“The win is the sit, not the caffeine optimize.”

---

## Presentation

```
Sunday board — pick 0–2. One at a time. Skip free.

EASY · home · free · ~10 min
Slow first pour
Win: brew coffee or tea; sit 5 min before any app
Hours: n/a

EASY · near · free–cheap · ~30–45 min
One fruit at [Market name]
Win: buy 1 fruit and bring it home
Hours: Sun 9am–2pm (check) · https://example.org/market

STRETCH · free · ~20–40 min one-way
[Event or park]
Win: <binary>
Hours: … · https://…

Not today: [wrong-day market] · [out-of-season crop] · [closed trail]
Soft exits: skip all · later · can't today
```

The near/Stretch lines above are **illustrative format only** — re-fetch live hours and real URLs. Optional one-line “why this board.” Don’t dump raw research unless asked.

---

## Checklist before you send

- [ ] Real date resolved  
- [ ] ≥1 zero-drive EASY  
- [ ] Hard filters run by **subagent auditor** (not main-agent self-check)  
- [ ] Every DROP honored; no invented hours  
- [ ] Wrong-day / out-of-season / closed only appear in Not today  
- [ ] Pick 0–2 · soft exits printed  
- [ ] Wins binary and doable  
- [ ] STRETCH linked or omitted  
- [ ] No app setup or guide persona required  

If any item fails, fix the board and re-run the checklist. Do not send until all pass.
