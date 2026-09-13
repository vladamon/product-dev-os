---
name: measure
description: Use this skill when the user invokes `/product:measure`, wants to set up measurement for a shipped or about-to-ship feature, or needs product-level activation and retention tracking before a launch or a product-market-fit review.
---
# product:measure — Instrumentation

Use this skill when the user invokes `/product:measure [feature]` or `/product:measure product`, or wants to set up measurement before evidence is needed.

## Purpose

Plan the instrumentation that later judgments depend on. Two modes:

- **Feature mode** — `product:measure "[feature]"`. Is a shaped bet paying off? Success metric seeded from the pitch's done criteria, baseline, target, lifecycle events. Read by `product:reflect`.
- **Product mode** — `product:measure product`. Is the product as a whole working? Activation moment, active-user definition, retention cohorts, acquisition sources, revenue events. Read by `product:launch` (launch threshold) and `product:pmf` (retention). Needs no pitch — it is seeded from the product promise.

Run before or immediately after ship — evidence not planned before ship is rarely collected after.

Read recipe `recipes/16-measure.md` for the authoritative process.

## Contract
Requires:
  feature mode — docs/specs/YYYY-MM-DD-[slug]-pitch.md (required: complete done criteria), docs/specs/YYYY-MM-DD-[slug]-build.md (recommended)
  product mode — docs/product/product-model.md (required: Product Promise + Primary Users non-deferred); business-model.md, go-to-market.md (recommended)
Produces:
  feature mode — docs/product/journeys/[slug]-telemetry.md
  product mode — docs/product/journeys/product-telemetry.md
Updates: the same file in update mode when it exists

## Step 0: Verify prerequisites (gate)

**Gate override:** `--skip-gate` proceeds past any refusal below; write `gate_override: true` in the telemetry frontmatter and `Gate skipped — [check]` under False Positive Signals (`docs/conventions.md` §3).

Determine the mode first: the argument `product` (or "whole product", "activation", "retention") → product mode; anything else → feature mode.

**Feature mode — pitch exists with done criteria:**

The pitch's done criteria are the seed for the primary metric. Without them, this skill is guessing.

If no pitch matches the feature:
```
✗ Cannot run product:measure yet.

No pitch found for "[feature]".

Run this first:
  product:shape "[feature]"

Or, if you want product-level activation and retention (no pitch needed):
  product:measure product
```
Then STOP.

If the pitch exists but has no done criteria (empty or placeholder section):
```
✗ Pitch [slug]-pitch.md has no done criteria to measure against.

Run: product:shape pro to complete the pitch, or edit the pitch directly to add
at least one specific, testable done criterion.
```
Then STOP.

**Product mode — product promise exists:**

If `docs/product/product-model.md` is missing or Product Promise / Primary Users are `[deferred]`:
```
✗ Cannot run product:measure product yet.

Missing requirements:
  - docs/product/product-model.md [missing OR Product Promise / Primary Users deferred]

Run this first:
  product:discover lite   (new product)  or  product:audit lite   (existing product)

Why this matters:
  Activation is the moment a user first gets the value the product promises.
  Without a written promise, "activated" gets defined as "signed up".
```
Then STOP.

## Step 1: Identify the target

**Feature mode.** If no feature specified: find the most recent build file without a corresponding telemetry file and ask "Are we setting up measurement for '[feature]'?" If a name is passed: find the matching pitch and build file.

**Product mode.** If `product-telemetry.md` exists, enter update mode: "Product telemetry exists from [date]. I'll update definitions, baselines, and targets."

## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Feature mode, build file has an instrumentation plan → default to `pro`, announce: "Defaulting to pro — build file has an instrumentation plan. Run lite? (y/n)"
3. Product mode, a `*-launch.md` exists or users are live → default to `pro`, announce: "Defaulting to pro — live users; cohorts and acquisition sources matter now. Run lite? (y/n)"
4. Otherwise → ask: "Run **lite** (primary metric + baseline + target, ~5 min) or **pro** (full event plan, secondary metrics, cohorts, review cadence, ~15 min)?"

## Step 3: Read context

**Feature mode**
1. Shaped pitch — done criteria (these become the success metrics)
2. Build checklist — instrumentation plan section if present
3. Related journey in `docs/product/journeys/` — for event naming

**Product mode**
1. `product-model.md` — Product Promise (defines the activation moment), Core Objects (event names)
2. `business-model.md` — revenue model (trial, subscription, upgrade events), ARPU and churn assumptions (targets)
3. `go-to-market.md` — inner-ring channels (acquisition source values)
4. Onboarding or primary journeys in `docs/product/journeys/`
5. Codebase — detect an analytics SDK (PostHog, Plausible, GA, Amplitude, Mixpanel, Segment, etc.)

## Step 4: Show context summary

```
product:measure — [feature "[Feature Name]" | product mode]

[Feature] Done criteria from pitch (these become success metrics):
  [list]
[Product] Promise: "[product promise]" → candidate activation moment: [guess]
          Revenue model: [from business-model or "none"]  Channels: [from go-to-market or "none"]

Instrumentation already planned: [events, or "none specified"]
Analytics tool detected: [name | none — events will need an instrumentation layer]

Will ask about: [list]

Correct anything?
```

Wait for confirmation.

## Step 5: Conduct the interview

**Feature mode — lite (3 questions):**
1. "Based on the done criteria, what is the single number that would tell you this feature is working?"
2. "What is the baseline for that number right now — before the feature shipped (or an estimate if it hasn't)?"
3. "What target would make you confident the bet paid off?"

