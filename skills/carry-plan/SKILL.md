---
name: carry-plan
description: >
  Carry an approved plan (design doc, RFC, issue, or PR plan) to a draft PR ready
  for human review. Use when asked to implement a plan, run /carry-plan, land
  work via tests + PR, or when the user asks if anything is left on a plan/PR.
metadata:
  short-description: "Plan → Dev/Validator → draft PR; done = remote body + PASS on HEAD"
---

# /carry-plan

**One line:** Carry an approved plan to a **draft PR ready for human review**.

Orchestrate as **Tech Lead** (main agent). Spawn **Dev** and **Validator** as subagents. Do not merge unless the user explicitly asks.

## Roles

| Role | Who | Job |
|------|-----|-----|
| **Tech Lead** | Main agent | Read plan, classify scope, open/update PR, spawn Dev/Validator, enforce done gate |
| **Dev** | Subagent | Implement plan + write/run tests or stated checks |
| **Validator** | **Different** subagent | Phase 1: plan fit + ponytail + Musk 5-step on the diff. Phase 5: plan + HEAD + remote body + evidence. PASS/FAIL only |

**Hard rule:** Dev and Validator must not be the same agent. Never validate by resuming Dev. Always spawn a fresh Validator (or a prior Validator id — never Dev’s id).

## Scope class (pick once, re-pick if scope grows)

| Class | When | Implementation bar |
|-------|------|--------------------|
| **Behavior** | Code, API, or user-visible behavior changes | Full TDD via `/unit-tests` (and family) when applicable: red → green → refactor until tests pass |
| **Docs/chore** | Docs, metadata, config, renames only — no behavior/API change | No full TDD. Still run **plan-stated checks** (or a minimal sanity check if the plan names none) and body/evidence audit |

If work later touches behavior, reclassify to **Behavior** and re-validate.

## Workflow

**Order is fixed.** Run Phase 1 → 2 → 3 → 4 → 5. Do not skip, reorder, or open a later phase until the earlier gate passes.

```text
1 Implement (+ Validator on diff)
  → 2 Draft PR (isDraft)
    → 3 Checks / CI
      → 4 Evidence on remote body
        → 5 Validator on HEAD + body
```

### Phase 1 — Implement

**Gate out:** Validator PASS on **diff vs plan**. No PR until then.

- **Dev:** implement the plan.
  - Behavior: invoke `/unit-tests` → red/green/refactor until tests pass.
  - Docs/chore: apply changes; run plan-stated checks only.
- **Validator:** after Dev’s implementation pass, a **fresh** Validator (≠ Dev) reviews the **diff against the plan**, then applies **simplicity principles** (below). Prefer `/ponytail-review` if available; else apply the same principles as a subagent critic. FAIL → Dev fixes → **new** Validator again.

  **Review principles:**

  1. **Plan fit** — does the diff implement the plan (no silent scope drop/expand)?
  2. **Ponytail** — hunt over-engineering only: dead flexibility, YAGNI layers, reinventions of stdlib/native. Format: one line per finding (`L<n>: tag: what. replacement.`). Tags: `delete` · `stdlib` · `native` · `yagni` · `shrink`. Score: `net: -<N> lines` or `Lean already. Ship.` Do not apply fixes here — report only. Correctness/security/perf are out of scope for this pass (route elsewhere if seen).
  3. **Musk 5-step** (in order; stop early if a step removes the need for the next):
     1. Make the requirements less dumb (challenge extras the plan didn’t need)
     2. Delete the part or process
     3. Simplify or optimize
     4. Accelerate cycle time
     5. Automate (only after 1–4)

  PASS only if plan fit is good **and** no blocking ponytail/5-step findings (or Dev already addressed them). Report both plan-fit and simplicity results.

- **Tech Lead:** orchestrates; does not claim done.

### Phase 2 — Draft PR

**Gate in:** Phase 1 PASS. **Gate out:** remote PR exists with `isDraft: true` and a body (summary + test plan).

- Open or ensure a PR that is **draft**: `isDraft: true` (`gh pr create --draft` or convert to draft).
- **Tech Lead** owns the PR body (motivation, summary, test plan / checks). Dev may draft text; Tech Lead publishes.
- Confirm with remote state: `gh pr view --json url,number,isDraft` → `isDraft` must be `true` until human review (do not mark ready-for-review unless the user asks).

### Phase 3 — Checks / CI

**Gate in:** Phase 2 draft PR live. **Gate out:** checks/CI recorded for **current** HEAD.

- Run plan-stated checks and tests locally when they exist.
- **If CI exists** on the repo/PR: wait for or trigger it; fix until green. Do not invent CI or claim CI passed when none is configured.
- Record what actually ran (commands, pass/fail, CI conclusion if any).

### Phase 4 — Evidence & update PR body

**Gate in:** Phase 3 evidence recorded. **Gate out:** remote body re-read and matches **current** HEAD.

- Update the **remote** PR body so it matches **current** HEAD and the tree:
  - summary matches what shipped (no overclaims, no removed paths/features)
  - test plan / checks reflect what was run; `[x]` only if that check was run and passed on current work
  - no stale claims from earlier commits
- Re-read after edit: `gh pr view <n> --json body,title,state,isDraft,mergeable`. Trust **remote body**, not memory, not local notes, not a grep of the tree for “is the PR done?”

### Phase 5 — Validator PASS on current head

**Gate in:** Phase 4 remote body current. **Gate out:** Validator PASS on **this** HEAD (done candidate).

- Spawn **Validator** (≠ Dev) against: plan + diff at **current HEAD** + **remote** PR body + recorded evidence.
- PASS only if: plan honored, body accurate, checks/evidence honest, no open plan items.
- **Any commit or body-material change after PASS invalidates PASS.** Go back to Phase 3 (not jump to Done).

## Done

Say **done / nothing left / ready for human** only if all hold (re-check before answering):

1. Remote body re-read just now — matches tree/commits.
2. Test-plan boxes honest; unchecked = not done until run/recorded.
3. Validator PASS on **this** HEAD.
4. Checks green; CI green if CI exists.
5. Still draft (or user-requested ready); human owns merge.

**Not done:** mergeable / open / CI green alone, or “validated earlier.”

## Anti-patterns

- Done because mergeable/open without remote body + Validator on HEAD  
- Grep tree instead of `gh pr view` body; same agent as Dev and Validator  
- Docs/chore with no verification; inventing CI; merge without user ask  
