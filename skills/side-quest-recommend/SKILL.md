---
name: side-quest-recommend
description: >
  Builds a short menu of optional side quests by running starter, half-day, and
  weekend modes as parallel subagents, then listing options for the user to pick.
  Use for /side-quest-recommend, weekend board, things to do, or what should I do.
  Not multi-day itineraries or restaurant booking.
---

# Side quest recommend

**You orchestrate. Subagents invent the options. User picks.**

Dessert, not homework. Skip free. Never invent open hours or venues.

## 1. Context (main agent only)

Resolve once — ask only if missing:

| Input | Default |
|--------|---------|
| Datetime | **now** (or the date/range they named) |
| Location | Ask once (neighborhood / city) |
| Transport | Walk + drive OK |
| Max one-way | **60 min** local · **2.5 h** for weekend mode |

Note weekday, time of day, free half-day vs overnight intent.

## 2. Run modes as subagents (parallel)

Spawn **one read-only (or normal) subagent per mode** below. Pass the same context packet to each. Do **not** write the mode options yourself.

| Mode | File | Job |
|------|------|-----|
| **starter** | [modes/starter.md](modes/starter.md) | One tiny at-home option that fits the time of day |
| **half-day** | [modes/half-day.md](modes/half-day.md) | One same-day local outing (honest hours) |
| **weekend** | [modes/weekend.md](modes/weekend.md) | One overnight / getaway sketch if the datetime allows; else return SKIP |

**Each subagent prompt must include:**

```
You are proposing ONE side-quest option for mode: <mode>.
Context: datetime=… location=… max one-way=…
Follow: <absolute path to mode file>
Also honor honesty: never invent venues/hours; check-before-go + URL if fragile.

Return exactly:
- STATUS: OPTION | SKIP
- If OPTION: title, win, where/when, hours, travel, why this fits context
- If SKIP: one-line reason (e.g. midweek morning — no getaway)
```

Prefer parallel spawn. Wait for all three.

If a harness has **no** subagent tool: run each mode file yourself as a separate pass and still label options by mode — last resort only.

## 3. Present overall options (main agent)

Collect every `STATUS: OPTION`. Drop SKIPs (optional one-line “not offered: …” if useful).

Show a **menu** for the user to pick. Number the options. Do not auto-pick for them.

```
Side quests — pick 0–1 (or more if you want). Skip free.

1 · STARTER · …
   Win: …
   …

2 · HALF-DAY · …
   Win: …
   Hours: … · url

3 · WEEKEND · …     # omit if all SKIP
   …

Why these: one line from context (datetime + place).
```

Then **stop and wait** for the user to choose a number (or skip). After they pick, expand only that card if needed — no residual nag if they ignore.

## Shared honesty (all modes)

- Never invent open hours, seasons, closures, or venues.
- Prefer free/cheap; mention drive cost when far.
- Binary win only.
- If nothing honest for a mode → that subagent SKIPs; thinner menu is fine.
