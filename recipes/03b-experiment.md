---
id: 03b-experiment
phase: test
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md
skill: product:experiment
---

# Recipe: Assumption Experiment

## When to use

Use this after the assumption map (recipe 02), when at least one high-risk assumption needs to be tested before you commit to building. This is the cheap-test step between validation and shaping.

The principle is Lean Startup's Build → Measure → Learn at the smallest possible scale: do not write production code to test whether anyone wants the thing. Pick the cheapest experiment that would either validate or invalidate the assumption.

If the riskiest assumption is invalidated by a cheap experiment, you save weeks of building. If it is validated, you build with conviction. If it is inconclusive, you redesign the experiment — you do not silently proceed.

## Inputs

- `docs/product/assumptions.md` with at least one row where Risk is `high` and Verdict is blank or `pending`
- Optional: prior experiments under `docs/specs/*-experiment.md`
- Optional: critique (suggested cheapest test), `business-model.md` (price to pre-sell at), `go-to-market.md` (channels to smoke-test)

## The six lightweight methods

Match the method to the assumption type. Pick exactly one method per experiment — combinations dilute the signal.

| Method | Tests | When to use | Time budget |
|---|---|---|---|
| **Landing page** | Desirability ("would someone care?") | Pre-product. You can describe the promise in one sentence. | 1–3 days |
| **Concierge** | Desirability + Usability ("is this actually useful when delivered?") | You can deliver the value manually to 3–5 people. | 1–2 weeks |
| **Wizard of Oz** | Feasibility + Desirability ("does it solve it if we fake the hardest part?") | The core risk is in a backend / AI capability that's expensive to build. | 1–2 weeks |
| **Fake door** | Demand ("would they click / sign up?") | The feature lives inside an existing product. | 1–3 days |
| **Smoke test** | Distribution ("can we reach them at all, at what cost?") | The channel is the real risk. Paid ads, community posts, or cold outreach to a defined list. | 3–7 days |
| **Pre-sale** | Viability ("will they pay, and how much?") | Before building: ask for money, a refundable deposit, a paid pilot, or a signed letter of intent. Strongest signal for B2B and higher prices. | 1–2 weeks |

If none of the six fit, the assumption is probably too vague to test. Sharpen it.

Sign-ups and "I'd pay for that" are not pre-sales. Only a payment, a deposit, or a signed commitment with a price counts.

## Interview questions

Ask one at a time.

### Lite (5 questions)

1. **Which assumption are we testing?** Read it back from `assumptions.md` with its ID. If multiple are high-risk, pick the one whose invalidation would kill the most downstream work.
2. **What would "validated" look like?** A specific, observable signal. Not "people seem interested" — "at least 5 of the next 20 people I show this to sign up for early access", or "3 of 15 prospects pay a $50 deposit".
3. **What method fits — landing page / concierge / wizard of oz / fake door / smoke test / pre-sale?**
4. **What is the time budget?** Hard maximum. If the experiment overruns, the answer is "inconclusive" — not "let me extend it."
5. **What will the verdict change?** If validated → proceed. If invalidated → kill / pivot. If inconclusive → redesign or waive explicitly.

### Pro (additional 3 questions)

6. **What is the false positive scenario?** What would make the signal look good for the wrong reason? (Friends signing up to be polite; a deposit from someone who'd never renew.)
7. **What is the smallest version of this experiment that still gives signal?** Push for cheaper. Most first drafts are 3× larger than they need to be.
8. **Who specifically will see this experiment?** Named people or a defined channel — not "the internet."

## Output structure

Write `docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md`:

```markdown
---
type: experiment
product: [Product Name]
assumption_id: A[n]
assumption: [copied verbatim from assumptions.md]
method: [landing-page | concierge | wizard-of-oz | fake-door | smoke-test | pre-sale]
status: [planned | running | complete]
verdict: [pending | validated | invalidated | inconclusive]
created: YYYY-MM-DD
conclude_by: YYYY-MM-DD
ran: YYYY-MM-DD
concluded: YYYY-MM-DD
skill: product:experiment
---

# Experiment: [Short Name]

## Assumption being tested
A[n] — [verbatim from assumptions.md]

## Hypothesis
If [we do X], then [we'll observe Y], which would [validate / invalidate] the assumption.

## Method
[One of the six]

## Setup
[Concrete description of what's built / shown / sent / offered, including price for pre-sales]

## Success threshold
[Specific numeric or observable threshold]

## False positive guards
[What would make this look good for the wrong reason — and how we'll detect it]

## Time budget
[Days — hard maximum; conclude by YYYY-MM-DD]

## Audience
[Named people or defined channel]

## Results
[Filled by `record` — raw numbers and observations]

## Verdict
[validated / invalidated / inconclusive]

## What this changes
[If validated: which downstream decision is now unblocked]
[If invalidated: which assumption is now known false; what pivot or kill follows]
[If inconclusive: what to redesign, or the waiver reason]
```

On design, set the row's Test column to `[method] → [this file]` and Verdict to `pending`. On `record`, set Verdict and append the result to Evidence.

## Exit condition

The experiment is complete when the verdict is filled in with evidence. "Validated" requires meeting the success threshold. "Invalidated" requires either missing the threshold or finding a false positive. "Inconclusive" requires explicitly choosing to redesign or waive — never a default.

## AI review prompt

1. Is the success threshold specific enough to produce a binary verdict, or vague enough to allow wishful interpretation?
2. Is the method actually the cheapest viable test, or is it secretly a small build?
3. For a viability assumption, does the test involve real money or a signed commitment — or just stated intent?
4. Is the audience defined, or is it "people on the internet"?
5. If the verdict turns out invalidated, is the next move actually a pivot or kill — or has the founder already committed to building regardless?

## Checklist

- [ ] Assumption is copied verbatim from `assumptions.md`, with its ID
- [ ] Method is one of the six (not a combination)
- [ ] Success threshold is observable and specific
- [ ] Time budget is a hard maximum with a conclude-by date
- [ ] False positive guard is named (pro)
- [ ] Assumption row's Test and Verdict columns are updated
- [ ] Verdict is filled in after running — no "TBD" allowed at conclusion
