---
name: mutation-testing
description: >
  Assess test suite effectiveness via meaningful mutation operators. Child of
  /unit-tests. Mutants model realistic small faults (e.g. >= to >), not absurd
  swaps or magnet-detectable changes. Use for mutation score review, surviving
  mutant analysis, or /mutation-testing.
metadata:
  short-description: "Meaningful mutation testing adequacy"
parent-skill: unit-tests
---

# /mutation-testing

Judge suite quality by seeding small realistic faults and measuring kills.
Parent: [`unit-tests`](../unit-tests/SKILL.md) (`references/principles.md`).

Not a test-generation technique. Score = mutants killed / total (excl. equivalent).

Assumes: competent-programmer hypothesis + coupling effect (see Limits).

## Meaningful Mutants

Adjacent slips a competent programmer might make:
- Relational boundary: `i >= 0` → `i > 0`, `x < 5` → `x <= 5`
- Arithmetic: `x + 2*y` → `y + 2*y`
- Boolean: `&&` → `||`
- Init removal: `int x = 5` → `int x`
- Constant from program text: `x < 5` → `x < 12`

## Reject (meaningless / equivalent)

- **Magnet mutants** — detectable only by inspection, not behavior (CMU marble analogy)
- **Non-context constants** — `x < 5` → `x < 99999`
- **Logically equivalent** — `i >= 0` → `!(i < 0)`
- **Non-adjacent relational swaps** (e.g. `>` → `<`) — illustrative only; course teaches adjacent boundary ops

## Surviving Mutant Actions

| Situation | Action |
|-----------|--------|
| Path not exercised | Better input (`/black-box`); perturb representatives (CMU `f(x,y)`: y=1→y=2) |
| Path exercised, weak oracle | Strengthen oracle (`/test-oracle`) |
| Equivalent | Exclude from score |
| Meaningless operator | Exclude; fix tool config |

## Output

Score (excl. equivalent), surviving meaningful mutants with fix, recommendation.

## Limits

Assumptions may not hold for all codebases. Supplements black-box + white-box; do not chase 100% score.