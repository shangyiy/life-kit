---
name: carry-plan
description: >
  Carry an implementation plan to a PR: implement with /unit-tests and its
  family, set a /goal that tests pass and the PR description honors the plan,
  and split editor vs validator across different subagents. Use when asked to
  carry a plan, implement a plan, or when the user runs /carry-plan.
metadata:
  short-description: "Plan → tests → PR with split editor/validator"
---

# /carry-plan

**One line:** implement the plan using `/unit-tests` and its family.

Orchestrate only. Do not self-certify.

## Roles

| Role | Who | Job |
|------|-----|-----|
| **Orchestrator** | Main agent | Read plan, set goal, spawn subagents, open/update PR |
| **Editor** | Subagent | Implement plan + write tests via the unit-tests family |
| **Validator** | **Different** subagent | Run tests; check PR description honors the plan |

**Rule of thumb: editor and validator must not be the same agent.**  
Never validate by resuming the editor. Always spawn a fresh validator (or a prior validator id — never the editor’s id).

## Goal (set first)

As soon as the plan is known, set an autonomous goal (session `/goal` or `update_goal`) with success criteria **both** required:

1. **All tests pass** (project test command green; no known failing suite).
2. **PR description is up to date and honors the plan** (scope, intent, and checklist match what the plan asked for — no silent scope drop, no invented scope).

Report progress on the goal after each editor/validator round. Mark the goal completed only when the validator confirms both criteria. If blocked after repeated failures, surface `blocked_reason` instead of faking green.

## Workflow

1. **Plan** — take the plan from the user (paste, design doc, issue, or PR plan section). Restate acceptance criteria in one short block.
2. **Goal** — set the goal above; do not start editing until the goal is active.
3. **Editor subagent** — spawn with write access; instruct it to:
   - implement only what the plan requires
   - design and write tests with **`/unit-tests`** (and children as needed: `/black-box`, `/test-oracle`, `/white-box`, `/mutation-testing`)
   - leave a short summary of files + how tests map to the plan
4. **Validator subagent** — **new agent** (not the editor). Instruct it to:
   - run the repo’s test command(s) and report pass/fail with output
   - read the open PR body (or draft body) against the plan; list gaps if the description is stale, missing plan items, or overclaims
   - return a clear **PASS** or **FAIL** with reasons — no code edits
5. **Loop** — on FAIL: resume or re-spawn the **editor** only; then spawn a **new validator** again. On PASS: update goal completed; ensure PR description is the validated text.
6. **PR** — open or update the PR; body must be the plan-honoring description the validator accepted.

## Subagent placement

| Step | Subagent? | Notes |
|------|-----------|--------|
| Parse plan / set goal | Main | Keep plan + goal ownership here |
| Implement + tests | **Editor** | One implementer; may follow unit-tests workflow itself |
| Test run + PR-desc audit | **Validator** | Read-only preferred; never the editor |
| Fix after FAIL | **Editor** | Same editor resume is fine; validator stays separate |
| Goal complete / PR push | Main | Orchestrator owns git PR surface if policy requires |

If subagents are unavailable: still separate “editor pass” and “validator pass” in two turns — never claim validation in the same turn that edited.

## Anti-patterns

- Editor self-validates (“tests look fine”) without a separate agent run  
- Goal completed before tests were actually run  
- PR body left as default/fill while the plan listed concrete acceptance criteria  
- Expanding scope beyond the plan without updating the goal and PR description  

## Output

Brief status each round: goal progress · editor summary · validator PASS/FAIL · PR URL when ready.
