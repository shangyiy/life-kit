---
name: unit-tests
description: >
  The unit-test use case: tests of the smallest piece of code that can be
  tested on its own. Covers what a unit is, the unit's contract as the oracle
  source, isolating the unit with test doubles (dummy, stub, fake, spy, mock)
  and choosing the least intrusive one, testability seams and their
  trade-offs, test code quality, the eleven practices, and test-first change.
  Applies /testing and its methods. Use to write unit tests, to review an
  existing unit suite, or on /unit-tests.
metadata:
  short-description: "Write and review unit tests"
parent-skill: testing
---

# /unit-tests

The use case for code-level unit tests. Every principle and definition of [`testing`](../../domain/testing/SKILL.md) applies unchanged; this skill holds only what is specific to units of code. It makes three choices for that domain. **What is under test:** a unit, the smallest piece of code that can be tested on its own and assigned to one developer; a unit test sends a stimulus and checks the returned result, the state left behind, or both. **Where the oracle comes from:** the unit's contract (pre- and postconditions, invariants, state sequences), made explicit before testing. **Which faults it models:** small slips in code, injected as mutants. The methods supply the detail: inputs from [`black-box`](../black-box/SKILL.md) and [`combinatorial`](../combinatorial/SKILL.md), oracles from [`test-oracle`](../test-oracle/SKILL.md), structural gaps from [`white-box`](../white-box/SKILL.md), suite strength from [`mutation-testing`](../mutation-testing/SKILL.md). Whether the task is to write tests or to review a suite, apply the same principles; in a review, report each violation once with the principle it breaks and the fix, and list behaviors no test covers.

## Principles, most important first

- **Isolate the unit.** Collaborators that are not under test are replaced by doubles where a real one would make the test slow, nondeterministic or unable to reach a condition. Isolation is an approximation (`testing` § six principles): what a double stands in for is not tested here (`testing` § Definitions, fixture), so the wiring needs tests at higher levels.
- **The contract, not the code, sets the tests.** Every postcondition and state sequence gets a check, and all outcomes of one stimulus share one test; a limit the contract ignores is a gap to report (`testing` principles 3 and 4, § Definitions: contract).
- **Prefer the least intrusive double that serves,** from least to most intrusive: dummy or stub, fake, spy, mock. Stub when the collaborator only needs to be there and return canned answers; fake when the test needs realistic behavior that stubbing cannot give; spy to reveal internal state; mock when interactions matter or behavior must change during the test. Which outcomes need an interaction check follows the oracle rule "stub queries, mock actions" (`test-oracle`). Mocks can be much work, brittle, hard to maintain and read, and often unnecessary; use them where interactions matter.
- **Design units to be testable.** Testability (`testing` § Definitions) is decided by the design: see the seams below.
- **Test first.** Write the test before the code that makes it pass, so each test is seen to fail (`testing` principle 2).
- **Treat test code like production code.** It is read and changed as often.

## Test doubles

- **Kinds:** a **dummy** only fills a parameter slot, a **stub** returns canned answers, a **fake** is a simpler working version, a **spy** records calls or reveals hidden state, a **mock** checks expected interactions and can also act as a stub or a spy. In general testing usage "stub" means any simulated collaborator; among doubles it is the simplest kind.
- **Why doubles:** isolation, speed, determinism, simulated special conditions and injected faults, access to hidden information, and tests that run before the real collaborator exists.
- **Substitutability:** a double and the real collaborator share an interface, and the double must honor that contract; contract tests written against an interface can then run against every implementation. A double made by inheriting the real implementation can break substitution outside the test; prefer an interface and delegation.

## Testability seams

- **Five inhibitors:** code that cannot be instantiated (environment-bound creation), invoked (hidden or opaque operations), observed (no return value, hidden state, side effects or interactions), substituted (hard-coded collaborators, chains of calls through collaborators) or overridden in a test.
- **Inheritance cannot bypass a parent's creation logic.** Creating a subclass always runs the parent's construction, so neither a test subclass nor an overridden factory method stops creation logic you cannot change from running, along with its environment-bound effects. Hold such code by composition instead: put it behind a thin wrapper you control, depend on the wrapper's interface, and double the wrapper.
- **Design for it:** high cohesion and low coupling; one responsibility per unit, so each test has one reason to fail; extension without modification; small interfaces; dependence on abstractions. Dependency injection, passing collaborators in from outside instead of creating them inside, is the mechanism that achieves dependency inversion, and it is central to testability.
- **Hidden logic:** split complex hidden logic into simple hidden helpers and a visible unit that holds the complexity, and test hidden methods indirectly through the visible interface; once the complexity is extracted, the simple hidden helpers need no direct tests, because the visible behavior covers them. Don't break visibility at run time, which makes tests brittle and complicated.
- **Guidelines:** instantiate inside a unit only objects you will never replace with a double; keep test-preventing logic out of creation; avoid globally reached, non-replaceable state and members a test cannot replace where a test needs a double; prefer delegation to inheritance; wrap any external or legacy code you cannot change, not only code you inherit from, in the same way.
- **Trade-offs:** testability can clash with information hiding and other design principles; it is a matter of balance. Sealing a method against overriding has no easy answer: weigh the cost of misuse against testability, and remember tests can reveal misuse. Shared central resources are natural single instances yet are precisely the ones tests want to replace; make the instance replaceable under an agreed convention.

## Test code quality

- **Simplicity:** small steps and a small fixture. Move nonessential setup into helpers with descriptive names, all at a single abstraction level; a long, noisy arrange hides the behavior.
- **Maintainability:** factor duplication into setup steps and helpers, and move conditional logic out of tests into helpers; shared setup must still leave each test independent.
- **Expected-error tests:** if the test code around the action is complex, a declared expected error can come from the wrong statement and mask a failure, so keep only the action that should raise it inside the expectation.
- **Injecting a fault in code** (`testing` principle 2): seed a defect or replace part of the production code with a stub until the test fails, then restore it. Never comment out an unfinished test; make it fail.
- **A parameterized test** runs one test logic over rows of input and expected data.
- **The eleven practices** and their homes: simplicity and maintainability (above); understandability (`testing` principle 4: names state the behavior; `test-oracle`: no magic values); essentiality (`test-oracle`: each check its own verdict, no hyperassertions); single purpose and behavior first (`testing` principles 4 and 3); determinism and independence (`testing` principle 5); fail-ability (`testing` principle 2); comprehensiveness (`testing` principle 7); speed (`testing` principle 6).

## Test-driven change

- **Red, green, refactor:** start from a test name that states the intent, write the test, add only enough code to build, see it fail, make it pass with the smallest change, then improve the design. A hard-coded green step is legitimate work in progress, not a defect; the next failing test forces the generalization. Move in the smallest steps possible, and avoid breaking many tests together.
- **An interface change** with no new behavior needs no new test: change the interface, fix every use until the code is consistent again, and rerun the suite, which must still pass.
- **Migrate incrementally:** add the new code path beside the old one, let the old one delegate to the new, move tests over, and delete the old path last; deleting it first breaks many tests at once.
