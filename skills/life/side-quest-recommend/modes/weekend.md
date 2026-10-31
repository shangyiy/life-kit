# Mode: weekend

One overnight or getaway sketch. It is not a booking service.

It must be grounded: a real region within driving range, web-backed open or season status for anything claimed, and doable in this free window. Follow [../references/web-search.md](../references/web-search.md) (weekend query set); lookup is required.

## When to skip

- Skip on a midweek workday, a free evening only, or a request for quick local things only.
- Skip late at night with no booked stay, if the only path is "leave tonight and find a bed now". Offer it again for the next free Friday and Saturday, or once a stay is booked.

## Inputs from the packet

- Home, and the upcoming weekend or the named dates.
- `max_one_way_getaway`: 2.5 hours by default.
- Nights: 1 unless the person said 2.
- `weather` and `special_dates`: a holiday weekend can fill every stay and change opening hours.

## Steps

1. Look up 2 or 3 regions with a doable hook, using the weekend queries, and verify each.
2. Pick one region and one hook.
3. Return one OPTION, or SKIP.

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
