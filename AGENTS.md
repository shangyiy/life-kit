Write user-facing prose by the `readable` rule: one plain idea per point. Ship
by `verify-before-ship`: someone who did not build the work checks the exact
version that ships, then the owner approves, or rule 8 lets it merge. For
skills, also follow `agent-evals`: score over repeated trials; grade the work,
not its fit to the skill.

Skills follow the two layers in `README.md`. Repo and harness detail lives here
or in `skill-evals`, never in a skill.

## Shipping

1. **Branch:** never push to `main`. Use `<type>/<topic>` (`feat`, `fix`,
   `docs`, `refactor`, `chore`) and conventional commits.
2. **Scope:** one skill per PR, or one mechanical edit across skills; nothing
   unrelated. List new skills in `README.md` and both `skills` arrays.
3. **Version:** bump only when shipped skill content changes (minor for a new
   skill, patch for a fix), in `plugin.json`, `.claude-plugin/plugin.json` and
   `.claude-plugin/marketplace.json` together.
4. **Evals:** eval cases go only in their own draft PR to
   `skill-evals/eval-sets/<skill>/`. No eval material (cases, rubrics, expected
   answers) goes in the life-kit PR or in a skill folder.
5. **Checks:** for a skill, run the closed-book eval (see the `skill-evals`
   README) and an independent agent review against this file. Every claim must
   trace to the skill's source. On every PR, run `/ponytail-review` (smallest
   complete change) on the diff and the PR body. Apply the right findings, then
   run the final checks. In the PR body, explain any flagged text you keep.
6. **Leak audit:** before a PR is opened or pushed, and again before merge: no
   private data, rubric or expected-answer wording in the diff. No AI,
   language, framework, tool or vendor terms (LLM, agent, git, ponytail, CI…)
   in a domain skill's files, except names and titles in README credits
   (case-insensitive, whole-word).
7. **PR body:** shorter than the diff: Motivation, Summary, Test evidence (each
   check's method, result and head sha, or "could not run" and why), and
   Dependencies (linked PRs, or "none").
8. **Merge:** open PRs as drafts and send Shang Yi the link. Merge only when
   every check passed on the final head sha. Any edit means running every check
   again. A check that could not run blocks the merge until Shang Yi decides.
   `skill-evals` PRs merge automatically once validated as the `skill-evals`
   README defines. Small life-kit fixes (wording or filler, no rule change) may
   be self-merged. New skills and rule or principle changes wait for Shang Yi's
   explicit OK.
