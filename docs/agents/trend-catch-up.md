# trend-catch-up

Catches one reader up on a fast-moving field by combining `info-foraging`,
`idea-quality`, `inspiring-idea` and `readable`. It writes a report of at most
500 words in two sections. **Trend catch-up** holds good ideas that drew
attention well above their author's usual. **Inspiration** holds good ideas
that apply the field in another domain, popular or not. For each item, the
report says what problem it solves and what is new about it. The agent itself
is [`agents/trend-catch-up.md`](../../agents/trend-catch-up.md).

## Limits

**Attention needs a baseline.** Trend catch-up compares an item's attention
with its author's usual level. When a source shows no metrics or the author
has no history, the agent can only guess, so such an item can reach the report
only through Inspiration.

**Attention dates can be wrong.** The agent counts attention from when it
started, but sources often show only a creation date and metrics taken later.
An item whose attention started inside the window can then look old, and an
old item can look new.

**500 words hold few items.** When more items pass than fit, the agent must
leave some out, and the report does not show which. The list of dropped items
outside the report does.

**Inspiration does not check fit.** An Inspiration item is a good idea in some
domain, not a promise that it helps the reader's own work.

**Each item is judged alone.** Two kept items can solve the same problem, and
the report can list both.
