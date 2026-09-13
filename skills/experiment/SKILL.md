---
name: experiment
description: Use this skill when the user invokes `/product:experiment`, wants a cheap test for a risky assumption before building, wants to check if people will pay before building, or needs to record the result of a test that ran.
---
# product:experiment — Assumption Test

Use this skill when the user invokes `/product:experiment` or asks to design a cheap test for a risky assumption before building.

## Purpose

Test the riskiest assumption with the cheapest viable experiment before committing to a build. Produces `docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md` and records its verdict in the assumption map. Sits between the validation skills (`discover`, `critique`, `interview`, `viability`, `gtm`) and `product:model` / `product:shape`.

Read recipe `recipes/03b-experiment.md` for the authoritative process. The assumption map format is `docs/conventions.md` §5.

## Contract
Requires: docs/product/assumptions.md with at least one untested high-risk row (Risk `high`, Verdict blank or `pending`)
Produces: docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md
Updates: docs/product/assumptions.md — Test and Verdict columns of the tested row (on design, and again on `record`)

## Step 0: Verify prerequisites (gate)

1. If `docs/product/assumptions.md` does not exist:
   ```
   ✗ Cannot run product:experiment yet.

   Missing requirements:
     - docs/product/assumptions.md is missing

   Run this first:
     product:discover   (new product)
     product:audit      (existing product)
   ```
   Then STOP.

2. Find untested high-risk rows per the gate rule (legacy `Risk: high` list lines count). If none:
   ```
   ✗ Cannot run product:experiment yet.

   docs/product/assumptions.md has no untested high-risk assumptions.

   Either: run product:critique or product:discover pro to pressure-test the ratings,
   or: proceed to product:model / product:shape — nothing high-risk is waiting on a test.
   ```
   Then STOP.

3. If several qualify, list them by ID and ask: "Which one are we testing? Pick the one whose invalidation would kill the most downstream work."

**Gate override:** `--skip-gate` proceeds; write `gate_override: true` in the experiment frontmatter and `Gate skipped — [check]` in its Setup section.

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `assumptions.md` has 3+ untested high-risk rows → default to `pro`, announce: "Defaulting to pro — multiple high-risk assumptions; tighter design matters. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (method + threshold + time budget, ~5 min) or **pro** (full design with false-positive guards and audience, ~15 min)?"

## Step 2: Read context

1. **`docs/product/assumptions.md`** — the target row verbatim (ID, text, type, evidence so far)
2. **Prior experiments** — `docs/specs/*-experiment.md` for related assumptions, to avoid duplicates
3. **Related work** — the latest critique (its "cheapest test"), interview syntheses (evidence), `go-to-market.md` (channels for smoke tests), `business-model.md` (price for pre-sales)
4. **User-specified files** (from `from`, `using`, or natural mention)

## Step 3: Show context summary

```
product:experiment — designing test for A[n]: "[assumption text]"

Type: [desirability | viability | feasibility | usability | distribution | trust]
Evidence so far: [Evidence column]
Suggested by critique: [cheapest test, or "no critique"]

Prior experiments for this product: [N] — [slugs or "none"]

Will ask about: method, threshold, time budget, audience, false-positive guards

Correct anything?
```

Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/03b-experiment.md` and follow the lite or pro set.

- **Method selection — always:** show the six-method table from the recipe; match method to assumption type. Viability rows ("they will pay") default toward **pre-sale**; distribution rows toward **smoke test**.
- **Cheapest viable version — always push:** "Is there a version of this that's half the work and still gives signal?"
- **Verdict criteria — always elicit before running:** the numeric or observable signal for validated vs. invalidated. If the founder cannot state it, the experiment is unrunnable — push back.

## Step 5: Produce the artifact

Write `docs/specs/[today]-[assumption-slug]-experiment.md` using the structure in the recipe. Slug: kebab-case, 3–5 words from the assumption ("Solo developers will pay for an AI product OS" → `solo-devs-pay-for-os`).

Initial frontmatter: `status: planned`, `verdict: pending`, `assumption_id: A[n]`, `conclude_by: <created + time budget>`; `ran:` and `concluded:` blank. Set `status: running` and `ran:` when the founder says the experiment has started. `product:next` and `product:checkin` flag a running experiment past `conclude_by`.

## Step 6: Update assumptions.md

On the tested row set:
- `Test` → `[method] → docs/specs/[date]-[slug]-experiment.md`
- `Verdict` → `pending`

Update frontmatter `updated:`.

## Step 7: Summarize

```
Experiment designed → docs/specs/[date]-[slug]-experiment.md

Assumption: A[n] — [short text]
Method: [method]
Success threshold: [threshold]
Time budget: [days] — conclude by [date]

Recommended next step:
  Run the experiment within the time budget.
  When results are in:  product:experiment record [slug]
```

## Mode: record

Invoked as `product:experiment record [slug]`. Open the experiment file and ask, one at a time:

1. "What were the raw results? Numbers and observations."
2. "Did you meet the success threshold? Yes / No / Inconclusive."
3. "Did any false-positive signal show up?"
4. "Verdict: validated / invalidated / inconclusive."
5. "What does this change?"

Update the experiment file: frontmatter `status: complete`, `verdict: <value>`, `concluded: <today>`; fill Results, Verdict, What this changes.

Update `assumptions.md` on the row: `Verdict` → the verdict; append the result to `Evidence` (e.g. `pre-sale: 4/15 paid deposit → [file]`).

Summarize with routing:
```
Verdict recorded: A[n] — [verdict]

Recommended next step:
  validated    → product:viability / product:gtm if missing, otherwise product:model
  invalidated  → product:critique (re-run with this result) or product:discover with a new framing
  inconclusive → redesign: product:experiment, or waive explicitly in assumptions.md
                 (Verdict: waived — <reason>) and proceed at acknowledged risk
```

## Fallback questions (if recipe unavailable)
1. "Which high-risk assumption are we testing? Read it back verbatim with its ID."
2. "Which method fits — landing page / concierge / wizard of oz / fake door / smoke test / pre-sale?"
3. "What would 'validated' look like? Specific, observable, numeric if possible."
4. "What is the hard time budget — days, not weeks?"
5. "What will the verdict change about your next move?"

## Artifact naming
Point-in-time. One file per experiment; only Results, Verdict, What this changes, and status/verdict/concluded frontmatter are filled later by `record`. A redesigned experiment is a new date-prefixed file.

## Rules

- An assumption that can't produce a binary verdict is not testable. Sharpen it before designing.
- The method is one of the six — combinations dilute the signal.
- The success threshold is set before the experiment runs, never interpreted after. Reject "we'll see how it feels."
- For "will they pay", asking people is not a test — money, a deposit, or a signed commitment is.
- If the experiment turns into a real product build, it is no longer an experiment — flag it and redirect to `product:shape`.
- Recording verdicts is mandatory. An experiment without a recorded verdict is a story you tell yourself.
