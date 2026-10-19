---
name: verify-before-ship
description: >
  Principles for handing over or approving any change (code, documents,
  instructions): the owner can accept it after one read, and the exact version
  that ships is independently checked and approved. Use to do or review such
  work, or on /verify-before-ship.
license: MIT
metadata:
  short-description: "Done = owner accepts after one read; verify what ships"
---

# /verify-before-ship

Ship only work the owner can accept after one read, with evidence and approval
for the exact version that ships. To do the work, meet every principle below.
To review work, check it against each principle and name every breach with
its fix, most important first. Any report you write follows principle 1 too.

## Principles

Most important first.

1. **Done means the owner can accept it after one read.** Reading the work
   once, the owner finds three things right:
   - **Core idea up front**: the most important, highest-level idea comes
     first. Principles come before plans. Definitions and support come later.
   - **Reads easily**: plain words, no needless words, and no term the owner
     must look up.
   - **Works**: every required check passed on the exact version the owner
     gets.
   If any of the three is missing, it is not done. Every check that can
   run is run before handover; skipping one and saying so instead is not
   allowed. Before calling a check impossible, look for another way to run
   it, and say what you tried. A check that has not run leaves the work not
   done, whichever path follows: it stays not done until the check runs and
   passes on this version, or until the owner, told plainly which check could
   not run and why, decides. A "not done" verdict that calls for an edit also
   calls for every required check to run again on the edited work, not only
   the one that failed (principle 3).
2. **The builder and the verifier are different parties.** Anyone who helped
   build the work cannot be its verifier. The verifier sees only the task, the
   work, and the criteria, and works out the problem from them, not from the
   builder's account. Keep the builder's reasoning and expected answers out of
   view (closed-book) until the verdict is in; after that they may help explain
   differences. The verifier reports findings to the owner without the
   builder's approval.
3. **Evidence and approval hold only for the version they were given on.**
   Editing the work, or anything it depends on, cancels both, whatever its
   size or reason. That includes a fix made to satisfy another principle
   here, and any fix you prescribe: run every required check again on the
   changed version, then seek approval again. A change only to how the work is
   described resets no check, but the description must still match the
   evidence: remove or check any claim the evidence does not support. Time
   passing changes nothing by itself; when the work depends on something that
   changes with time, that change counts as an edit to what the work relies
   on. Never report a check as passed unless it ran on this version. When
   handing over after a change, show what changed and which checks ran again.
4. **Do not shape the work to fit its checker.** When a measure becomes a
   target, it ceases to be a good measure. Do not copy the checker's wording or
   expected answers into the work; fix the behavior they point at. Keep a
   held-out check that never guides changes and runs once, at the end, on the
   version that ships; lead with its result as the one to expect. Seeing a
   held-out result uses it up: if the work changes after that, report its
   later results as tuning scores and replace it with a fresh one. Call any
   score on checks that shaped the work a tuning score, say it overstates
   real performance on unseen cases, and give the gap to the held-out score.
   A large gap means the work fits the checker, not the task. For a measure
   tracked over time, also track one or more measures never treated as a
   target, and watch how far the two drift apart; swapping in a new target
   only creates the next target.
5. **Make the smallest change that solves the whole task.** Each part must earn
   its place. Leave out work the task does not need, including for needs that
   do not exist yet; propose it separately if wanted. A change that leaves part
   of the task unsolved is not smaller, it is unfinished.
6. **Nothing ships until the owner explicitly approves it.** Green checks and
   other reviewers' sign-offs support the owner's decision; they do not make it.
   Work stays a draft until the owner, or someone the owner named, approves
   this exact version after its checks have run.

## Terms

- **Owner**: the person who decides whether the work ships.
- **Check**: any test, review, or audit whose result is evidence about the
  work. A required check is one the task, the criteria, or the owner calls for.
- **Version**: one exact, identifiable state of the work and of everything it
  depends on: its inputs and the environment it runs or is used in.
- **Description**: what is said about the work, apart from the work itself.
- **Held-out check**: a check kept unseen while the work is shaped, run last.
