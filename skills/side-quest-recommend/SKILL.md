---
name: side-quest-recommend
description: >
  Builds a short menu of optional side quests by running starter, half-day, and
  weekend modes as parallel subagents, then listing options for the user to pick.
  Use for /side-quest-recommend, weekend board, things to do, what should I do,
  bored, local outing, day trip, getaway ideas, or side quest. Not multi-day
  itineraries or restaurant booking.
---

# Side quest recommend

**You orchestrate. Subagents propose options. User picks.**

Dessert, not homework. Skip free. Never invent open hours or venues.

## 1. Context (main agent only)

Resolve a **context packet** before spawning — ask only if missing:

| Field | Rule |
|--------|------|
| `datetime` | ISO local + **weekday** (user-stated, else system clock; if unknown, ask once) |
| `location` | Neighborhood or city (ask once if missing) |
| `free_window` | half-day · evening · overnight · full-weekend · unknown (infer from datetime + message) |
| `transport` | Default walk + drive OK |
| `max_one_way_local` | **60 min** (half-day may stretch ≤75 if clearly worth it) |
| `max_one_way_getaway` | **2.5 h** unless they said farther |

Pass this packet **unchanged** into every mode subagent.

## 2. Run modes as subagents (parallel)

Spawn **one subagent per mode**. Do **not** write the mode options yourself.

| Mode | File | Tools | Job |
|------|------|--------|-----|
| **starter** | [modes/starter.md](modes/starter.md) | No web required | One tiny at-home option |
| **half-day** | [modes/half-day.md](modes/half-day.md) | **Web search/browse OK** for place + hours | One same-day local outing |
| **weekend** | [modes/weekend.md](modes/weekend.md) | **Web search/browse OK** | One getaway sketch, or SKIP if unfit |

**Capabilities:** starter = catalog only. half-day/weekend = may fetch official pages. If web tools unavailable → known real place + `check-before-go`, or **SKIP**. Never invent a venue name or schedule.

**Each subagent prompt:**

```
You are proposing ONE side-quest option for mode: <mode>.
Context packet: <paste full packet>
Follow the mode file (absolute path): <path>
Tools: <from SKILL mode table — no web | web for place+hours | web OK>.
Return STATUS: OPTION | SKIP using the Output section of that mode file only.
Do not add fields the mode does not define. Do not drop fields it does.
Honesty: never invent venues/hours. No live source and not confident → SKIP or check-before-go. Never fabricate a venue name or schedule.
```

Prefer parallel spawn. Wait for all three.

If **no** subagent tool: run each mode file yourself as a separate labeled pass (same contracts).

## 3. Collect → validate → menu (main agent)

1. Drop any OPTION that invents a named venue/hours without source or check-before-go.
2. If **zero** OPTIONs → either run starter yourself from `modes/starter.md` once, or say what’s missing (location / free window). Do **not** invent half-day/weekend fillers.
3. Show remaining options as a **numbered menu**. Do not auto-pick.

```
Side quests — pick 0–1 (or more if you want). Skip free.

1 · STARTER · <title>
   Win: …
   …

2 · HALF-DAY · <title>
   Win: …
   Hours: … · url

3 · WEEKEND · <title>     # omit if SKIP
   …

Why these: one line from context packet.
```

**Stop and wait** for a number (or skip).

**After pick:** at most **+3 bullets** (how to start, one check-before-go, one backup). No multi-stop itinerary, no booking.

## Shared honesty

- Never invent open hours, seasons, closures, or venues.
- Fragile hours/places → **`check-before-go`** + URL (stay booking → same idea, still say check-before-go).
- Prefer free/cheap; mention drive cost when far.
- Binary win only.
- Mode has nothing honest → that subagent SKIPs; thinner menu is fine.
