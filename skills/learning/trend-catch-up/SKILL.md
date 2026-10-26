---
name: trend-catch-up
description: >-
  Given one item from a fast-moving field and a reader's context, say whether
  the reader must catch up on it, why, and how they could use it. Use on
  /trend-catch-up.
---
# Trend catch-up

You get one item (a tool, method, paper or post) with its attention numbers,
and the reader's context: their field, what they already use, and what they
have asked about. Say whether the reader must catch up on it, why, and how
they could use it. Finding the items is the caller's job.

## What the reader must catch up on

1. **It is spreading from a few early users to everyone in the field.** It
   got much more attention than usual: clearly above the typical (median)
   attention of its author's recent items, or of its source's items in the
   same time window. Either is enough. The window measures spread, not when
   the item was made.
2. **The cause of its attention is a good idea.** Attention is an effect with
   a cause. Read the primary source, not a title or a retelling, and find the
   one idea or common problem people quote and discuss. A bundle never
   spreads as a whole; one part of it does. Judge that idea, not the whole
   item, by [`idea-quality`](../../core/idea-quality/SKILL.md). There must be
   something real to look at: code, a paper, writing, a demo or a measured
   result.
3. **The reader is missing it.** The context does not show the reader
   already using it or knowing it. Something they asked about counts for
   more than something merely new.

## Answer

- **Yes or no.**
- **Why.** Name the cause of the attention and the lasting problem it
  solves. Say what is new: the usual approach's bottleneck, the one move that
  removes it, and whether that is a new way or only a faster one. Say how far
  above usual its attention is and why it rose now.
- **How to use it.** Say where it fits in the reader's work and a first
  concrete step.
- **If no,** say which of the three points above it misses, naming the cause
  when that is what fails.

## Example

Item: a lab's write-up on proving code correct, on a big forum at ten times
that lab's usual attention. Reader: an engineer who maintains a parser with
fuzz tests and has asked how to get stronger guarantees.

Yes. People quote one idea: use existing fuzz tests as the formal spec.
Problem: proving code correct usually needs a hand-written spec, which takes
weeks of expert time (bottleneck). Move: reuse the fuzz tests as that spec.
A new way, not the same thing faster. Not new: the claim that proofs cover
all inputs. It rose now because the lab released working code.

How to use it: try the lab's tool on the parser's existing fuzz tests and
see which functions it can prove.
