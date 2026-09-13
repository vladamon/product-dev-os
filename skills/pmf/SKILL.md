---
name: pmf
description: Use this skill when the user invokes `/product:pmf` or asks "is this working?", "do I have product-market fit?", "should I pivot or quit?", "should I keep going with this product?", or wants a product-level (not feature-level) review of retention, pull, and whether to persevere, pivot, or kill.
---
# product:pmf — Product-Market Fit Review

Use this skill when the user invokes `/product:pmf` or has a live product with real users and needs to decide whether to double down, change course, or stop.

## Purpose

The product-level counterpart to `product:reflect`. Gather retention and pull evidence, exclude vanity metrics, force a fit verdict and a decision from fixed sets, and schedule the next review with thresholds that would flip the decision. Produces `docs/specs/YYYY-MM-DD-pmf.md`.

Read recipe `recipes/27-product-market-fit.md` for the authoritative process.

## Contract
Requires: product live with real users — a docs/specs/*-launch.md with `status: complete` (Results recorded), OR explicit founder confirmation
Produces: docs/specs/YYYY-MM-DD-pmf.md
Updates: nothing (recommends updates to go-to-market.md / business-model.md in the summary)

## Step 0: Verify prerequisites (gate)

**Check 1 — the product is live with real users:**

If no `*-launch.md` has `status: complete`, ask: "Is the product live, with people outside your friends using it?" If no:
```
✗ Cannot run product:pmf yet.

Missing requirements:
  - live product with real users (no recorded launch, founder confirms not live)

Run this first:
  product:launch        (plan and run a launch)
  product:launch record [slug]   (if you launched but never recorded it)

Why this matters:
  Fit is a property of real usage. Without users, this review would grade
  your expectations, not your product.
```
Then STOP.

**Check 2 — enough users to judge (warning, caps the verdict):**

If active users (core value action within the natural frequency window) are fewer than 10:
```
⚠ [N] active users — below 10.

The verdict is capped at "Too early". Retention percentages on this sample
are noise. The review will focus on pull signals and the plan to reach
10+ active users in your ICP — not on building more features.

Proceed? (y/n)
```

**Check 3 — review before the scheduled date (warning):**

If the latest `*-pmf.md` has `next_review` in the future:
```
⚠ Last review ([date]) set the next review for [next_review] with thresholds:
  [flip thresholds]

Reviewing early usually means an emotional trigger, not new evidence.
What changed? Proceed anyway? (y/n)
```

**Gate override.** `--skip-gate` proceeds past Check 1. Write `gate_override: true` into the review's frontmatter and add under Verdict: `Gate skipped — no confirmed live users; verdict rests on founder-reported usage`.

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. ≥30 active users or any paying customers → default to `pro`, announce: "Defaulting to pro — enough usage for segments and a survey. Run lite? (y/n)"
3. Fewer than 10 active users → default to `lite`, announce: "Defaulting to lite — verdict capped at Too early. Run pro? (y/n)"
4. Otherwise → ask: "Run **lite** (retention + pull + decision, ~10 min) or **pro** (adds survey, segments, revenue quality, pivot analysis, ~30 min)?"

## Step 2: Read context

**1. User-specified files** (analytics exports, billing exports, survey results — from `--from`, `--using`, or natural mention)
**2. `docs/intake/`** — if it exists and no files were specified
**3. Launch files:** `docs/specs/*-launch.md` — thresholds, results, verdicts, best channels
**4. Telemetry:** `docs/product/journeys/product-telemetry.md` first — activation event, active-user definition, retention cohorts; then feature `*-telemetry.md` files. If product telemetry is missing: `⚠ No product telemetry — retention will come from exports or manual counts. Run product:measure product before the next review.`
**5. `docs/product/business-model.md`:** price, churn assumption, income target
**6. `docs/product/go-to-market.md`:** intended ICP (for segment comparison)
**7. Evidence:** `docs/research/*-synthesis.md`, `docs/specs/*-retro.md`
**8. Prior reviews:** `docs/specs/*-pmf.md` — last verdict, decision, flip thresholds
**9. Check-ins:** latest `docs/checkins/*-checkin.md` — the "one number" trend

## Step 3: Show context summary

```
product:pmf — product-market fit review for [Product Name]

Live since: [first launch date] ([N] weeks)
Launches: [N] — last verdict [hit/partial/miss]
Active users: [N | unknown — will ask]  (definition: [core action] within [window])
Paying: [N | none | unknown]
Intended ICP: "[from go-to-market.md | not defined]"

Previous review: [date — verdict, decision, thresholds | none]
Evidence files: [telemetry, synthesis, retros, exports found]

Will ask about: retention cohorts, pull signals, [survey, segments, revenue], decision

Correct anything?
```

Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/27-product-market-fit.md`. Follow the lite or pro set. One question at a time.

**Always ask (every tier):**
1. "What is the core value action, and how often does the underlying problem naturally occur?" — defines *active*. Reject "logged in."
2. "For your earliest cohorts: what share were still doing the core action at week 1, 4, and 8?" If unknown, help compute it from exports or a manual count; if impossible, the verdict is Too early and instrumenting retention becomes the first next step.
3. "If you were starting today, knowing what you know, would you start this?" Record the answer verbatim.
4. The decision question — after the verdict is presented.

**Survey (pro):** if not run, generate the Sean Ellis survey from the recipe with the product's name, name the exact audience (core action ≥2 times, active last 2 weeks), and schedule it. Proceed with the review; the verdict cannot be **Strong** without it.

**Vanity exclusion:** when the founder cites signups, views, followers, upvotes, or praise as evidence, record the value under "Vanity metrics excluded" and ask for the retention or pull equivalent.

**Honesty protocol (conventions §8) — load-bearing:**
- Present the reviewer's verdict with the evidence *before* asking the founder's view. If the founder disagrees, record it under Verdict as `Founder disagreement: ...` — never adjust the verdict to match.
- When the sunk-cost answer is "no" or hesitant and the founder leans persevere, name it: "You said you wouldn't start this today. What evidence makes continuing different from starting?"
- Under 10 active users, do not entertain feature roadmaps. The next step is users in the ICP.

**Decision:** one of Persevere-narrow / Iterate core / Pivot (typed) / Kill. Reject "keep going and see" and "need more data" — the alternative is Persevere-narrow with flip thresholds and a date. With a Too early verdict, the decision is Persevere-narrow (defined as reaching N active ICP users by a date) or Kill.

**If Kill:** build the shutdown plan with the founder — sunset date and notice, data export, billing stop and refunds, vendor shutdown.

**Next review (always):** date (default 4–8 weeks) and flip thresholds: "If [metric] ≥ X by [date] → [decision]; if ≤ Y → [decision]."

## Step 5: Produce the artifact

Write `docs/specs/[today's date]-pmf.md` using the Output structure in `recipes/27-product-market-fit.md`.

For lite: Evidence inventory, Retention, Vanity metrics excluded, Sunk-cost answer, Verdict, Decision, Next review. Mark Survey and Segments `[deferred]`.
For pro: all sections.

Shutdown plan (kill only) carries: `Not legal/tax advice — verify contractual, refund, and data-protection obligations with a qualified professional in your jurisdiction.`

## Step 6: Update related artifacts

None written. If the decision narrows the ICP or changes pricing, the summary names `product:gtm` / `product:viability` to update those living docs in their own update mode.

## Step 7: Summarize

```
PMF review → docs/specs/[date]-pmf.md

Verdict:  [VERDICT] — [one-line evidence: e.g. "wk-8 retention flattens at 22% in agency segment"]
Decision: [DECISION] — [what changes]
Next review: [date] — flip if [threshold]

Recommended next step:
  [Too early]:        product:gtm — reach [N] active users in the ICP by [date]; no new features
  [Persevere-narrow]: product:gtm (narrow ICP to [segment]), then product:shape "[next slice for that segment]"
  [Iterate core]:     product:interview synthesize (why value isn't landing), then product:shape "[core change]"
  [Pivot]:            product:discover with the new framing ([pivot type]) — or product:critique on it first
  [Kill]:             execute the shutdown plan; product:triage to choose what's next
```

## Fallback questions (if recipe unavailable)
1. "How many people did the core value action in the last [natural frequency window]?"
2. "Of your earliest users, how many are still active after 1, 4, and 8 weeks?"
3. "What evidence of pull exists — complaints when it breaks, unprompted referrals, payment without negotiation?"
4. "If you were starting today, knowing what you know, would you start this?"
5. "Persevere-narrow, iterate core, pivot, or kill — and when do you review again?"

## Pivot interrupt
If the founder reveals the live product is no longer the product under review (already pivoted, a different core action, a different audience than all evidence reflects):
1. Stop the interview immediately
2. Record what was captured as `docs/specs/[date]-pmf-partial.md` with `status: abandoned`
3. Note in frontmatter: `pivot_signal: "[what changed]"`
4. Say: "Review paused — the evidence describes a product that no longer exists. Recommended: product:discover with the current framing, then product:launch for the new version before reviewing fit."

A founder deciding to kill mid-review is not an interrupt — continue to the shutdown plan.

## Artifact naming
Point-in-time artifact — never overwritten. Each review is a new date-prefixed file; `related.previous_review` links the chain. `product:next` and `product:checkin` read the latest file's `next_review` and flip thresholds.

## Rules

- A decision is mandatory, from the fixed set. "Need more data" becomes Persevere-narrow with a date and flip thresholds.
- Every claim ties to a number or a quote with a source file. No number, no claim.
- Vanity metrics are recorded and excluded — never counted as fit.
- Under 10 active users the verdict is Too early, and the next step is getting users, not building features.
- Strong requires flattening retention and a survey at ≥40% very disappointed with ≥30 responses.
- The reviewer's verdict comes first and is not softened for enthusiasm or time invested. Founder disagreement is recorded, not resolved by editing the verdict.
- The sunk-cost question is always asked and its answer recorded verbatim.
- Next review date and flip thresholds are mandatory.
