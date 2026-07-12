---
name: side-quest-recommend
description: >
  Recommends optional side quests: default Saturday-style board (home starter +
  local outing), or a single mode if named (starter, half-day, weekend). Honest
  hours only; no invented venues. Use for /side-quest-recommend, weekend board,
  things to do, morning starter, half-day, or getaway sketch.
---

# Side quest recommend

Standalone — no app, bot persona, or setup wizard. **Dessert, not homework.** Optional always.

## Default (bare slash / “weekend board” / “things to do”)

**Do not ask which mode.** Run the **product board** immediately:

1. Load [modes/starter.md](modes/starter.md) → pick **one** home Easy card.
2. Load [modes/half-day.md](modes/half-day.md) → up to **two** outing cards from the **curated slate** (or ask once for home/area + any places they already know). Audit outs. KEEP only.
3. Emit **one board**: home Easy first, then KEEP outs (omit outs if none). Easy-only is fine.

Never invent venues or open hours.

## Single mode (only if named)

| User says | Load |
|-----------|------|
| starter / brew / tea / coffee / slow morning | [modes/starter.md](modes/starter.md) only |
| half-day / this afternoon / nearby market or park | [modes/half-day.md](modes/half-day.md) only |
| getaway / overnight / road trip / out of town | [modes/weekend.md](modes/weekend.md) only |

If they name a mode, run **that file only** — still no multi-mode quiz.

## Shared rules

1. Trip outs: real calendar date when needed. Starter: today/tomorrow is enough.
2. **Never invent** hours, seasons, closures, venues, or “usually 9–5.”
3. Outings: **separate audit pass** (subagent preferred; else `audit_pass: self-second-look`). Honor every DROP. No invent-to-fill.
4. Product injects home/drive/tastes when present; ask only if missing.
5. Soft exits optional on bare skill output (product/Mira owns them).
6. Thread-only novelty if recent boards exist; else skip.

### Reject if

| Reject | Why |
|--------|-----|
| Hours / season / closure / venue made up | Dishonest |
| Wrong day for market/event | Dishonest |
| Closed venue/trail/road | Safety |
| Expensive tickets as default primary outing | Prefer free/cheap |
| Moral homework / wellness lecture | Pleasure or drop |
| Overnight with no real place/region | Dishonest (weekend mode) |

### Auditor shape

```
KEEP | DROP · reason · hours_ok · source_url
Summary: kept N / dropped M
```

Compose only from KEEP. Empty outs → Easy-only. Honesty footer = DROP list when useful.
