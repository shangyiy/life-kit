# Mode: half-day

One same-day local outing, roughly 2 to 6 hours door to door, skipped if the person is mid-flight or wants only home ideas or an overnight.

Follow [../references/web-search.md](../references/web-search.md) (half-day query set).

## Inputs from the packet

- `location`, and the target date and weekday from `datetime`.
- `max_one_way_local`.
- `weather` and `special_dates`.

## Output

```
STATUS: OPTION
title: …
win: binary (for example, buy 1 fruit and bring it home)
where/when: place, date, about door-to-door time
hours: sourced text, check-before-go if fragile, https://…
travel: one-way estimate
why: fits this datetime, weather and location
```

```
STATUS: SKIP
reason: … (what you searched, why nothing honest)
```
