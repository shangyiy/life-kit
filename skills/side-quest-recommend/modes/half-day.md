# Mode: half-day

One **same-day** local outing. Home → out → back. Roughly 2–6 h door-to-door.

## Fit

Daylight free time, weekend afternoon, “things to do near me.” SKIP if user is clearly mid-flight / only wants home / only wants overnight.

## Defaults

| Input | Use from context |
|--------|------------------|
| Home / area | Required (from packet) |
| Date | Target day + **weekday** from packet |
| Max one-way | From packet `max_one_way_local` (60 min default; ≤75 only if clearly worth it) |

## Web lookup (required)

You **must use web search and page fetch** (whatever the harness provides: `web_search`, `web_fetch`, `open_page`, browse, etc.). Do **not** invent a place or hours from memory alone.

### What to search (try 1–3 queries)

Use the packet city + weekday + date:

1. `farmers market {city} {weekday}` or `farmers market {city} hours`
2. `free events {city} {date or "this weekend"}`
3. `best short hike OR park overlook near {city}` (pick one open same day)
4. Optional: `{neighborhood} things to do free` if neighborhood known

### What to open

- **Official** market / park / city / venue pages when you find them  
- Event listing with a clear date that matches the packet  
- Prefer `.gov`, park district, market association, or the venue’s own site over random blogs  

Useful patterns (adapt to region):

- City/events: search → open the official events or parks page  
- US parks: `nps.gov` or local `*parks.org` / city parks department  
- Markets: “{name} farmers market” → official hours page  

### Rules after fetch

1. Hours must match the **packet weekday/date**. Wrong day → DROP that candidate (try another or SKIP).  
2. Put the **URL you opened** on the OPTION (`hours:` line).  
3. Fragile / unclear schedule → still include URL + `check-before-go`.  
4. No honest candidate after real lookups → `STATUS: SKIP` with reason (cite what you tried).  
5. Never invent a venue name or “usually open 9–5.”

## Pipeline

1. Run web lookups above for the packet location + date.  
2. Pick **one** clear stop (market fruit, short park loop, free event that day).  
3. Confirm hours from an opened page when possible.  
4. Emit OPTION or SKIP.

## Output

```
STATUS: OPTION
title: …
win: binary (e.g. buy 1 fruit and bring it home)
where/when: place · date · ~door-to-door time
hours: sourced text · check-before-go if fragile · https://…
travel: one-way estimate
why: fits this datetime + location
```

```
STATUS: SKIP
reason: … (what you searched / why nothing honest)
```
