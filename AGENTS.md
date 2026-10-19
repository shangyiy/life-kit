Write prose by `readable`: one plain idea per point. Ship by
`verify-before-ship`: someone who did not build the work checks the exact
version that ships, then the owner approves. For skills, also follow
`agent-evals`: score over repeated trials; grade the work, not its fit to the
skill.

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
4. **Evals:** eval cases go in their own draft PR to
   `skill-evals/eval-sets/<skill>/`.
5. **Checks:** for a skill, run the closed-book eval (see the `skill-evals`
   README) and an independent agent review against this file. Every claim must
   trace to the skill's source. On every PR, run `/ponytail-review` (smallest complete
   change) on the diff and the PR body. Apply the right findings. In the PR body,
   explain any flagged text you keep.
6. **Leak audit:** no private data or rubric wording in the diff. No AI,
   language, framework, tool or vendor terms (LLM, agent, git, ponytail, CI…)
   in a domain skill's files, except names and titles in README credits
   (case-insensitive, whole-word).
7. **PR body:** shorter than the diff: Motivation, Summary, Test evidence (each
   check's method, result and head sha, or "could not run" and why), and
   Dependencies (linked PRs, or "none").
8. **Merge:** open PRs as drafts and send Shang Yi the link. Before any merge,
   even a self-merge, apply the `/ponytail-review` findings and run the leak
   audit. `skill-evals` PRs merge automatically once validated. Small life-kit
   fixes (wording or filler, no rule change) may be self-merged. New skills and
   rule or principle changes wait for Shang Yi's explicit OK.
