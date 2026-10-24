# life-kit

Know what good looks like.

Each skill writes down what good work is in one area, in plain English. Read it as a guide, or run it in an AI agent as a slash command to do the work or review it.

## How it's organized

Inspired by Clean Architecture, skills have at most two layers. **Domain** skills (`skills/domain`) say what good work is in a field, whatever the tool. **Use case** skills (every other folder) do one kind of work; when one builds on a domain skill, it cites it instead of restating it.

Each rule has one home, and tool or framework detail is worked out at run time from your project.

## Skills

### Thinking
- [**perspective**](./skills/domain/perspective/SKILL.md): Win someone's support by seeing the situation from their side.
- [**grouping**](./skills/domain/grouping/SKILL.md): Put observations into kinds, name them, and check that the groups hold.
- [**misfits**](./skills/domain/misfits/SKILL.md): Find misfits in a record of work and keep the patterns that live.

### Software design
- [**design-principles**](./skills/domain/design-principles/SKILL.md): What makes a design easy to change: hiding, coupling, dependency direction, contracts.
- [**clean-arch-domain**](./skills/swe/clean-arch-domain/SKILL.md): Decide whether a business rule belongs in the domain or a use case.
- [**structure-view**](./skills/swe/structure-view/SKILL.md): Design or recover a module's static structure.
- [**behavior-view**](./skills/swe/behavior-view/SKILL.md): Design or recover behavior as sequence views and use case courses.
- [**user-stories**](./skills/swe/user-stories/SKILL.md): Turn an idea into user stories, acceptance checks and thin slices.

### Validation
- [**verify-before-ship**](./skills/domain/verify-before-ship/SKILL.md): Hand over a change only when it is verified and the owner can accept it after one read.
- [**testing**](./skills/domain/testing/SKILL.md): What makes a good test, for anything under test.
- [**unit-tests**](./skills/swe/unit-tests/SKILL.md): Write and review unit tests.
- [**black-box**](./skills/swe/black-box/SKILL.md): Pick test inputs from the spec and decide which combinations to test.
- [**white-box**](./skills/swe/white-box/SKILL.md): Close structural coverage gaps.
- [**test-oracle**](./skills/swe/test-oracle/SKILL.md): Design how a test decides pass or fail.
- [**mutation-testing**](./skills/swe/mutation-testing/SKILL.md): Judge a suite by the injected faults it detects.

### Agent evals
- [**agent-evals**](./skills/swe/agent-evals/SKILL.md): Design, run and review evals of AI agents.

### Career & communication
- [**review-resume**](./skills/hiring/review-resume/SKILL.md): Honest review of how your resume fits a job description.
- [**resume-deep-dive**](./skills/hiring/resume-deep-dive/SKILL.md): Mock interview on your resume claims, one question at a time.
- [**find-the-argument**](./skills/presentation/find-the-argument/SKILL.md): Find the one argument in notes or voice notes and rebuild the reasoning around it.
- [**make-presentation-slide**](./skills/presentation/make-presentation-slide/SKILL.md): Build a deck that teaches one argument with claim titles.
- [**readable**](./skills/writing/readable/SKILL.md): Default plain-English style for text people read.

### Life
- [**investing**](./skills/domain/investing/SKILL.md): Decide where to put capital, what to pay, and when to act or wait.
- [**side-quest-recommend**](./skills/life/side-quest-recommend/SKILL.md): Suggest a few real things to do near you.

## License

[MIT](./LICENSE). Copyright (c) 2026 Shang-Yi Yu
