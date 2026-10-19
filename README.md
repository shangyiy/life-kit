# life-kit

Portable [Agent Skills](https://agentskills.io) pack.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-resume`](./skills/hiring/review-resume/SKILL.md) | `/review-resume` | Honest resume ↔ JD fit review (hiring-manager lens) |
| [`resume-deep-dive`](./skills/hiring/resume-deep-dive/SKILL.md) | `/resume-deep-dive` | Mock-interview grill of resume claims (one Q at a time) |
| [`review-skill`](./skills/swe/review-skill/SKILL.md) | `/review-skill` | Subagent audits a skill against a best-practices URL |
| [`side-quest-recommend`](./skills/life/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | A few optional things to do near you — pick one or skip |
| [`testing`](./skills/core/testing/SKILL.md) | `/testing` | What makes a good test, for anything under test (core of the testing skills) |
| [`unit-tests`](./skills/swe/unit-tests/SKILL.md) | `/unit-tests` | Write and review unit tests (use case on `/testing`) |
| [`black-box`](./skills/swe/black-box/SKILL.md) | `/black-box` | Spec-based input selection (method under `/testing`) |
| [`combinatorial`](./skills/swe/combinatorial/SKILL.md) | `/combinatorial` | Which input combinations to test; decision tables (method under `/testing`) |
| [`test-oracle`](./skills/swe/test-oracle/SKILL.md) | `/test-oracle` | Pass/fail oracle design (method under `/testing`) |
| [`white-box`](./skills/swe/white-box/SKILL.md) | `/white-box` | Structural coverage gaps (method under `/testing`) |
| [`mutation-testing`](./skills/swe/mutation-testing/SKILL.md) | `/mutation-testing` | Mutation adequacy (method under `/testing`) |
| [`carry-plan`](./skills/swe/carry-plan/SKILL.md) | `/carry-plan` | Carry a plan to draft PR: Dev/Validator split, done = remote body + PASS |
| [`clean-arch-domain`](./skills/swe/clean-arch-domain/SKILL.md) | `/clean-arch-domain` | Domain (entities) vs use case (interactor) split for business rules |
| [`verify-before-ship`](./skills/core/verify-before-ship/SKILL.md) | `/verify-before-ship` | Ship only what the owner can accept after one read, verified on the exact version |
| [`process-thinking-aloud`](./skills/presentation/process-thinking-aloud/SKILL.md) | `/process-thinking-aloud` | Voice notes → structured reasoning (not dictation) |
| [`find-the-argument`](./skills/presentation/find-the-argument/SKILL.md) | `/find-the-argument` | Notes → one thesis that makes the rest inevitable |
| [`make-presentation-slide`](./skills/presentation/make-presentation-slide/SKILL.md) | `/make-presentation-slide` | One argument as claim titles + sparse evidence |
| [`readable`](./skills/writing/readable/SKILL.md) | `/readable` | Default simple-English writeup: idea, elaboration, example when it helps |

## Install

### Grok

```bash
grok plugin install shangyiy/life-kit --trust
# or local checkout
grok plugin install /path/to/life-kit --trust
```

### Claude Code

Install as a native [Claude Code plugin](https://code.claude.com/docs/en/plugins) (managed bundle; updates with the repo rather than a hand-maintained fork).

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

Plugin skills are namespaced (e.g. `/life-kit:review-resume`, `/life-kit:unit-tests`). Run `/reload-plugins` if they don’t show yet.

**Local checkout (dev):**

```bash
claude --plugin-dir /path/to/life-kit
```

To make `/readable` the default in another repo, add this line to that repo's `AGENTS.md` and `CLAUDE.md`:

```text
For user-facing prose, follow the readable skill (/readable).
```

## review-resume

Self-service hiring coach for strong candidates. Paste a JD and resume:

```text
/review-resume
[paste JD]
[paste resume]
```

Honest fit calls (Strong / Stretch / Weak / Not the right fit). No ATS hacks, no invented experience.

## resume-deep-dive

Mock interviewer for foundation and problem-solving behind resume bullets—not a fit review. Agent-agnostic `SKILL.md` (any harness that loads Agent Skills).

```text
/resume-deep-dive
[paste resume]
optional focus: e.g. merge queue
```

One question at a time (why / tradeoff / alternative / gotcha). Depth-first after answers. No verdicts, no rewrite coaching. For JD fit, use `/review-resume` instead.

## side-quest-recommend

```text
/side-quest-recommend
```

1. Resolve datetime + location  
2. Run **starter / half-day / weekend** as **subagents**  
3. Show overall **numbered options** — user picks  

No mode quiz. Skip free. Never invent hours/venues.

## testing

Core skill `/testing`: what makes a good test, for anything under test. The
methods `/black-box`, `/combinatorial`, `/test-oracle`, `/white-box` and
`/mutation-testing` apply it; `/unit-tests` is the code-level use case.
Credits: [`skills/core/testing/README.md`](./skills/core/testing/README.md).

## carry-plan

```text
/carry-plan
[paste plan]
```

Tech Lead orchestrates **Dev** ≠ **Validator** through fixed phases: implement → draft PR → checks/CI → remote body evidence → Validator PASS on HEAD.

- Behavior: `/unit-tests` TDD; docs/chore: plan-stated checks  
- Phase 1 Validator: plan fit + ponytail + Musk 5-step  
- **Done** only if remote body matches tree, test plan honest, Validator PASS on **this** HEAD (mergeable alone is not enough)  

## Presentation argument pipeline

```text
/process-thinking-aloud   ← voice / monologue
/find-the-argument        ← one thesis
/make-presentation-slide  ← claim-title deck
```

## License

[MIT](./LICENSE) — Copyright (c) 2026 Shang-Yi Yu

