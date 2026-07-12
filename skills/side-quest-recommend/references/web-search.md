# Web search & fetch

Shared lookup for **half-day** and **weekend** options.  
Goal: every place/hours claim is **grounded** — real URL opened, day matches, doable.

## Pipeline (do this order)

```
1. SEARCH   1–3 targeted queries (query sets below)
2. OPEN     official page(s) for the best 1–2 candidates
3. VERIFY   weekday/date, open/closed, within drive of packet home
4. EMIT     OPTION with hours + URL  — or SKIP with what you tried
```

**Must use tools:** `web_search` + page fetch (`web_fetch` / `open_page` / browse).  
**Do not** invent from memory. **Do not** stop at a SERP snippet — open the page.

If tools fail or nothing verifies → **`STATUS: SKIP`** (list queries). Never “usually 9–5.”

## What to open (priority)

1. Venue / market / park **own** site  
2. `.gov`, park district, city recreation  
3. Market associations, visitor bureaus (`visit*`)  
4. **Last resort:** well-known aggregator — still verify; prefer official  

**Skip as sole source:** random blogs, undated listicles, social posts without hours.

US-shaped patterns (adapt elsewhere):

| Kind | Prefer |
|------|--------|
| Parks | `nps.gov`, state parks `*.gov`, `*parks.org` |
| Markets | Named market + “hours” → association or city page |
| Events | Official calendar with an explicit **date** |

Always use the **URL you opened**, not a guessed homepage.

## Verify (fail closed)

| Check | Fail → |
|--------|--------|
| Hours cover **packet weekday/date** | Drop candidate; try another or SKIP |
| Place exists (named, address/area on page) | Drop |
| Within ~packet max one-way of home | Drop (or note too far and SKIP) |
| Seasonal / closure noted on page | Drop if closed for packet dates |
| Stay “available tonight” | **Never claim** — info URL only + check-before-go |

Fragile but real → keep OPTION with **`check-before-go`** + URL.

## Query sets

Fill from packet: `{city}` `{weekday}` `{date}` `{date_range}` `{max_one_way}`.

### half-day (same-day / next free day)

Run until you have **one** verified stop (or SKIP):

1. `farmers market {city} {weekday}` / `farmers market near {city} hours`  
2. `farmers market {nearby city} {weekday}` if home city’s market is wrong day  
3. `free events {city} {date}` or `{city} events {weekday}`  
4. `{city} state park` OR `short hike near {city}` — then open **hours/status** page  

Win shapes: buy **1 fruit** · one short loop · one free set/leave.

### weekend (overnight getaway)

Only if free window allows a real leave–sleep–return (not late night, unbooked “leave tonight”):

1. `weekend getaway from {city} under {max_one_way}`  
2. `{region} state park` + open status/hours  
3. `{town} events {date_range}` if a town candidate appears  
4. Optional: `scenic drive from {city}` → visitor bureau  

Stay line: **type only** + info URL · check-before-go · book yourself — **no** inventory invent.

## Anti-patterns

- Snippet-only hours (didn’t open page)  
- Wrong-day market sold as open  
- “Everyone goes to X” with no URL  
- Inflated “half-day” that is actually a full expedition  
- Overnight fantasy with no booked bed late at night  

## Done when

- **OPTION:** place + binary win + travel + **hours text + https://… you opened** + why it fits packet  
- **SKIP:** one line on searches tried / why nothing honest  
