---
name: structure-view
description: >
  Design or recover the static structure of a module: relations between its
  parts, where each behavior belongs, and which patterns are really there.
  Use to draw, read out or review a class or module structure, or on
  /structure-view.
metadata:
  short-description: "Static structure: design and recover"
parent-skill: design-principles
---

# /structure-view

Design a module's static structure or recover it from code: its parts, how they relate, where each behavior belongs, and which design patterns are present. It applies [`design-principles`](../../domain/design-principles/SKILL.md); nothing here restates it. Use it to do the work or to review it; in a review, name each breach once, with its fix.

## Principles

1. **Draw every field that holds another object as a kept link, never as a brief use** (association). This includes a collaborator or strategy passed in through a constructor or setter and then stored. A brief use (dependency) is only a parameter, a return type, a local, a static call, or an object created and not kept.
2. **Choose the weakest relation the code proves**: brief use, then kept link, then owned lifetime. Move up only when you find the extra fact the stronger relation needs, as listed in rule 1 and under the relations below, and cite where it shows (`design-principles` principle 7).
3. **Put a behavior on a type when it uses that type's own data or keeps its invariants** (information expert); **move it to a separate collaborator when it changes for a different reason than the type** (`design-principles` principle 2); **give the part that needs another type's data to the type that owns that data.** In design, take the behaviors from the steps of the use cases ([`user-stories`](../user-stories/SKILL.md)).
4. **Claim a pattern only when its shape is present (the common ones are listed below) and each of its roles maps to a concrete element.** Otherwise write "no pattern" and name the missing role. A name that sounds like a pattern is not evidence; whether a shape is worth adding is `design-principles` principle 6.
5. **Keep the module view (modules and their dependencies) apart from the type view (the types inside one module).** Read module dependencies from the code's own declarations of what it uses: A declares it uses B, so A depends on B. Report every cycle; judge direction, and whether a cycle breaks the rule, by `design-principles` principle 3.
6. **Name every type, operation, field and variable for what it means, in the business's own terms where one exists**, and give each term one meaning within one part of the system.

## Relations and their code evidence

- **Owned lifetime** (composition): the part belongs to at most one whole at a time and, unless the whole first releases it, ends with it. Evidence: the whole creates or receives it, is its only holder, never hands it out to be kept, and releases it (held by value, embedded, or destroyed by the whole). If it is shared or outlives the whole, it is a kept link.
- **Grouping** (aggregation): the standard leaves its meaning open; draw a kept link unless the requester defines it.
- **Is a kind of** (generalization): declares the other as its supertype, type to type or abstraction to abstraction, whether or not it inherits code; subclassing an abstract type is generalization. Whether it is a true subtype is `design-principles` principle 5.
- **Promises an abstraction** (realization): a type declares that it implements an abstraction (an interface type kept apart from any one implementation); implicit conformance counts only if some code uses it through that abstraction.
- **How many** (multiplicity): optional single gives 0..1; required at creation and never empty gives 1; a collection gives 0..*, and 1..* only if non-empty is enforced.
- **Who can reach whom** (navigability): the holder of a reference reaches the held; both ways only if both hold one.

## Who creates, who coordinates

- The type that contains, records, closely uses, or has the start-up data for an object creates it (creator).
- One part outside the delivery mechanism (not in the user interface) receives each system event and coordinates its handling (controller; the interactor of [`clean-arch-domain`](../clean-arch-domain/SKILL.md)).
- When no business concept fits a job, add a helper type rather than overload a cohesive one (pure fabrication).

## Variation shapes

- **Steps vary inside a fixed sequence:** a base runs the sequence and calls steps that each variant supplies (template method).
- **The whole algorithm swaps:** a held collaborator behind an abstraction, chosen from outside (strategy).
- **What gets created varies:** creation goes through an operation or object that variants override or replace (factory method, abstract factory).
- **A wrapper adds behavior:** it offers the same interface as what it wraps and forwards to it (decorator; proxy when it controls access instead).
- **One change notifies many:** a subject keeps a list of listeners behind an abstraction and calls each (observer).
