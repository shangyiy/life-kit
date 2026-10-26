Write user-facing prose by the `readable` rule: one plain idea per point. Ship
by `verify-before-ship`: someone who did not build the work checks the exact
version that ships, then the owner approves, or rule 8 lets it merge. For
skills, also follow `agent-evals`: score over repeated trials; grade the work,
not its fit to the skill.

Skills follow the two layers in `README.md`. Agents in `agents/` only combine skills: each names the skills it applies and in what order. A rule an agent needs goes in a skill, never in the agent. Repo and harness detail lives here
or in `skill-evals`, never in a skill.

Every new or changed skill folder has a `README.md` with a Credit list of its
sources (author, title, venue, year), ending with: "This skill is an
independent restatement. It is not affiliated with or endorsed by any of these
authors." A core `SKILL.md` holds principles and definitions only: no
examples, no source notes.

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
   trace to the skill's source. On every PR, run a review that every line is
   needed (such as `/ponytail-review`) on the diff and the PR body. Apply the
   right findings. In the PR body, explain any flagged text you keep. Before a
   PR is opened or updated, run every check that can run on its head sha.
6. **Leak audit:** no private data, rubric or expected-answer wording in the
   diff. For a `skill-evals` PR, check private data only (eval wording is its
   content). No AI, programming-language, framework, tool or vendor terms (LLM,
   agent, git, ponytail, CI…) in a core skill's files, except names and titles
   in README credits (case-insensitive, whole-word).
7. **PR body:** shorter than the diff: Motivation (the problem in one or two
   sentences), Summary, Test evidence (each check, such as the eval, reviews
   and leak audit, with its method, result and head sha, or "could not run"
   and why), and Dependencies (linked PRs, or "none").
8. **Merge:** open PRs as drafts and send Shang Yi the link. Merge only when
   every check passed on the final head sha. Any edit means running every check
   again. A check that could not run blocks the merge until Shang Yi decides.
   `skill-evals` PRs may be merged once an independent review and the leak audit
   pass on the final head sha. Small life-kit fixes (wording or a bug, no rule
   change) may be merged once a review by someone other than the author passes
   on the final head sha. New skills, rule or principle changes, and anything
   else or anything you are unsure about wait for Shang Yi's explicit OK.
