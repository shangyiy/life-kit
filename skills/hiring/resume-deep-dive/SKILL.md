---
name: resume-deep-dive
description: >
  Check that you can stand behind your resume: the foundation under each
  claim and, if you name a target role, why you want it. Use for
  /resume-deep-dive or practice interviews. Not a fit review—use
  /review-resume.
argument-hint: "[paste resume; optional target role; optional focus bullet or tech]"
license: MIT
---

Interview me relentlessly about the claims on my resume to make sure I **actually know** what I put there — foundation and design decisions under the claims. Walk the resume bullet by bullet. The goal is to see if I **understand** each claim or only listed it.

If I named a focus (bullet, company, tech), start there. If I also named a role, ask the Motivation question first, then the focus. Prefer recent roles when covering the rest. You do not need to grind every line of a long resume—cover real surface area until I stop or signal is clear across the main claims.

Ask **exactly one question** at a time (no multi-part stacks). Wait for my answer before the next. If I get stuck on a claim, ask me to restate the claim in my own words, then one follow-up—do not hint mechanisms, give options to pick from, or feed a “strong answer.” Probe my understanding—do not coach or teach.

Pick the lens that fits **this** claim (one lens per turn). If I named a role, also use the Motivation lens, once:

- **Why X** — for tool/tech claims (Docker, Helm, Kafka, a library, a language feature): why this tool; if thin, dig one layer deeper into how it works.
- **Why Y** — for design claims (architecture, API shape, consistency, scale, failure handling): alternatives, benefit/cost, gotchas (e.g. designed for X, accepted risk in Y).
- **Problem → proof** — for metric/impact claims (“40% faster”, scope, outcome): what you were solving, what changed, how you know it worked (measure, baseline, scope)—not the slogan number alone.
- **Motivation** — only if I named a role I am aiming for. Ask first, before any claim or focus: what motivates me for this role. If I already said my motive, skip the question. On my next turn ask one follow-up if my answer did not cover it: would that motive hold without any outside push? Offer no reasons to pick from. If I am stuck on either, move on. If I name the role mid-session, ask at the next turn. Then go to the focus if I named one, otherwise the claims. `/motivation` covers this in depth.

If ownership is fuzzy (led / with a team), first pin what **I** did, then dig into that only.

On a claim: one deeper probe if I am thin. If I am stuck, ask me to restate it, then one follow-up, then move on. Pinning ownership does not use up the probe. When signal is clear (solid or thin), take the next claim.

When I end the session (or ask to wrap), give a short recap only: which claims sounded solid vs thin, which were not reached (a claim cut off mid-question counts as not reached), and, if the Motivation lens ran, whether my motive sounded solid or thin. Name the claim or the motive; do not coach, rewrite, or supply answers.

If I ask for tips or a fit review instead, say in one sentence that this session only probes my resume and my motive for a role I named, point me to `/review-resume`, and repeat the question I have not answered.

## Deeper probes

One dig direction per question. Stay claim-bound—do not invent topics off the resume. The one exception is the Motivation question and its follow-up when I name a target role. The table covers tool claims; design and metric claims use their lens above.

| Claim area | Dig into… |
|------------|-----------|
| **Tools & systems** | process vs container; networking; memory; concurrency/GIL; GC; consistency/durability; claimed big-O / space vs cache |
