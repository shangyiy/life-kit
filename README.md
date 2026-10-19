# life-kit

life-kit is a pack of portable [Agent Skills](https://agentskills.io). Each skill is a `SKILL.md` file you run as a slash command, such as `/readable` or `/unit-tests`. The skills cover testing, software design, hiring, presentations, writing and everyday life.

## How skills are organized

Inspired by Clean Architecture, skills have at most two layers:

- **Domain** (`skills/domain`): what good work is in a field, true whatever the tool, language or output format.
- **Use case** (everything else): one kind of work that serves a domain idea and cites the domain skill instead of restating it.

Tool and framework detail is not written in the skills; it is worked out at run time from the project's environment. Dependencies point inward only, each rule has one home, and every skill supports both doing the work and reviewing existing work.

## Skills

| Folder | Skill | What it does |
|--------|-------|--------------|
| domain | [`design-principles`](./skills/domain/design-principles/SKILL.md) | What makes a design easy to change: hiding, coupling, dependency direction, contracts |
| | [`grouping`](./skills/domain/grouping/SKILL.md) | Put observations into kinds, name them, and check that the groups hold |
| | [`perspective`](./skills/domain/perspective/SKILL.md) | Win someone's support by seeing the situation from their side |
| | [`testing`](./skills/domain/testing/SKILL.md) | What makes a good test, for anything under test |
| | [`verify-before-ship`](./skills/domain/verify-before-ship/SKILL.md) | Hand over a change only when it is verified and the owner can accept it after one read |
| swe | [`unit-tests`](./skills/swe/unit-tests/SKILL.md) | Write and review unit tests |
| | [`black-box`](./skills/swe/black-box/SKILL.md) | Pick test inputs from the spec and decide which combinations to test |
| | [`test-oracle`](./skills/swe/test-oracle/SKILL.md) | Design how a test decides pass or fail |
| | [`white-box`](./skills/swe/white-box/SKILL.md) | Close structural coverage gaps |
| | [`mutation-testing`](./skills/swe/mutation-testing/SKILL.md) | Judge a suite by the injected faults it detects |
| | [`agent-evals`](./skills/swe/agent-evals/SKILL.md) | Design, run and review evals of AI agents |
| | [`clean-arch-domain`](./skills/swe/clean-arch-domain/SKILL.md) | Decide whether a business rule belongs in the domain or a use case |
| | [`user-stories`](./skills/swe/user-stories/SKILL.md) | Turn an idea into user stories, acceptance checks and thin slices |
| hiring | [`review-resume`](./skills/hiring/review-resume/SKILL.md) | Honest review of how a resume fits a job description |
| | [`resume-deep-dive`](./skills/hiring/resume-deep-dive/SKILL.md) | Mock interview on your resume claims, one question at a time |
| presentation | [`find-the-argument`](./skills/presentation/find-the-argument/SKILL.md) | Find the one argument in notes or voice notes and rebuild the reasoning around it |
| | [`make-presentation-slide`](./skills/presentation/make-presentation-slide/SKILL.md) | Build a deck that teaches one argument with claim titles |
| writing | [`readable`](./skills/writing/readable/SKILL.md) | Default plain-English style for text people read |
| life | [`side-quest-recommend`](./skills/life/side-quest-recommend/SKILL.md) | Suggest a few real things to do near you |

## License

[MIT](./LICENSE). Copyright (c) 2026 Shang-Yi Yu
