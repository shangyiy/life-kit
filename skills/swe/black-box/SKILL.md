---
name: black-box
description: >
  Spec-based (black-box) test input selection, for designing inputs or
  reviewing the inputs and combinations an existing suite covers, for any
  entity under test: input space models built from attributes,
  characteristics and blocks; disjoint, complete and uniform partitions;
  validity; relationships; boundaries; representatives; which combinations of
  blocks to test (all combinations, each choice, pairwise, t-wise, base
  choice, multiple base choice); constraints; decision tables; random testing
  and fuzzing. Use case of the testing domain. Use for behavior-first input
  design or review, equivalence classes, boundary values, pairwise or
  decision tables, or /black-box.
metadata:
  short-description: "Spec-based test inputs and their combinations"
parent-skill: testing
---

# /black-box

Choose test inputs from the specification, without looking at the implementation, for any entity under test (EUT): code, a circuit or a whole system; or review an existing suite's inputs and combinations against the same model. It applies [`testing`](../../domain/testing/SKILL.md) principles 3, 7 and 8 and uses its definitions; nothing here restates them. Model one independently testable requirement at a time: attributes, characteristics, blocks, combinations, representatives. To review, rebuild the model from the spec and place each existing test in its block per characteristic and its combination; gaps, redundancy and model defects then show directly.

## Principles, most important first

1. **The model is the hard part.** Once the input space model exists, deriving tests is fairly mechanical; listing every attribute and choosing characteristics is where it goes wrong, and no model is certainly complete. Every attribute counts, explicit or implicit. Review the model like any design: look for a missing characteristic and compare alternatives before choosing.
2. **Check disjointness and completeness (testing principle 7) with degenerate inputs.** Place the empty, single and other degenerate inputs against every block: an input in no block shows incompleteness, an input in several shows overlap, a different defect. Overlap usually means a missing characteristic: add it, make the original depend on it, and give the ambiguous case its own block. Incompleteness takes an "other" block, including one for inputs where a characteristic does not apply.
3. **One representative per uniform block is enough.** Two tests from the same combination are redundant. Uniformity is hard to guarantee: where a block may not be uniform, split it rather than sample it more. Give fault-prone behavior finer blocks; blocks need not be the same size. Vary the concrete values from one combination to the next, since a value repeated everywhere can hide a fault another value of the same block would reveal.
4. **Semantic characteristics find more.** Syntactic ones follow one attribute's type: mechanical, but they produce more tests and can miss the very function the EUT performs. Semantic ones need domain knowledge, often span several attributes or describe the output, and handle validity better. Combine both, use facts the spec takes for granted, and say which ones you used. More characteristics with fewer blocks beat few with many: fewer mistakes, fewer tests.
5. **Validity per attribute, one block per reason.** Model validity per attribute, not as one aggregate, and give each distinct reason for invalidity its own block, since each may be handled differently. Values the spec treats alike share one block; splitting them only adds tests.
6. **Relationships and boundaries are characteristics too.** One input relative to another, or a new input relative to stored state, has its own blocks and boundaries: the equal case, and touching or adjacent cases under the spec's semantics. Take the minimum, just above it, a nominal value, just below the maximum and the maximum, give important boundary values blocks of their own, look for boundaries inside blocks, and test just outside each end for robustness. Boundary analysis assumes independent inputs: where one input sets another's limit, list every limit it can take. Logical values have no real boundaries.
7. **Some failures need interactions, but all combinations explode.** A fault may show only when two or more characteristics take particular blocks together, yet all combinations grow as the product of block counts. Each combination criterion trades thoroughness for size, and none is best everywhere: choose one by what is known about where interactions hide, justify it against its assumptions, and name its weakness (testing principle 8): the interactions it leaves untested.
8. **Impossible and unanswered combinations differ.** A combination that cannot happen by definition is infeasible: state it as a constraint; Constraints below says how each criterion handles it. One that can happen but that the rules do not answer is a requirement gap (testing principle 3), never treated as infeasible. Constraints often surface late, while choosing concrete values; revisit the model when they do.
9. **A combination strategy only combines what the model expresses.** Over purely syntactic characteristics without constraints, generated combinations exercise only input validity and never the real function. Generated combinations do not remove the work of choosing characteristics, values and oracles, and they take the choice of representatives out of your hands.
10. **Divide large models.** One big model needs many constraints; several small models, each scoped by a subset of attributes, need few. Where small models overlap, choose one representative that serves both. A model of pure syntactic validity kept apart from semantic validity stops the two from mixing.
11. **Random selection supplements, never replaces, systematic selection.** Drawing inputs from a probability distribution is cheap, needs little knowledge of the EUT, reduces bias, and enough failure-free runs can bound the likely failure rate at a given confidence. It misses sparse corner cases, yields many redundant tests, makes root causes hard to find and needs an automatic oracle. Fuzzing aims malformed and unexpected input at robustness and security, judged by implicit oracles: normal end, exception, crash.

