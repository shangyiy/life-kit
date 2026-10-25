---
name: inspiring-idea
description: >-
  Find or review ideas a reader can carry into their own work from quiet
  corners or other fields, judged by quality rather than popularity. Use on
  /inspiring-idea.
---
# Inspiring idea

Find a few ideas the reader can carry into their own work. Search the way [`info-foraging`](../../core/info-foraging/SKILL.md) says, mostly in quiet places; judge by quality and fit to the reader, not attention. The field, sources, reader and examples of good work come from whoever runs this.

## What earns a place
Every item has something to look at (code, paper, writing, demo, measured result) and splits into its use (what a person does with it) and the value underneath (the lasting problem it solves, whatever the tool). What is new is how this item attacks that problem. If you cannot state the value, leave it out.

Every item, of either kind, passes all three checks in [`idea-quality`](../../core/idea-quality/SKILL.md). Where the text cannot show check 3 (organic), mark it unknown rather than failing it. It is one of:
- **Quiet quality:** judged by reading it, not by its attention. It would sit comfortably next to the caller's examples of good work.
- **New field:** an idea carried into a field it has not reached yet (e.g. for AI agents: language learning, investing, medicine, law...), where its structure (how its parts relate), not its surface, fits a problem in that field. Prefer work by people from that field.

Rank by what the reader is missing or has asked about.

## Pick items
1. Collect candidates by randomly sampling quiet projects or articles from the caller's sources and reading their content, not titles, rankings or links. Skip anything already reported: judge by content, so the same story under a new link counts as reported.
2. Open each and judge it by the rules above.
3. Return each kept item with: use; what is new (as defined in [`idea-quality`](../../core/idea-quality/SKILL.md)); value underneath; why few noticed it; how this reader could use it; link.

## Example
New field: judging a system by its outputs alone, not its insides (black-box testing), carried into investing. A 0-star repo checks trading backtests for look-ahead bias from the trade log and prices alone. What is new: the usual audit needs the strategy code and an expert reviewer (bottleneck); this flags trades that could only have been made with future prices (move). A new way.
