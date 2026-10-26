# trend-catch-up

Catches one reader up on a fast-moving field by combining `info-foraging`,
`idea-quality`, `inspiring-idea` and `readable`. It gathers items, keeps the
ones that are good and can inspire the reader's work, and reports for each
what problem it solves and what is new about it. The agent itself is
[`agents/trend-catch-up.md`](../../agents/trend-catch-up.md).

## Limits

**The filter is only as good as the reader's context.** Whether an item can
inspire depends on the reader's problems and on what they already know. With a
vague context, the agent can judge only whether an item is a good idea, not
whether it is new or useful to this reader.

**Attention signals choose what to open, not what to keep.** A loud item can
fail the filter and a quiet one can pass it. The report lists the dropped items
so the reader can see this.

**Each item is judged alone.** Two kept items can solve the same problem, and
the report can list both.
