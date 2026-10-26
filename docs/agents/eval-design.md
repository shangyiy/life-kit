# eval-design

Designs and writes one agent eval by combining `testing`, `test-oracle` and
`agent-evals`, then hands it to an independent audit. The agent itself is
[`agents/eval-design.md`](../../agents/eval-design.md).

## Limits

**The expected results are only as good as the labels it is given.** The
agent cannot make ground truth. It needs real cases labeled before any run by
someone who knows the field, each with the verdict and the reasons behind it.
Without that input it can only propose cases and guess labels, which are not
expected results until that person confirms them.

Weak labels weaken both oracles. A verdict without a reason leaves the
reasoning unchecked, and a vague reason ("it makes sense") cannot be judged
point by point.
