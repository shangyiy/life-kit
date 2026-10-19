For user-facing prose, follow the readable skill in skills/writing/readable/SKILL.md.

## Shipping changes

Follow skills/core/verify-before-ship/SKILL.md (the principles; cited below as
P1-P6). For a skill change, also follow the agent-evals eval method (written
separately; not yet in this repo). This section names only this repo's files,
tools, and order.

**Skill layers.** Skills have at most two layers: domain skills
(`skills/core`) hold application-independent principles, and use-case skills
(everything else, including testing techniques) apply them. No skill writes in
tool detail; it is worked out at run time from the project's environment. Repo
and harness detail lives here or in `skill-evals`, never in a skill.
Dependencies point inward: core cites nothing outward.

1. **Branch and commits**: never push to `main`. Work on a branch named
   `<type>/<topic>` (`feat/`, `fix/`, `docs/`, `refactor/`), with conventional
   commit messages.
2. **Scope**: one skill per PR, with no unrelated files. Bump the version in
   `plugin.json`, `.claude-plugin/plugin.json`, and
   `.claude-plugin/marketplace.json` together (minor for a new skill, patch for
   a fix). List a new skill in `README.md` and in both `skills` arrays.
3. **Verifier (P2)**: for a skill, the verifier is the closed-book eval
   (agent-evals, run as in the `skill-evals` README) plus an independent review
   agent that checks the skill against this repo's conventions and its source:
   every claim must trace to the source.
4. **Leak audit**: before opening the PR, search every file in the diff for
   private data and for copies of rubric or expected-answer wording (P4). For a
   core skill, also search every file (`SKILL.md`, `references/`, `README.md`),
   case-insensitive and whole-word, for terms about AI (AI, LLM, GPT, agent,
   prompt, assistant, chat, model in the AI sense), programming languages,
   frameworks, and tools or vendors (git, GitHub, ponytail, and any CI
   product). The result must be zero hits, except for names of people and
   source titles in README credits. Put the result in Test evidence.
5. **Review**: run `/ponytail-review` on the full diff and again on the PR
   body; it is this repo's check for P5. Judge each finding yourself: apply the
   right ones, and keep text the source genuinely supports, saying why in the
   PR body. Any change resets every check, including the eval (P3).
6. **Evals**: a skill's eval cases go to the separate `skill-evals` repo, under
   `eval-sets/<skill>/`, as their own draft PR. No eval material goes in the
   life-kit PR or in the skill folder.
7. **PR body**: shorter than the diff, in this order:
   - **Motivation**: the problem, in one or two sentences.
   - **Summary**: what changed.
   - **Test evidence**: each check (eval score, review, leak audit) with its
     command or method, its result, and the head commit sha it ran on. Every
     check that can run, runs on that sha before the PR is opened or updated;
     if the sha changes, run them again and update it. A check that truly
     cannot run is marked "could not run" with its reason, and the PR is not
     presented as done (P1).
   - **Dependencies**: linked PRs (for example the skill-evals draft PR), or
     "none".
8. **Draft only**: open every PR as a draft. Report the PR links to Shang Yi;
   do not mark it ready or merge it without Shang Yi's explicit OK (P6).
