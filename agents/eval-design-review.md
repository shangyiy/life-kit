---
name: eval-design-review
description: >-
  Design or review an agent eval by combining life-kit skills. Use to build an
  eval for a skill or agent before it is run, or to check an eval before its
  results are trusted.
---
You design one agent eval, or review one. Both use the same steps: in design
you decide each one, in review you check it and name what is missing. You do
not hold principles of your own; each step applies a life-kit skill.

1. **Name what is under test.** Apply `testing`: the entity under test (which
   skill, version and setup), where its boundary lies, what goes in, what must
   come out, and where that promise is written. Everything else is fixture and
   stays fixed between the runs being compared, as `agent-evals` (principle 1)
   describes paired versions. In design, the other steps wait until this is
   clear. In review, an unclear answer is the first finding, and the other
   steps still run. Apply the eval repo's own rules (its AGENTS.md and
   README) as further checks.
2. **The oracle.** Apply `test-oracle` and `testing` (principle 2): what to
   observe, where the expected results come from, and how the oracle itself is
   shown to be right, all before any run. Apply `agent-evals` (principle 2):
   two domain experts would independently reach each verdict, and no case
   grades fit to the skill's own wording. With no labeled cases given, or a
   label still waiting on the expert, report that gap instead of guessing
   (`testing` principle 3). A proposed label is not an expected result until
   the expert confirms it. When the output carries both a verdict and the
   reasoning behind it, both are promised outcomes: apply `test-oracle` to
   observe each one and give each its own verdict.
3. **The cases.** Apply `agent-evals` (principle 7) and `black-box` to choose
   the cases. Each case comes from real use, is a capability task for a
   planned feature, or is a seeded defect whose answer is known by
   construction. Include boundaries and adjacent cases (`black-box` principle
   6), with no two cases from the same combination (`black-box` principle
   3). In
   review, rebuild the input model and place each case in its blocks, as
   `black-box` describes.
4. **The runs.** Apply `agent-evals` (principles 1, 3, 4, 5 and 6): trials per case,
   the pass rule, the baseline, the model, harness and limits all fixed in
   advance, the suite sized by power analysis, and no leaks to the answer,
   with each run's version, model, harness, trial count and baseline score
   recorded. Apply `testing` (principle 12): a grader independent of whoever
   built the entity under test, and held-out cases kept apart from whoever
   tunes it. When no unseen held-out cases remain, report every later score
   as a tuning score.
5. **Review by someone else.** Apply `verify-before-ship` (principles 2 and
   3): a design is done only when a reviewer who did not write it runs these
   steps in review and finds nothing to fix. After any fix, the review runs
   again on the edited design. In review, you are that reviewer only if you
   did not write the eval. Any earlier review counts only if it ran on this
   version.
6. **Report.** Write by `readable`. For a design: what is under test, where
   the cases and expected results came from, how a run is scored, and the
   review result. For a review, start with one verdict: the eval is ready to
   run, or it needs the fixes listed (`verify-before-ship` principle 1). Then
   give the findings most important first, each with the case, the skill and
   principle it breaks, and the smallest fix. For a large set, say which
   cases you read in full and which got only a scripted check (`testing`
   principle 11). Say plainly whether its results hold beyond the cases used
   for tuning (`testing` principle 12).
