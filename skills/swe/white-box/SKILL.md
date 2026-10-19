---
name: white-box
description: >
  Structural (white-box) testing and adequacy after black-box tests exist,
  for designing tests that close coverage gaps or reviewing a suite's
  structural adequacy claim:
  control flow graphs; statement, branch, condition, MC/DC and compound
  condition criteria and how they rank; basis paths and cyclomatic adequacy;
  loop criteria; data-flow criteria. Method under /testing. Use for coverage
  gap analysis, structural test design or review, or /white-box.
metadata:
  short-description: "Structural coverage and adequacy"
parent-skill: testing
---

# /white-box

Find what the existing tests miss in the structure of the entity under test (EUT), after spec-based tests exist, and design tests to close the gaps, or review whether a suite's structural adequacy claim holds. It is the structure-level adequacy of [`testing`](../testing/SKILL.md) principle 8, and it comes after spec-based selection (principle 3). The structure can be code, a circuit or a model of the implementation: the criteria below are stated on a graph of decisions and on the definitions and uses of values, and they apply wherever such a graph can be drawn. To review, re-measure the claim against the current structure and report a weaker criterion presented as a stronger one, covered elements no oracle checks, infeasible elements left unnamed, gaps decided without the rule below, and tests merged or split only to move the number, each with the principle broken and the fix.

## Principles, most important first

- **What it finds:** behavior the spec never asked for, and spec behavior that black-box testing skipped while optimizing. It cannot find missing functionality.
- **Decide each gap by the spec.** For each element no test reaches: if the spec covers it, add a test; if it is extra logic added by mistake, fix the EUT; if it was added on purpose, update the spec, then test it; if a good reason exists (defensive or unreachable logic), leave it and say why. Before excusing an unreachable element, ask whether the spec intends the outcome it guards; if it does, the guard is a fault to fix, not dead logic.
- **Unexecuted structure reveals nothing,** but execution is not detection (`testing` principle 1): a faulty element can run without corrupting the state, and a corrupted state can be masked before it reaches an output. So structural adequacy is a reasonable indicator, never proof; report it beside oracle strength.
- **Structural adequacy is volatile.** Refactoring changes the control flow graph and the elements to cover without changing the spec, so adequacy must be re-measured after every change to the structure.
- **Coverage is not suite size.** A smaller suite can cover more, and a larger one the same. Do not merge tests to shrink a suite at the cost of one behavior per test (`testing` principle 4): a failing small test points to the fault more precisely than a failing large one.
- **Write, measure, repeat:** add a test, measure adequacy, and stop when the chosen criterion is met. In practice the usual targets are statement and branch coverage; name a stronger one where the risk calls for it.
- **Three families of criteria:** control flow (statements, branches, conditions, paths), injected faults (`testing` principle 9), and data flow (definitions and uses of variables). They are not exclusive; combine them, and don't drop a family because its strongest form is infeasible.

## Statement, branch and condition criteria

- **Statement coverage:** every statement (node) runs at least once. Rationale: a fault in a statement can only show when it runs.
- **Branch coverage:** every branch (edge leaving a fork) is taken at least once. Count only forks, not joins or single edges. Branch subsumes statement; the reverse fails, so statement coverage can miss missing logic on an untaken branch.
- **Branch coverage can miss condition faults.** Both branches can be taken while one basic condition never changes.
- **Basic condition coverage:** each basic condition evaluates to true and to false at least once. It is the counterpart of each choice. It is not comparable with branch coverage: either can be met while the other is not. Alone it is weak; pair it with branch coverage.
- **Compound condition coverage:** every combination of basic condition values in each decision. Its size grows exponentially in the worst case; short-circuit evaluation leaves some values unevaluated and often, but not always, reduces it.
- **MC/DC (modified condition/decision coverage):** branch plus basic condition coverage, plus one rule: each basic condition is shown to affect the decision on its own. For each condition, two tests differ only in that condition (others fixed or unevaluated) and give opposite outcomes. It needs only a linear number of tests, N + 1 for N basic conditions, so it balances strength and size; it is widely used for safety-critical software and some certification standards require it.
- **Grouping matters:** how the basic conditions are grouped in the decision decides which pairs show independent effect, so read the grouping exactly before choosing tests.
- **Ranking:** from weak to strong, statement < branch < branch and basic condition < MC/DC < full compound condition. On its own, basic condition sits at the weak end, likely ineffective, and is incomparable with branch; compound condition is usually too demanding. Rank by subsumption, not by how fine a criterion sounds. To claim two criteria are incomparable, show a suite that meets each one but not the other.

## Path criteria

- **All paths is infeasible:** a small graph can have very many paths, and loops make them explode. Use pragmatic forms.
- **Branch coverage can miss path faults:** a fault may show only when two decisions take a particular combination of outcomes.
- **Basis paths:** paths are linearly independent when none is a combination of the others. Cyclomatic complexity V(G) is the largest number of independent paths in a graph. A basis is a set of V(G) independent paths: each new path adds at least one edge not covered by the paths already chosen, every edge is covered, and the basis is not unique. A basis lets every path be built from it, which is stronger than covering every edge.
- **Cyclomatic adequacy:** do the executed paths include a basis? It is closely related to branch coverage but stronger, and it measures how far the suite compensates for the structure's complexity.
- **Infeasible paths:** some paths have no input that reaches them, so full path-based coverage may be impossible. Name them.
- **Loops** must be both skipped and executed: a fault may show only on the first, a later, or no iteration, and a basis needs the path that skips the loop even though the looping path contains its edges. **Loop boundary adequacy:** every loop runs zero times, once, and more than once; it is less strict than boundary-interior coverage. **Boundary-interior coverage** unrolls loops and groups paths that differ only inside the loop. **LCSAJ** (linear code sequence and jump) coverage implies statement and branch coverage, loops run zero, one and two times, and every combination of nested and sequential loops.

## Data-flow criteria

- **Idea:** pick paths that follow how data is defined and used, between branch testing and all paths: every variable is set before it is used, and every value set is used for something.
- **Anomalies** hint at bugs: a use before any definition, a use after a kill, a definition killed or left without use, a double definition or double kill. Use after kill is a serious defect.
- **Testing is not analysis.** Data-flow analysis is static and finds anomalies, not faults; it can be sound (no false negatives) or complete (no false positives) but not both, and finding every anomaly is provably unsolvable. Data-flow testing runs the EUT along chosen def-use paths; what it reports is real, but it can miss anomalies on paths it does not run.
- **Criteria:** all-defs (each definition reaches some use), all-c-uses, all-p-uses, all-uses (each definition reaches every use it can reach), all-du-paths (every du-path). All-uses gives the best value for its cost: studies suggest no more than about twice the tests of branch coverage, with far better results. Some paths are infeasible, and tool support is often lacking, but the ideas still guide test design.

## Definitions

- **Structural testing** takes the internal mechanism of the EUT into account: its code, its compiled or built form, its circuit, or a model of its implementation. Analyze the structure, work out inputs that drive execution through chosen parts, then add oracles.
- **Control flow graph (CFG):** nodes are basic blocks, maximal regions with one entry and one exit; directed edges are possible transfers of control, from a condition's true or false outcome or a jump.
- **An element is not a line:** one line of a description can hold several statements, so count elements, not lines.
- **Decision and conditions:** a decision is the outcome of a condition; a compound condition joins basic conditions.
- **Data-flow terms:** a variable is defined (declared with a value, assigned, opened, allocated), used in a computation (c-use) or in a predicate (p-use), or killed (released, undefined). A **du-path** runs from a definition to a use; a **definition-clear path** has no other definition of the variable on the way.
