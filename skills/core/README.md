# core

This folder is inspired by Clean Architecture. It holds the domain: principles and definitions that stay true whatever the tool, language or output format. The skills here name none of them.

## Two layers

Skills in this kit are written in two layers. The testing and software design families show how.

- **Domain** lives here. [`testing`](./testing/SKILL.md) says what makes a good test, for anything under test. [`verify-before-ship`](./verify-before-ship/SKILL.md) says when a change is ready to hand over.
- **Use case** is one kind of work built on the domain. In testing, [`unit-tests`](../swe/unit-tests/SKILL.md) applies `testing` to the smallest piece of code, and the techniques [`black-box`](../swe/black-box/SKILL.md), [`combinatorial`](../swe/combinatorial/SKILL.md), [`test-oracle`](../swe/test-oracle/SKILL.md), [`white-box`](../swe/white-box/SKILL.md) and [`mutation-testing`](../swe/mutation-testing/SKILL.md) each apply it to one question, such as which inputs to pick or how to decide pass or fail. In software design, [`clean-arch-domain`](../swe/clean-arch-domain/SKILL.md) decides whether a business rule belongs in the domain or in a use case, and [`user-stories`](../swe/user-stories/SKILL.md) turns an idea into stories, acceptance checks and thin slices.

Tool and framework detail is not written in the skills; it is worked out at run time from the project's environment.

## Rules

- Dependencies point inward only. A use case cites the domain; the domain never cites a use case.
- Each rule has one home. Other skills point to it instead of restating it.
- Every skill supports both doing the work and reviewing existing work.
