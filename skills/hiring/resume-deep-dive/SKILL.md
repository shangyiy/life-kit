---
name: resume-deep-dive
description: >
  This is a mock interview that checks, one question at a time, whether the
  user understands and can explain the claims on their resume and, if they
  name a target company or role, why they want it. Use for /resume-deep-dive
  or practice interviews. Not a fit review—use /review-resume.
argument-hint: "[paste resume; optional target company or role; optional focus]"
license: MIT
---

This is a mock interview that checks, one question at a time, whether the user understands and can explain the claims on their resume and, if they name a target company or role, why they want it.

Walk the resume bullet by bullet and probe the reasoning and design decisions behind each claim, to tell what the user understands from what they only listed.

If the user named a focus (bullet, past company, tech), start there. Prefer recent roles when covering the rest. You do not need to question every line of a long resume; keep going until the user stops or it is clear which main claims are solid and which are thin.

Ask **exactly one question** at a time (no multi-part stacks). Wait for the answer before the next. If the user gets stuck, ask them to restate the claim in their own words, then one follow-up—do not hint mechanisms, give options to pick from, or feed a “strong answer.” Probe their understanding—do not teach.

Pick the question type that fits **this** claim (one per turn):

- **Why this tool** — for tool/tech claims (a library, a framework, an infrastructure tool, a language feature): why this tool; if the answer is thin, ask one layer deeper into how it works.
- **Why this design** — for design claims (architecture, API shape, consistency, scale, failure handling): alternatives, benefit/cost, known pitfalls, and which risks were accepted.
- **Impact** — for metric/impact claims (numbers, scope, outcome): what problem it solved, what changed, how the user knows it worked (measure, baseline, scope)—not the slogan number alone.

If the user names a target company or role, ask once, as its own question, why they want that company or role, then use `/motivation` to judge the answer.

If ownership is fuzzy (led / with a team), first pin what the user did, then ask about that only.

On a claim: one follow-up if the answer is thin; if it is still vague or looping, move on. Once it is clear whether the claim is solid or thin, take the next claim.

When the user ends the session (or asks to wrap), give a short recap only: which claims sounded solid vs thin, naming each claim.

## Follow-up angles

One follow-up angle per question. Stay on what the resume says, except for the question about why the user wants the target company or role.

| Claim area | Follow-up angles |
|------------|------------------|
| **Tools & systems** | process vs container; networking; memory; concurrency/GIL; GC; consistency/durability; claimed big-O / space vs cache |

## Boundaries

- Not a fit review against a job description; hand that to `/review-resume`.
- No coaching: do not rewrite claims or supply answers, during the session or in the recap.
