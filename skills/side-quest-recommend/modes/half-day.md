# Mode: half-day

Same-day local outing. Home → out → back. Roughly **2–6 hours** door-to-door.

## Defaults

| Input | Default if unknown |
|--------|-------------------|
| Home / area | Ask once (neighborhood or city) |
| When | **This weekend** or **tomorrow** — resolve a real date |
| Transport | Walk + drive OK |
| Max one-way | **60 minutes** (up to ~75 for one stretch) |
| Interests | nature, food if unknown |
| **Slate** | Founder/user list of real places (name + optional official URL). **P1 source of truth.** |

## Output

Up to **2 cards**. Prefer one primary + optional stretch. **Omit** stretch if nothing honest survives audit.

```
Half-day — <date> — pick 0–1. Skip free.

HALF · primary · free–cheap · ~2–4 h door-to-door
<title / place>
Win: <binary>
Hours: … · https://…

HALF · stretch · …   # omit if none

Not today: …
```

## Pipeline

### 1. Context
Date, home/area, max travel, interests. Injected profile if present.

### 2. Pull candidates — curated slate first
1. Use the **curated slate** (named places/events + optional URL for this home).  
2. If slate is empty, ask once for 1–3 real places they already know (or accept Easy-only when composed with starter).  
3. **Do not** live-scrape or invent venues to fill slots. Optional: open a slate URL only to check hours.  
4. Later (not default): richer live search is product Phase 3+.

Never invent venues.

### 3. Audit
Required — [SKILL.md](../SKILL.md) hard filters. Package all outing candidates.

### 4. Compose
KEEP only. free > cheap > paid · closer · verified hours. **Free ≠ free if far** — mention gas/parking when relevant.

### 5. Wins
Binary: buy **1 fruit** · one set/leave · hilltop turnaround · one marked loop.

## Checklist

- [ ] Date + home known (or asked once)  
- [ ] Outs from slate (or user-named real places) — no invent  
- [ ] Audit ran; every DROP honored  
- [ ] ≤2 cards; stretch omitted if empty  
