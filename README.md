# life-kit

life-kit is a pack of portable [Agent Skills](https://agentskills.io). Each skill is a `SKILL.md` file you run as a slash command, such as `/readable` or `/unit-tests`. The skills cover testing, software design, hiring, presentations, writing and everyday life.

## How skills are organized

Skills are written in three layers, inspired by Clean Architecture.

- **Domain** (`skills/core`): principles that hold whatever the tool or language.
- **Use case**: one kind of work built on the domain, such as unit tests.
- **Adapter**: tool and framework detail, kept in a skill's `references/`.

Dependencies point inward only, and each rule has one home. See [skills/core/README.md](./skills/core/README.md) for more.

## Skills

| Folder | Skill | What it does |
|--------|-------|--------------|
| core | [`testing`](./skills/core/testing/SKILL.md) | What makes a good test, for anything under test |
| core | [`verify-before-ship`](./skills/core/verify-before-ship/SKILL.md) | Hand over a change only when it is verified and the owner can accept it after one read |
| swe | [`unit-tests`](./skills/swe/unit-tests/SKILL.md) | Write and review unit tests |
| swe | [`black-box`](./skills/swe/black-box/SKILL.md) | Pick test inputs from the spec |
| swe | [`combinatorial`](./skills/swe/combinatorial/SKILL.md) | Decide which input combinations to test |
| swe | [`test-oracle`](./skills/swe/test-oracle/SKILL.md) | Design how a test decides pass or fail |
| swe | [`white-box`](./skills/swe/white-box/SKILL.md) | Close structural coverage gaps |
| swe | [`mutation-testing`](./skills/swe/mutation-testing/SKILL.md) | Judge a suite by the injected faults it detects |
| swe | [`clean-arch-domain`](./skills/swe/clean-arch-domain/SKILL.md) | Decide whether a business rule belongs in the domain or a use case |
| swe | [`carry-plan`](./skills/swe/carry-plan/SKILL.md) | Carry an approved plan to a draft PR ready for review |
| swe | [`review-skill`](./skills/swe/review-skill/SKILL.md) | Audit a skill against a best-practices link |
| hiring | [`review-resume`](./skills/hiring/review-resume/SKILL.md) | Honest review of how a resume fits a job description |
| hiring | [`resume-deep-dive`](./skills/hiring/resume-deep-dive/SKILL.md) | Mock interview on your resume claims, one question at a time |
| presentation | [`process-thinking-aloud`](./skills/presentation/process-thinking-aloud/SKILL.md) | Turn voice notes into structured reasoning |
| presentation | [`find-the-argument`](./skills/presentation/find-the-argument/SKILL.md) | Find the one thesis that ties your notes together |
| presentation | [`make-presentation-slide`](./skills/presentation/make-presentation-slide/SKILL.md) | Build a deck that teaches one argument with claim titles |
| writing | [`readable`](./skills/writing/readable/SKILL.md) | Default plain-English style for text people read |
| life | [`side-quest-recommend`](./skills/life/side-quest-recommend/SKILL.md) | Suggest a few real things to do near you |

## Install

### Grok

```bash
grok plugin install shangyiy/life-kit --trust
# or local checkout
grok plugin install /path/to/life-kit --trust
```

### Claude Code

Inside Claude Code:

```text
/plugin marketplace add shangyiy/life-kit
/plugin install life-kit@life-kit
```

Or from your shell:

```bash
claude plugin marketplace add shangyiy/life-kit
claude plugin install life-kit@life-kit
```

Local checkout:

```bash
claude --plugin-dir /path/to/life-kit
```

Skills are namespaced, such as `/life-kit:unit-tests`. Run `/reload-plugins` if they don't show yet.

To make `/readable` the default in another repo, add this line to its `AGENTS.md` and `CLAUDE.md`:

```text
For user-facing prose, follow the readable skill (/readable).
```

## License

[MIT](./LICENSE). Copyright (c) 2026 Shang-Yi Yu
