<p align="center"><img src="assets/mascot.png" alt="A tabby cat in a teal hoodie sitting on a scooter, eyes closed" width="400"></p>

# life-kit

Know what good looks like.

Each skill writes down what good work is in one area, in plain English. Read it as a guide, or run it in an AI agent as a slash command to do the work or review it.

## How it's organized

Inspired by Clean Architecture, skills have at most two layers. **Core** skills (`skills/core`) say what good work is in a field, true for every use case in that field, whatever the tool. **Use case** skills (every other folder) do one kind of work; when one builds on a core skill, it cites it instead of restating it.

Each rule has one home, and tool or framework detail is worked out at run time from your project.

**Agents** (`agents/`) combine skills for one purpose, like building with blocks: each says which skills to apply, in what order, and what to return. An agent holds no principles of its own.

## Agents

- [**code-review**](./agents/code-review.md): Review a code change for design and tests by combining the software design and validation skills.
- [**consult**](./agents/consult.md): Write a prep note for advising someone stuck on a career or life question by combining the listening, perspective, goal, motivation and decision skills; finds the real problem and leaves every decision to the asker. Only as good as the asker's account ([limits](./docs/agents/consult.md#limits)).
- [**eval-design-review**](./agents/eval-design-review.md): Design or review an agent eval by combining the testing and eval skills; a design passes only after a review by someone else. Needs high-quality labeled cases as input ([limits](./docs/agents/eval-design-review.md#limits)).
- [**trend-catch-up**](./agents/trend-catch-up.md): Catch a reader up on a fast-moving field by combining the search, idea and writing skills; reports at most three of the most valuable ideas. Only as good as the reader's context ([limits](./docs/agents/trend-catch-up.md#limits)).

## Skills

### Thinking
- [**perspective**](./skills/core/perspective/SKILL.md): Win someone's support by seeing the situation from their side.
- [**listening**](./skills/core/listening/SKILL.md): Know why you listen, then listen, ask, and tell little.
- [**optionality**](./skills/core/optionality/SKILL.md): Find the choices you really have and judge what each is worth.
- [**purpose**](./skills/core/purpose/SKILL.md): Aim the work at its purpose; means and numbers serve the purpose and must not replace it.
- [**experimentation**](./skills/core/experimentation/SKILL.md): When thinking cannot settle something, run a small, cheap, reversible test, learn from the result, and adjust.
- [**grouping**](./skills/core/grouping/SKILL.md): Put observations into kinds, name them, and check that the groups hold.
- [**misfits**](./skills/core/misfits/SKILL.md): Find misfits in a record of work and keep the patterns that live.
- [**info-foraging**](./skills/core/info-foraging/SKILL.md): Get the most value for the attention spent looking: how to follow scent, which items to take, when to leave a source.
- [**idea-quality**](./skills/core/idea-quality/SKILL.md): What makes an idea good: it is the core of the solution to a problem that occurs over and over again in its context, it makes sense from first principles, it actually solves the problem, even if only in part, and it works alongside other ideas.
- [**motivation**](./skills/core/motivation/SKILL.md): Judge whether a motive can keep a person acting by asking whether they truly endorse the reason, not only where it comes from.

### Software design
- [**design-principles**](./skills/core/design-principles/SKILL.md): What makes a design easy to change: hiding, coupling, dependency direction, contracts.
- [**clean-arch-domain**](./skills/swe/clean-arch-domain/SKILL.md): Decide whether a business rule belongs in the domain or a use case.
- [**structure-view**](./skills/swe/structure-view/SKILL.md): Design or recover a module's static structure.
- [**behavior-view**](./skills/swe/behavior-view/SKILL.md): Design or recover behavior as sequence views and use case courses.
- [**user-stories**](./skills/swe/user-stories/SKILL.md): Turn an idea into user stories, acceptance checks and thin slices.

### Validation
- [**verify-before-ship**](./skills/core/verify-before-ship/SKILL.md): Hand over a change only when it is verified and the owner can accept it after one read.
- [**testing**](./skills/core/testing/SKILL.md): What makes a good test, for anything under test.
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
- [**negotiation**](./skills/work/negotiation/SKILL.md): Reach an agreement that serves the important interests of the people involved, or see when no agreement is better.
- [**find-the-argument**](./skills/presentation/find-the-argument/SKILL.md): Find the one argument in notes or voice notes and rebuild the reasoning around it.
- [**make-presentation-slide**](./skills/presentation/make-presentation-slide/SKILL.md): Build a deck that teaches one argument with claim titles.
- [**readable**](./skills/writing/readable/SKILL.md): Default plain-English style for text people read.

### Learning
- [**inspiring-idea**](./skills/learning/inspiring-idea/SKILL.md): Given an idea and your context, say whether it can inspire your work, why, and how to apply it.

### Life
- [**investing**](./skills/core/investing/SKILL.md): Decide where to put capital, what to pay, and when to act or wait.
- [**next-goal**](./skills/life/next-goal/SKILL.md): Find the next goal worth pursuing and keep only strong candidates.
- [**side-quest-recommend**](./skills/life/side-quest-recommend/SKILL.md): Suggest a few real things to do near you.
- [**still-want-it**](./skills/life/still-want-it/SKILL.md): Reconsider a choice before putting more into it.

## License

[MIT](./LICENSE). Copyright (c) 2026 Shang-Yi Yu
