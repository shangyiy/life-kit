# Web search and fetch

This is the lookup for the half-day and weekend modes: every claim about a place or its hours rests on a page you opened. The ranking is in [SKILL.md](../SKILL.md); this file does not repeat it.

## Pipeline

Search, open, verify, rank, then emit. Run the steps in this order.

1. Search with 2 to 4 targeted queries from the query sets below. Stop once you hold 2 or 3 candidates that verify.
2. Open the official page of each candidate. A search snippet is never enough.
3. Verify each candidate with the table below.
4. Rank the survivors by the Ranking in SKILL.md.
5. Emit one OPTION with hours and the URL you opened, or SKIP with the queries you tried.

You must use search and page fetch. Never fill a gap from memory, and never write "usually 9 to 5". If the lookup fails or nothing verifies, return `STATUS: SKIP` and list the queries.

## Search in the place's language

Write the person-facing text in `packet.language`, and write the search queries in the language of the place. A Japanese town needs Japanese queries, and a Taiwanese town needs Traditional Chinese ones. Searching only in the interface language misses local markets and ward events.

## Open the best source

Prefer the venue's own site, then a city, county or park-district page, then a market association or visitor bureau. Use a reputable aggregator only as a last resort, and still open it and check the hours. Do not rely on a random blog, an undated listicle, or a social post without hours.

| Kind | Prefer |
|------|--------|
| Parks | The official park or city parks page |
| Markets | The named market's hours on its association or city page |
| Events | An official calendar that shows an explicit date |

Cite the URL you opened, not a guessed homepage.

## Verify, and fail closed

A candidate that fails a check is dropped, and you try another or SKIP.

| Check | On failure |
|-------|------------|
| Hours cover the packet weekday and date | Drop |
| The place exists, with a name and an address or area on the page | Drop |
| Within the packet's one-way limit of home | Drop |
| Seasonal closure or holiday schedule for the packet dates | Drop if closed; use the holiday hours if they differ |
| Outdoor plan against `packet.weather` | Drop in a rain window; with `unknown` weather, keep it as `check-before-go` |
| A stay is available tonight | Never claim it; give an info URL and `check-before-go` |

A real but fragile candidate stays as an OPTION with `check-before-go` and its URL.

## Query sets

Fill the queries from the packet: city, ward or town, weekday, date, date range, one-way limit. Use the finest location known, then the city, then a neighboring town. Add the local words from the regional notes.

Half-day: stop when you hold 2 or 3 verified candidates, mixing queries from these.

1. Dated events: the city or ward, the date or weekday, plus "events" or its local word.
2. Periodic markets: the city, the weekday, plus "farmers market" or its local word.
3. A nearby town's market on the same weekday, if the home town has none that day.
4. Last tier: a park, green space or short hike, then open its hours page.

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

## Anti-patterns

- Hours taken from a snippet without opening the page.
- A market on the wrong weekday sold as open.
- Queries only in the interface language for a foreign town.
- "Everyone goes to X" with no URL.
- A half-day option that is really a full expedition.
- An overnight with no booked bed late at night.
- A holiday weekend using the normal hours.

## Done when

- OPTION: the place, a binary win, the travel time, the hours text with the https URL you opened, and why it fits the packet.
- SKIP: one line on the searches tried and why nothing was honest.
