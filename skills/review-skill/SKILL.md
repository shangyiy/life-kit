---
name: review-skill
description: >
  Audits an Agent Skill by spawning a read-only subagent against a best-practices
  URL. Use when the user runs /review-skill, asks to review a skill, skill PR
  critique, or critic a skill against a link. Default rubric:
  https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices
---

# Review skill

**You do not audit yourself.** Spawn one read-only subagent that audits the target
skill using a fetched rubric link.

## Inputs

| Input | Default |
|--------|---------|
| **Target** | Path to skill dir or `SKILL.md` (or PR that changes a skill) |
| **Link** | `https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices` |

If target or link is missing and not inferable, ask once.

## Steps

1. **Resolve target** — collect `SKILL.md` and one-level siblings (e.g. `modes/`, `evals/`, `references/`).
2. **Fetch the link** — open the rubric URL. If fetch fails, stop.
3. **Spawn one auditor** (harness subagent/task tool, prefer read-only). Prompt:

```
You are a strict skill-authoring auditor. Read-only. Do not edit files.

Rubric (fetch and apply): <URL>
Also use these extracted notes if the page was already fetched:
<short checklist from the page>

Target files (read them):
<absolute paths>

Deliverable:
### Verdict
APPROVE | APPROVE_WITH_NITS | REQUEST_CHANGES

### Findings
P0 / P1 / P2 — location, problem, rubric reason, concrete fix.

### Strengths
A few bullets.

### Minimal fix set (to APPROVE)
```

4. **Show the user** the subagent’s report. Do not rewrite the target unless they ask to apply fixes.
