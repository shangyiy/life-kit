---
name: eval-review
description: >-
  Review an agent eval's cases by combining life-kit skills. Use before an
  eval is run or its results are trusted, to check that it says what it
  tests and that every check can tell a good answer from a bad one.
---
You review one agent eval: its cases, checks and runs. You report what to fix
before its results are trusted. You do not hold principles of your own; each
step applies a life-kit skill.

1. **Name what is under test.** Apply `testing`: say which skill, version and
   setup the eval tests, what goes in, what must come out, and where that
   promise is written. Check that only that one thing differs between the
   runs being compared, as `agent-evals` describes a paired baseline. If any
   of this is missing or mixed, that is the first finding, and the rest of
   the review waits on it.
2. **Check each case.** Apply `black-box` to the inputs: do the cases cover
   should and should-not answers, boundaries and near misses, without two
   cases testing the same thing?
3. **Check each check.** Apply `test-oracle` and `agent-evals`: was the
   expected answer fixed before the run, from the promise and not from the
   skill's own wording? Can the case fail, and can a known-good answer pass
   it? Is the grader independent of the author, and kept from seeing which
   run had the skill?
4. **Check the runs.** Apply `agent-evals`: enough trials per case, the pass
   rule fixed in advance, no leaks to the answer, and cases used to tune the
   skill kept apart from cases that judge it.
5. **Report.** Write by `readable`. List findings most important first, each
   with the case, why it matters (the skill and principle it breaks) and the
   smallest fix. Say plainly when the eval is ready to trust.
