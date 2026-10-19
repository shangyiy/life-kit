---
name: test-oracle
description: >
  Design or review a test's oracle, the check that decides pass or fail: what
  to observe, where expected results come from, and how to trust the oracle.
  Use for expected results, assertions, interaction checks, or the oracle
  problem, or on /test-oracle.
metadata:
  short-description: "Design and review test oracles"
parent-skill: testing
---

# /test-oracle

How to build the pass-or-fail decision of a test, the assert step, for any entity under test (EUT): code, circuit or system. It applies [`testing`](../../domain/testing/SKILL.md) principle 2 (an oracle that can fail, expected results from the spec, every promised outcome checked) and uses its definitions of oracle, contract, fault, error and failure. To review oracles, list what the spec promises for each test's behavior, compare it with what the checks judge, and name each lapse once, with its fix.

## Principles

- **Observe every promised outcome.** A postcondition can promise a returned result, a resulting state, an interaction with a collaborator, or several of these; observe each one the spec makes a promise about. An unchecked outcome leaves its faults undetected, and a check placed elsewhere passes even though the state is wrong. Check what the contract promises, not internal state outside it, which ties the test to the implementation.
- **Derive each expected result before the run** from the contract (postconditions and invariants), the input block, or the business rule for this case. A value copied from the EUT's own output only confirms what the EUT does. When a recorded or circular oracle is replaced, reselect the cases from the rule too, its blocks, boundaries and special values, instead of keeping arbitrary inputs with recomputed expectations.
- **Use the most specific oracle the spec supports; remove variation instead of weakening the oracle.** When an outcome varies because of a source the test can control, a clock, a generator of random values or identifiers, or a collaborator, replace that source with a double that gives known values and check the exact results that follow from them, including that the EUT used and passed on the value the source gave. Cheaper oracles judge less: fall back to properties or observation only for outcomes whose expected values stay unknown with every such source controlled, and say what the weaker oracle cannot detect.
- **Say whether a check judges a failure or an error.** Most oracles judge failures, deviations visible at the external interface. A check on internal state, logs, traces or a probe on hidden state judges an error, by the classification in `testing` § Definitions, even when the test detects it; name it so.
- **Validate the oracle itself.** An oracle, a reference result or a human or automated judge can be wrong. Run it on cases with a known right answer and on known-bad cases, and confirm it passes the first and fails the second; this also shows each case can be passed at all (`testing` principle 2). Where judgment is involved, compare independent judges on the same cases and report how often they agree; let a judge return "cannot decide" rather than guess, and recheck the oracle when the EUT, the spec or the judge changes.
- **Give each check its own verdict, and judge redundancy check by check.** A check is redundant when another already fails whenever it fails and gives the same diagnosis; it is essential when it gives a diagnosis no other gives. Decide for each check separately, in each test: ask whether another check subsumes it under all conditions, and whether its extra condition is worth checking. The same kind of check can be redundant in one test and essential in the next, so never keep or drop such checks as a group. A check that a result exists at all (a not-null check) is redundant when the next check uses that object directly, since that check's failure already points at it; it is essential when the next check reaches the value through a chain of calls, where a missing link anywhere fails the same way and only the earlier check says which link it was.
- **Grade only where the spec grades, and report a verdict per outcome.** Pass or fail fits every outcome the spec states as a requirement. A graded verdict, partial credit or a score on a scale, fits only where the spec itself admits degrees of quality, or where several outcomes carry different weight; fix the scale, what each level means, the weights and the combining rule before the run, and never let credit on other outcomes offset a failed required one. When a behavior promises several outcomes or quality dimensions, judge and report each one, then combine them by that rule; one blended score hides which outcome failed.
- **No hyperassertions:** a check riddled with incidental detail, such as a whole output compared when one property matters, breaks on harmless changes and makes the test brittle. Check the essential property; make brittle tests less brittle.
- **No magic values.** A magic number is a hard-coded value whose meaning is obscure, and any hard-coded expected value can be one, even one familiar in the domain. Make its meaning visible where the check reads it: write it inline when it is plain there, derive it in view, or give it a short reason; name it only when the name reads more clearly than the value.
- **Diagnostic and simple.** Prefer the simplest test that reads clearly. A failure report shows what was expected, what happened, and which part is wrong, with the expected and actual values each correctly labeled; a custom failure message adds only what the report does not already show. A check that reduces a comparison to true or false reports only that it was false and loses the actual value. Keep conditional logic out of the assert step: a branch in the check can skip it silently. Determinism and fail-ability are `testing` principles 5 and 2; an oracle that is true for almost any output is useless.

## Kinds of oracle

- **Comparator:** checks the actual result against an expected value from the spec, or against a golden standard, a trusted reference result or implementation. It is only as good as the reference.
- **Parametric assertion:** checks a property that must hold for any valid input, such as a postcondition, an invariant, or a relation between input and output. It needs no precomputed value per input, but a wrong output can still satisfy the property.
- **Error oracle:** passes only when the specified error occurs, checks that the error is the specified one, and fails explicitly when no error occurs.
- **Interaction oracle:** checks that a collaborator received the expected calls, messages or signals.
- **Observer (implicit oracle):** classifies a run as normal end, exception, or crash. It is cheap and fully automatic, so random testing and fuzzing rely on it, but it judges only robustness, not correctness.
- **Judge:** a person or procedure that rates an output against a rubric when no exact expected value exists. It is the most fallible kind; validate it as above.

## Observation and interactions

- **Three things to observe:** the result the EUT returns, the state it is left in, and its interactions with collaborators.
- **Hidden outcomes need visibility.** Operations with no result, state users cannot see, hidden side effects and hidden interactions block observation. Expose them through the design, or with a double that records them, rather than by reaching into internals, which makes tests brittle.
- **Check results for queries, interactions for actions:** stub queries, mock actions. For a query, give a canned answer and check the result or state. Check interactions for actions, the calls that change something outside the EUT.
- **Check what the spec says about the interaction:** which calls happen, how many times, with which arguments, in which order, and under which circumstances. Where the spec rules a call out, check that it never happens.
- **Check only the interactions you care about.** Verifying every call ties the test to the implementation and makes it brittle. Check that no further interactions happen only when the spec requires it.
- **Arrange defines the double's behavior; assert verifies the interactions.** An interaction check assumes the collaborator's contract rather than testing it.

## The oracle problem

- **Knowing the expected result in advance can be hard:** with many generated tests, an unfamiliar domain, or unfamiliar software. It is worst for random testing and other automated generation, and it is part of what makes an EUT less testable.
- **Responses:** compare with a golden standard, check parametric assertions, observe crashes and exceptions, or use a validated judge. Each gives up some precision for automation; say which one you chose and what it cannot detect.

## Definitions

- **Expected and actual:** the expected value is the oracle; keep it distinct from the actual value and label each clearly.
