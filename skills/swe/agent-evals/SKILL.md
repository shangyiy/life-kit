---
name: agent-evals
description: >
  The agent-eval use case of the testing domain. Use to design, run or review
  an eval, score or claim for an AI agent, including one that follows a skill
  or instruction file, to interpret pass@k or judge scores, or on /agent-evals.
metadata:
  short-description: "Design and review AI agent evals"
parent-skill: testing
---

# /agent-evals

Every principle of [`testing`](../../domain/testing/SKILL.md) applies unchanged
to evals of AI agents; this skill holds only what is agent-specific. To design
or run an eval, meet every principle; to review one, report each one it breaks.

## Principles

1. **Agents are nondeterministic, so every score comes from repeated trials**
   (`testing` principles 5 and 8) and holds only for its exact model, harness
   and skill ([`verify-before-ship`](../../domain/verify-before-ship/SKILL.md)
   principle 3); run several models so a gain is no one model's quirk. Use
   pass@k (at least one of k trials succeeds) when one success is enough,
   pass^k (all k do) when users need every one. Average each task's trials
   before the standard error, clustered for related tasks; pair versions on the
   same tasks and size the suite by power analysis.
2. **An agent fails only through its own work, never a task or grader defect.**
   Prompts may be as underspecified as real use, but ambiguity stays out of the
   grader: it accepts every reasonable reading, every threshold it enforces is
   stated exactly as checked, and two domain experts would independently reach
   its verdict. Grade the substance and quality of the final work, not its path
   unless the path or interaction is under test (transcripts, turn limits, tool
   choice), and never its fit to a skill's or the eval's own format, sections
   or wording ([`test-oracle`](../test-oracle/SKILL.md): no hyperassertions;
   reference solutions: `testing` principle 2). Multi-part tasks may need
   partial credit (`test-oracle`: grade only where the spec grades).
3. **Choose and combine graders per task:** code where possible, a model where
   needed, humans sparingly to validate. Calibrate model graders against human
   experts with a clear rubric; one isolated call per dimension can help.
4. **Read transcripts before trusting any score** (`testing` principle 6): each
   failure must look fair. A regression drop beyond noise signals a break. Near
   100%, large gains show as small increases, at 100% as none: start capability
   tasks hard, at a low pass rate, and graduate saturated ones to regression.
5. **Agents act on their surroundings and seek answers or loopholes,** so
   `testing` principles 2 (out of reach), 5 (clean slate) and 12 (held-out
   sets) apply in full: no trial reaches tests, grader code, rubrics, reference
   solutions, earlier trials' history or leaked answers. Keep checking: rerun
   leaked cases with the leak blocked or mark them incorrect.
6. **Match the run environment to production; fix and report its settings.** On
   one coding benchmark, resources moved scores just under 2 points in the
   moderate range, about 6 at the extremes; time limits, concurrency and API
   latency can too. Give each task a guaranteed allocation and a higher kill
   limit, so runs at the allocation and at the limit agree within noise. Count
   infrastructure errors apart (retests: `testing` principle 5); doubt a gap
   under about 3 points until both runs' setups are documented and matched.
7. **Start early and small, with tasks from real use** (`testing` principle 10)
   and capability tasks for planned features; take expected findings from real
   history (failures found or fixed, reviews that happened) or seeded defects
   ([`mutation-testing`](../mutation-testing/SKILL.md)). Twenty to fifty
   suffice while changes have large effects (power analysis: principle 1).
   Cover tasks where a behavior should and should not occur (`testing`
   principle 7); track latency, tokens, cost, tool calls and errors.
