# Web search and fetch

This is the lookup for the half-day and weekend modes, where every claim about a place or its hours rests on a page you opened, and the ranking is in [SKILL.md](../SKILL.md).

## Pipeline

Search, open, verify, rank, then emit. Run the steps in this order.

1. Search with 2 to 4 targeted queries from the query sets below. Stop once you hold 2 or 3 candidates that verify.
2. Open the official page of each candidate. A search snippet is never enough.
3. Verify each candidate with the checks below.
4. Pick the best survivor by the Ranking in SKILL.md.
5. Emit one OPTION or SKIP.

You must use search and page fetch. Never fill a gap from memory, and never write "usually 9 to 5". If the lookup fails or nothing verifies, return `STATUS: SKIP` and list the queries.

## Search in the place's language

Write the person-facing text in `packet.language`, and write the search queries in the language of the place. A town where people speak another language needs queries in that language, because searching only in the interface language misses local markets and events.

## Open the best source

Prefer the venue's own site, then an official park page, a city, county or park-district page, then a market association or visitor bureau. Use a reputable aggregator only as a last resort, and still open it and check the hours. Do not rely on a random blog, an undated listicle, or a social post without hours.

Cite the URL you opened, not a guessed homepage.

## Verify, and fail closed

Check each candidate against the grounding tests in SKILL.md, plus these two. A candidate that fails is dropped, and you try another or SKIP.

- The place exists: a name and an address or area on the page.
- A park or seasonal sight: the official page confirms hours, closures, reservations and fees for the date. A seasonal sight also passes the Seasonal sight test in SKILL.md.

## Query sets

Fill the queries from the packet: city, district or town, weekday, date, date range, one-way limit. Use the finest location known, then the city, then a neighboring town. Add the local words from the region file, if any.

Half-day: mix queries from these.

1. Dated events: the city or district, the date or weekday, plus "events" or its local word.
2. Periodic markets: the city, the weekday, plus "farmers market" or its local word.
3. A nearby town's market on the same weekday, if the home town has none that day.
4. Seasonal sights in the region (foliage, wildlife, blooms); see the Seasonal sight test in SKILL.md.
5. Last tier: a park, landmark, green space or short hike, then open its hours page.

Win shapes: buy one fruit, walk one short loop, watch one set or one float, leave with one free thing.

Weekend, only when the free window allows a real leave, sleep and return (not late at night, not an unbooked "leave tonight"):

1. "weekend getaway from {city} under {max one-way}" or "overnight near {city}".
2. A state, national or regional park in the region, and its open status, reservations and fees, plus seasonal sights at the destination. A scenic route that links several parks can be one trip.
3. Events in the destination town on the date range.
4. Optional: a scenic drive, through its visitor bureau.

For the stay, give the type only, with an info URL. Say `check-before-go` and leave booking to the person. Never invent inventory.

## Region files

If a file in `references/regions/` matches the packet location, read it before searching; otherwise search generically. A region file holds local words, official sources and quest ideas as hints, not facts; verify every quest live. Adding a region means adding one file there.
