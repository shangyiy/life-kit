---
name: design-principles
description: >
  What makes a design easy to change: what each module hides, what it is
  tied to, which way it depends, what it promises, and when an abstraction
  pays. Use to design, split or review modules, interfaces or subtypes, or on
  /design-principles.
metadata:
  short-description: "Core design principles"
---

# /design-principles

The domain of software design. These principles hold for any module at any size, whatever the language or notation; views of a design's structure and behavior apply them. Use it to do the work or to review it; in a review, name each breach once, with its fix.

## Principles

1. **Give each decision that is likely to change to one module, and keep it out of that module's interface** (information hiding). Split by decisions (data layout, algorithm, external format, device, a rule that varies), not by processing steps, so each likely change touches one module.
2. **Keep in one module what changes for the same reason** (high cohesion), **and keep what one module must know about another small, narrow and explicit** (low coupling). Tell a module what to do instead of taking its data and deciding for it; don't reach through one module into another's parts.
3. **Depend only on modules harder to change than the depender, never the reverse** (dependency direction). A module that many others depend on, and that depends on few, is hard to change (stable); if it also holds a decision likely to change, put that decision behind an abstraction it owns. When a stable module needs a volatile one, the stable side defines the abstraction and the volatile side implements it (dependency inversion). Allow no dependency cycles between modules released or changed separately (packages, services).
4. **For each operation, write down what the caller must ensure, what the operation then guarantees, and what stays true of the module's state between calls** (design by contract: precondition, postcondition, invariant). A broken precondition is the caller's bug; a broken postcondition or invariant is the supplier's. Input from outside the system is not a precondition: validate it where it enters. Prefer an interface that makes a precondition impossible to break over one that documents it: required parameters, one way to express each choice (including "unspecified"), safe defaults; check what remains with assertions, kept apart from input validation.
5. **Make every subtype usable wherever its supertype is expected** (Liskov substitution): it accepts at least what the supertype accepts, guarantees at least what it guarantees, keeps the supertype's invariants, and allows no state change the supertype forbids. Shared code or a shared name does not make a subtype. A new version of a module must be substitutable for the old one for every existing dependent; when it cannot be, make the break explicit and visible to them.
6. **Add an abstraction, layer or indirection only at a variation point**: two or more variants exist now, or a known decision is likely to change. Otherwise write the direct, concrete design and extract the abstraction when the second variant arrives. Whenever you decline or remove an abstraction, say why: no variation point.
7. **Ground every design claim in where it shows, and mark what you cannot tell.** Cite where in the code or requirement each element, relation and breach shows. Where the evidence is missing, or the answer depends on something not visible (a choice made at run time, configuration, an outside system), write "unknown" and state any assumption; never fill the gap with a likely guess.
8. **Write each explanation once, where its reader looks, and keep it true** (documentation). The interface states the contract (principle 4); a comment says why the code is as it is, not what it does; when the code changes, its explanation changes with it.

## SOLID and package principles, derived from the principles

- One reason to change per module (single responsibility; from 1 and 2). It does not mean "does one thing".
- New behavior at an existing variation point arrives as new code, not edits (open-closed; from 1 and 6).
- Subtypes are substitutable (Liskov substitution; principle 5).
- Each client sees only the operations it uses (interface segregation; from 2).
- Depend on the abstraction the stable side owns (dependency inversion; from 3). Passing an implementation in from outside (dependency injection) is one way to supply it, not the principle itself.
- Release together what changes together and is reused together (package principles).

## Definitions

- **Module:** any unit with an interface and a hidden decision: a function, a type, a package, a service.
- **Interface:** what a module's users may rely on; everything else is its hidden decision.
- **Coupling:** how much one module must know about another to work with it; **cohesion:** how strongly the parts of one module change for the same reason.
- **Stable:** hard to change because many modules depend on it and it depends on few. **Abstraction:** an interface kept apart from any one implementation, so implementations can be added or replaced without changing its users.
- **Variation point:** a place that meets principle 6's test.
- **Subtype:** a type that its users may treat as another type, its supertype; it is one only if principle 5 holds.