## Combination criteria

- **All combinations** (strong equivalence class): every combination of blocks across all characteristics; complete for the model, rarely affordable. **Each choice** (weak equivalence class): every block in at least one test; cheap, often weak.
- **Pairwise:** every block of each characteristic appears with every block of every other at least once; **t-wise** extends this to t characteristics. Each test covers many pairs, which is the saving and also the cost: a failure does not say which pair caused it, so it suits asking whether anything broke more than what broke. It assumes uniform blocks, independent characteristics and faults that need at most two of them; where these fail, use t-wise or targeted combinations. In one study of recalled safety-critical software, nearly all reported faults needed no more than two interacting characteristics; whether that holds depends on the product's real dependencies. Its saving is large next to all combinations, not next to the combinations that matter.
- **Base choice:** pick the most ordinary block of each characteristic as the base test, then vary one characteristic at a time through its other blocks, keeping every other characteristic at a valid base block so one rejection cannot hide another fault. The base is a design decision to justify (most likely in use, simplest, smallest), and its blocks must combine. It fits when one unusual block makes the rest irrelevant because it stops processing; two non-base blocks never meet, so add pairwise or **multiple base choice** (several bases, each varied the same way) where such interactions matter.
- **Ranking:** A subsumes B when every suite meeting A meets B. Two chains run strongest to weakest: all combinations, t-wise, pairwise, each choice; and all combinations, multiple base choice, base choice, each choice. Pairwise and base choice are not comparable.
- **Constraints** say a block cannot, or can only, combine with a given block of another characteristic. All combinations, each choice and pairwise drop infeasible combinations; base choice criteria first re-choose base blocks, then drop what is still infeasible.

## Decision tables

- **When an output depends on combinations of conditions,** list the combinations: each is answered by a rule, infeasible, or unanswered. A decision table lists conditions and actions as rows and rules as columns; a don't-care entry marks a condition that does not affect a rule's actions.
- **Use one when** inputs are logically related (one value limits what others may be) and some outputs depend on only a subset of them, and only when evaluation order changes nothing: once a rule matches, no other needs checking. When order changes the result, model the sequence instead. Keep tables in the business's terms, apart from the implementation, so the people who own the rules can check them.
- **A sound table** has a rule for every action and an action for every rule, and its merged rules still account for every raw combination. Each rule gets a test, and further tests vary each don't-care value to show it does not matter.

## Definitions

- **Specification:** any description of intended behavior, formal or informal, including requirements inferred from what users say or imply.
- **Attribute:** anything, explicit or implicit, that must be set or determined before running the EUT and can change its behavior: parameters, user inputs, sequences of actions, stored and global state, files, environment and configuration. Its possible values form its **domain**; the **input space** is the product of all domains.
- **Characteristic:** a property of attributes, or of the output, chosen to partition. Sources: preconditions, postconditions, relations among attributes, relations to special values, definitions in the spec, domain knowledge. A **partition** splits one characteristic into **blocks**; a block is **uniform**, an equivalence class, when every value in it behaves alike.
- **Combination:** one block from each characteristic; a **combination criterion** says which combinations a suite must cover.
