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

Attention is an effect; it always has a cause. For every high-attention item, state from its primary source why it is getting attention (the specific idea, or the common problem it solves), and decide keep or drop from that cause. So judge a bundle by the part that caused its attention; read the original, since a title or a retelling cannot give the cause; and make every drop reason name the cause and why it does not fit.

It also:
- Got much more attention than its author or source usually gets: clearly above the typical (median) engagement of their own recent items. If it is brand new, compare with similar new items from the same kind of source. One strong source is enough.
- Passes the first-principles and cohesion checks in [`idea-quality`](../../core/idea-quality/SKILL.md).

Rank by what the reader is missing or has asked about, not by novelty.

## Pick items
1. Before any topic or keyword search, scan each source's highest-attention items in the window, sorted by the attention signal it offers, with no topic or keyword filter. Read every one and note keep or drop with a one-line reason that names the cause. Whether an item is seen should depend on its attention, not on whether its text happens to contain topic words; keyword searches miss high-attention items whose text has none.
2. Then collect candidates from the caller's sources for the time window. The window measures spread, not birth: an item still spreading in the window counts, even if its attention began earlier. Skip anything already reported: judge by content, so the same story under a new link counts as reported.
3. Open each and check it against the rules above.
4. Return each kept item with: use; what is new (as defined in [`idea-quality`](../../core/idea-quality/SKILL.md)); value underneath; why it rose now; how this reader could use it; link.

A source fails: carry on and say which.

## Example
A lab's write-up on proving code correct shows up on a big forum, far above that lab's usual attention: it passes. What is new: proving code correct usually needs a hand-written formal spec, which takes weeks of expert time (bottleneck). Move: use the existing fuzz tests as the spec. A new way, not the same thing faster. Not new: the claim that proofs cover all inputs.
