# life-kit

Portable [Agent Skills](https://agentskills.io) pack.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-resume`](./skills/review-resume/SKILL.md) | `/review-resume` | Honest resume ↔ JD fit review (hiring-manager lens) |
| [`resume-deep-dive`](./skills/resume-deep-dive/SKILL.md) | `/resume-deep-dive` | Mock-interview grill of resume claims (one Q at a time) |
| [`review-skill`](./skills/review-skill/SKILL.md) | `/review-skill` | Subagent audits a skill against a best-practices URL |
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | A few optional things to do near you — pick one or skip |
| [`unit-tests`](./skills/unit-tests/SKILL.md) | `/unit-tests` | Unit testing meta-skill (SWE suite) |
| [`black-box`](./skills/black-box/SKILL.md) | `/black-box` | Spec-based input selection (child of `/unit-tests`) |
| [`test-oracle`](./skills/test-oracle/SKILL.md) | `/test-oracle` | Pass/fail oracle design (child of `/unit-tests`) |
| [`white-box`](./skills/white-box/SKILL.md) | `/white-box` | Structural coverage gaps (child of `/unit-tests`) |
| [`mutation-testing`](./skills/mutation-testing/SKILL.md) | `/mutation-testing` | Meaningful mutation adequacy (child of `/unit-tests`) |
| [`carry-plan`](./skills/carry-plan/SKILL.md) | `/carry-plan` | Carry a plan to draft PR: Dev/Validator split, done = remote body + PASS |

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

## swe (unit testing)

Unit testing suite. Entry point:

```text
/unit-tests
```

Orchestrates:

1. **Contract** — pre/post-conditions, invariants  
2. **`/black-box`** — partition inputs, pick representatives  
3. **`/test-oracle`** — pass/fail procedure per case  
4. **Fixture** — Arrange EUT + doubles  
5. **Write tests** — Act + Assert  
6. **`/white-box`** — CFG coverage gaps  
7. **`/mutation-testing`** — suite adequacy when requested  

Principles: [`skills/unit-tests/references/principles.md`](./skills/unit-tests/references/principles.md).  
Credit / source: [`skills/unit-tests/README.md`](./skills/unit-tests/README.md).

## carry-plan

```text
/carry-plan
[paste plan]
```

Tech Lead orchestrates **Dev** ≠ **Validator** through fixed phases: implement → draft PR → checks/CI → remote body evidence → Validator PASS on HEAD.

- Behavior: `/unit-tests` TDD; docs/chore: plan-stated checks  
- Phase 1 Validator: plan fit + ponytail + Musk 5-step  
- **Done** only if remote body matches tree, test plan honest, Validator PASS on **this** HEAD (mergeable alone is not enough)  

## License

[MIT](./LICENSE) — Copyright (c) 2026 Shang-Yi Yu

