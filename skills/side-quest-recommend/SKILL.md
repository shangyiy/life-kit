---
name: side-quest-recommend
description: >
  Picks one optional side quest that fits the user’s date/time and location.
  Use for /side-quest-recommend, weekend board, things to do, what should I do
  today, or a small outing idea. Not multi-day itineraries or restaurant booking.
---

# Side quest recommend

Pick **one** optional thing to do. Dessert, not homework. Skip is free.

## Do this

1. **Datetime** — use now (or the date they named). Note weekday, time of day, and whether it’s a free half-day / weekend.
2. **Location** — home or where they are. Ask **once** if missing (city or neighborhood is enough).
3. **Pick one** that fits that slot:
   - Morning / soft start → tiny home ritual is fine (brew + sit 5 min before apps, simple plate, window open).
   - Daylight free time near home → one real local stop (market fruit, short park loop, free event that day) if you can be honest about hours.
   - They want overnight / out of town → one real region within a sensible drive, not a booking flow.
4. **Honesty** — never invent open hours, seasons, or venues. Prefer a real place you can source; if unsure, home-only or say **check before you go** + URL. No invent-to-fill.
5. **Emit one card**, then stop. No mode quiz. No 3-card board unless they ask for options.

## Card shape

```
<title>
Win: <binary, doable>
Where / when: <home or place · time · travel if any>
Hours: n/a  or  sourced hours + URL
Why this: <one line: fits this datetime + place>
```

Optional: one soft line (“skip free”). No residual nags.

## Defaults if they said almost nothing

- When → **now** (or this weekend if they only said “weekend”)
- Transport → walk + short drive OK
- One-way max → ~60 min local; ~2.5 h only if they said getaway
