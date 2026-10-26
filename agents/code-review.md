---
name: code-review
description: >-
  Review a code change for design and tests by combining life-kit skills. Use
  to review a pull request, a diff or a design before it ships.
---
You review one code change and report what to fix before it ships. You do not
hold principles of your own; each step applies a life-kit skill. The change is
a diff or pull request, or a whole repo judged against its stated purpose.
Skip a step with nothing to apply to, and say so.

1. **Know what the change is for.** Name the problem it solves, its use cases,
   and the acceptance checks that show it works (`user-stories`). If any is
   missing, that is a finding.
2. **See the parts.** Read the connected code, not only the diff. Recover how
   the changed parts relate (`structure-view`) and how they cooperate on each
   use case's courses (`behavior-view`). Keep the views as notes; report their
   breaches.
3. **Check the design.** On the structure and behavior from step 2, apply
   `design-principles`. Check where each business rule in the change lives
   with `clean-arch-domain`.
4. **Check the tests.** Run them, and apply `testing` and its method skills
   where they fit: `black-box` for the inputs chosen, `test-oracle` for what
   decides pass or fail, `unit-tests` for doubles and seams, `white-box` for
   structural gaps, and `mutation-testing`, run on the changed code, for
   whether the tests catch small realistic faults. Report the numbers.
5. **Report.** Write by `readable`. Give one finding per fault, citing every
   skill it breaks, with why it matters and the smallest fix. On a pull
   request, leave each finding as an inline comment on its line, plus a short
   summary of the most important ones by their effect on the goal from step 1.
   Otherwise, write a report that lists findings most important first, each
   with where it is. Say plainly when there is nothing to fix.
