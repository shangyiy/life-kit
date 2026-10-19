# Sources

Every principle and definition in `SKILL.md`, with where it comes from. All
sources were read on 2026-10-19; SbE has no public copy and is unverified. Use-Case 2.0 page numbers are from the 2023
e-book PDF; Cohn chapter and section names are from the 2004 book.

Short names: **UC2** = Jacobson, Spence, Bittner, *Use-Case 2.0*. **Cohn** =
*User Stories Applied*. **Wake** = "INVEST in Good Stories". **Jeffries** =
"Card, Conversation, Confirmation". **HW** = Humanizing Work splitting guide.
**SPIDR** = Cohn's SPIDR article. **MG** = Cohn's Mountain Goat "User Stories"
guide. **SbE** = Adzic, *Specification by Example*, "Key process patterns".
**North** = "Introducing BDD".

## Core principles

1. **Start from the goal, not the solution.**
   - SbE, "Deriving scope from goals": scope is a solution to a business goal;
     successful teams start from the goal and define scope together.
   - Cohn ch. 7, "Start with Goal Stories" (identify each role's goals) and
     "Keep the UI Out as Long as Possible" (do not mix requirement with
     solution).
   - Cohn ch. 2, "Valuable": keep technology assumptions out of stories.
   - MG, "Improving a Weak Story": identify the decision the user is trying
     to make, so the team can discuss whether the named solution is best.
2. **Every story and slice ends in the result its actor's goal names.**
   - Wake, "Valuable": valuable to the customer; slice vertically through
     the layers.
   - Cohn ch. 2, "Valuable to Purchasers or Users": avoid stories valued only
     by developers; rewrite so the benefit to users is apparent.
   - HW, "User Story Formats" (tasks or components pretending to be a story)
     and "Step 1" (combine non-stories into an increment of value).
   - MG, story vs task; "Are technical stories really user stories?" (some
     technical work is better kept as a technical item).
   - UC2 "Use-Case Slices" (p. 15): a slice is a work item of clear value;
     HW Pattern #1: splitting a workflow one step at a time is "the wrong
     way to go" (basis for: a prepare-only or input-only slice is a step).
3. **A story is done when its acceptance checks pass.**
   - UC2 Principle 1 (p. 5) and "Test Case" (p. 44-45): test cases are the
     most important part of a use case's description; they define what it
     means to complete it; at least one test case for each story.
   - UC2 "Prepare a Use-Case Slice" (p. 26): a slice with no test cases has
     not been properly prepared.
   - Jeffries, "Confirmation": the acceptance test confirms the story; the
     customer says how she will confirm it at the start.
   - Cohn ch. 6: acceptance tests are written before coding, capture details
     and the customer's assumptions, and decide when a story is fully
     implemented; stop when more tests do not clarify the story's intent.
   - Cohn ch. 2, "Testable": nonfunctional stories need measurable targets.
   - SbE, "Refining the specification": define what the software does, not
     how.
   - Cohn ch. 6: tests are also written "whenever new tests are discovered
     during or after the programming of the story" (basis for: add more as
     new cases appear).
   - UC2 Principle 4 (p. 8-9) and "Use Cases" (p. 14): basic flow plus
     alternative flows; SbE, "Illustrating using examples" (edge cases)
     (basis for: primary course and exception courses even when short).
4. **Cut thin vertical slices, and say why the first one comes first.**
   - Wake, "Small", "Estimable", "Independent", "Valuable" (slice the cake).
   - Cohn ch. 2, "Small", "Splitting Stories"; ch. 7, "Slice the Cake".
   - UC2 Principle 4 (p. 8-9) and Principle 5 (p. 10): build in slices of
     clear value; independently implementable and testable slices.
   - HW, "User Stories Are Vertical Slices"; layer splits fail Independent
     and Valuable.
   - First slice's reason: HW "Cynefin and Story Splitting" (most valuable
     and/or most risky first), HW Pattern #6 (the case carrying the major
     effort), HW Meta-Pattern (first slice goes to the core complexity).
