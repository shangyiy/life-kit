---
name: behavior-view
description: >
  Design or recover behavior: sequence views of how parts cooperate, and a use
  case's courses read out of code. Use to draw, trace or review an interaction
  or the paths through code from an entry point, or on /behavior-view.
metadata:
  short-description: "Sequences and paths: design and recover"
parent-skill: design-principles
---

# /behavior-view

Design how a system's parts cooperate in a scenario, or recover it from code as a sequence view and as a use case's courses. It applies [`design-principles`](../../core/design-principles/SKILL.md); the use case form (input, primary course, exception courses) is defined in [`user-stories`](../user-stories/SKILL.md), and the interactor that carries a use case out in [`clean-arch-domain`](../clean-arch-domain/SKILL.md). Use it to do the work or to review it; in a review, name each breach once, with its fix.

## Principles

1. **Before writing any view, list every branch, error return, early exit, and retry or repeat on the traced path; after writing, check that each appears exactly once in each view** (path inventory). A retry drawn as a single call, or a view with only the primary course, is incomplete.
2. **Add no participant, message, course or step that the code or requirement lacks** (no invented flows). Cite where each shows and mark what you cannot tell, such as an implementation chosen at run time, as `design-principles` principle 7 requires.
3. **Keep one level of detail per view.** Pick one level of participants (modules or objects) and fold every deeper call into the one message that leads to it; keep use case courses at the level of the actor's goal.
4. **Start from one entry point that a system event reaches** (a public operation, handler, command or program start) and follow its calls in order down to the chosen level; name the entry point.

## Sequence views

- Give each object, module, actor or outside system taking part one lifeline (participant).
- Draw a call the sender waits on (synchronous message), and its reply (return) when the reply carries a value or error that matters.
- Mark a call the sender does not wait on (asynchronous message), and the message that brings a participant into existence (creation).
- Box mutually exclusive branches, one condition each, at most one of which runs (alt); a part that runs only if its condition holds (opt); a part that repeats, with its condition or bound (loop); and an early exit that ends the enclosing flow (break).
- Write each condition (guard) in plain terms taken from the code's own condition.

## Reading behavior out of code

- Branching on a condition or a value: alt, or opt when one side does nothing.
- Loops, iteration, retries and polling: loop, with its bound or stop condition.
- Early return on failure, raised error or error result: its own exception course, anchored at the step where the condition is found, and in the sequence an alt or break with the error return.
- An early return on success: a branch (alt or break) of the course it belongs to.
- The path the actor's goal normally takes: the primary course; other successful branches stay inside it as alt or opt. The actor is whoever triggers the entry point: a user role, an outside system or a timer.
- Callbacks, events and spawned tasks: asynchronous messages; say when their order is not guaranteed.
- A call through an interface: a message to the interface's role, with the candidate implementations listed as assumptions.
