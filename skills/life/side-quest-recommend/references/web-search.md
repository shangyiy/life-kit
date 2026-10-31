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

Write the person-facing text in `packet.language`, and write the search queries in the language of the place. A Japanese town needs Japanese queries, and a Taiwanese town needs Traditional Chinese ones. Searching only in the interface language misses local markets and ward events.

## Open the best source

Prefer the venue's own site, then a city, county or park-district page, then a market association or visitor bureau. Use a reputable aggregator only as a last resort, and still open it and check the hours. Do not rely on a random blog, an undated listicle, or a social post without hours.

Cite the URL you opened, not a guessed homepage.

## Verify, and fail closed

Check each candidate against the grounding tests in SKILL.md, plus these two. A candidate that fails is dropped, and you try another or SKIP.

- The place exists: a name and an address or area on the page.
- A stay is available tonight: never claim it; give an info URL and `check-before-go`.

## Query sets

Fill the queries from the packet: city, ward or town, weekday, date, date range, one-way limit. Use the finest location known, then the city, then a neighboring town. Add the local words from the regional notes.

Half-day: mix queries from these.

1. Dated events: the city or ward, the date or weekday, plus "events" or its local word.
2. Periodic markets: the city, the weekday, plus "farmers market" or its local word.
3. A nearby town's market on the same weekday, if the home town has none that day.
4. Last tier: a park, landmark, green space or short hike, then open its hours page.

Win shapes: buy one fruit, walk one short loop, watch one set or one float, leave with one free thing.

Weekend, only when the free window allows a real leave, sleep and return (not late at night, not an unbooked "leave tonight"):

1. "weekend getaway from {city} under {max one-way}" or "overnight near {city}".
2. A state or national park in the region, and its open status.
3. Events in the destination town on the date range.
4. Optional: a scenic drive, through its visitor bureau.

For the stay, give the type only, with an info URL. Say `check-before-go` and leave booking to the person. Never invent inventory.

## Regional notes

These local words and classes fill the Ranking classes in SKILL.md. Add a region only when a query there needs it.

- Japan: events are イベント, 祭り, 区民行事; markets are 朝市, 日曜マルシェ. A 直売所 or 産直 (farm-stand or JA market) and a 卸売 market open to the public count as markets. Official sources are `.go.jp` and `.lg.jp` city or ward pages and JA pages.
- Taiwan: events are 活動, 祭典, 藝閣; markets are 市集, 夜市. A 產直 or 農會 market counts as a market. Official sources are township and city offices, farmers' associations, and tourism bureau pages.
- United States: events are "events" plus the date; markets are "farmers market" and "flea market". Official sources are `*.gov` city and county pages, `nps.gov`, and park districts. Weather comes from `weather.gov`.
