---
name: black-box
description: >
  Spec-based (black-box, functional) test input selection, for designing new
  inputs or reviewing an existing suite's inputs, for any entity under test:
  why systematic, non-uniform selection beats random and ad hoc picks; input
  space models built from attributes, characteristics and partitions;
  disjointness, completeness and uniform blocks; validity; relationship
  characteristics; boundary values; representatives; dividing large models;
  random testing and fuzzing. Method under /testing. Use for behavior-first
  input design or review, equivalence classes, boundary values, or /black-box.
metadata:
  short-description: "Spec-based test input selection and review"
parent-skill: testing
---

# /black-box

Select test inputs from the specification, without looking at the implementation, whether the entity under test (EUT) is code, a circuit or a whole system; or review an existing suite's inputs against the same model. It is the method behind [`testing`](../../core/testing/SKILL.md) principles 3 (behavior first) and 7 (partition the inputs and choose representatives). Model one independently testable requirement at a time: attributes, then characteristics, then blocks checked for disjointness and completeness, then representatives. To review, rebuild the model from the spec, map each existing test to its block per characteristic, and report blocks and boundaries no test reaches, tests that share a block combination, repeated representatives, partition defects and missing invalid or implicit attributes, each with the principle broken and the fix.

## Principles, most important first

- **Spec first, at every level.** Spec-based testing finds missing functionality and functionality that clashes with the spec, so use it first, as the baseline technique, at unit, integration and system level alike.
- **Faults cluster instead of spreading evenly.** Unless faults are dense, use everything you know about where faults hide. Random picks remove bias but miss sparse regions; ad hoc picks may share the builder's wrong assumptions, especially when tester and builder are the same person.
- **So select systematically and partition.** Split the input space into blocks of related behavior so that faults concentrate in a few blocks. Give fault-prone behavior finer blocks; blocks need not be the same size, and small blocks deserve their own tests.
- **Every partition is disjoint and complete.** Disjoint: no input in two blocks. Complete: every input, valid or invalid, in some block. Ideally each block is also uniform, an equivalence class: if one value passes, all pass; if one fails, all fail. Then one representative per block is enough, however large the block, and two tests from exactly the same block combination are redundant. Uniformity is hard to guarantee, so judge whether each block is likely to be uniform and split it where it is not; doubt about a block calls for a finer partition, not for more samples from it.
- **The model is the hard part.** Once the input space model exists, deriving tests is fairly mechanical; listing every attribute and choosing characteristics is where it goes wrong, and a model is never certainly complete. Review it like any design.

## Getting partitions right

- **Check degenerate inputs against every block.** Before calling a partition incomplete, place the empty input, the single-element input and other degenerate inputs against every block. An input that falls in no block shows incompleteness; an input that falls in several blocks shows overlapping blocks, so the partition is not disjoint, which is a different defect.
- **Fixing overlap:** an overlap usually means a characteristic is missing. Add it, make the original characteristic depend on it, and give the ambiguous case its own block.
- **Fixing incompleteness:** add an "undefined" or "other" block for what is left, including a block for inputs where a characteristic does not apply, such as an output property of invalid input.
- **Validity:** model validity per attribute, not as one aggregate, and give each distinct reason for invalidity its own block, since each may be handled differently. Values the spec treats the same way belong in one block: splitting them only adds tests.
- **Relationships are characteristics too.** One input relative to another, or a new input relative to stored state, is a characteristic with its own blocks and its own boundaries: the equality case, and touching or adjacent cases under the semantics the spec states.
- **Sanity review:** check for a missing characteristic, and compare alternatives before choosing.
- **More characteristics with fewer blocks** beat few characteristics with many blocks: fewer mistakes and fewer tests. Every extra block means more tests.
- **Syntactic and semantic characteristics.** Syntactic ones follow one attribute's type and are mechanical and easy, but less effective and they produce more tests; a purely syntactic model can miss the very function the EUT performs. Semantic ones need domain knowledge, often span several attributes or describe the output, and find more. Combine both; semantic ones handle validity better.
- **Domain knowledge counts.** Facts the spec takes for granted are sources of characteristics and boundaries; use them, and say which ones you used.

## Boundaries

- **Errors cluster at boundaries,** because people think at the margins. Boundary value analysis takes the minimum, just above it, a nominal value, just below the maximum, and the maximum, under a single-fault assumption.
- **Robustness testing** adds values just outside each end. **Worst-case testing** combines the boundary values of all variables and grows fast.
- **Limits:** boundary analysis produces many tests; some boundaries are unclear (set by the spec or by the machine); logical values have no real boundaries; and it assumes independent variables, so it misses boundaries that move with another input. Where one input sets another's limit, list every limit it can take.
- **Boundaries as blocks:** give important boundary values blocks of their own, and look for boundaries inside partitions too. Typical special values: the extremes of a numeric range, values next to them, zero and its neighbors, an absent value; for collections and strings, absent, empty, one element, near capacity, at capacity, just past it.

## Representatives and large models

- **Representatives:** choose concrete values for each block in each combination, and vary them from one combination to the next. A value repeated everywhere can hide a fault that another value from the same block would reveal.
- **Combinations:** not every block can combine with every other; constraints remove infeasible ones, so the test count is not the product of block counts. Choosing which combinations to test is a method of its own.
- **Divide and conquer:** a big model needs many constraints; several small models, each scoped by a subset of attributes, need few. Small models overlap, which is hard to avoid, so remove overlapping cases by choosing one representative that serves both. Starting with a model of pure syntactic validity keeps it apart from semantic validity.

## Random testing

- **Random testing** selects inputs algorithmically from a probability distribution over the domain; it is not monkey testing, which is acting at random to see what happens. It is cheap, automatable, needs little knowledge of the EUT, and reduces human bias. It tends to find invalid or out-of-range data handling, unchecked return codes, memory and index errors, data corruption, races and undocumented features.
- **Guarantees and limits:** enough failure-free random tests can bound the likely failure rate at a given confidence. But it misses corner cases, produces a sheer number of tests, many redundant, makes root-cause analysis hard, and needs an automatic oracle. Use it beside systematic selection, not instead of it.
- **Fuzzing** is a random variant that feeds malformed and unexpected input, mostly negative, aimed at robustness and security flaws, and uses implicit oracles: normal end, exception, crash. The line between the two is not strict.

## Definitions

- **Spec-based testing** ignores the internal mechanism of the EUT and judges only the outputs it gives for selected inputs and conditions. It drives the EUT through its outward interface and takes oracles from the spec. Also called black-box, functional or behavior-first testing. **Function view:** any EUT maps a domain to a range; an input can be a sequence of actions, and an output can be any observable effect.
- **Specification:** a description of intended behavior, formal or informal: requirements, use cases, user stories, interface documents, quality-attribute specs, or requirements inferred from what users say or imply.
- **Independently testable requirement:** the unit of work; model one at a time.
- **Attribute:** anything explicit or implicit that can change the behavior, everything you must set or determine before calling it. Explicit: parameters, user inputs, sequences of actions, queries. Implicit: stored and global state, variables in pre- and postconditions, files and databases, environment and configuration. An attribute's possible values form its **domain**; the **input space** is the product of all domains.
- **Characteristic:** a property that organizes attributes, or properties of the output, into something to partition. A **partition** splits one characteristic into **blocks**. Sources of characteristics: preconditions, postconditions, relations among attributes, relations to special or boundary values (zero, absent, blank), definitions in the spec, and domain knowledge the spec takes for granted. Sources of blocks: valid, invalid and special values; the edges of each domain; values for normal use.