5. **Assume by default; ask only what decides the result.**
   - `pipeline-design/idea-to-merge.md`: "asks only what changes the
     result"; "ask once". This is the repo's own rule; the test "decides
     which stories exist or which items are picked, and a wrong guess is
     costly or hard to notice" is this skill's wording of it (tightened after
     run1, where a looser test let time, place, and format questions through).
   - HW "Step 1"/Pattern #9: "You probably know enough to build something.
     Do that, and you'll know more" (basis for assuming by default).
   - Jeffries, "Card" and "Conversation"; Wake, "Negotiable"; Cohn ch. 2,
     "Negotiable": details are settled in conversation; the front of the card
     holds open questions, settled details become tests.
   - Cohn ch. 2, sidebar "A Lack of Domain Knowledge": when a term could mean
     very different things, developers asked the customer.
   - Cohn ch. 6: acceptance tests document the customer's assumptions (basis
     for writing an assumption as a check).
   - UC2 Principle 4 (p. 8): some slices have questions that cannot be
     answered yet; put those aside (basis for: name which slices wait and
     which go ahead).
   - UC2 Principle 6 (p. 11): when timely answers are not available,
     requirements need more detail.
6. **See the whole, detail only what is next.**
   - UC2 Principle 2 (p. 5-6): understand the big picture without capturing
     all requirements up front; Principle 3 (p. 8): no complete model needed
     before starting.
   - Cohn ch. 7, "Size the Story to the Horizon".
   - SbE, "Just in time".

## Definitions

- **Story (use case):** form from /clean-arch-domain. UC2 "Use Cases"
  (p. 14): all the ways of using a system to achieve a goal for a user; UC2
  p. 5-6: actors can be other systems, and the initiator is an actor or the
  system. Cohn ch. 7: active voice, one user, closed stories (after
  Lauesen).
- **Course:** UC2 p. 8-9, 14 (basic and alternative flows). The
  source-cannot-be-read course is this skill's generic rule, from UC2's
  alternative flows and SbE edge cases; no source states it directly.
- **Slice:** UC2 "Use-Case Slices" (p. 15): one or more stories selected
  from a use case to form a work item of clear value; a story is a thread
  through one or more flows with its test cases (p. 16).
- **Acceptance check:** UC2 "Test Case" (inputs and expected results);
  North, "Given / When / Then"; SbE, "Illustrating using examples" (key
  examples representing each important class of behavior, plus edge cases).
- **Assumption:** Cohn ch. 6 (tests document assumptions); cheap-to-fix
  test from the pipeline rule above.
- **Constraint:** Cohn ch. 7, "Put Constraints on Cards" (after Newkirk and
  Martin): obeyed rather than implemented; write the test "during one of the
  first iterations" and keep running it each iteration.
- **Task:** MG (story vs task); Wake, SMART tasks serve a story.
- **Investigation:** Cohn ch. 2 (spike, timebox); HW Pattern #9 (acceptance
  criteria are questions to answer; "it should be your last resort"; "make
  every effort to use one of the previous eight patterns"); SPIDR, Spike.

## Ways to split

- Courses: UC2 Principle 4 (basic flow first); SPIDR, Paths.
- Rules: HW Pattern #3; SPIDR, Rules (relax a rule first).
- Data: HW Pattern #4; SPIDR, Data; Cohn ch. 2 (split along data).
- Operations: HW Pattern #2; Cohn ch. 2 (create, edit, delete).
- Interfaces: HW Pattern #5; SPIDR, Interfaces.
- Shared effort: HW Pattern #6; Cohn ch. 2, "Independent".
- Quality targets: HW Pattern #8 (defer performance; any non-functional
  requirement). Applies only to a target that belongs to one story; a
  constraint across all stories is checked from the first slice (Cohn ch. 7).
- Investigation last: HW Pattern #9.
- Choosing a split: HW "Step 3" (expose low-value parts; equal sizes).
  Too small: Cohn ch. 2, "Combining Stories". Dependencies: Cohn ch. 2,
  "Independent" (combine, or split another way).

## Where sources disagree, and what this skill does

- Cohn ch. 12 says a story is usually smaller in scope than a use case,
  similar to one scenario, and quotes Grenning that a story card plus its
  acceptance tests is basically a use case. /clean-arch-domain treats story
  and use case as the same thing. This skill keeps that, and handles the
  size difference with slices (UC2): a slice is one or more courses of a use
  case.
- Jeffries prefers examples over use-case documents. This skill keeps use
  cases short (the /clean-arch-domain form) and puts the weight on the
  checks, which matches both Jeffries and UC2 ("test cases are the most
  important part").
