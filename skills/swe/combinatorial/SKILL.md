---
name: combinatorial
description: >
  Spec-based combinatorial test design, or review of the combinations an
  existing suite covers: why interactions need combinations,
  the input-space coverage criteria (all combinations, each choice, pairwise,
  t-wise, base choice, multiple base choice) and how they rank, the trade-offs
  of pairwise testing, constraints for impossible combinations, unanswered
  combinations as requirement gaps, and decision tables for business rules.
  Method under /testing, built on the /black-box input model. Use when
  combinations explode, for pairwise or decision-table design or review, or
  /combinatorial.
metadata:
  short-description: "Combination strategies and decision tables"
parent-skill: testing
---

# /combinatorial

Choose which combinations of blocks to test once [`black-box`](../black-box/SKILL.md) has built the input space model, or judge which combinations an existing suite covers. It applies [`testing`](../testing/SKILL.md) principles 7 and 8 to any entity under test: combinations of blocks are an input-space adequacy criterion. To review, rebuild the model and constraints, map each existing test to its block combination, and report the claimed criterion the suite fails, base choices without justification, infeasible combinations tested, unanswered combinations given a guessed result, and interactions left untested, each with the principle broken and the fix.

## Principles, most important first

- **Some failures need interactions.** A fault may show only when two or more variables take particular values together, so testing each value alone can miss it.
- **All combinations explode.** Their number is the product of the block counts and soon exceeds any test budget. Each input-space coverage criterion is an optimization that trades thoroughness for size, and what is effective depends on the entity under test (EUT).
- **No criterion is best everywhere.** All combinations is complete for the model but rarely affordable; each choice is affordable but rarely enough. Pairwise and base choice are compromises that can be very effective when domain knowledge about interactions backs them: base choice drops combinations unlikely to hide faulty interactions, pairwise samples only two-way interactions. Name the criterion, justify it against its assumptions, and say which interactions it leaves untested.
- **Impossible and unanswered combinations are different things.** A combination that cannot happen by definition is infeasible: state it as a constraint between blocks and drop it from the tests. A combination that can happen but that the rules give no answer for is a gap in the requirement: send it back to the requirement owner, don't guess an expected result, and don't drop it as if it were impossible.
- **A strategy only combines what the model expresses.** Over purely syntactic characteristics with no constraints, generated combinations can exercise only input validity and never the real function. Use semantic characteristics, declare constraints, and combine strategies.

## Criteria

- **All combinations (AC):** every combination of blocks across all characteristics. Also called strong equivalence class testing.
- **Each choice (EC):** every block appears in at least one test. Also called weak equivalence class testing. Cheap, often weak.
- **Pairwise (all pairs):** every block of each characteristic appears with every block of every other characteristic in at least one test. Each test exercises many pairs together, which is where the saving comes from. **T-wise** extends this to every combination of t characteristics.
- **Base choice (BC):** pick the most ordinary block of each characteristic; together they form the base test. Each further test holds all but one characteristic at its base and varies that one through its other blocks. It isolates non-ordinary blocks one at a time.
- **Multiple base choice (MBC):** several ordinary blocks per characteristic give several base tests, each varied the same way.
- **Ranking:** criterion A subsumes B when every suite that meets A also meets B. Two chains run from strongest to weakest: AC, t-wise, pairwise, EC; and AC, MBC, BC, EC. Different chains are not comparable: pairwise does not subsume base choice, and base choice does not subsume pairwise.

## Base choice

- **The base choice is a design decision.** Choose it as the most likely in real use, the simplest, the most obvious, the smallest, or the first in some order, and justify the choice. The base test must be feasible: the base blocks must be able to combine.
- **Base choice fits when one unusual block makes the others irrelevant,** such as an invalid input that stops processing. Then only one unusual block per test is needed and interactions need no check. Keep other characteristics at valid values so syntactic and semantic validity don't mix.
- **Its limit:** two non-base blocks never appear in the same test, so a fault that needs two unusual values together goes unseen. Where such interactions matter, add pairwise or multiple base choice.

## Pairwise trade-offs

- **Why it saves so much:** it assumes no fault needs more than two characteristics, and each test exercises many pairs together.
- **Assumptions:** blocks are true equivalence classes, characteristics are independent, and failures come from the interaction of at most two characteristics. Where these fail, use t-wise or targeted combinations.
- **Evidence:** a post-mortem study of recalled safety-critical software found that nearly all reported defects could have been caught by a suite covering every pair of parameter values, so pairwise interactions are a major source of faults.
- **Critique:** the saving is large next to all combinations, not next to the combinations that matter. Whether most faults are pairwise depends on the real dependencies in the product, and real inputs are not randomly distributed. Generators do not remove the work of choosing variables, values and oracles, and of analyzing results; a generator also picks the values, so representatives are out of your hands.
- **Fault localization is lost.** One test covers many pairs, so a failing test does not say which pair caused it. Pairwise answers "is anything broken?", which suits regression, not "what is broken?".

## Constraints

- **Two kinds:** a block cannot combine with a given block of another characteristic, or a block can combine only with a given block of another characteristic.
- **Handling depends on the criterion:** AC, EC and pairwise drop infeasible combinations; BC and MBC first re-choose base blocks, then drop what is still infeasible.
- **Constraints often surface late,** while generating concrete inputs. Revisit the model when they do.

## Business rules and decision tables

- **Business rules can be covered systematically.** When an output depends on combinations of conditions, list the combinations. Each one is either answered by a rule, impossible (a constraint), or unanswered, which exposes an incomplete requirement.
- **A decision table** lists conditions and actions as rows and rules as columns; each rule maps one combination of condition values to its actions. A don't-care entry marks a condition that does not affect a rule's actions.
- **Use one when** inputs are logically related (one value limits what others may be), some calculations involve only a subset of inputs, and actions are unequivocal: the order of evaluating conditions or rules changes nothing, and once a rule matches, no other rule needs checking. When evaluation order changes the result, a table misleads; model the sequence instead.
- **Tables in the business's terms,** kept apart from the implementation, let customers, test designers and developers state and check the rules together; a thin adapter connects each table to the EUT.
- **What a sound table shows:** every action has some rule that triggers it; every rule triggers some action; merged rules with don't-cares still account for every raw combination.
- **Tests:** each rule gets an affirmative test, and further tests vary each don't-care value to show it really doesn't matter.
