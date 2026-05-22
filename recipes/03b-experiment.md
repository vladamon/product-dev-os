---
id: 03b-experiment
phase: discovery
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md
skill: product:experiment
---

# Recipe: Assumption Experiment

## When to use

Use this after the assumption map (recipe 02), when at least one high-risk assumption needs to be tested before you commit to building. This is the cheap-test step that sits between discovery and shaping.

The principle is Lean Startup's Build → Measure → Learn applied at the smallest possible scale: do not write production code to test whether anyone wants the thing. Pick the cheapest experiment that would either validate or invalidate the assumption.

If the riskiest assumption is invalidated by a cheap experiment, you save weeks of building. If it is validated, you build with conviction. If it is inconclusive, you redesign the experiment — you do not silently proceed.

## Inputs

- `docs/product/assumptions.md` with at least one assumption flagged `Risk: high`
- Optional: prior experiments under `docs/specs/*-experiment.md`

## The five lightweight methods

Match the method to the assumption type. Pick exactly one method per experiment — combinations dilute the signal.

| Method | Tests | When to use | Time budget |
|---|---|---|---|
| **Landing page** | Desirability ("would someone care?") | Pre-product. You can describe the promise in one sentence. | 1–3 days |
| **Concierge** | Desirability + Usability ("is this actually useful when delivered?") | You can deliver the value manually to 3–5 people. | 1–2 weeks |
| **Wizard of Oz** | Feasibility + Desirability ("does it solve it if we fake the hardest part?") | The core risk is in a backend / AI capability that's expensive to build. | 1–2 weeks |
| **Fake door** | Demand ("would they click / sign up / pay?") | The feature lives inside an existing product. | 1–3 days |
| **Smoke test** | Acquisition ("can we reach them at all?") | You suspect the distribution channel is the real risk. | 3–7 days, paid ads |

If none of the five fit, the assumption is probably too vague to test. Sharpen it.

## Interview questions

Ask one at a time.

### Lite (5 questions)

1. **Which assumption are we testing?** Read it back from `assumptions.md`. If multiple are high-risk, pick the one whose invalidation would kill the most downstream work.
2. **What would "validated" look like?** A specific, observable signal. Not "people seem interested" — "at least 5 of the next 20 people I show this to sign up for early access."
3. **What method fits — landing page / concierge / wizard of oz / fake door / smoke test?**
4. **What is the time budget?** Hard maximum. If the experiment overruns, the answer is "inconclusive" — not "let me extend it."
5. **What will the verdict change?** If validated → proceed to shape. If invalidated → kill / pivot. If inconclusive → redesign or skip.

### Pro (additional 3 questions)

6. **What is the false positive scenario?** What would make the signal look good for the wrong reason? (E.g., friends signing up because they're being polite.)
7. **What is the smallest version of this experiment that still gives signal?** Push for cheaper. Most first drafts of experiments are 3× larger than they need to be.
8. **Who specifically will see this experiment?** Named people or a defined channel — not "the internet."

## Output structure

Write `docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md`:

```markdown
---
type: experiment
product: [Product Name]
assumption: [the assumption being tested, copied verbatim from assumptions.md]
method: [landing-page | concierge | wizard-of-oz | fake-door | smoke-test]
status: [planned | running | complete]
verdict: [pending | validated | invalidated | inconclusive]
created: YYYY-MM-DD
ran: YYYY-MM-DD
concluded: YYYY-MM-DD
skill: product:experiment
---

# Experiment: [Short Name]

## Assumption being tested
[Verbatim from assumptions.md]

## Hypothesis
If [we do X], then [we'll observe Y], which would [validate / invalidate] the assumption.

## Method
[Landing page / Concierge / Wizard of Oz / Fake door / Smoke test]

## Setup
[Concrete description of what's built / shown / sent]

## Success threshold
[Specific numeric or observable threshold]

## False positive guards
[What would make this look good for the wrong reason — and how we'll detect it]

## Time budget
[Days / weeks — hard maximum]

## Audience
[Named people or defined channel]

## Results
[Fill in after running — raw numbers and observations]

## Verdict
[validated / invalidated / inconclusive]

## What this changes
[If validated: which downstream decision is now unblocked]
[If invalidated: which assumption is now known false; what pivot or kill follows]
[If inconclusive: what to redesign or what to abandon]
```

## Exit condition

The experiment is complete when the verdict is filled in with evidence. "Validated" requires meeting the success threshold. "Invalidated" requires either missing the threshold or finding a false-positive. "Inconclusive" requires explicitly choosing to redesign or move on without certainty — never a default.

## AI review prompt

1. Is the success threshold specific enough to produce a binary verdict, or is it vague enough to allow wishful interpretation?
2. Is the method actually the cheapest viable test, or is it secretly a small build?
3. Is the audience defined or is it "people on the internet"?
4. If the verdict turns out invalidated, is the next move actually a pivot or kill — or has the user already committed to building regardless?

## Checklist

- [ ] Assumption is copied verbatim from `assumptions.md`
- [ ] Method is one of the five (not a combination)
- [ ] Success threshold is observable and specific
- [ ] Time budget is a hard maximum
- [ ] False positive guard is named (pro)
- [ ] Verdict is filled in after running — no "TBD" allowed at conclusion