**Feature mode — pro adds (see `recipes/16-measure.md`):**
4. "What secondary metrics matter? (Leading indicators that can move before the primary does.)"
5. "What would a false positive look like — the primary metric looks good for the wrong reason?"
6. "What events should fire? At minimum: entered, completed, abandoned, error."
7. "When will you first review these numbers? Day 1? Day 7? Day 30?"

**Product mode — lite (4 questions):**
1. "What is the moment a new user first gets the value your product promises? That's the activation event — not signup."
2. "What counts as an *active* user — which action, and how often does the underlying problem naturally occur (daily, weekly, monthly)?"
3. "What activation rate (activated ÷ signed up) and week-4 retention would tell you it's working? Baseline if you have one."
4. "Which analytics tool will record these — or what's the simplest way to count them by hand at first?"

**Product mode — pro adds:**
5. "How will you know where each signup came from — UTM, referrer, or a 'how did you hear about us' question?"
6. "Which revenue events matter — trial started, converted, upgraded, churned?"
7. "What is your one north-star number for the next 3 months?"
8. "What would a false positive look like — e.g. activations from your own test accounts or a launch-day spike?"
9. "When will you review cohorts — weekly for the first 8 weeks?"

**Event naming (pro, both modes):** for each journey step touched, confirm or define:
```
Journey step: "User creates their first invoice"
→ Proposed event: invoice_created   Properties: { user_id, is_first, source }
   Confirm or rename?
```

## Step 6: Produce the artifact

Update mode if the file exists: update baselines and add events; never delete historical baselines — append a dated note.

**Feature mode** — `docs/product/journeys/[feature-slug]-telemetry.md`:

```
---
type: telemetry
scope: feature
product: [Product Name]
feature: [Feature Name]
tier: [lite|pro]
status: active
created: [date]
updated: [date]
skill: product:measure
related:
  pitch: docs/specs/[date]-[feature]-pitch.md
  build: docs/specs/[date]-[feature]-build.md
---

# Measurement: [Feature Name]

## Primary Metric
| Metric | Baseline | Target | Current |
|--------|----------|--------|---------|
| [name] | [value] | [value] | [fill after ship] |

## Secondary Metrics
[pro: table; lite: [deferred]]

## Analytics Events
[pro: table; lite: [deferred]]
| Event | When fired | Properties |
|-------|-----------|-----------|

## False Positive Signals
[pro; lite: [deferred]]

## Review Cadence
[day 1 / day 7 / day 30 and the question asked at each]
```

**Product mode** — `docs/product/journeys/product-telemetry.md`:

```
---
type: telemetry
scope: product
product: [Product Name]
tier: [lite|pro]
status: active
created: [date]
updated: [date]
skill: product:measure
related:
  product_model: docs/product/product-model.md
  business_model: docs/product/business-model.md
  go_to_market: docs/product/go-to-market.md
---

# Product Measurement: [Product Name]

## Activation
**Activation event:** [event] — [the value moment, in the product promise's words]
| Metric | Baseline | Target | Current |
|--------|----------|--------|---------|
| Activation rate (activated ÷ signups) | | | |
| Time to activation (median) | | | |

## Active User Definition
[Action] at least [N times] per [natural frequency of the problem]

## Retention
Weekly signup cohorts. Report % still active at W1 / W4 / W8. Target W4: [value]
| Cohort (week of) | Signups | W1 | W4 | W8 |
|---|---|---|---|---|

## North Star
[pro: one number for the next 3 months; lite: [deferred]]

## Acquisition Sources
[pro: how source is captured + source values from go-to-market; lite: [deferred]]

## Revenue Events
[pro: trial_started, subscription_activated, upgraded, churned …; lite: [deferred]]

## Analytics Events
| Event | When fired | Properties |
|-------|-----------|-----------|

## False Positive Signals
[pro; lite: [deferred]]

## Review Cadence
[weekly cohort review for 8 weeks, then monthly; first product:pmf after 4–8 weeks of usage]
```

## Step 7: Summarize

```
Measurement setup complete → docs/product/journeys/[slug | product]-telemetry.md

[Feature] Primary metric: [name]  Baseline: [value] → Target: [value]
[Product] Activation: [event]  Active = [definition]  W4 retention target: [value]
Events defined: [N] (pro) / [deferred] (lite)
Analytics tool: [name | none — add an instrumentation layer before launch]

Recommended next step:
  [Feature] After data has collected:  product:reflect "[feature]"
  [Product, pre-launch]                product:launch
  [Product, users live 4–8 weeks]      product:pmf
```

## Fallback questions (if recipe unavailable)
1. "What is the one number that would tell you this is working?"
2. "What is the current baseline for that number?"
3. "What target would make you confident the bet paid off?"
4. "What events should fire? Cover: entered, completed, abandoned, error."
5. "When will you review these numbers for the first time?"

## Artifact naming
Living documents, updated in place. One telemetry file per feature slug; exactly one `product-telemetry.md` per product.

## Rules

- A primary metric (feature) or activation event (product) is mandatory. "We'll figure it out later" is not acceptable.
- Baseline must be established before or at ship. A target without a baseline is not measurable.
- Feature events cover the minimum lifecycle: entered, completed, abandoned, error.
- Activation is a value moment, never signup or login.
- The active-user definition matches the natural frequency of the problem — a monthly-invoicing tool is not judged on daily actives.
- If no analytics infrastructure exists, flag it explicitly: "No analytics tool detected — these events need an instrumentation layer before data can be collected."
- Never skip this skill because "we'll measure later."
