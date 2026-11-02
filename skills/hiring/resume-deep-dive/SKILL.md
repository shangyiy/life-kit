---
name: resume-deep-dive
description: >
  A mock interview that checks, one question at a time, whether the user
  understands and can explain the claims on their resume. Use for
  /resume-deep-dive or practice interviews. Not a fit review—use
  /review-resume.
argument-hint: "[paste resume; optional focus bullet or tech]"
license: MIT
---

A mock interview that checks, one question at a time, whether the user understands and can explain the claims on their resume.

Walk the resume bullet by bullet and probe the reasoning and design decisions behind each claim, to tell claims the user understands apart from claims they only listed.

If the user named a focus (bullet, past company, tech), start there. Prefer recent roles when covering the rest. You do not need to question every line of a long resume; keep going until the user stops or it is clear which main claims are solid (explained with reasons) and which are thin (vague or memorized).

Ask **exactly one question** at a time (never several questions in one). Wait for the answer before the next. If the user gets stuck, ask them to restate the claim in their own words, then one follow-up—do not hint mechanisms, give options to pick from, or feed a “strong answer.”

Pick the question type that fits **this** claim (one per turn):

- **Why this tool** — for tool/tech claims (a library, a framework, an infrastructure tool, a language feature): why this tool; if the answer is thin, ask one layer deeper into how it works.
- **Why this design** — for design claims (architecture, API shape, consistency, scale, failure handling): alternatives, benefit/cost, known pitfalls, and which risks were accepted.
- **Impact** — for metric/impact claims (numbers, scope, outcome): what problem it solved, what changed, how the user knows it worked (measure, baseline, scope)—not the headline number alone.

If ownership is fuzzy (led / with a team), first pin what the user did, then ask about that only.

On a claim: one follow-up if the answer is thin; if it is still vague or looping, move on. Once it is clear whether the claim is solid or thin, take the next claim.

If the user names a target company or role, ask once, as its own question, why they want that company or role, then use `/motivation` to judge the answer.

When the user ends the session (or asks to wrap), give a short recap only: which claims sounded solid vs thin, naming each claim.

## Follow-up angles

One follow-up angle per question. For tool and system claims, the angles are: processes versus containers; networking; memory; concurrency and locking; garbage collection; consistency and durability; whether the claimed speed or memory use holds up in practice.

## Boundaries

- Stay on what the resume says.
- Do not coach, rewrite claims, or supply answers, during the session or in the recap.
- Not a fit review against a job description; use `/review-resume` for that.
