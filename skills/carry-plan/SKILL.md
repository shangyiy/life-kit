---
name: carry-plan
description: >
  Carry a code implementation plan (design doc, RFC, issue, or PR plan) through
  code + tests to an open PR: implement with /unit-tests and its family when
  behavior changes, set a /goal that tests pass and the PR body honors the plan,
  and split editor vs validator across different subagents. Use when asked to
  carry, execute, or implement a plan; ship a plan to PR; implement an RFC or
  design doc; or when the user runs /carry-plan. Not for writing plans only.
metadata:
  short-description: "Plan → tests → PR with split editor/validator"
---

# /carry-plan

**One line:** implement the plan using `/unit-tests` and its family when the plan changes behavior or API.

Orchestrate only. Do not self-certify. Primary term for the GitHub text: **PR body**.

## Roles

| Role | Who | Job |
|------|-----|-----|
| **Orchestrator** | Main agent | Read plan, set goal, **draft PR body**, spawn subagents, open/update PR |
| **Editor** | Subagent | Implement plan + write tests (when required) |
| **Validator** | **Different** subagent | Run tests / stated checks; audit **draft PR body** vs plan |

**Rule of thumb: editor and validator must not be the same agent.**  
Never validate by resuming the editor. Always spawn a fresh validator (or a prior validator id — never the editor’s id).

## Goal (set first)

As soon as acceptance criteria exist, set an autonomous goal (`/goal` or `update_goal`) with **both** criteria required when tests apply:

1. **All tests pass** (project test command green; no known failing suite). For docs/chore-only plans: skip this criterion; use the plan’s stated checks instead.
2. **PR body is up to date and honors the plan** (scope, intent, checklist match — no silent scope drop, no invented scope).

If goal tooling is missing: state both criteria in chat and track them explicitly each round (do not skip the gate).

Report progress after each editor/validator round. Mark completed only when the validator confirms all active criteria. After **3** validator FAIL rounds, stop and surface `blocked_reason` using the template below — never fake green.

### Goal text example

```text
Carry plan: <title>. Success: (1) <test command or "docs-only checks"> green;
(2) PR body honors plan acceptance criteria: <bullets>.
```

### blocked_reason template

```text
blocked_reason: <what failed>
last_validator: <VERDICT summary / key gaps>
fail_rounds: n/3
ask_human: <decision needed>
```

## Workflow

Copy and tick:

- [ ] 1 Plan restated with acceptance criteria  
- [ ] 2 Goal active  
- [ ] 3 Editor implemented (+ tests if required)  
- [ ] 4 Orchestrator drafted PR body from plan + editor summary  
- [ ] 5 Validator PASS (tests + draft PR body)  
- [ ] 6 Goal completed  
- [ ] 7 PR description written/updated to validated PR body (verify with `gh pr view`)  

1. **Plan** — take the plan (paste, design doc, RFC, issue, or PR plan section). Restate acceptance criteria in one short block.  
   **If no plan, or criteria cannot be restated:** ask once for the plan/source; **do not** spawn the editor until criteria are written.
2. **Goal** — set the goal above; do not start editing until the goal is active (or explicitly tracked in chat).
3. **Editor subagent** — spawn with write access; instruct it to:
   - implement only what the plan requires
   - **If the plan changes behavior or API:** design and write tests with **`/unit-tests`** (and children as needed: `/black-box`, `/test-oracle`, `/white-box`, `/mutation-testing`). **If `/unit-tests` is unavailable:** still require black-box tests for changed behavior/API using project test conventions; do **not** skip the test criterion.
   - **If docs/chore only:** skip unit-test design; implement only stated deliverables
   - leave a short summary of files + how checks map to the plan
4. **Draft PR body (orchestrator)** — after the editor returns, **you** write the draft **PR body** from the plan + editor summary (scope, what changed, acceptance criteria, test plan). Do not open the PR yet. Pass this draft into the validator spawn payload.
5. **Validator subagent** — **new agent** (not the editor). Give it the draft PR body + plan. Instruct it to return the report skeleton below — **no code edits**:
   - run the repo’s test command(s) (or plan-stated checks for docs/chore)
   - audit the **draft PR body** against the plan; list gaps if stale, missing plan items, or overclaims
   - verdict **PASS** or **FAIL**
