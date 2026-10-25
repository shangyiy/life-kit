---
name: inspiring-idea
description: >-
  Find or review ideas a reader can carry into their own work from quiet
  corners or other fields, judged by quality rather than popularity. Use on
  /inspiring-idea.
---
# Inspiring idea

Find a few ideas the reader can carry into their own work. They are usually quiet, so popularity cannot find or judge them; quality and fit to the reader can. Search the way [`info-foraging`](../../core/info-foraging/SKILL.md) says, leaning on its rule to search quiet places on purpose. The field, sources, reader and examples of good work come from whoever runs this.

## What earns a place
Every item has something to look at (code, writing, demo) and splits into its use case (what a person does with it) and the value underneath (the problem it solves no matter the tool). If you cannot state the value, leave it out.

Then it meets one of:
- **Quiet quality**: judged by reading it, not by its attention, passing all three checks in [`idea-quality`](../../core/idea-quality/SKILL.md). It would sit comfortably next to the caller's examples of good work.
- **New field**: an idea applied to a field it has not reached yet (for agents: language learning, investing, medicine, law...). Prefer work by people from that field; it carries the field's own method.

Rank by what the reader is missing or has asked about.

## Use case: pick items
1. Collect candidates from the caller's sources, mostly the quiet ones. Skip anything already reported.
2. Open each and judge it by the rules above. Drop thin ones.
3. Return each kept item with: use case, what is new (name the usual approach's bottleneck, with its cost when known; the one move that removes or bypasses it; and whether that is a new way or just the same thing faster. Not its results), value underneath, why few noticed it, how this reader could use it, and its link.

Nothing qualifies: return nothing.

## Example
A 0-star repo that checks trading backtests for look-ahead bias from the trade log and prices alone, without reading the strategy code: new field (investing). What is new: it reads the fingerprint the bias leaves in the output instead of hunting for it in the code.

## Why
Analogy research (Gentner's structure-mapping, 1983): what carries across fields is the structure of an idea, not its surface, so ideas from other fields are a main source of new ones.
