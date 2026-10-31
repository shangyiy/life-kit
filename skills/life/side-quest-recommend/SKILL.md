---
name: side-quest-recommend
description: >
  Suggests a few real, doable things to do near you, from a tiny at-home start
  to a local outing or simple getaway. Use for /side-quest-recommend, weekend
  plans, things to do, what should I do, bored, day trip, or side quest, but
  not multi-day itineraries or restaurant booking.
---

# Side quest recommend

Turn the person's surroundings into a short quest board of real, doable options for now or the day the person named, led by one recommended quest.

## Ground every option in data

Show an option only if its time, place and win are real and checkable for this person. Skip any option that fails a test below, and prefer a short honest board to a pretty false one. Never invent venues, open hours, seasons, closures, or "rooms available tonight".

- Time: a real clock or a time the person stated, turned into a weekday and a free window, never a guessed "sometime".
- Location: the place the person stated, else network geolocation, never a made-up city.
- Outing or getaway: a real place or event, open (or checkable) at that time, within the travel limit, with a win the person can finish.
- Travel: take the time from a map or the venue page, or write "about X, confirm on a map".
- Home starter: doable at home in minutes, with no fake props and no invented "local" claim.
- Weather: an outdoor option needs a dry enough window. Rain in the window removes it, or the option moves indoors. If weather is `unknown`, tag an outdoor option `check-before-go`.
- Seasonal sight: offer a seasonal happening (a foliage peak, a wildlife season, a bloom) only when an official or current source confirms it is happening in the target window, else drop it.
- Special dates: a holiday, festival, long weekend or clock change can move hours, crowds and daylight. Check the option's hours against that date.
- Fragile hours: if the place is real but its hours may shift, keep the option and tag it `check-before-go` with the URL.

## Build the context packet first

Fill the packet before running any mode, and prefer lookups to questions. Pass it unchanged to every mode; an option that does not fit the packet (wrong day, wrong city, not doable now) is invalid.

| Field | Rule |
|-------|------|
| `language` | The language the person wrote in. A language they already set wins. Ask once with chips (繁體中文 for `zh-Hant`, English for `en`) only if their message does not make it clear or is in neither. |
| `datetime` | ISO local time with weekday: stated by the person, else the system clock. Ask once if neither exists. |
| `location` | Stated by the person, else network geolocation (a city is enough). Do not ask when the lookup works; ask only when it fails or is useless. A correction from the person always wins. |
| `free_window` | One of `short`, `half-day`, `overnight`, `full-weekend`, `unknown`, inferred from the table below. |
| `weather` | Rain forecast (and rough temperature) at the location for the target day or days, or the next 24 hours if the window is unknown, from a forecast page. Write `unknown` if the lookup fails. |
| `special_dates` | Holidays, festivals, a clock change or a long weekend on the target day or days, or in the next 24 hours if the window is unknown. Write `none found` if nothing turns up. |
| `transport` | Walk and drive by default. |
| `max_one_way_local` | 60 minutes; up to 75 for a half-day option that is clearly worth it. |
| `max_one_way_getaway` | 2.5 hours unless the person said farther. |

Infer `free_window` from the person's words and the clock:

| Signal | `free_window` |
|--------|---------------|
| A soft morning, a free evening, "a bit of time", about 1 to 2 hours free | `short` |
| A free afternoon, "half day", a free day, or a morning with at least half the day left | `half-day` |
| Overnight, getaway, "out of town tonight or this weekend" | `overnight` |
| The whole Saturday and Sunday free | `full-weekend` |
| Unclear | `unknown` |

## Run only the modes the window allows

Each mode finds one option of its own kind, and the free window decides which modes run.

| Mode | Files | Web | Job | Runs when |
|------|-------|-----|-----|-----------|
| starter | [modes/starter.md](modes/starter.md) | no | A tiny at-home option, doable at packet time. | Always. |
| half-day | [modes/half-day.md](modes/half-day.md), [references/web-search.md](references/web-search.md) | must search and fetch | A same-day outing, real and open that day. | Always, but for `short` only if the outdoor window is usable (see below). |
| weekend | [modes/weekend.md](modes/weekend.md), [references/web-search.md](references/web-search.md) | must search and fetch | A doable getaway sketch, or SKIP. | For `overnight` and `unknown`; for `full-weekend` only if an overnight fits; and whenever the person asked for a getaway or overnight. |

