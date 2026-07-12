# Web search & fetch

Shared lookup for **half-day** and **weekend** options.  
Goal: every place/hours claim is **grounded** — real URL opened, day matches, doable.

## Contents

- Pipeline  
- Search language ≠ UI language  
- What to open  
- Verify  
- Among verified candidates (rank)  
- Multi-day / vacation  
- Query sets  
- Anti-patterns  
- A/B note  
- Done when  

## Pipeline (do this order)

```
1. SEARCH   1–4 targeted queries (query sets below)
2. OPEN     official page(s) for the best 1–3 candidates
3. VERIFY   weekday/date, open/closed, within drive of packet home
4. RANK     among survivors (see “Among verified candidates”)
5. EMIT     one OPTION with hours + URL  — or SKIP with what you tried
```

**Must use tools:** `web_search` + page fetch (`web_fetch` / `open_page` / browse).  
**Do not** invent from memory. **Do not** stop at a SERP snippet — open the page.

If tools fail or nothing verifies → **`STATUS: SKIP`** (list queries). Never “usually 9–5.”

## Search language ≠ UI language

- **User-facing** `win` / `why` / menu lines → packet `language` (`zh-Hant` / `en`).  
- **Search queries** → language of the **place** (JP for Osaka/Tokyo, 繁中 for 台灣, etc.), plus local event words.  
Do not search Japanese venues only in Chinese/English if that misses 朝市・イベント・区民行事.

## What to open (source quality)

1. Venue / market / park / temple **own** site  
2. City / ward / county `.go.jp` · `.lg.jp` · `.gov` · park district  
3. Market associations, JA 直売, visitor bureaus (`visit*`)  
4. **Last resort:** reputable aggregator — still open and verify hours  

**Skip as sole source:** random blogs, undated listicles, social posts without hours.

| Kind | Prefer |
|------|--------|
| Parks | Official park / city parks pages; US: `nps.gov`, `*.gov` parks |
| Markets | Named market + hours → association, JA, city page |
| Events | Official calendar with explicit **date** (区・市・縣・寺社) |
| TW | 鄉鎮市公所、農會、觀光局、環境教育場所認證頁 |

Always use the **URL you opened**, not a guessed homepage.

## Verify (fail closed)

| Check | Fail → |
|--------|--------|
| Hours cover **packet weekday/date** | Drop candidate; try another or SKIP |
| Place exists (named, address/area on page) | Drop |
| Within ~packet max one-way of home | Drop (or too far → SKIP) |
| Seasonal / closure for packet dates | Drop if closed |
| Stay “available tonight” | **Never claim** — info URL + check-before-go only |

Fragile but real → OPTION with **`check-before-go`** + URL.

## Among verified candidates (pick order)

After verify, if more than one candidate survives, **emit the highest rank** (not random A/B):

| Rank | Class | Examples |
|------|--------|----------|
| **1** | **Dated / one-off that day** | Festival, temple fair, 納涼, 藝閣, special exhibition open that date |
| **2** | **Periodic market that weekday** | Sunday 朝市, 日曜マルシェ, weekly farmers market, 夜市 that day |
| **3** | **直売 / 產直 / visitor-ok wholesale market** | JA 直売所, 産直, 卸売 market open to public that day |
| **4** | **Permanent park / landmark** | City park loop, castle grounds, eco museum with open hours |

**Tie-break (same rank):** shorter one-way → clearer binary win → better official URL.

**Do not** rank below a failed verify. Distance/window filters first; rank only among survivors.

### Multi-day / vacation day-slice

If the user gives a **date range** (vacation), main agent may run **one half-day packet per day** (or one day they care about). Still **not** a booked multi-city itinerary.

Across days in the same range: **prefer not repeating** the same venue (or same rank-3/4 class) if another rank ≥2 candidate exists for that day.

## Query sets

Fill from packet: `{city}` `{ward}` `{weekday}` `{date}` `{date_range}` `{max_one_way}`.  
Prefer **finer location** (`{ward}` / 鄉鎮) when known; fallback to city, then neighboring ward/town.

### half-day (same-day / one vacation day)

Run until you have **one** ranked OPTION (or SKIP). Mix 1–4 queries:

1. **Dated events:** `{city}` / `{ward}` + `{date}` or `{weekday}` + `events` · `イベント` · `祭り` · `活動` · `祭典`  
2. **Periodic markets:** `{city}` + `{weekday}` + `farmers market` · `朝市` · `マルシェ` · `市集` · `夜市`  
3. **Nearby market if home closed that day:** `{nearby city}` + same weekday market terms  
4. **直売:** `{city}` + `直売` · `產直` · `JA` · `farm stand` + hours / 定休日  
5. **Last tier:** `{city}` + `公園` · `park` · `緑地` · short hike — then open **hours** page  

Win shapes: buy **1 fruit** · one short loop · watch one set / one float · one free leave.

### weekend (overnight getaway)

Only if free window allows real leave–sleep–return (not late night, unbooked “leave tonight”):

1. `weekend getaway from {city} under {max_one_way}` / `overnight near {city}`  
2. `{region} state park` / 国立公園 / 国定公園 + open status  
3. `{town} events {date_range}`  
4. Optional: scenic drive → visitor bureau  

Stay: **type only** + info URL · check-before-go · book yourself — no inventory invent.

## Anti-patterns

- Snippet-only hours (didn’t open page)  
- Wrong-day market sold as open  
- Searching only in UI language for a foreign city  
- “Everyone goes to X” with no URL  
- Inflated half-day that is a full expedition  
- Overnight fantasy with no booked bed late at night  
- Random A/B when a rank-1 or rank-2 candidate already verified  
- Showing both A and B to the user (main agent **judges** to one winner per mode)

## A/B note (for main agent)

Each mode launches **two independent** proposers. After both return, apply **Among verified candidates** (and drop ungrounded). Emit **one** winner per mode into the user menu — never “here are six raw A/B lines.”

## Done when

- **OPTION:** place + binary win + travel + **hours text + https://… you opened** + why it fits packet  
- **SKIP:** one line on searches tried / why nothing honest  
