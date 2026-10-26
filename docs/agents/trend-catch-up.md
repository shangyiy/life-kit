# trend-catch-up

Catches one reader up on a fast-moving field by combining `info-foraging`,
`idea-quality`, `inspiring-idea` and `readable`. It keeps two kinds of good
ideas: trend catch-up ideas, which drew attention well above their author's
usual, and inspiration ideas, which apply the field in another domain, popular
or not. It merges the kept items that are the same idea, picks at most three of
the most valuable for the reader, and writes them up by `readable` in at most
500 words, with a link to each source. Before judging any item, the agent opens
its full source and keeps expanding it until it reaches the actual idea, and it
judges only on that full text, never on a title, snippet or listed date. The
agent itself is [`agents/trend-catch-up.md`](../../agents/trend-catch-up.md).

## Runtime requirements

The agent opens the full text of outside items, and that text can carry
injected instructions. These are harness requirements: the harness that runs
the agent must enforce them. The prompt does not enforce them, and they must
not depend on its wording.

- The agent gets read-only tools only: search, open, and read text.
- Nothing from an item, such as code, install commands or scripts, is ever
  executed.
- A fixed script does all fetching. It only downloads a page and converts it
  to text.
- The judging run has no secrets, credentials or account connections, and it
  runs in a disposable sandbox, such as a fresh cloud VM.

## Limits

**Attention needs a baseline.** Trend catch-up compares an item's attention
with its author's usual level. When a source shows no metrics or the author
has no history, the agent can only guess, so such an item can reach the report
only as an inspiration idea.

**Attention dates can be wrong.** The agent counts attention from when it
started, but sources often show only a creation date and metrics taken later.
An item whose attention started inside the window can then look old, and an
old item can look new.

**Three ideas is a small cap.** When more ideas pass, the agent must leave some
out, and the report does not show which. The list of dropped items in the notes
does.

**Inspiration does not check fit.** An inspiration idea is a good idea in some
domain, not a promise that it helps the reader's own work.

**Merging is a judgment call.** The agent decides which kept items are the same
idea, so it can merge two ideas that only look alike, or keep one idea twice.
