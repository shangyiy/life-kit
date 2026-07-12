# Web search & fetch (half-day + weekend)

Shared lookup rules. Mode files only define **fit, defaults, output shape, and which query set** to use.

## Must use tools

Before any outing/getaway **OPTION**, run **web search + open/fetch** (harness: `web_search`, `web_fetch`, `open_page`, browse, etc.).

Do **not** invent places, hours, seasons, or “rooms available” from memory alone.

If tools fail or nothing honest survives → **`STATUS: SKIP`** (cite what you tried). Never fabricate a venue name or “usually 9–5.”

## What to open

Prefer, in order:

1. Venue / market / park **official** site  
2. `.gov` / park district / city pages  
3. Established market associations, visitor bureaus (`visit*`)  
4. Avoid random blogs as sole source for hours  

US-shaped patterns (adapt by country):

- Parks: `nps.gov`, state parks `*.gov`, local `*parks.org`  
- Markets: “{name} farmers market” → official hours page  
- Events: city/official events calendar with a clear **date**  

Always prefer the **URL you actually opened**.

## Rules after fetch

1. Hours/status must match the **packet weekday/date** (or weekend range). Wrong day → drop candidate, try another or SKIP.  
2. Put the **opened URL** on the OPTION (`hours:` line).  
3. Fragile / unclear schedule → URL + **`check-before-go`**.  
4. Place must be roughly within packet **max one-way** of home.  
5. Stay (weekend only): type + info URL only — **no** fake availability; `check-before-go` · book yourself.  
6. Nothing honest after real lookups → SKIP with reason (queries tried).

## Query sets

Use packet `{city}`, `{weekday}`, `{date}`, `{date_range}`, `{max_one_way}`. Try **1–3** queries, then open best hits.

### half-day (same-day local)

1. `farmers market {city} {weekday}` or `farmers market {city} hours`  
2. `free events {city} {date or "this weekend"}`  
3. `short hike OR park overlook near {city}` (same day open)  
4. Optional: `{neighborhood} things to do free`

Pick **one** clear stop (market fruit, short park loop, free event that day).

### weekend (overnight / getaway)

1. `weekend getaway from {city} under {max_one_way}` or `overnight near {city}`  
2. `{region} state park` / `open trails` for the season  
3. `{town} events {date_range}` if you have a candidate town  
4. Optional: `scenic drive from {city}` → tourism or parks page  

One real region + one doable hook for those dates. Not a booking agent.
