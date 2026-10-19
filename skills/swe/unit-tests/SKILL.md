---
name: unit-tests
description: >
  Meta-skill for writing and reviewing unit tests. Orchestrates black-box input
  selection, white-box coverage gaps, test-oracle design, and mutation-testing
  adequacy. Use when asked to write unit tests, review a test suite, improve
  test quality, or when the user runs /unit-tests.
metadata:
  short-description: "Unit testing meta-skill"
---

# /unit-tests

Write or review unit tests. Read `references/principles.md` for the eleven
practices and workflow.

## Workflow

1. **Contract** — pre/post-conditions, invariants, spec.
2. **Black-box inputs** — `/black-box`: partition input space, pick representatives.
3. **Oracles** — `/test-oracle`: pass/fail procedure per case.
4. **Fixture** — Arrange: EUT, test doubles, isolation.
5. **Write tests** — Act + Assert; one reason to fail; self-documenting names.
6. **White-box gaps** — `/white-box`: uncovered CFG branches/conditions.
7. **Measure adequacy** — `/white-box` coverage + `/mutation-testing` when user wants suite-quality feedback.

## Quality Checklist (all eleven practices)

- [ ] Simplicity — small fixture, small steps
- [ ] Understandability — clear names, no magic numbers
- [ ] Essentiality — no redundant assertions
- [ ] Single purpose — one behavior, one failure mode
- [ ] Behavior first — spec before implementation
- [ ] Maintainability — no conditionals in test code; refactor like production code
- [ ] Determinism — doubles for I/O, time, concurrency
- [ ] Independence — clean slate per test, any order
- [ ] Fail-ability — must be able to fail; stubs use `fail()`
- [ ] Comprehensiveness — happy, sad, boundary, corner; no overkill
- [ ] Speed — fast; doubles for expensive deps

## Anti-Patterns

Split-personality tests · hyperassertions · sleeping snails (`Thread.sleep`) ·
tests that pass when production is wrong · coverage before behavior · random
inputs without partition reasoning

## Output

Contract summary → test table (input, expected, oracle, partition rationale) →
test code → optional one-line coverage/mutation note.
