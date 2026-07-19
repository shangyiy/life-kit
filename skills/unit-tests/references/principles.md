# Unit Testing Principles

Principles common to rigorous unit testing, aligned with CMU 18-652–style teaching.

## Definition

In-process testing of a small code unit (class/method), isolated from collaborators.

## Arrange–Act–Assert

Setup (fixture) → Exercise → Verify (oracle) → Teardown (optional)

## Eleven Practices

Simplicity · Understandability · Essentiality · Single purpose · Behavior first ·
Maintainability · Determinism · Independence · Fail-ability · Comprehensiveness · Speed

Behavior first = black-box before white-box. 100% coverage is not the goal.

## Five-Step Test Workflow

1. Design tests  2. Select inputs  3. Determine oracles  4. Set up fixture  5. Measure adequacy

## Order of Attack

Black-box (spec) → white-box (structure) → mutation testing (suite adequacy).

Black-box finds missing functionality; white-box finds unexpected implementation behavior.

Testing shows presence, not absence, of bugs (Dijkstra).
