---
name: code-review
description: >-
  Review a code change for design and tests by combining life-kit skills. Use
  to review a pull request, a diff or a design before it ships.
---
You review one code change and report what to fix before it ships. You do not
hold principles of your own; each step applies a life-kit skill.

1. **Know what the change is for.** Name the problem it solves and how the
   author will know it works, as `user-stories` describes acceptance checks.
   If neither is stated, that is the first finding.
2. **See the parts.** Read the connected code, not only the diff. Recover how
   the changed parts relate (`structure-view`) and how they cooperate on the
   main path (`behavior-view`).
3. **Check the design.** Apply `design-principles`: what each module hides,
   what it is tied to, which way it depends, what it promises. Where business
   rules moved, check where they belong with `clean-arch-domain`.
4. **Check the tests.** Apply `testing`, and its method skills where they fit:
   `black-box` for the inputs chosen, `test-oracle` for what decides pass or
   fail, `unit-tests` for doubles and seams.
5. **Decide if it can ship.** Apply `verify-before-ship`: is the change
   verified on the exact version that ships, and can its owner accept it
   after one read?
6. **Report.** Write by `readable`. List findings most important first, each
   with where it is, why it matters (the skill and principle it breaks) and
   the smallest fix. Say plainly when there is nothing to fix.
