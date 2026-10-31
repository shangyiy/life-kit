---
name: side-quest-recommend
description: >
  Suggests a few real, doable things to do near you, from a tiny at-home start
  to a local outing or simple getaway. Use for /side-quest-recommend, weekend
  plans, things to do, what should I do, bored, day trip, or side quest, but
  not multi-day itineraries or restaurant booking.
---

# Side quest recommend

Give a short menu of real, doable options for now or the day the person named, led by the one you recommend.

## Ground every option in data

Show an option only if its time, place and win are real and checkable for this person. Skip any option that fails a test below, and prefer a short honest menu to a pretty false one. Never invent venues, open hours, seasons, closures, or "rooms available tonight".

- Time: a real clock or a time the person stated, turned into a weekday and a free window, never a guessed "sometime".
- Location: the place the person stated, else network geolocation, never a made-up city.
- Outing or getaway: a real place or event, open (or checkable) at that time, within the travel limit, with a win the person can finish.
- Travel: take the time from a map or the venue page, or write "about X, confirm on a map".
- Home starter: doable at home in minutes, with no fake props and no invented "local" claim.
- Weather: an outdoor option needs a dry enough window. Rain in the window removes it, or the option moves indoors. If weather is `unknown`, tag an outdoor option `check-before-go`.
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

| Mode | Files | Web | Job |
|------|-------|-----|-----|
| starter | [modes/starter.md](modes/starter.md) | no | A tiny at-home option, doable at packet time. |
| half-day | [modes/half-day.md](modes/half-day.md), [references/web-search.md](references/web-search.md) | must search and fetch | A same-day outing, real and open that day. |
| weekend | [modes/weekend.md](modes/weekend.md), [references/web-search.md](references/web-search.md) | must search and fetch | A doable getaway sketch, or SKIP. |

| `free_window` | Modes to run |
|---------------|--------------|
| `short` | starter, plus half-day only if the outdoor window is usable |
| `half-day` | starter, half-day |
| `overnight`, `unknown` | starter, half-day, weekend |
| `full-weekend` | starter, half-day, and weekend only if an overnight fits |

If the person asked for a getaway or overnight, always run weekend as well.

For `short`, run half-day only if at least about 2 hours remain before the stated end time, else the looked-up sunset, else 18:00. If sunset is unknown and the local hour is after 15, skip half-day. Prefer skipping half-day to sending someone out into the dark.

## Run each mode as one pass

Each mode runs one pass by its mode file and returns one OPTION or SKIP in that file's output format. You run the passes yourself, or hand each mode to a separate helper run when the setup has them and parallel runs help. Either way, give each pass the full packet and its mode files.

For a range of days (a vacation, or a `full-weekend`), run half-day once per day, at most 3 days; ask which days if the range is longer, unless the person named them. Run starter once for the whole range. This is still not a multi-city itinerary.

Two independent runs per mode (A and B) are an optional variant in [references/ab-variant.md](references/ab-variant.md); use it only when the person or the setup asks.

## Ranking

When more than one candidate survives, take the higher class. Ranking only orders candidates that passed the grounding tests.

1. A dated event that day, such as a festival, a fair or a special exhibition open on that date.
2. A market that runs on that weekday, such as a weekly farmers market or night market.
3. A fixed landmark or park with open hours.

On a tie, take the shorter one-way trip, then the clearer and easier win over the logistics-heavy one, then the better official URL. Across days, do not repeat a venue or a class-3 option when a candidate of class 1 or 2 exists. Regional types that fill these classes are in [references/web-search.md](references/web-search.md).

## Check, then show the menu

Check each returned option against the grounding tests above before anything goes in the menu, and drop any that fails, including a named place or hours with no source URL you opened (a starter needs only clear home doability). Never merge two places into one option, and never invent another.

Lead with the one option you recommend and one line on why it fits this person and time best: usually the top-ranked outing, or the starter when time, energy or weather is low. Then list the other verified options as alternatives. Never book or commit for the person; a reply is enough to continue.

Write the menu in `packet.language`, with place names in the venue's own language, in a natural friend tone. Use human labels, not mode names or run labels. Give each option one line: what to do, the one-step win, hours, travel, link. Tag fragile hours `check-before-go`. Prefer free or cheap, and mention the drive cost when far. Omit modes with no winner.

If the person asked for a getaway and weekend has no winner, add one soft honest line that an overnight does not fit this window (it needs a booked stay, or a freer Friday and Saturday), then still show the other options.

If nothing survives, give one grounded starter from [modes/starter.md](modes/starter.md), or say you could not verify an outing. Do not invent filler.

Example, with one pair for the same menu:

```
# zh-Hant
我推薦週日的農夫市集：離你車程約20分鐘，早上天氣最好，買一顆水果就能回家。上午9點到下午1點，https://…
其他可以考慮：
- 週六下午逛公園（約1小時），https://…

# en
I'd go to the Sunday farmers market: about 20 min away, best weather in the morning, and you can grab one fruit and head home. 9 am to 1 pm, https://…
Other options:
- Saturday afternoon walk in the park (about 1 hour), https://…
```

## After the reply

When the person picks something, give at most 3 bullets: how to start, one thing to check before going, and one backup. Write no multi-stop itinerary and make no booking.
