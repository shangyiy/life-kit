# Mode: weekend

One **overnight / getaway** sketch — not a booking agent.

**Grounded:** real region within drive · web-backed open/season status when claimed · doable in this free window.  
**Lookup:** required — follow [../references/web-search.md](../references/web-search.md) (**weekend** query set).

## Fit

Fri–Sun free window, getaway/overnight/out of town, or full free weekend.  
**SKIP** midweek workday, free evening only, or quick-local-only request.  
**SKIP** late night + **no booked stay** if the only path is “leave tonight / find a bed now.” Re-offer for next free Fri–Sat or when stay is already booked.

## Defaults

| Input | From packet |
|--------|-------------|
| Home | Required |
| Range | Upcoming weekend or named dates |
| Max one-way | `max_one_way_getaway` (2.5 h default) |
| Nights | 1 unless they said 2 |

## Pipeline

1. Web lookup (shared ref, weekend queries).  
2. One region + one doable hook.  
3. OPTION or SKIP.

## Output

```
STATUS: OPTION
title: … (region or trip name)
win: leave home, sleep away once, back by <day>
where/when: region · date range · ~one-way drive
hours: n/a or key site hours · check-before-go · https://…
travel: ~Xh one-way
why: fits this free window + location
stay: optional — type · check-before-go · book yourself · https://… (info only)
```

```
STATUS: SKIP
reason: … (what you searched / why nothing honest)
```
