# Mode: weekend

Overnight or multi-day **away** from home, then return. Not a full travel-agent booking flow.

## Defaults

| Input | Default if unknown |
|--------|-------------------|
| Home / area | Ask once |
| When | **Upcoming weekend** — resolve Fri/Sat/Sun (or their range) |
| Transport | Drive OK |
| Max one-way | **2.5 hours** (ask if they want farther) |
| Nights out | **1** (Sat night) unless they said 2 |
| Interests | nature, food, small towns if unknown |
| Budget | free/cheap outdoor + modest stay unless they said otherwise |

## Output

One **trip sketch**, not a hotel booking. Up to **3 cards**: anchor destination + 1–2 doables.

| Slot | Role | Rules |
|------|------|--------|
| **WEEKEND · anchor** | Where / region | Real place within max drive · why it fits this weekend |
| **WEEKEND · day** | Daytime doable | Dated/seasonal if relevant · honest hours · free/cheap preferred |
| **WEEKEND · stay** | Sleep option type | Region-level or named public campground / known lodge **with source** — never invent availability. Or omit and say “book your own stay” |

```
Weekend trip — <date range> — optional sketch. Skip free.

WEEKEND · anchor · ~Xh one-way
<title / region>
Win: leave home, sleep away once, back by <day>
Drive: ~… · why this weekend: …

WEEKEND · day · free–cheap
<title>
Win: <binary>
Hours: … · https://…

WEEKEND · stay · check-before-book
<option type or named public site>
Win: have a bed/site booked before you leave
Note: confirm availability yourself · https://…   # omit slot if nothing honest

Not today: …
```

## Pipeline

### 1. Context
Date range, home, max drive, nights, interests, constraints (kids, dogs, no camping, etc.).

### 2. Pull candidates
Web search + official pages for:
1. Regions / towns within max one-way with a clear weekend hook  
2. Dated events / festivals that weekend  
3. Parks, trails, scenic loops open that season  
4. Seasonal draws (foliage, bloom, snow, harvest) **only if in season**  
5. Public campgrounds or well-documented stay areas (optional)  

Never invent a “secret town” or fake lodge inventory.

### 3. Subagent hard-filter audit
Required — [SKILL.md](../SKILL.md) reject table **plus** weekend rows (overnight claims need a real place/region; stay claims need a source or omit).

### 4. Score & compose
Prefer: honest open season · worth the drive for 1+ nights · one clear anchor · not a packed itinerary. **One primary arc**, not five cities.

### 5. Write cards
KEEP only. Stay slot: type + link, or omit. No booking steps, payment, or “I reserved for you.”

### 6. Honesty footer
Auditor drops (closed pass, wrong weekend for festival, out of season, etc.).

## Out of scope (say no / redirect)

- Flight itineraries, multi-city tours, visa, full packing lists  
- Actually booking lodging or tickets  
- Restaurant reservation flows  

If they need only a **same-day** outing, switch to **half-day**. If they need a **tiny home ritual**, switch to **starter**.

## Checklist

- [ ] Date range + home + max drive resolved  
- [ ] Subagent auditor ran; every DROP honored  
- [ ] Anchor is real and within drive  
- [ ] No invented hours / season / stay availability  
- [ ] Stay omitted or sourced as check-before-book  
- [ ] Not a booking agent response  
