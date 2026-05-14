---
name: product:measure
description: Use this skill when the user invokes `/product:measure [feature]` or wants to set up measurement for a shipped or about-to-ship feature.
---
# product:measure — Feature Instrumentation

Use this skill when the user invokes `/product:measure [feature]` or wants to set up measurement for a shipped or about-to-ship feature.

## Purpose

Set up instrumentation to measure whether a shaped bet is paying off. Define success metrics, specify analytics events, establish baselines, and set targets. Run after `product:build`, before or immediately after ship — so that `product:reflect` has evidence to evaluate.

Read recipe `recipes/16-measure.md` for the authoritative process.

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-pitch.md (required), docs/specs/YYYY-MM-DD-[slug]-build.md (recommended)
Produces: docs/product/journeys/[slug]-telemetry.md
Updates: docs/product/journeys/[slug]-telemetry.md (in update mode if the feature ships iterations)

## Step 1: Identify the feature

If no feature specified:
- Read `docs/specs/` and find the most recent build file without a corresponding telemetry file
- Ask: "Are we setting up measurement for '[feature name from latest build]'?"

If a feature name is passed: search `docs/specs/` for a matching pitch and build file.

## Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Build file found with an instrumentation plan section → default to `pro`, announce: "Defaulting to pro — build file has an instrumentation plan. Run lite? (y/n)"
3. Only pitch found, no build file → default to `lite`, announce: "Defaulting to lite — no build file found. Run pro? (y/n)"
4. Otherwise → ask: "Run **lite** (primary metric + baseline + target, ~5 min) or **pro** (full event plan + secondary metrics + review cadence, ~15 min)?"

## Step 2: Read context

**1. Shaped pitch:** `docs/specs/[date]-[feature]-pitch.md` — read done criteria (these become the success metrics)
**2. Build checklist:** `docs/specs/[date]-[feature]-build.md` — read instrumentation plan section if present
**3. Related journey:** `docs/product/journeys/` — find journeys this feature affects (for event naming)

## Step 3: Show context summary

```
product:measure — setting up measurement for "[Feature Name]"

Done criteria from pitch (these become success metrics):
  [list each done criterion]

Instrumentation plan from build:
  [list planned events, or "none specified"]

Related journey: [name if found, or "not found"]

Will ask about: [primary metric, baseline, target, events]

Correct anything?
```

Wait for confirmation.

## Step 4: Conduct the interview

**Lite — 3 questions:**
1. "Based on the done criteria, what is the single number that would tell you this feature is working?"
2. "What is the baseline for that number right now — before the feature shipped (or an estimate if it hasn't)?"
3. "What target would make you confident the bet paid off?"

**Pro — additional questions (read `recipes/16-measure.md` for full set):**
4. "What secondary metrics matter? (Numbers that could move even if the primary doesn't — leading indicators.)"
5. "What would a false positive look like — the primary metric looks good but for the wrong reason?"
6. "What events should fire when a user interacts with this feature? At minimum: entered, completed, abandoned, error."
7. "When will you review these numbers for the first time? Day 1? Day 7? Day 30?"

**Event naming (pro only):**
For each step in the related journey that this feature touches, confirm or define the analytics event:
```
Journey step: "User submits the form"
→ Proposed event: [feature]_form_submitted
   Properties: { user_id, duration_ms, [domain-specific fields] }
   Confirm or rename?
```

## Step 5: Produce the artifact

Check if `docs/product/journeys/[feature-slug]-telemetry.md` already exists. If so, enter update mode: "A telemetry doc exists from [date]. I'll update baselines and add new events."

Write `docs/product/journeys/[feature-slug]-telemetry.md`:

```
---
type: telemetry
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
[pro: table of secondary metrics; lite: mark as [deferred]]

## Analytics Events
[pro: table of events + properties; lite: mark as [deferred]]

| Event | When fired | Properties |
|-------|-----------|-----------|
| [event_name] | [trigger] | [key properties] |

## False Positive Signals
[pro: what looks good but isn't; lite: mark as [deferred]]

## Review Cadence
[When to check: day 1, day 7, day 30, and what question to ask at each checkpoint]
```

## Step 6: Summarize

```
Measurement setup complete → docs/product/journeys/[slug]-telemetry.md

Primary metric: [metric name]
Baseline: [value] → Target: [value]
Events defined: [N] (pro) / [deferred] (lite)

Recommended next step:
  After sufficient data has collected:
  product:reflect "[feature name]" — to evaluate against these metrics

  Pass this file as context:
  product:reflect using docs/product/journeys/[slug]-telemetry.md
```

## Fallback questions (if recipe unavailable)
1. "What is the one number that would tell you this feature is working?"
2. "What is the current baseline for that number (before the feature shipped)?"
3. "What target would make you confident the bet paid off?"
4. "What events should fire when a user interacts with this feature? Cover: entered, completed, abandoned, error."
5. "When will you review these numbers for the first time?"

## Rules

- A primary metric is mandatory. "We'll figure it out later" is not acceptable — the shaped pitch has done criteria, and at least one maps to a measurable number.
- Baseline must be established before or at ship. A target without a baseline is not measurable.
- Events must cover the minimum lifecycle: entered, completed, abandoned, error.
- If no analytics infrastructure exists in the project, flag it explicitly: "No analytics tool detected in the codebase — these events will need an instrumentation layer before data can be collected."
- Never skip this skill because "we'll measure later." Evidence not planned before ship is rarely collected after.
