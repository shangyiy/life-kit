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
   stories from that goal. Test any solution the idea names against that goal
   and the actor's situation when the need arises: if it relies on a condition
   the actor will not be in, or otherwise cannot reach the goal, reject it and
   say why, not merely that it is early. A solution that can serve the goal is
   one option to note, not the requirement.
2. **Every story and slice ends in the result its actor's goal names,** seen
   by the actor or whoever receives the outcome. A slice that only gathers
   input or prepares data for a later slice is a step, not a slice. Work only
   builders value, or one layer or component, is a task: join it with what
   completes the goal; if no user sees a change, it stays a task.
3. **A story passes when its acceptance checks pass.** The next slice to build
   has its own checks with concrete values; an outline or a promise of checks
   is not one. Each later slice must be checkable, named by the observable
   result that will pass or fail it, with only the detail the plan needs. Write
   checks before building; add more as new cases appear. Every use case with a
   slice shows its primary course and one or more exception courses, even if
   short. A quality or constraint needs a target with a real number; if none is
   given, it is an open point (principle 5). A check states the result, never
   how it is reached; stop when another check adds no clarity.
4. **Cut thin vertical slices, and say why the first one comes first.** Split
   a story too big to finish, size, or understand. Each slice runs from the
   start to the goal's result and passes or fails on its own, ideally in any
   order. Never split by layer, component, or step. Give the first slice's
   reason as it applies to that slice, not as a general rule: the value it
   delivers, the risk it settles, or the effort it carries for the others. The
   first slice takes the plain primary course; exception courses follow as
   later slices unless trivial to add.
5. **Assume by default; ask what decides the result or is costly to guess.**
   For each open point, weigh its plausible answers and the cost of acting on a
   wrong one. Ask when the answers change which stories, courses, or checks
   exist; when no sensible default can pick the items the system acts on; when
   the value is a fact only the owner knows; or when a wrong guess would cause
   harm that is costly or hard to reverse, even if the stories stay the same.
   Ask these even if a later change looks cheap or the owner wants few
   questions. Assume openly each point whose wrong guess is cheap to reverse:
   note it beside its story and turn it into a check. Never assume part of what
   you ask, nor ask what the idea states. Ask once, all together, each with its
   plausible answers and stakes. Name the slices that wait for each answer and
   those that go ahead now. Never stop all work.
6. **See the whole, detail only what is next.** List every use case the idea
   implies, to see its scope and what to leave out. Detail only the slices next
   in the build order; each later one stays at the result that will decide it
   (principle 3), since understanding changes as slices are built.

## Definitions

- **Story (use case):** one actor's goal in the use case form of
  /clean-arch-domain, plus its acceptance checks. The actor is a person or
  another system, or the system starts the use case itself. Write it in active
  voice, for one actor. It is closed: it ends when the goal is reached; a
  story named for an ongoing activity holds several closed ones.
- **Slice:** one or more courses of a use case taken as one unit of work, with
  the checks that cover them.
- **Acceptance check:** a concrete starting situation, an event or input, and
  the expected observable result, so the outcome is pass or fail. The checks
  cover each kind of behavior the story must show, and its edges. Where a
  failure could be taken for a valid result, the check shows that the two
  results differ.
- **Assumption:** a choice made for the owner on a point whose wrong guess is
  cheap to undo and leaves the same stories, stated openly so it can be fixed.
- **Constraint:** a condition every story obeys instead of one behavior to
  build. Its check, with a real target, is set up alongside the first slice
  and rerun with every later slice; it is never left for the end.
- **Task:** work builders do to deliver a story; it lives inside the story.
- **Investigation:** the last resort, for when no part of a story can be built
  or sized yet. First name the thinnest slice whose real work would settle the
  doubt and the part understood well enough to build now; investigate only if
  neither exists, saying why. It is timeboxed; open questions are its checks.
- **Ways to split:** each keeps one case of a varying thing, and later slices
  add the others: courses (primary first, simplest form); business rules (one,
  or a relaxed one, first); data (one kind or subset first); operations (one
  per story); interfaces (simplest way in and out first); shared effort (any
  one case first, the rest second); a quality target of one story (behavior
  first, target next); investigation (last). Pick the split that exposes
  low-value parts to drop or defer and gives slices of similar size. Join
  pieces too small to track, or ending in no goal, into closed stories. Combine
  slices that depend on each other's order, or split another way.
