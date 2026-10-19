---
name: user-stories
description: >
  Turn an idea into user stories (use cases) and their acceptance checks,
  decide what to ask or assume, and split the work into slices. Use when
  writing, reviewing, or splitting stories, use cases, or acceptance criteria.
metadata:
  short-description: "Idea to stories, checks, and slices"
---

# /user-stories

To write stories, meet every principle and definition below; to review them,
name every breach with its fix, most important first.

## Core principles

1. **Start from the goal, not the solution.** Find who the idea is for, what
   they want, and why. Test a named solution against that goal and the
   actor's situation: reject it, saying why, if it cannot reach the goal;
   otherwise it is one option, not the requirement.
2. **Every story and slice ends in the result its actor's goal names.**
   Gathering input, preparing data, one layer or component, or work only
   builders value is a step or task: join it with what completes the goal.
3. **A story passes when its acceptance checks pass.** Write them before
   building; add more as cases appear. A quality needs a target with a real
   number, or it is an open point. A check states the result, never how.
4. **Cut thin vertical slices; say why the first comes first.** Each slice
   runs from the start to the goal's result and passes or fails on its own;
   never split by layer, component, or step. The first takes the plain
   primary course; give its reason for that slice: the value it delivers, the
   risk it settles, or the effort it carries for the others.
5. **Assume by default; ask what decides the result or is costly to guess.**
   Ask when the plausible answers change which stories, courses, or checks
   exist; when no sensible default picks what the system acts on; when the
   value is a fact only the owner knows; or when a wrong guess would cause
   costly or hard-to-reverse harm. Assume openly each point whose wrong guess
   is cheap to undo, and turn it into a check. Never ask what the idea
   states, nor assume part of what you ask. Ask once, all together, each
   with its plausible answers and stakes; name the slices that wait, and go
   ahead with the rest: never stop all work.
6. **See the whole, detail only what is next.** List every use case the idea
   implies, to fix scope. The next slice to build has checks with concrete
   values; each later slice stays at the observable result that decides it.

## Definitions

- **Story (use case):** one actor's goal, closed when it is reached, with
  its checks. Form: the input, the primary course (steps when all goes well)
  and one or more exception courses (steps when something fails); each step
  says what the system does, never how. The actor may be another system.
- **Slice:** one or more courses of a use case, built and checked as a unit.
- **Acceptance check:** a starting situation, an event or input, and the
  expected observable result. Checks cover each kind of behavior and its
  edges, and tell a failure apart from a valid result that looks alike.
- **Constraint:** a condition every story obeys; its check, with a real
  target, starts with the first slice and reruns with every later one.
- **Investigation:** a timeboxed last resort when no part of a story can be
  built or sized, and no thin real slice would settle the doubt.
- **Ways to split:** one case first, the rest later, by course, rule, data,
  operation, interface, shared effort or quality target. Join pieces too
  small to track or bound to a fixed order.
