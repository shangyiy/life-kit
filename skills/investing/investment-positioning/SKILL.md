---
name: investment-positioning
description: >
  Review whether to buy, add, hold, trim, or exit an investment position by
  testing the thesis, expectations, forced-exit risk, and value of waiting.
  Use for /investment-positioning or before changing market exposure.
metadata:
  short-description: "Decision record for changing a position"
parent-skill: investing
---

# /investment-positioning

Turn a proposed position change into a decision record. Apply
[investing](../../core/investing/SKILL.md) first. Do not place orders, move
money, or request account access. Ask only general, category-level questions
(such as whether the money may be needed before the review); never ask for
balances, account details, or identifiers, and use only what is volunteered.

## Decide

1. **Name the decision.** State the proposed change, intended holding period,
   and why a decision is needed now. If the request is mainly emotional, use
   the short format below.
2. **Write the thesis.** State what must be true, what the price already
   appears to expect, and what observation would disprove the thesis.
   Consensus describes expectations already reflected in price; it is not a
   reason to buy or chase strength.
3. **Test the alternatives.** Compare acting now with holding, doing nothing,
   and the next-best use of capital. Include costs, uncertainty, and the value
   of preserving room to act later.
4. **Run the forced-exit check.** A forced exit is selling at someone else's
   time or price. Consider margin, borrowed money, or other leverage;
   worse-than-expected losses; sudden price jumps; disappearing liquidity;
   financing changes; correlated selling; dated cash needs; loss of income;
   and fear or discomfort that could force an untimely sale.
5. **Choose and record.** Select buy, add, hold, trim, exit, or wait. Give the
   strongest reason, the strongest objection, the thesis-break condition, and
   the next review trigger.

## Resolve unknowns

Never turn missing information into assumed safety. Map each material unknown
to a conservative action:

- Unknown thesis or thesis-break condition: do not add exposure; write both
  before reconsidering.
- Unknown expectations or valuation: do not claim an edge; gather current,
  relevant evidence first.
- Unknown liquidity, financing, or effective exposure: do not add exposure;
  identify the obligation and worst-case loss first.
- Unknown dated cash needs or income resilience: avoid increasing exposure;
  clarify whether invested capital may be needed before the review horizon.
- Unknown temperament under loss: use no increase as the default; consider a
  smaller hypothetical loss and whether it would change the plan.
- Unavailable or conflicting evidence: mark it unknown, explain what would
  resolve it, and prefer waiting over invented precision.

## Final checklist

- The decision and time horizon are explicit.
- The thesis is separate from the price movement.
- Expectations already in the price are acknowledged.
- Evidence against the thesis received serious weight.
- Acting was compared with doing nothing.
- Forced-exit causes include market, financing, personal, and emotional risks.
- Every material unknown has a next action.
- The choice can be reversed without ruin if the thesis is wrong.
- A review trigger is observable and tied to the thesis.

## Anti-patterns

- Treating a recent gain or loss as the thesis.
- Buying because others agree or selling merely because they disagree.
- Averaging down only to improve the recorded purchase price.
- Inventing data, certainty, liquidity, or a precise value.
- Using activity to relieve fear, regret, boredom, or urgency.
- Accepting a promise of guaranteed returns; treat it as a red flag and stop
  the evaluation until the claim and provider are independently verified.

## Suitability boundary

This skill gives a decision record, never an allocation or position size.
Refer the person to a licensed financial professional instead of answering
when the decision requires individualized allocation, tax or legal advice,
retirement-income planning, debt restructuring, evaluation of an unsuitable
or opaque product, or reconciliation of near-term cash needs with loss
capacity. Also refer when the person may be under coercion, facing fraud, or
unable to understand the possibility of loss. Then return only `Stop`, why
the decision is outside this skill, what kind of professional to see, and a
reminder to ask how that professional is paid.

## Formats

Use the short format when the person is upset, rushed, or asking a narrow
question. Return only `Pause`, `What is known`, `What is unknown`,
`Safest next action`, and `Review trigger`, without padding.

Otherwise return the proposed choice, thesis, priced-in expectations,
strongest supporting and opposing evidence, forced-exit result, unknowns and
their actions, and review trigger. End every format once with: “Educational
only; this is not individualized financial advice.”
