---
name: product:experiment
description: Use this skill when the user invokes `/product:experiment` or asks to design a cheap test for a risky assumption before building.
---
# product:experiment — Assumption Test

Use this skill when the user invokes `/product:experiment` or asks to design a cheap test for a risky assumption before building.

## Purpose

Test the riskiest assumption with the cheapest viable experiment before committing to a build. Produces `docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md`. This skill sits between `product:discover` (or `product:audit`) and `product:shape`.

Read recipe `recipes/03b-experiment.md` for the authoritative process.

## Contract
Requires: docs/product/assumptions.md (required) with at least one assumption marked `Risk: high`
Produces: docs/specs/YYYY-MM-DD-[assumption-slug]-experiment.md
Updates: docs/product/assumptions.md (appends verdict to the corresponding row after the experiment runs)

## Step 0: Verify prerequisites (gate)

1. Read `docs/product/assumptions.md`. If the file does not exist:
   ```
   ✗ Cannot run product:experiment yet.

   Missing requirements:
     - docs/product/assumptions.md is missing

   Run this first:
     product:discover   (new product)
     product:audit      (existing product)
   ```
   Then STOP.

2. Read the file and look for at least one assumption with `Risk: high` or in the "Riskiest Assumptions" section. If none:
   ```
   ✗ Cannot run product:experiment yet.

   docs/product/assumptions.md has no high-risk assumptions to test.

   Either: run product:discover pro to deepen the assumption map,
   or: skip experiment and proceed to product:shape if you're proceeding on faith
       (acknowledge the risk in the pitch).
   ```
   Then STOP.

3. If multiple high-risk assumptions exist, list them and ask: "Which assumption are we testing? Pick the one whose invalidation would kill the most downstream work."

If all checks pass, proceed.

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `assumptions.md` has 3+ high-risk assumptions → default to `pro`, announce: "Defaulting to pro — multiple high-risk assumptions; tighter experiment design matters. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (method + threshold + time budget, ~5 min) or **pro** (full design with false-positive guards and audience, ~15 min)?"

## Step 2: Read context

**1. `docs/product/assumptions.md`** — read fully, identify the target assumption verbatim
**2. Prior experiments:** scan `docs/specs/*-experiment.md` — note any prior experiments for related assumptions to avoid duplication
**3. User-specified files** (from `--from`, `--using`, or natural mention) — any prior notes, competitor screenshots, drafts

## Step 3: Show context summary

```
product:experiment — designing test for "[assumption text]"

Source: docs/product/assumptions.md (line [N])
Risk type: [desirability | viability | feasibility | usability | distribution | trust]
Risk level: high

Prior experiments for this product: [N] — [list slugs or "none"]

Will ask about: method, threshold, time budget, audience, false-positive guards

Correct anything?
```

Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/03b-experiment.md`. Follow lite or pro question set.

**Method selection — always ask:** Show the five-method table from the recipe and ask which one fits.

**Cheapest viable version — always push:** After the user proposes a method, ask: "Is there a version of this that's half the work and still gives signal?" Most first drafts overreach.

**Verdict criteria — always elicit:** What numeric or observable signal would count as validated vs. invalidated? If the user cannot answer this before running, the experiment is unrunnable. Push back.

## Step 5: Produce the artifact

Write `docs/specs/[today's date]-[assumption-slug]-experiment.md` using the structure in `recipes/03b-experiment.md`.

Derive `assumption-slug` from the assumption text: kebab-case, 3–5 words. Example assumption "Solo developers will pay for an AI product OS" → slug `solo-devs-pay-for-os`.

Initial frontmatter:
- `status: planned`
- `verdict: pending`
- `ran:` and `concluded:` left blank — filled in later

## Step 6: Update assumptions.md

Append to the relevant assumption row in `docs/product/assumptions.md`:
```
Test method: [method] → see docs/specs/[date]-[slug]-experiment.md
Verdict: pending
```

This keeps the assumption map as the single index — every high-risk assumption links to its experiment.

## Step 7: Summarize

```
Experiment designed → docs/specs/[date]-[slug]-experiment.md

Assumption: [short text]
Method: [method]
Success threshold: [threshold]
Time budget: [days]

Recommended next step:
  Run the experiment within the time budget.

  When the verdict is in, re-invoke this skill to record the result:
    product:experiment record "[slug]"

  Then:
    Validated → product:shape "[feature]"
    Invalidated → assumption killed; revisit product:discover or product:model
    Inconclusive → redesign experiment or proceed at acknowledged risk
```

## Recording results (post-run)

If invoked with `record` and a slug — e.g. `product:experiment record solo-devs-pay-for-os` — open the existing experiment file and conduct a short interview:

1. "What were the raw results? (Numbers, observations.)"
2. "Did you meet the success threshold? Yes / No / Inconclusive."
3. "Did any false-positive signal show up?"
4. "Verdict: validated / invalidated / inconclusive."
5. "What does this change?"

Update the file's frontmatter (`status: complete`, `verdict: <value>`, `concluded: <today>`) and the Results, Verdict, and "What this changes" sections.

Also update `docs/product/assumptions.md` — change the verdict on the corresponding row from `pending` to the actual verdict.

## Fallback questions (if recipe unavailable)
1. "Which high-risk assumption are we testing? Read it back verbatim."
2. "What method fits — landing page / concierge / wizard of oz / fake door / smoke test?"
3. "What would 'validated' look like? Specific, observable, numeric if possible."
4. "What is the hard time budget — days, not weeks?"
5. "What will the verdict actually change about your next move?"

## Rules

- An assumption that can't produce a binary verdict is not testable. Sharpen it before designing the experiment.
- The method must be one of the five — combinations dilute the signal. If the user wants to combine, push them to pick the most important one.
- The success threshold is set before the experiment runs, not interpreted after. Reject "we'll see how it feels."
- If the experiment ships as a real product instead of a test, it's no longer an experiment — flag this and redirect to `product:shape`.
- Recording verdicts is mandatory. An experiment without a recorded verdict is a story you tell yourself.
