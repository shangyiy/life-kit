---
name: white-box
description: >
  Structural (white-box) test adequacy: CFG-based coverage gaps after black-box
  tests exist. Statement, branch, and condition coverage. Child of /unit-tests.
  Use for coverage gap analysis, structural test design, or /white-box.
metadata:
  short-description: "Structural coverage gap analysis"
parent-skill: unit-tests
---

# /white-box

Find what existing tests miss in the implementation. Run after black-box.
Parent: [`unit-tests`](../unit-tests/SKILL.md) (`references/principles.md`).

## Core Idea

Build a CFG (nodes = basic blocks, edges = control flow). Uncovered elements
may hide faults even when black-box tests pass. Coverage is an indicator, not
proof. Structural adequacy is volatile — refactoring changes CFG without
changing spec.

## Coverage Ladder (weak → strong)

Statement → Branch → Condition (condition coverage ≠ MC/DC) → Path (usually infeasible; skip unless asked)

Report weakest unmet criterion first.

## Workflow

1. Trace existing tests against CFG.
2. List uncovered statements/branches/conditions.
3. For each gap, propose minimal input by reverse-engineering from the code path.
4. Attach oracle via `/test-oracle`.

## Decision Guide

- Uncovered branch in spec → add test (black-box input, structural justification)
- Uncovered branch, extra logic not in spec → fix code or test if intended
- All branches covered at target criterion → report adequate

## Output

Coverage %, uncovered gaps with line + suggested input, minimal proposed tests.