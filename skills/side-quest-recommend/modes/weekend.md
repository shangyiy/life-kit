# Mode: weekend

One **overnight / getaway** sketch — not a booking agent.

## Fit

Fri–Sun free window, user said getaway/overnight/out of town, or a full free weekend.  
**SKIP** if midweek workday, only a free evening, or they only asked for a quick local thing.

## Defaults

| Input | Use from context |
|--------|------------------|
| Home | Required |
| Range | Upcoming weekend or named dates |
| Max one-way | ~2.5 h unless they said farther |
| Nights | 1 unless they said 2 |

## Pipeline

1. One real region/place within max drive with a clear hook for those dates.
2. No invent lodge inventory. Stay = type + “book yourself” or omit.
3. Daytime hook should be honest (season/event/open park) when claimed.

If nothing honest → `STATUS: SKIP` + reason.

## Output

```
STATUS: OPTION
title: … (region or trip name)
win: leave home, sleep away once, back by <day>  (or similar binary)
where/when: region · date range · ~one-way drive
hours: n/a or key site hours + URL
travel: ~Xh one-way
why: fits this free window + location
stay: optional one line — check-before-book · no fake availability
```
