# side-quest-recommend evals

Lightweight scenarios for mode routing, honesty, and audit behavior. There is no built-in runner in life-kit yet — use a harness or a human rubric.

## Files

| File | Role |
|------|------|
| [cases.json](./cases.json) | Queries + `expected_behavior` checklists |

## How to run (manual)

1. Load the skill (`/side-quest-recommend` or open `SKILL.md`).
2. For each case in `cases.json`:
   - Send `query` (and inject `context` if present).
   - Score each string in `expected_behavior` as pass/fail.
3. A case **passes** only if all expected_behavior items pass.
4. Web-backed cases (half-day, weekend): judge **process and honesty**, not a fixed venue list. Live hours change.

## How to run (agent harness)

Prompt a fresh agent:

```text
You have skill side-quest-recommend loaded.
Run eval case <id> from skills/side-quest-recommend/evals/cases.json.
User message = case.query. Honor case.context.
After answering as the skill would, score yourself against expected_behavior
as PASS/FAIL per line. Do not edit the skill during the eval.
```

Optional: spawn a **grader** subagent that only sees the skill output + expected_behavior (not the main agent's chain-of-thought excuses).

## Minimum green set

Before merging skill changes that touch modes or filters, run at least:

1. `route-starter-coffee`
2. `audit-wrong-day-drop` (or `route-half-day-afternoon` if no Monday market available to tempt)
3. `route-weekend-getaway`

## Adding cases

- Prefer **observable** expected_behavior (mode label, card count, auditor present, no invented hours).
- Avoid golden venue names that go stale.
- Keep ≥1 case per mode + ≥1 routing + ≥1 honesty drop.
