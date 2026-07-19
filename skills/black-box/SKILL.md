---
name: black-box
description: >
  Spec-based (black-box / functional) test input selection: partition input
  space into equivalence blocks, pick representatives, handle combinatorial
  constraints. Child of /unit-tests. Use for behavior-first input design,
  equivalence classes, boundary values, pairwise testing, or /black-box.
metadata:
  short-description: "Spec-based test input selection"
parent-skill: unit-tests
---

# /black-box

Select inputs from specification only — no implementation peeking.
Parent: [`unit-tests`](../unit-tests/SKILL.md) (`references/principles.md`).

Also called: spec-based testing, functional testing, behavior-first testing.

## Process

Mine the spec (requirements, pre/post-conditions, API docs) for **attributes**
(anything that can vary) → group into **characteristics** → **partition** each
characteristic into blocks → pick **representatives** + oracle (`/test-oracle`).

**Characteristic types:**
- *Syntactic* — mechanical, type-driven (e.g., sign of integer, string length)
- *Semantic* — domain-driven (e.g., triangle type, number of ZIP matches)

## Partition Quality

- **Disjoint** — no input belongs to two blocks of the same characteristic
- **Complete** — blocks cover the characteristic; add "undefined" for invalid combos
- **Uniform** — all-or-none: one pass ⇒ block passes; one fail ⇒ block fails
- **Sanity review** — check for missing characteristics (e.g., length-1 list breaks "order")

## Selection Rules

Happy · sad · boundary (at/near limits) · corner (pathological, interacting).
No redundancy within a block. Systematic non-uniform selection beats random —
faults are sparse needles, not uniformly distributed.

## Combinatorial Reduction

Pairwise (2-wise) when combinations explode. Split tables when constraints make
combos impossible (e.g., monochrome only with hand-held).

## Output

Per case: characteristic, block, representative input, expected (oracle), rationale.
Flag uncovered blocks and constraints applied.