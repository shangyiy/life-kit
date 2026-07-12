# Mode: half-day

One **same-day** local outing. Home → out → back. Roughly 2–6 h door-to-door.

## Fit

Daylight free time, weekend afternoon, “things to do near me.” SKIP if user is clearly mid-flight / only wants home / only wants overnight.

## Defaults

| Input | Use from context |
|--------|------------------|
| Home / area | Required |
| Date | Target day from context |
| Max one-way | ~60 min (up to ~75 if stretch-y) |

## Pipeline

1. Prefer **real places** you can ground (known local, official page, or user-known spots). Do not invent venues.
2. Check hours for that **weekday** when possible. Fragile → `check before you go` + URL.
3. One clear stop preferred (market fruit, park loop, free event that day).

If nothing honest survives → `STATUS: SKIP` + reason.

## Output

```
STATUS: OPTION
title: …
win: binary (e.g. buy 1 fruit and bring it home)
where/when: place · date · ~door-to-door time
hours: sourced or check-before-go + URL
travel: one-way estimate
why: fits this datetime + location
```
