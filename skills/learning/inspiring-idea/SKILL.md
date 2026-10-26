---
name: inspiring-idea
description: >-
  Given an idea and a reader's context, say whether the idea can inspire the
  reader's own work, why, and how to apply it in their field. Use on
  /inspiring-idea.
---
# Inspiring idea

You get an item (a project, article, paper or method) and the reader's
context: their field, the problems they have, and work they value. Say
whether the item can inspire the reader's own work, why, and how to apply it
in the reader's field. Popularity plays no part.

## What makes an idea inspiring for this reader

1. **It is a good idea,** as [`idea-quality`](../../core/idea-quality/SKILL.md)
   describes. Where the source cannot show the author's own need, leave that
   unknown; the problem it solves must still be named.
2. **Its structure fits a problem the reader has.** Causes carry across,
   not surface features. To check:
   1. Understand the reader's field and problem from the context.
   2. Write the idea's mechanism as relations between its parts, without its
      field's nouns, and the reader's problem the same way.
   3. Map the parts one to one, and keep only what carries over as a
      connected chain of causes, not scattered resemblances.
   4. State in one sentence the principle both sides share; that is what to
      carry over.
   5. List where the mapping does not hold.

   Ideas from another field are the strongest source: someone who knows both
   fields sees what people in one of them do not.
3. **It is new to the reader.** The context does not show the reader
   already working this way.

## Answer

- Yes or no.
- Why: the problem the idea solves and its mechanism; the reader's problem
  it maps onto, with what corresponds to what; what is new (the usual
  approach's bottleneck, the one move that removes it, and whether that is a
  new way or only faster); where the mapping breaks.
- How to apply it: what the idea becomes in the reader's field, the first
  concrete step to try it, and what to watch for where the mapping breaks.
- If no, which of the three points above it misses.

## Example

Item: a small code project that checks trading backtests for look-ahead bias
from the trade log and prices alone. Reader: a test engineer who wants to
check systems without reading their code.

Yes. The project solves a recurring problem (backtests that quietly use
future prices) by flagging trades that could only have been made with
prices not yet known. That maps onto black-box testing: the trade log is the
system's output, the prices are the oracle, and no strategy code is needed.
What is new: the usual audit needs the strategy code and an expert reviewer
(bottleneck); this checks outputs against a timing rule instead (move), a
new way. The mapping breaks where the reader's system has no clear notion of
"known at the time".

How to apply it: for a system whose outputs carry timestamps, write a check
that flags any output depending on input that arrived after it. Start with
one service's logs; skip systems where inputs carry no reliable time.