6. **Loop** — on FAIL: resume or re-spawn the **editor** only (if code/tests); revise draft PR body if body-only gaps; then spawn a **new validator**. Cap **3** validator FAIL rounds → `blocked_reason`. On PASS: complete goal; then **must** land the validated PR body on GitHub (step 7).
7. **PR — must write the validated PR body** (required; goal criterion 2 is not met until this lands):
   - **Create** with body: `gh pr create ... --body "<validated body>"` (or equivalent).
   - **If a PR already exists:** **always update the description** — `gh pr edit <n> --body "<validated body>"` (or equivalent). Never leave the default/empty/`--fill` body when a plan-validated draft exists.
   - After create/edit, **re-read** the remote PR body (`gh pr view --json body`) and confirm it matches the validated text (scope, acceptance criteria, test plan). If it does not match, edit again before claiming done.
   - If PR tooling is missing: leave the validated body ready to paste for the user (still require validator PASS on that draft) and state that the remote PR body is **not** updated yet.

## Validator report skeleton

```text
VERDICT: PASS | FAIL
Tests: <command(s)> · exit <code> · pass|fail
  (or N/A docs-only: <stated checks>)
PR body vs plan:
  - [ ] scope matches
  - [ ] acceptance criteria covered
  - [ ] no overclaim
Gaps: <none | bullets>
```

### Example FAIL

```text
VERDICT: FAIL
Tests: npm test · exit 1 · fail (auth.spec.ts: token expiry)
PR body vs plan:
  - [x] scope matches
  - [ ] acceptance criteria covered — missing "refresh rotates jti"
  - [x] no overclaim
Gaps: tests red; PR body omits jti rotation
```

### Example PASS (behavior)

```text
VERDICT: PASS
Tests: npm test · exit 0 · pass
PR body vs plan:
  - [x] scope matches
  - [x] acceptance criteria covered
  - [x] no overclaim
Gaps: none
```

### Example PASS (docs-only)

```text
VERDICT: PASS
Tests: N/A docs-only: links resolve; README section present
PR body vs plan:
  - [x] scope matches
  - [x] acceptance criteria covered
  - [x] no overclaim
Gaps: none
```

## Subagent placement

| Step | Subagent? | Notes |
|------|-----------|--------|
| Parse plan / set goal | Main | Keep plan + goal ownership here |
| Implement (+ tests) | **Editor** | One implementer; unit-tests workflow when required |
| Draft PR body | Main | From plan + editor summary; before validator |
| Test run + PR body audit | **Validator** | Read-only preferred; never the editor; receives draft |
| Fix after FAIL | **Editor** (+ Main if body-only) | Validator stays separate |
| Goal complete / PR body write | Main | After validator PASS: `gh pr create` or **`gh pr edit --body`**; re-read body |

If subagents are unavailable: still separate “editor pass” and “validator pass” in two turns — never claim validation in the same turn that edited.

## Anti-patterns

- Editor self-validates (“tests look fine”) without a separate agent run  
- Goal completed before tests/checks were actually run  
- Opening a PR before a draft PR body was written and validated  
- **PR exists but description never updated** (`gh pr create --fill` / empty body left as-is)  
- PR body left as default/fill while the plan listed concrete acceptance criteria  
- Expanding scope beyond the plan without updating the goal and PR body  
- Forcing full `/unit-tests` ceremony on pure docs/chore plans  
- Skipping tests on behavior/API changes because `/unit-tests` skill is missing  

## Output

Each round, one status line (`fail_rounds` = validator FAIL count only):

```text
goal: in_progress|completed|blocked · editor: <1-line> · validator: PASS|FAIL · fail_rounds: n/3 · PR: <url|draft>
```
