---
name: clean-arch-domain
description: >
  Decide whether a business rule belongs in the domain (entities) or in a use
  case (interactor) under Clean Architecture. Use when designing or reviewing
  where logic lives, splitting requirements (use cases or user stories) into
  code, or when the user runs /clean-arch-domain.
metadata:
  short-description: "Domain vs use case split"
---

# /clean-arch-domain

Decide where each business rule lives: domain or use case.

## Principles

### Two kinds of business rules

- **Application-independent**: hold across the business's applications → entities (domain).
- **Application-specific**: exist only for this application's process → use cases.

### Use case

A use case gives the input data (named, not structured), the primary course,
and the exception courses. Each step says what the system does, never how:
validation criteria are decided later. It names no delivery mechanism or
storage. The actor's action that starts it is not a system step. A user story
and a use case are the same thing; heaviness comes from elaborate templates
(tiers of actors, pre- and postconditions), not from the use case. Do not bury
use cases in elaborate templates.

### Interactor

A use case takes data in, processes it, and puts data out, so it can become an
object: the interactor (Jacobson's control object). It holds the application's
specific rules and controls the dance of several entities, then gathers their
results into the response model and passes it out through the output boundary.
Use cases are not shared between applications.

### Boundaries

Data enters and leaves an interactor through boundaries (abstract
interfaces). It implements the input boundary; the outer side, the output one.

- **Request model**: the outer side translates outside input into it and passes
  it through the input boundary; the interactor never sees the outside form. It
  is a bunch of primitives with no framework dependencies, and reveals nothing
  about the delivery mechanism.
- **Response model**: the interactor gathers its results into it as unformatted
  values and passes it out through the output boundary; formatting is outside.

### Entity

An entity is a business object holding application-independent rules, not just
data, so many use cases and applications may use it. It is not a copy of one
storage table: it is usually built from many tables, and may include operations.
Do not shape entities like tables.

### Core principles

1. Architecture should reveal intent: the use cases, not the tools.
2. Source-code dependencies across a boundary point toward the business rules;
   nothing inside (domain and use cases) depends on delivery, storage, or
   frameworks. Business rules never sit in the delivery mechanism or in storage.
3. Business rules can be tested with a request in and a response out, with
   nothing else running: no delivery, no storage. Each use case is testable
   this way.

## Workflow

1. **Use cases** — from the requirements (use cases or user stories), write each
   use case as defined in Use case above.
2. **Rules** — list every business rule each use case needs.
3. **Classify** — sort each rule into one of the two kinds above:
   application-independent → **domain**; application-specific → **use case**.
4. **Assign** — domain rules go on entities; use case rules go in the
   interactor (see Interactor and Boundaries).
5. **Check** — check the design against every statement in Principles; each
   one it breaks is a violation.

## Output

Use case list (input, primary course, exception courses) → rule table (rule,
domain or use case, reason) → violations and moves.
