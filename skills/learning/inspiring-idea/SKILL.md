---
name: inspiring-idea
description: >-
  Given an idea and a reader's context, say whether the idea can inspire the
  reader's own work, why, and how to apply it in their field. Use on
  /inspiring-idea.
---
# Inspiring idea

You get one item (a project, article, paper or method) and the reader's
context: their field, the problems they have, and work they value. Say
whether the item can inspire the reader's work, why, and how to use it in
their field. How popular the item is does not matter.

## What makes an idea inspiring for this reader

1. **It is a good idea,** as [`idea-quality`](../../core/idea-quality/SKILL.md)
   describes. If the source does not show the author's own need, leave that
   unknown, but still name the problem the idea solves.
2. **It works the same way as a problem the reader has.** Its parts and the
   reader's problem are linked by the same causes, not just by looking alike.
   To check:
   1. Understand the reader's field and problem from the context.
   2. Describe how the idea works as links between its parts, without the
      words of its own field. Describe the reader's problem the same way.
      This plain wording is only for the check; write the answer in the
      reader's own words.
   3. Pair each part of the idea with a part of the reader's problem. Keep
      only the pairs that form one chain of causes; drop scattered
      resemblances.
   4. Write in one sentence the rule both sides share. That rule is what the
      reader carries over.
   5. List where the pairing does not hold.

   Ideas from another field are the best source. Someone who knows both
   fields sees what people inside one of them miss.
3. **It is new to the reader.** The context does not show the reader already
   working this way.

## Answer

- **Yes or no.**
- **Why.** Name the problem the idea solves and how it solves it. Name the
  reader's problem it pairs with, and which part matches which. Say what is
  new: the usual approach's bottleneck, the one move that removes it, and
  whether that is a new way or only a faster one. Say where the pairing does
  not hold.
- **How to apply it.** Say what the idea becomes in the reader's field, the
  first concrete step to try it, and what to watch where the pairing does not
  hold.
- **If no,** say which of the three points above it misses.

## Example

Item: a small code project that checks trading backtests for trades that
used future prices, from the trade log and prices alone. Reader: a test
engineer who wants to check systems without reading their code.

Yes. The project solves a recurring problem: backtests that quietly use
prices not yet known. It flags any trade that could only have been made with
such prices. This pairs with testing a system from the outside: the trade
log is the system's output, the prices are the expected facts, and no
strategy code is needed. The shared rule: an output must not depend on input
that arrived after it. What is new: the usual audit needs the strategy code
and an expert reviewer (bottleneck); this checks outputs against a timing
rule instead (move), a new way. The pairing does not hold where the reader's
system has no clear idea of "known at the time".

How to apply it: for a system whose outputs carry timestamps, write a check
that flags any output depending on input that arrived after it. Start with
one service's logs; skip systems whose inputs carry no reliable time.
