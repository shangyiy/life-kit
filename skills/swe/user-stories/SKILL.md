---
name: user-stories
description: >
  Turn an idea into user stories (use cases) and their acceptance checks,
  decide what to ask or assume, and split the work into slices that each
  pass or fail on their own. Use when writing, reviewing, or splitting user
  stories, use cases, or acceptance criteria, or for /user-stories.
metadata:
  short-description: "Idea to stories, checks, and slices"
---

# /user-stories

Idea to stories, checks, and slices. To write stories, meet every principle
and definition below; to review stories, check them against each one and name
every breach with its fix, most important first. Check your own stories the
same way before handing them over. The use case form, its primary and
exception courses, and where each rule lives come from /clean-arch-domain.

## Core principles

1. **Start from the goal, not the solution.** Find who the idea is for, what
   they want the system to do that it does not do today, and why. Derive the
   stories from that goal. Any solution the idea names is one option to
   note, not the requirement.
2. **Every story and slice ends in the result its actor's goal names,**
   seen by the actor or whoever receives the outcome. A slice that only
   gathers input or prepares data for a later slice is a step, not a slice.
   Work only builders value, or one layer or component, is a task: join it
   with what completes the goal; if no user sees a change, it stays a task.
3. **A story passes when its acceptance checks pass.** Every slice you
   propose, and every slice you review, carries its own checks, written out with
   concrete values. Saying that checks will exist, or leaving blanks to fill
   in later, is not a check. Write the first checks before building; add
   more as new cases appear. Every use case that has a slice shows its
   primary course and one or more exception courses, even in a short answer.
   A quality or constraint needs a target with a real number; if the owner
   gave none, assume one, note it as an assumption, and check against it. A
   check states the result, never how it is reached. Stop when one more check
   would not make the intent clearer.
4. **Cut thin vertical slices, and say why the first one comes first.** A
   story too big to finish, size, or understand is split. Each slice runs
   from the start to the goal's result and passes or fails on its own,
   ideally in any order. Never split by layer, component, or step. Give the
   first slice's reason: most value, biggest risk, or it carries the effort
   the others share. The first slice takes the plain primary course; the
   exception courses become later slices unless they are trivial to add.
5. **Assume by default; ask only what decides the result.** Ask only when
   the reply settles which stories exist or which items the system picks
   or acts on, and a wrong guess would be costly to undo or hard to notice.
   Each question names the story or the choice of items its answer changes.
   Do not ask what the idea already states. Assume anything the owner will
   see in the first result and can cheaply correct; note it beside its story
   and turn it into a check. Leave no costly-to-guess rule unspoken: each one
   is asked or openly assumed. Ask once, all questions together, each with
   its plausible answers. For each open question, name the slices that wait
   for it and the slices that go ahead now; a slice that goes ahead does not
   depend on the answer. Never stop all work.
6. **See the whole, detail only what is next.** List every use case the idea
   implies, to see its scope and what to leave out. Detail only the slices
   you put in the build order next, each with its checks (principle 3); the
   other use cases stay named only. Understanding changes as slices are built.

## Definitions

- **Story (use case):** one actor's goal in the use case form of
  /clean-arch-domain, plus its acceptance checks. The actor is a person or
  another system, or the system starts the use case itself. Write it in
  active voice, for one actor. It is closed: it ends when the goal is
  reached; a story named for an ongoing activity holds several closed ones.
- **Slice:** one or more courses of a use case taken as one unit of work,
  with the checks that cover them.
- **Acceptance check:** a concrete starting situation, an event or input,
  and the expected observable result, so the outcome is pass or fail. The
  checks cover each kind of behavior the story must show, and its edges.
  Where a failure could be taken for a valid result, the check shows that
  the two results differ.
- **Assumption:** a choice made for the owner that is cheap to fix once seen.
- **Constraint:** a condition every story obeys instead of one behavior to
  build. Its check, with a real target, is set up alongside the first slice
  and rerun with every later slice; it is never left for the end.
- **Task:** work the builders do to deliver a story; it lives inside the story.
- **Investigation:** the last resort, for when no part of a story can be
  built or sized yet. Before proposing one, name the thinnest slice whose
  real work would settle the doubt, and the part understood well
  enough to build now; investigate only if neither exists, and say why. It
  has a fixed timebox; its checks are the open questions, and it ends when
  they are answered.
- **Ways to split:** each keeps one case of a varying thing, and later slices
  add the others: courses (primary course first, simplest form); business
  rules (one rule, or a relaxed one, first); data (one kind or subset
  first); operations (one per story); interfaces (simplest way in and out
  first); shared effort (any one case first, the rest second); a quality
  target that belongs to one story (behavior first, target next);
  investigation (last). Pick the split that exposes low-value parts to drop
  or defer and gives slices of similar size. Join pieces too small to track,
  or that end in no goal, into closed stories. When slices depend on each
  other's order, combine them or split along another line.
