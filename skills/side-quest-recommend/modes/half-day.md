# Mode: half-day

Same-day local outing. Home base → out → back. Roughly **2–6 hours** door-to-door.

## Defaults

| Input | Default if unknown |
|--------|-------------------|
| Home / area | Ask once (neighborhood or city) |
| When | **This weekend** or **tomorrow** — resolve a real date |
| Transport | Walk + drive OK |
| Max one-way | **60 minutes** (up to ~75 for one stretch pick) |
| Interests | nature, food if unknown |

## Output

Up to **2 cards**. Human picks **0–1** (or both if they want). Prefer one primary + optional stretch.

| Slot | Role | Rules |
|------|------|--------|
| **HALF · primary** | Main outing | One clear stop or short loop · free/cheap preferred · hours from a real source |
| **HALF · stretch** | Optional add-on or farther | Within max drive · honest hours · **omit** if nothing honest survives audit |

```
Half-day — <Weekday date> — pick 0–1. Skip free.

HALF · primary · free–cheap · ~2–4 h door-to-door
<title / place>
Win: <binary>
Hours: … · https://…

HALF · stretch · …   # omit if none
…

Not today: …
```

## Pipeline

### 1. Context
Date, home/area, max travel, interests. Thread-only novelty if present.

### 2. Pull candidates
Search the web; open **official** pages. Use harness search/fetch tools.

Default pulls (1–3 first; add 4–6 if gaps):
1. Markets / produce that day near home  
2. Free/cheap events that date  
3. Parks / short overlooks  
4. Seasonal harvest only if open  
5. Free culture (bands, free tours, festivals)  
6. One short scenic drive / overlook within max one-way  

Never invent venues to fill a slot.

### 3. Subagent hard-filter audit
Required — follow **Hard filters** in [SKILL.md](../SKILL.md). Package all near/out candidates.

### 4. Score & compose
Prefer free > cheap > paid · closer · verified hours · worth the drive. **Free ≠ free if far** — mention gas/parking when relevant.

### 5. Write cards
Only KEEP candidates. Binary wins. Hours match auditor.

**Win patterns:** buy **1 fruit** and bring it home · one set / full concert or leave · hilltop turnaround + leave · walk one marked loop.

### 6. Honesty footer
Auditor DROP list under **Not today**.

## Checklist

- [ ] Real date resolved  
- [ ] Home/area known  
- [ ] Subagent auditor ran; every DROP honored  
- [ ] No invented hours  
- [ ] ≤2 cards; stretch omitted if empty  
- [ ] Wins binary and doable  
