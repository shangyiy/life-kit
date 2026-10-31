# Mode: weekend

One overnight or getaway sketch, not a booking service.

Follow [../references/web-search.md](../references/web-search.md) (weekend query set), with 2 or 3 regions that have a doable hook, ranked by the class of the destination hook, then the tie-break in [../SKILL.md](../SKILL.md).

## When to skip

- Skip on a midweek workday, a free evening only, or a request for quick local things only.
- Skip late at night with no booked stay, if the only path is "leave tonight and find a bed now". Offer it again for the next free Friday and Saturday, or once a stay is booked.

## Inputs from the packet

- `location`, and the upcoming weekend or the named dates from `datetime`.
- `max_one_way_getaway`.
- Nights: 1 unless the person said 2.
- `weather`: check the destination forecast for the date range.
- `special_dates`.

## Output

```
STATUS: OPTION
title: … (region or trip name)
win: leave home, sleep away once, back by <day>
where/when: region, date range, about one-way drive
hours: n/a or key site hours, check-before-go, https://…
travel: about X hours one-way
why: fits this free window and location
stay: optional; type, check-before-go, book yourself, https://… (info only)
```

```
STATUS: SKIP
reason: … (what you searched, why nothing honest)
```
