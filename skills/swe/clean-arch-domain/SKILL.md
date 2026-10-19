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

Decide where each business rule lives: domain or use case. Each core principle
and definition below is a rule: breaking one is a violation, and a definition
that does not apply is marked not applicable.

## Core principles

1. **Two kinds of business rules.** Application-independent rules would hold
   in any application the business uses, even if it has only one, and live in
   entities (the domain). Application-specific rules exist only for this
   application's process and live in use cases, which are never shared between
   applications. Each rule has one home; a rule stated in more than one place
   is a violation.
2. **Dependencies point inward.** Source-code dependencies point from the
   outer side toward the business rules. The outer side is the delivery
   mechanism (whatever talks to users or other systems), storage, frameworks
   and tools. Nothing inside (domain and use cases) depends on it, and no
   business rule sits in it; detail that is not a business rule belongs
   there. Business rules reach storage through an entity gateway: an interface
   the business rules own and storage implements.
3. **Architecture reveals intent.** The structure shows the use cases, not the
   tools.
4. **Business rules are testable on their own.** Each use case can be tested
   by passing a request model in and reading the response model out, with only
   the interactor and its entities running: no delivery mechanism, no storage.

## Definitions

### Use case

A use case gives the input data (named, not structured), the primary course
(the steps when everything goes right), and the exception courses (the steps
when something goes wrong). Each step says what the system does, never how:
validation criteria are decided later. It names no delivery mechanism or
storage. The actor's action that starts it is not a system step. A user story
and a use case are the same thing. Keep use cases light: plain text with the
input data, primary course and exception courses, not buried in elaborate
forms.

### Entity

An entity is a business object holding application-independent rules, not just
data, so many use cases and applications may use it. It is not a copy of one
storage table: it typically spans several tables and can carry its own
operations.

### Interactor

A use case takes data in, processes it, and puts data out, so it can become an
object: the interactor (Jacobson's control object). It carries out the
application-specific rules and directs several entities.

### Boundaries

Data enters and leaves an interactor through boundaries (abstract interfaces).
The interactor implements the input boundary; the delivery mechanism implements
the output boundary, so the interactor does not depend on what shows its
results.

- **Request model**: the delivery mechanism translates its input into it and
  passes it through the input boundary, so the interactor never sees the input
  in the form it had on the outer side. It holds plain values only and depends
  on no framework.
- **Response model**: the interactor gathers its results into it as unformatted
  values and passes it out through the output boundary; the delivery mechanism
  formats them.
