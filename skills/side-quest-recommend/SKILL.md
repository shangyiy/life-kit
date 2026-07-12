---
name: side-quest-recommend
description: >
  Recommends optional side quests in one of three modes: starter (tiny at-home
  ritual), half-day trip (local outing), or weekend trip (overnight / multi-day
  away). Uses real web sources and honest hours for trip modes. Use for side
  quests, weekend plans, half-day ideas, morning starters, things to do,
  /side-quest-recommend, or a preview board. Not a restaurant-booking or full
  travel-agent flow.
---

# Side quest recommend

Standalone recommend skill — no app, bot persona, or setup wizard.

**Tone (all modes):** Dessert, not homework. Optional always. No guilt or streaks.

## Modes

Pick **exactly one** mode per run. If the user names a mode or slash flag, honor it.
If unclear, ask once:

| Mode | When | Read |
|------|------|------|
| **starter** | Tiny at-home ritual (brew coffee/tea, 5–25 min) | [modes/starter.md](modes/starter.md) |
| **half-day** | Local outing, same-day return (~2–6 h door-to-door) | [modes/half-day.md](modes/half-day.md) |
| **weekend** | Overnight or multi-day away (Sat–Sun style), return home | [modes/weekend.md](modes/weekend.md) |

**Inference hints (only if mode not stated):**
- brew / tea / coffee / “slow morning” / “tiny habit” → **starter**
- “this afternoon” / market / park / “half day” / nearby → **half-day**
- “weekend getaway” / overnight / road trip / “out of town” → **weekend**
- bare “weekend board” / “things to do” → ask **half-day vs weekend** (not starter)

After picking a mode, **load that mode file and follow it**. Do not mix mode outputs in one board unless the user asks for multiple modes explicitly (then run separately).

---

## Shared rules (all modes)

1. **Resolve a real calendar date** (or date range for weekend) before composing.
2. **Never invent open hours, seasons, road closures, or ticket prices.** Prefer official sources; else drop or mark **check before you go** + URL.
3. **Trip modes (half-day, weekend):** hard filters via **subagent auditor** — see below. Do not self-audit.
4. **Starter:** catalog only; no web required. Light tone check only (optional self-check OK; subagent optional).
5. Recent boards: use **this thread only** if present; else skip novelty scoring.
6. No account, install, or guide persona required.

---

## Hard filters — subagent audit (half-day + weekend)

**Do not self-audit trip candidates.** Main agent packages; a **separate auditor** applies the reject table. Honor every **DROP**.

### Main agent before audit
1. Package each candidate: mode · slot · title · win · claimed hours/season · source URL · notes (day, cost, drive, overnight).
2. Spawn auditor via harness subagent/task tool. Prefer **read-only**. Pass packet + target date(s) + home/area + reject table.

### Reject if

| Reject | Why |
|--------|-----|
| Hours / season / closure made up | Dishonest |
| Wrong day for market/event | Dishonest |
| Crop / season closed | Dishonest |
| Venue, trail, or road closed | Safety / honesty |
| Expensive tickets as the default “easy” pick | Prefer free/cheap when slot is Easy |
| Moral homework (“hydrate for wellness”) | Tiny pleasure or drop |
| Overnight claims without a real place/region | Dishonest (weekend) |

### Auditor output

```
For each candidate:
- KEEP | DROP
- reason (one line; cite source/day/season if DROP)
- hours_ok: yes | no | n/a | check-before-go
- source_url (if any)

Summary: kept N / dropped M
```

### Main agent after audit
- Compose only from **KEEP** (`check-before-go` allowed if hours real but fragile — mark on card).
- Empty after DROP → leave empty / fewer cards; never invent a replacement without re-pull + re-audit.
- Honesty footer = auditor DROP list.

---

## Shared presentation bits

- Binary **Win:** specific, doable, optional.
- Hours line: `n/a` (starter) or sourced hours + URL (trips).
- **Not today:** short list of auditor drops when any fired.
- Optional one-line “why this board.”

Mode files own card count, slots, and full templates.

---

## Evals

Manual / harness eval cases: [evals/cases.json](evals/cases.json). How to run: [evals/README.md](evals/README.md).

When changing mode behavior, keep cases green in spirit (expected_behavior), especially honesty and mode routing.
