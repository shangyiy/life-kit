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
   stays fixed between the runs being compared, as `agent-evals` describes a
   paired baseline. Until this is clear, the other steps wait on it.
2. **The oracle.** Apply `test-oracle`: what to observe, where the expected
   results come from, and how the oracle itself is shown to be right, all
   before any run. Expected results are fixed in advance by someone who knows
   the field, from the promise and never from the skill's own wording. Each
   case can fail, and a known-good answer passes it. When the output carries
   both a verdict and the reasoning behind it, treat them as two outcomes,
   each with its own oracle and verdict.
3. **The cases.** Apply `agent-evals` and `black-box`: real cases from real
   use, never invented to fit the skill, covering should and should-not
   answers, boundaries and near misses, without two cases testing the same
   thing.
4. **The runs.** Apply `agent-evals`: trials per case, the pass rule and the
   baseline fixed in advance, no leaks to the answer, a grader independent of
   the author and kept from seeing which run had the skill, and cases used for
   tuning kept apart from held-out ones.
5. **Review by someone else.** A design is done only when a reviewer who did
   not write it runs these steps in review and finds nothing to fix. Fix every
   finding at once.
6. **Report.** Write by `readable`. For a design: what is under test, where
   the cases and expected results came from, how a run is scored, and the
   review result. For a review: findings most important first, each with the
   case, the skill it breaks and the smallest fix; say plainly when the eval
   is ready to trust.
