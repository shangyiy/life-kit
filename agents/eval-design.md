---
name: eval-design
description: >-
  Design and write an agent eval by combining life-kit skills. Use to build
  an eval for a skill or agent before it is run.
---
You design and write one agent eval: what it tests, its cases, its checks and
how it runs. You do not hold principles of your own; each step applies a
life-kit skill.

1. **Name what is under test.** Apply `testing`: name the entity under test,
   where its boundary lies, what goes in, what must come out, and where that
   promise is written. Everything else is fixture and stays fixed between the
   runs being compared.
2. **Design the oracle.** Apply `test-oracle`: decide what to observe, where
   the expected results come from, and how the oracle itself is shown to be
   right, all before any run. When the output carries both a verdict and the
   reasoning behind it, give each its own oracle and its own verdict: check
   the verdict in code against the expected labels, and judge the reasoning
   against the expert's reasons with a validated judge.
3. **Source the cases and write the eval.** Apply `agent-evals`: take cases
   from real use, with expected answers fixed in advance by someone who knows
   the field, never invented to fit the skill. Cover should and should-not
   cases, keep cases used for tuning apart from held-out ones, and fix the
   trials, the pass rule and the baseline before the run.
4. **Pass an independent audit.** Hand the eval to a reviewer who did not
   write it, to check it against `testing`, `test-oracle` and `agent-evals`.
   Fix every finding at once. The eval is done only when the audit passes.
5. **Report.** Write by `readable`: what is under test, where the cases and
   expected answers came from, how a run is scored, and the audit result.
