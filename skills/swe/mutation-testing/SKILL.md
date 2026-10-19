---
name: mutation-testing
description: >
  Judge how well a test suite catches faults by injecting small, realistic
  faults (mutants, modeled defects) and measuring how many it detects. Use to
  design or run a mutation analysis or fault seeding, review a mutation score,
  surviving or equivalent mutants, or on /mutation-testing.
metadata:
  short-description: "Mutation-based suite adequacy"
parent-skill: testing
---

# /mutation-testing

Judge a suite's power to find real faults by measuring how well it finds seeded ones, or review a fault-injection analysis someone else ran. It is the method behind [`testing`](../../domain/testing/SKILL.md) principle 9 and works on any entity under test (EUT) for which a fault model exists: small slips in a program, or modeled defects in a circuit such as a line stuck at a fixed value. To review an analysis, check for a baseline the EUT passes, operators that model realistic faults, one fault per mutant, equivalent mutants identified rather than counted as survivors, survivors given a cause before tests were added, and any estimate stated with its representativeness assumption; name each lapse once, with its fix.

## Principles

- **Estimate the unseen from the seen.** If faults you planted are found at some rate, assume native faults are found at the same rate. The suite's rate on seeded faults then measures its effectiveness and supports a rough estimate of how many native faults remain. The result is only an estimate.
- **The estimate rests on representativeness.** It holds only as far as the seeded faults stand in for real ones: as likely to be detected, and occurring as often and in the same places. Seeded faults that are easier, or harder, to detect than real ones tell you nothing about real faults. This is the assumption to name when judging an estimate; the bridge below justifies using mutants as seeded faults, not the estimate itself.
- **Why small seeded faults speak for real ones.** Two assumptions bridge them. What competent builders make is close to correct, so real faults are mostly small departures, and small mutants resemble them (the competent programmer hypothesis, a claim about the EUT). Tests that detect small faults tend to detect the larger faults made of them, because their consequences are similar (the coupling effect hypothesis, a claim about the tests). Give this bridge when someone objects that seeded faults are not real faults, and concede that it is an assumption that may not hold for a given EUT, so judge results with that in mind. Coverage cannot stand in for it, because it says what ran, not whether an oracle checked it (`testing` principle 8).
- **It assesses tests; it does not design them.** It rates a suite's effectiveness and can help estimate the defect rate.
- **A score is an indicator, not proof.** It is an approximate measure of how well the suite reveals faults: a high score means the suite found these seeded faults, under the assumptions here, and the more mutants killed, the more effective the suite is likely to be. Feedback can be weak: a score says how much was missed, not always what to do about it. These caveats travel with every judgment that uses a score, including a comparison with coverage: it is an estimate resting on representative mutants, survivors may be equivalent, and neither coverage nor score proves correctness.
- **One tool among several:** by the redundancy principle (`testing`), use it beside spec-based and structural testing, not instead of them.
- **A survivor is a question, not a task.** Find its cause before adding tests, re-evaluating the strategy, doing nothing, or creating more mutants.

## Fault models and operators

- **Faults can be seeded by hand,** following a distribution of real fault types, or automatically, with mutation operators.
- **A good operator models a fault the EUT could really have:** a slip a competent builder could make, or a defect the process could really introduce. Common classes for programs: relational, conditional and arithmetic operator changes; constant replacement, using constants found elsewhere in the EUT's own text; shifting values by one; inserting an absolute value; variable replacement; removing a variable's initialization.
- **Interface mutations** change what crosses an interface: the values a caller sends, the call itself, the values that enter or leave the called part (including variables from wider scopes), or what it returns. For a circuit, the usual model holds a line at a fixed value, or joins or opens connections.
- **Reject unrepresentative operators,** such as constants that appear nowhere in the EUT or changes so drastic that any test kills them. They inflate the score without saying anything about real faults.

## Reading survivors

- **Input problem:** the mutated part never ran, or ran with values that hide the change. A survivor often means the input selection strategy was weak, not that one more test is missing. Perturb representative values within their blocks and revisit the partitions ([`black-box`](../black-box/SKILL.md)).
- **Oracle problem:** the change reached an output, but no check looked at it. Strengthen the oracle ([`test-oracle`](../test-oracle/SKILL.md)).
- **Equivalent:** no test can kill it. Identify it and report it beside the score, so it is not read as a weak suite.
- **Many survivors with one cause** call for a change of strategy, not a test per survivor.

## Definitions

- **Mutation:** one small change that turns a valid EUT into another valid one, one that can still be built and run. It hopefully seeds a fault.
- **Mutant:** a copy of the EUT with exactly one mutation.
- **Killed:** at least one test fails on the mutant. **Alive:** every test passes on it.
- **Equivalent mutant:** a mutant that is logically equivalent to the original and behaves identically for every input. No test can kill it.
- **Mutation score:** killed mutants divided by all mutants; higher is better. For a circuit the same ratio is called fault coverage. It is a form of adequacy criterion: it rates the suite, not the EUT.
