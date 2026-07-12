---
name: review-skill
description: >
  Critiques an Agent Skill (SKILL.md and siblings) by spawning read-only
  subagent reviewers against a best-practices document URL. Use when the user
  runs /review-skill, asks to review a skill, skill PR critique, skill best
  practices audit, or "critic this skill" against a link. Default rubric:
  Anthropic Agent Skills best practices.
---

# Review skill

Orchestrator only — **you do not write the critique yourself**. Spawn subagent
critics that use a best-practices page as the rubric.

## Inputs

| Input | Default |
|--------|---------|
| **Target** | Path to skill dir or `SKILL.md`, or open PR that adds/changes a skill |
| **Rubric link** | `https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices` |
| **Critics** | **3** parallel subagents (see lenses below) |

Parse user message for:
- path / PR / skill name
- optional custom `{link}` (any best-practices or style guide URL)
- optional `critics=N` (1–5; default 3)

If target unclear, ask once.

## Steps

### 1. Resolve target files

Collect the skill package (one level deep only):

- `SKILL.md` (required)
- `modes/**/*.md`, `references/**/*.md`, `evals/**/*`, other sibling `.md` if present
- Skip `node_modules`, binaries, huge dumps

If target is a **PR**, list changed skill paths under `skills/` and review each
changed skill (or the primary one if many).

### 2. Fetch the rubric

Open the rubric URL (harness browse/fetch). Extract principles as a short checklist
you will paste into every critic prompt. If fetch fails, stop and tell the user.

### 3. Spawn critics (parallel)

Use the harness subagent/task tool. Prefer **read-only**. `subagent_type`:
general-purpose (or explore if read-only-only).

**Default three lenses** (skip extras if `critics=1` or `2`):

| # | Lens | Focus |
|---|------|--------|
| 1 | **Discovery** | `name`, third-person `description`, triggers, when-to-use in metadata only |
| 2 | **Structure & freedom** | progressive disclosure, ≤500 lines body, degrees of freedom, workflows/checklists |
| 3 | **Concision & anti-patterns** | token bloat, redundancy, tool lock-in, time-sensitive claims, too many options |

If `critics=1`: one full-spectrum critic. If `critics>3`: add lenses (evals/testing, multi-mode consistency, examples quality).

**Each critic prompt must include:**

```
You are a strict skill-authoring critic. Read-only. Do not edit files.

## Rubric (from <URL>)
<paste extracted checklist / key rules from the fetched page>

## Target skill files
<absolute paths; instruct critic to read them>

## Your lens
<only this lens — do not re-review other lenses in depth>

## Deliverable
### Verdict
APPROVE | APPROVE_WITH_NITS | REQUEST_CHANGES

### Scorecard
Pass / Partial / Fail per rubric dimension relevant to your lens (one-line evidence).

### Findings
Ranked P0 / P1 / P2. For each: location, problem, why (cite rubric), concrete fix.

### Strengths
2–4 bullets.

Be strict but fair. Markdown-only skills: script checklist items N/A.
```

Launch critics **in parallel**. Wait for all.

### 4. Synthesize (orchestrator)

Merge findings:

1. Dedupe overlapping issues (keep strongest severity).
2. Overall verdict = worst of critics (`REQUEST_CHANGES` > `APPROVE_WITH_NITS` > `APPROVE`).
3. Present a short report to the user:

```markdown
# Skill review: <name>
Rubric: <url>
Critics: N

## Overall: <VERDICT>

## Consensus findings
- [P0/P1/P2] …

## Per-critic summary
| Critic | Verdict | Top issue |
|--------|---------|-----------|

## Strengths
…

## Minimal fix set (to APPROVE)
…
```

Do **not** auto-edit the skill unless the user asks to apply fixes.

## Rules

- Critics are **read-only**; orchestrator does not rewrite the target during review.
- Always use a **fetched** rubric — do not rely on memory of best practices alone.
- Custom `{link}` replaces the default URL for all critics.
- Keep this skill itself concise; detailed rubric lives at the link, not here.
