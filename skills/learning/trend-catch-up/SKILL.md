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
Every item has something real to look at (code, paper, writing, demo, measured result) and a value underneath (as defined in [`idea-quality`](../../core/idea-quality/SKILL.md)); if you cannot state it, leave it out.

Attention is an effect with a cause. For each high-attention item, read its primary source, not a title or a retelling, and name the idea or common problem that drives the attention. Judge that idea, not the whole item, by every check in [`idea-quality`](../../core/idea-quality/SKILL.md). Every drop reason names that cause and why it fails. The item also got much more attention than usual: clearly above the typical (median) engagement of its author's recent items, or of the source's items in the window. Either is enough.

Rank by what the reader is missing or has asked about, not by novelty. If few items qualify, keep fewer rather than pad.

## Pick items
1. Before any topic or keyword search, scan each source's items with the most attention during the window, whatever their post date, sorted by the attention signal it offers, with no topic or keyword filter. Read each, down to where items stop clearing the attention test above, and note keep or drop with a one-line reason. Whether an item is seen should depend on its attention, not on whether its text happens to contain topic words; keyword searches miss high-attention items whose text has none.
2. Then collect candidates from the caller's sources for the time window. The window measures spread, not birth. Skip anything already reported: judge by content, so the same story under a new link counts as reported.
3. Open each and check it against the rules above.
4. Return each kept item with: use; what is new (as defined in [`idea-quality`](../../core/idea-quality/SKILL.md)); value underneath; why it rose now; how this reader could use it; link.

A source fails: carry on and say which.

## Example
A lab's write-up on proving code correct shows up on a big forum, far above that lab's usual attention: it passes. What is new: proving code correct usually needs a hand-written formal spec, which takes weeks of expert time (bottleneck). Move: use the existing fuzz tests as the spec. A new way, not the same thing faster. Not new: the claim that proofs cover all inputs.
