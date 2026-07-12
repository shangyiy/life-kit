---
name: side-quest-recommend
description: >
  Suggests a few optional things to do near you — a tiny at-home start, a local
  outing, or a simple getaway idea — based on real time and place. Everything
  suggested must be real and doable. You pick one or skip. Use for
  /side-quest-recommend, weekend plans, things to do, what should I do, bored,
  local outing, day trip, getaway ideas, or side quest. Not (yet) multi-day
  travel itineraries or restaurant booking.
---

# Side quest recommend

Help the human choose **one optional thing** that fits *right now* (or the day they named). Dessert, not homework. Skip free.

**How it feels for them:** a short menu of real options → they pick a number (or none). No mode quiz.

## #1 rule — grounded by data

**Everything must be real and doable.** No vibes-only inventing.

| Must be grounded | How |
|------------------|-----|
| **Time** | Real clock or user-stated datetime → weekday + free window (not a guessed “sometime”) |
| **Location** | User-stated place, else **network/IP geolocation** — not a made-up city |
| **Each outing/getaway** | Real place/event · open (or checkable) for that time · within travel budget · win is binary and actually completable |
| **Each home starter** | Doable at home in minutes with no fake props or invented “local” claim |

If any of those fail → **SKIP that option** (or thinner menu). Never invent open hours, seasons, closures, venues, or “rooms available tonight.” Prefer a short honest menu over a pretty false one.

## 1. Context (main agent only)

Resolve a **context packet** before spawning. Prefer tools over questions.

| Field | Rule |
|--------|------|
| `datetime` | ISO local + **weekday** (user-stated, else system clock; if unknown, ask once) |
| `location` | User-stated if any; else **network / IP geolocation** (city/metro OK). **Do not ask** if network works. Optional soft note: “Using ~City from this network.” Ask **only** if lookup fails or is useless. User correction always wins. |
| `free_window` | half-day · evening · overnight · full-weekend · unknown (infer from datetime + message) |
| `transport` | Default walk + drive OK |
| `max_one_way_local` | **60 min** (half-day may stretch ≤75 if clearly worth it) |
| `max_one_way_getaway` | **2.5 h** unless they said farther |

Pass this packet **unchanged** into every mode subagent. Options must **fit this packet** (wrong day, wrong city, or not doable now → invalid).

## 2. Run modes as subagents (parallel)

Spawn **one subagent per mode**. Do **not** write the mode options yourself.

| Mode | File | Tools | Job |
|------|------|--------|-----|
| **starter** | [modes/starter.md](modes/starter.md) | No web | One tiny at-home option, doable at packet time |
| **half-day** | [modes/half-day.md](modes/half-day.md) + [references/web-search.md](references/web-search.md) | **Must** search + fetch | One same-day outing, real + open that day |
| **weekend** | [modes/weekend.md](modes/weekend.md) + [references/web-search.md](references/web-search.md) | **Must** search + fetch | One doable getaway sketch, or SKIP |

**half-day / weekend:** use shared **web-search** rules (queries, official pages, after-fetch). Put a **source URL** on claimed places/hours. Fail → **SKIP**.

**Each subagent prompt:**

```
You are proposing ONE side-quest option for mode: <mode>.
#1 rule: grounded by data — time, location, and the quest must be REAL and DOABLE for the context packet. If not, STATUS: SKIP.
Context packet: <paste full packet>
Follow the mode file (absolute path): <mode path>
If half-day or weekend: ALSO follow web-search rules (absolute path): <…/references/web-search.md> — use that mode's query set.
Tools: <starter: no web | half-day/weekend: MUST web_search + open/fetch pages before OPTION>
OPTION must cite a real source URL when claiming a place/hours.
Return STATUS: OPTION | SKIP using the Output section of the mode file only.
Do not invent venues/hours. Not confident after lookup → SKIP or check-before-go with URL — never fabricate.
```

Prefer parallel spawn. Wait for all three.

If **no** subagent tool: run each mode yourself as a labeled pass (same contracts; still use `references/web-search.md` for half-day/weekend).

## 3. Collect → validate → menu (main agent)

Before showing anything, drop OPTIONs that fail grounding:

1. Named place/hours without a source URL (outing/getaway) or clear home-only doability (starter).  
2. Wrong **weekday/date** for the claimed market/event/hours.  
3. Not doable in the free window (e.g. leave-tonight overnight with no booked stay at 11pm).  
4. Travel clearly over packet max one-way.

If **zero** OPTIONs remain → one honest starter from `modes/starter.md` if still grounded, or say you couldn’t verify an outing. **Do not invent fillers.**

Show remaining options as a **short friend-text menu** (numbered). Do not auto-pick.

- Human labels only — **not** STARTER / HALF-DAY / WEEKEND chrome.  
- Omit SKIP modes silently (no “not offered: …” footnotes).  
- Soft lead-in; “pick one or none.”

```
hey — pick one or none:

1. …
2. … (hours · short travel · link if useful)
```

**Stop and wait** for a number (or skip).

**After pick:** at most **+3 bullets** (how to start, one check-before-go, one backup). No multi-stop itinerary, no booking.

## Shared honesty

- **#1 rule wins** over filling the menu.  
- Fragile hours/places → **`check-before-go`** + URL.  
- Prefer free/cheap; mention drive cost when far.  
- Binary win only — something they can actually finish.  
- Thinner menu > false dessert.
