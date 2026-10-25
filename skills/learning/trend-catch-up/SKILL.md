---
name: trend-catch-up
description: >-
  Find or review what a reader must catch up on in a fast-moving field (e.g.
  AI agents): things spreading from early users to everyone, checked against
  real attention signals. Use on /trend-catch-up.
---
# Trend catch-up

Find the few things in a field the reader should not miss: things moving from a few early users to everyone in the field. Search the way [`info-foraging`](../../core/info-foraging/SKILL.md) says. The field, sources, reader and examples of good work come from whoever runs this.

## What earns a place
Every item has something real to look at (code, paper, writing, demo, measured result) and splits into its use (what a person does with it) and the value underneath (the lasting problem it solves, whatever the tool). What is new is how this item attacks that problem. If you cannot state the value, leave it out.

It also:
- Got much more attention than its author or source usually gets, or than similar new items from the same kind of source get, if it is brand new.
- Appears in at least two independent sources. Several posts that all link to one article count as one source.
- Passes the first-principles and cohesion checks in [`idea-quality`](../../core/idea-quality/SKILL.md).

Rank by what the reader is missing or has asked about, not by novelty.

## Pick items
1. Collect candidates from the caller's sources for the time window. Skip anything already reported.
2. Open each and check it against the rules above.
3. Return each kept item with: use; what is new (as defined in [`idea-quality`](../../core/idea-quality/SKILL.md)); value underneath; why it rose now; how this reader could use it; link.

A source fails: carry on and say which.

## Example
A lab's write-up on proving code correct shows up on a big forum and in several independent posts the same week, far above that lab's usual attention: it passes. What is new: proving code correct usually needs a hand-written formal spec, which takes weeks of expert time (bottleneck). Move: use the existing fuzz tests as the spec. A new way, not the same thing faster. Not new: the claim that proofs cover all inputs.
