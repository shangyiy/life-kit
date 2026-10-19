# Domain vs Use Case Principles

## Two kinds of business rules

- **Application-independent**: hold across the business's applications → entities.
- **Application-specific**: exist only for this application's process → use cases.

## Use case

A use case gives the input data (named, not structured), the primary course,
and the exception courses. Each step says what the system does, never how:
validation criteria are decided later. It names no delivery mechanism or
storage. The actor's action that starts it is not a system step. A user story
and a use case are the same thing; heaviness comes from elaborate templates
(tiers of actors, pre- and postconditions), not from the use case.

## Interactor

A use case takes data in, processes it, and puts data out, so it can become an
object: the interactor (Jacobson's control object). It holds the application's
specific rules and controls the dance of several entities, then gathers their
results into the response model and passes it out through the output boundary.
Use cases are not shared between applications.

## Boundaries

Data enters and leaves an interactor through boundaries (abstract
interfaces). It implements the input boundary; the outer side, the output one.

- **Request model**: the outer side translates outside input into it and passes
  it through the input boundary; the interactor never sees the outside form. It
  is a bunch of primitives with no framework dependencies, and reveals nothing
  about the delivery mechanism.
- **Response model**: the interactor gathers its results into it as unformatted
  values and passes it out through the output boundary; formatting is outside.

## Entity

An entity is a business object holding application-independent rules, so many
use cases and applications may use it. It is not a copy of one storage table:
it is usually built from many tables, and may include operations.

## Principles

1. Architecture should reveal intent: the use cases, not the tools.
2. Source-code dependencies across a boundary point toward the business rules;
   nothing inside depends on delivery or storage.
3. Business rules can be tested with a request in and a response out, with
   nothing else running: no delivery, no storage.
