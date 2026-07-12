# Mode: weekend

One **overnight / getaway** sketch — not a booking agent.

## Fit

Fri–Sun free window, user said getaway/overnight/out of town, or a full free weekend.  
**SKIP** if midweek workday, only a free evening, or they only asked for a quick local thing.

## Defaults

| Input | Use from context |
|--------|------------------|
| Home | Required (from packet) |
| Range | Upcoming weekend or named dates from packet |
| Max one-way | From packet `max_one_way_getaway` (2.5 h default) |
| Nights | 1 unless they said 2 |

## Web lookup (required)

You **must use web search and page fetch**. Do not invent a town, trail, or “rooms available” from memory.

### What to search (try 1–3 queries)

Use home city + drive radius + weekend dates:

1. `weekend getaway from {city} under 2.5 hours` or `day trip overnight near {city}`
2. `{region} state park camping` or `{region} open trails` for the season  
3. `{town} events {weekend date range}` if you have a candidate town  
4. Optional: `scenic drive from {city}` + open a tourism or parks page  

### What to open

- Official **tourism / visitor bureau**, **state/national park**, or town pages  
- Seasonal status (snow, fire closure, park hours) on official pages when relevant  
- Public campground or lodge **info** pages only — never claim a reservation  

Reference-style targets (adapt by country):

- US: `nps.gov`, state parks (`*.gov` parks), town `visit*` sites  
- Always prefer the domain you actually opened over a generic “everyone goes to X”

### Rules after fetch

1. Region/place must be real and roughly within max one-way of packet home.  
2. If you claim a dated event or open trail, hours/status should match what you fetched.  
3. Stay line: type only (`campground` / `small motel` / `book yourself`) + optional info URL — **no** fake availability. Use `check-before-go`.  
4. Nothing honest → SKIP with reason (what you searched).  
5. Never invent lodge inventory or “secret town.”

## Pipeline

1. Web search + open official pages for a real region within drive.  
2. One clear hook for those dates (view, short walk, free/cheap event).  
3. Emit OPTION or SKIP.

## Output

```
STATUS: OPTION
title: … (region or trip name)
win: leave home, sleep away once, back by <day>  (or similar binary)
where/when: region · date range · ~one-way drive
hours: n/a or key site hours · check-before-go · https://…
travel: ~Xh one-way
why: fits this free window + location
stay: optional — type · check-before-go · book yourself · https://… (info only)
```

```
STATUS: SKIP
reason: … (what you searched / why nothing honest)
```
