---
name: test-oracle
description: >
  Design test oracles: the procedure that decides pass vs fail for a test case.
  Child of /unit-tests. Use when defining expected results, assertions, or
  choosing oracle type for a test, or /test-oracle.
metadata:
  short-description: "Design test oracles"
parent-skill: unit-tests
---

# /test-oracle

Design pass/fail for each test case (Arrange–Act–**Assert**).
Parent: [`unit-tests`](../unit-tests/SKILL.md) (`references/principles.md`).

**Oracle** = procedure comparing actual vs expected to produce a verdict.

## Core oracle types

| Type | Example |
|------|---------|
| Exact value | `assertEquals(300, game.score())` |
| Exception | `assertThrows(InvalidOp.class, ...)` |
| Invariant | `balance > 0 && balance <= MAX` |
| Relational/range | `greaterThan(0)`, `closeTo(3.14, 0.01)` |
| Set/membership | `hasEntry("bar", "foo")` |
| Boolean | `assertTrue` / `assertFalse` |
| Null | `assertNull` / `assertNotNull` |
| Matcher (Hamcrest) | `assertThat(x, hasItem(...))` — better diagnostics |

Pick the simplest type that works. `assertEquals(expected, actual)` — expected first.

## Design Rules

1. Derive expected from spec/contract for this input block.
2. One oracle per test purpose (essentiality).
3. Oracle must fail when behavior is wrong; use `fail()` on stub paths.

## Oracle Smells

Redundant `assertNotNull` before use · hyperassertions (full serialized output) ·
non-failing oracle (passes either way) · asserting internal state not in contract ·
magic expected values without named constants

## Output

Per case: oracle type, assertion (one-liner), rationale (spec clause / block).