---
name: trend-catch-up
description: >-
  Find or review what a reader must catch up on in a fast-moving field (e.g.
  AI agents): things spreading from early users to everyone, checked against
  real attention signals. Use on /trend-catch-up.
---
# Trend catch-up

Find the few things in a field the reader should not miss: things moving from a few early users to everyone in the field. Search the way [`info-foraging`](../../core/info-foraging/SKILL.md) says, using popularity as the hint of where to look, then check whether the attention is real and the thing is worth it. The field, sources, reader and examples of good work come from whoever runs this.

## What earns a place
Every item has something real to look at (code, paper, demo, measured result) and splits into its use case (what a person does with it) and the value underneath (the problem it solves no matter the tool). If you cannot state the value, leave it out.

It also:
- Got much more attention than it usually does, not just a lot of attention.
- Appears in at least two independent sources. Several posts that all link to one article count as one source.
- If brand new with no usual level, is compared with similar items from the same kind of source.
- Passes the first two checks in [`idea-quality`](../../core/idea-quality/SKILL.md) (makes sense from first principles; one simple, cohesive idea). Popularity does not excuse hype or a grab-bag.

Rank by what the reader is missing or has asked about, not by novelty.

## Use case: pick items
1. Collect candidates from the caller's sources for the time window. Skip anything already reported.
2. Open each and check it against the rules above. Drop thin ones.
3. Return each kept item with: use case, what is new (name the usual approach's bottleneck, with its cost when known; the one move that removes or bypasses it; and whether that is a new way or just the same thing faster. Not its results), value underneath, why it rose now, how this reader could use it, and its link.

Nothing qualifies: return nothing. A source fails: carry on and say which.

## Use case: go deeper on one item (on request)
Ask the reader about it in rounds, each question with a suggested answer, until they can say what value it has and whether to use it.

## Example
A lab's write-up on proving code correct shows up on a big forum and in several independent posts the same week, far above that lab's usual attention: it passes. What is new: existing fuzz tests serve as the spec, so no one writes one by hand. Not new: the claim that proofs cover all inputs.

## Why
Diffusion of innovations (Rogers, 1962): new things spread from a few early users to the majority, and a sudden jump in independent attention marks that move.
