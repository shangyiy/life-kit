# Mode: half-day

One same-day local outing: home, out, back, roughly 2 to 6 hours door to door. Skip it if the person is mid-flight, wants only home ideas, or wants only an overnight.

Follow [../references/web-search.md](../references/web-search.md) (half-day query set); lookup is required.

## Inputs from the packet

- `location`, and the target date and weekday from `datetime`.
- `max_one_way_local`.
- `weather` and `special_dates`.

## Steps

1. Look up 2 or 3 candidates with the shared lookup and verify each.
2. Pick the best by the Ranking in [../SKILL.md](../SKILL.md).
3. Return one OPTION, or SKIP.

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
