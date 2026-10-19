# core

This folder is inspired by Clean Architecture. It holds the domain: principles and definitions that stay true whatever the tool, language or output format. The skills here name none of them.

## Three layers

Skills in this kit are written in three layers. The software design and testing families show how.

- **Domain** lives here. [`testing`](./testing/SKILL.md) says what makes a good test, for anything under test. [`verify-before-ship`](./verify-before-ship/SKILL.md) says when a change is ready to hand over.
- **Use case** is one kind of work built on the domain. In testing, [`unit-tests`](../swe/unit-tests/SKILL.md) applies `testing` to the smallest piece of code. In software design, [`clean-arch-domain`](../swe/clean-arch-domain/SKILL.md) decides whether a business rule belongs in the domain or in a use case. Evals of other systems would be another use case of `testing`.
- **Adapter** is detail: tools and frameworks such as a particular test runner. It lives in a skill's `references/`, for example [`unit-tests/references/adapters.md`](../swe/unit-tests/references/adapters.md), and never changes the rule.

The testing methods sit under the domain: [`black-box`](../swe/black-box/SKILL.md), [`combinatorial`](../swe/combinatorial/SKILL.md), [`test-oracle`](../swe/test-oracle/SKILL.md), [`white-box`](../swe/white-box/SKILL.md) and [`mutation-testing`](../swe/mutation-testing/SKILL.md). Each one applies `testing` to a single question, such as which inputs to pick or how to decide pass or fail.

## Rules

- Dependencies point inward only. A use case cites the domain; the domain never cites a use case or an adapter.
- Each rule has one home. Other skills point to it instead of restating it.
- Every skill supports both doing the work and reviewing existing work.
