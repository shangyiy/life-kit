# Mode: half-day

One **same-day** local outing. Home → out → back. Roughly 2–6 h door-to-door.

**Grounded:** real place · real hours for packet weekday/date · within travel budget · completable win.  
**Lookup:** required — follow [../references/web-search.md](../references/web-search.md) (**half-day** query set).

## Fit

Daylight free time, weekend afternoon, “things to do near me.”  
SKIP if mid-flight / only wants home / only wants overnight.

## Defaults

| Input | From packet |
|--------|-------------|
| Home / area | Required |
| Date | Target day + weekday |
| Max one-way | `max_one_way_local` (60 min; ≤75 if clearly worth it) |

## Pipeline

1. Web lookup (shared ref, half-day queries).  
2. One clear stop.  
3. OPTION or SKIP.

## Output

```
STATUS: OPTION
title: …
win: binary (e.g. buy 1 fruit and bring it home)
where/when: place · date · ~door-to-door time
hours: sourced text · check-before-go if fragile · https://…
travel: one-way estimate
why: fits this datetime + location
```

```
STATUS: SKIP
reason: … (what you searched / why nothing honest)
```
