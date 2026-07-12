---
name: review-skill
description: >
  Spawn a subagent to audit an Agent Skill against a best-practices link.
  Use when the user runs /review-skill, asks to review a skill, or critic a
  skill against a link.
---

Spawn a **read-only subagent** to audit the target skill against the best-practices link. **Do not audit it yourself.**

Default link: https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices  
If the user gives another link, use that instead.

Point the subagent at the skill’s files (`SKILL.md` and siblings). Tell it to fetch the link, apply that rubric, and return a clear verdict with findings. Show me the report.

Do not edit the skill until I ask you to apply fixes.