For `short`, run half-day only if at least about 2 hours remain before the stated end time, else the looked-up sunset, else 18:00. Prefer skipping half-day to sending someone out into the dark.

## Run each mode as one pass

Each mode runs one pass by its mode file and returns one OPTION or SKIP in that file's output format. You run the passes yourself, or hand each mode to a separate helper run when the setup has them and parallel runs help. Either way, give each pass the full packet and its mode files.

For a range of days (a vacation, or a `full-weekend`), run half-day once per day, at most 3 days; ask which days if the range is longer, unless the person named them. Run starter once for the whole range. This is still not a multi-city itinerary.

Two independent runs per mode (A and B) are an optional variant in [references/ab-variant.md](references/ab-variant.md); use it only when the person or the setup asks.

## Ranking

When more than one candidate survives, take the higher class. Ranking only orders candidates that passed the grounding tests.

1. A dated or seasonal event that day, such as a festival, a fair, a special exhibition, or a seasonal sight that passes the Seasonal sight test.
2. A market that runs on that weekday, such as a weekly farmers market or night market.
3. A fixed landmark, or a park (city, state or national) with open hours.

On a tie, take the shorter one-way trip, then the clearer and easier win over the logistics-heavy one, then the better official URL. Across days, do not repeat a venue or a class-3 option when a candidate of class 1 or 2 exists. Local types that fill these classes come from the region file for the packet location (see [references/web-search.md](references/web-search.md)).

## Check, then show the quest board

Check each returned option against the grounding tests above before anything goes on the board, and drop any that fails, including a named place or hours with no source URL you opened (a starter needs only clear home doability). Never blend two returned options into one quest, and never invent another.

The board uses quest words in place of mode names. A starter is a daily quest (日常任務), a half-day outing is a side quest (支線任務), and a weekend getaway is an expedition (遠征). Give each quest a one-line name, a win condition the person can finish and tick off (binary, and checkable on the page you opened), a small reward, hours, travel time and the link. A reward is a plain idea such as a coffee on the way back or "new place unlocked"; name a shop only if you verified it. Tag fragile hours `check-before-go`. Prefer free or cheap, and mention the drive cost when far.

Lead with one recommended quest (今日推薦任務) and one line on why it fits this person and time best: usually the top-ranked outing, or a daily quest when time, energy or weather is low. Below it, show up to 3 other verified quests as the board, ordered from near to far by travel time, each sourced or labeled as an estimate per the Travel test. Omit tiers with no winner.

Write the board in `packet.language`, with place names in the venue's own language, in a friendly game-guide tone. Never book or commit for the person; a reply is enough to continue.

If the person asked for a getaway and weekend has no winner, add one soft honest line that an expedition does not fit this window (it needs a booked stay, or a freer Friday and Saturday), then still show the other quests.

If nothing survives, give one grounded daily quest from [modes/starter.md](modes/starter.md), or say you could not verify an outing. Do not invent filler.

Example, with one pair for the same board:

```
# zh-Hant
今日推薦任務：週日農夫市集。早上天氣最好，離你最近，很適合現在出門。
任務：買一顆水果帶回家。獎勵：回程順便來杯咖啡。上午9點到下午1點，車程約20分鐘（估計），https://…

任務板：
1. 日常任務，泡茶坐5分鐘不看手機。獎勵：多一小時的好心情。就在家，0分鐘。
2. 支線任務，公園走一圈。任務：走完一圈。獎勵：新地點解鎖。上午9點到下午5點，車程約30分鐘（估計），https://…

# en
Recommended quest today: the Sunday farmers market. The weather is best in the morning and it is the closest outing.
Quest: buy one fruit and bring it home. Reward: a coffee on the way back. 9 am to 1 pm, about 20 min drive (estimate), https://…

Quest board:
1. Daily quest: brew tea and sit 5 minutes without your phone. Reward: an easy start to the day. At home, 0 min.
2. Side quest: walk one loop in the park. Quest: finish the loop. Reward: new place unlocked. 9 am to 5 pm, about 30 min drive (estimate), https://…
```

## After the reply

When the person accepts a quest, give at most 3 bullets: how to start, one thing to check before going, and one backup. Write no hour-by-hour itinerary and make no booking.
