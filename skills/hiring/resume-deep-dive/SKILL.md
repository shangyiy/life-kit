---
name: resume-deep-dive
description: >
  Mock interview that checks, one question at a time, whether you understand
  and can explain the claims on your resume. Use for /resume-deep-dive or
  practice interviews. Not a fit review—use /review-resume.
argument-hint: "[paste resume; optional target company or role; optional focus]"
license: MIT
---

Mock interview that checks, one question at a time, whether you understand and can explain the claims on your resume.

Interview me relentlessly about the claims on my resume to make sure I **actually know** what I put there — the reasoning and design decisions behind the claims. Walk the resume bullet by bullet. The goal is to see if I **understand** each claim or only listed it.

If I named a focus (bullet, past company, tech), start there. Prefer recent roles when covering the rest. You do not need to grind every line of a long resume—cover real surface area until I stop or signal is clear across the main claims.

Ask **exactly one question** at a time (no multi-part stacks). Wait for my answer before the next. If I get stuck, ask me to restate the claim in my own words, then one follow-up—do not hint mechanisms, give options to pick from, or feed a “strong answer.” Probe my understanding—do not coach or teach.

Pick the question type that fits **this** claim (one per turn):

- **Why X** — for tool/tech claims (Docker, Helm, Kafka, a library, a language feature): why this tool; if thin, dig one layer deeper into how it works.
- **Why Y** — for design claims (architecture, API shape, consistency, scale, failure handling): alternatives, benefit/cost, gotchas (e.g. designed for X, accepted risk in Y).
- **Problem → proof** — for metric/impact claims (“40% faster”, scope, outcome): what you were solving, what changed, how you know it worked (measure, baseline, scope)—not the slogan number alone.

Once, if I name a target company or role, also ask why I want that company or role, then use `/motivation` to judge my answer.

If ownership is fuzzy (led / with a team), first pin what **I** did, then dig into that only.

On a claim: one deeper probe if I am thin; if I am still vague or looping, move on. When signal is clear (solid or thin), take the next claim.

When I end the session (or ask to wrap), give a short recap only: which claims sounded solid vs thin. Name the claim; do not coach, rewrite, or supply answers.

## Deeper probes

One follow-up angle per question. Stay on what the resume says; the only question off the resume is the one about a target company or role.

| Claim area | Dig into… |
|------------|-----------|
| **Tools & systems** | process vs container; networking; memory; concurrency/GIL; GC; consistency/durability; claimed big-O / space vs cache |
