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

Decide where each business rule lives: domain or use case. Read
`references/principles.md` for the definitions and principles.

## Workflow

1. **Use cases** — from the requirements (use cases or user stories), write each
   use case's input data, primary course, exception courses. Steps say what, not
   how; no data structures, validation criteria, delivery mechanism, or storage.
2. **Rules** — list every business rule each use case needs.
3. **Classify** — for each rule ask:
   - Holds across the business's applications? → application-independent → **domain**.
   - Exists only for this application's process? → application-specific → **use case**.
4. **Assign** — domain rules go on entities; use case rules go in the interactor,
   which directs the entities behind input and output boundaries.
5. **Check** — run the checklist below.

## Quality Checklist

- [ ] Use cases are not shared between applications
- [ ] The interactor controls the dance of the entities
- [ ] Entities hold application-independent rules, not just data
- [ ] Domain and use cases know nothing of delivery, storage, or frameworks
- [ ] The outer side translates outside input into the request model and passes
      it through the input boundary
- [ ] Request model: a bunch of primitives, no framework dependencies, no delivery details
- [ ] Response model: unformatted values, passed out through the output boundary
- [ ] Each use case is testable with a request in, a response out, nothing else running

## Anti-Patterns

Business rules in the delivery mechanism or in storage · entities shaped like
tables · use cases buried in elaborate templates · architecture that shows the
tools instead of the intent

## Output

Use case list (input, primary course, exception courses) → rule table (rule,
domain or use case, reason) → violations and moves.
