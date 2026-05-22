---
name: product:shape
description: Use this skill when the user invokes `/product:shape [feature idea]` or asks to scope, plan, or define a feature before building it.
---
# product:shape — Feature Scoping

Use this skill when the user invokes `/product:shape [feature idea]` or asks to scope, plan, or define a feature before building it.

## Purpose

Shape a bounded, buildable feature slice. Define appetite, solution outline, what's explicitly in and out, risks, rabbit holes, and done criteria. Produces `docs/specs/YYYY-MM-DD-[feature]-pitch.md`.

Read recipe `recipes/09-shaped-pitch.md` for the authoritative process.

## Contract
Requires: docs/product/product-model.md (required: Core Objects + Lifecycle States non-deferred), docs/product/journeys/ (recommended), docs/specs/*-experiment.md with verdict (required if assumptions.md has untested high-risk assumptions)
Produces: docs/specs/YYYY-MM-DD-[slug]-pitch.md
Updates: nothing (new date-prefixed file per run; see Artifact naming)

## Step 0: Verify prerequisites (gate)

This skill commits you to building. The gate enforces that you've done the upstream work that prevents wasted builds.

**Check 1 — product model exists and has core sections complete:**

If `docs/product/product-model.md` is missing OR has `[deferred]` markers on Core Objects or Lifecycle States sections:
```
✗ Cannot run product:shape yet.

Missing requirements:
  - docs/product/product-model.md [missing OR sections deferred]
    Specifically: [Core Objects | Lifecycle States | both] not complete.

Run this first:
  product:model pro

Why this matters:
  Shaping without a model produces a pitch grounded in vague terms.
  The pitch's "what's in / what's out" will not survive contact with the codebase.
```
Then STOP. Do not proceed to Step 1.

**Check 2 — high-risk assumptions have been tested or explicitly waived:**

If `docs/product/assumptions.md` exists and contains any assumption with `Risk: high` whose row does NOT have a recorded experiment verdict (`Verdict: validated | invalidated | inconclusive` or `Verdict: waived` with a reason):
```
✗ Cannot run product:shape yet.

Untested high-risk assumption(s):
  - [verbatim assumption text]
  - [verbatim assumption text]

Run this first:
  product:experiment

Or, to proceed at acknowledged risk, edit docs/product/assumptions.md and add
`Verdict: waived — [your reason]` to each high-risk row. The reason will be
copied into the pitch's Risks section.
```
Then STOP.

**Check 3 — feature scope is named:**

If the user invoked `product:shape` without a feature name, ask for one before proceeding. Pitches without a feature name produce pitches without scope.

If all three checks pass, proceed to Step 1.

To override the gate explicitly (e.g., experimental sandbox): the user can invoke `product:shape --skip-gate "feature"`. Log the override in the pitch's frontmatter as `gate_override: true` and note in Risks: "Gate skipped — pitch may rest on incomplete upstream work."

## Step 1: Extract feature name

The feature idea is passed as an argument: `product:shape "reusable connection library"`

If no argument is given, ask: "What feature or problem are you scoping?"

Derive a kebab-case slug from the feature name for the filename: `connection-library`

## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. No product model → default to `lite`, announce: "Defaulting to lite — no product model found (for best results, run product:model first). Run pro anyway? (y/n)"
4. Otherwise → ask: "Run **lite** (problem + appetite + in/out + done criteria, ~5 min) or **pro** (full pitch with risks, rabbit holes, user flow, ~15 min)?"

## Step 3: Read context

**1. User-specified files** (from `--from`, `--using`, or natural mention)
**2. `docs/intake/`** — if exists and no files specified
**3. Product model:** `docs/product/product-model.md`
**4. Related journeys:** `docs/product/journeys/` — look for journeys this feature touches
**5. Existing pitches:** `docs/specs/` — list existing pitches to avoid overlap

## Step 4: Show context summary

```
product:shape — scoping "[Feature Name]"

Product context found:
  [product model status]
  [related journeys found]
  [existing pitches that might overlap]

Context files read:
  [any intake or specified files]

Will ask about: [what's needed for the pitch]

Correct anything?
```

Wait for confirmation.

## Step 5: Conduct the interview

Read `recipes/09-shaped-pitch.md` for the exact question set. Follow lite or pro version.

Key questions (always ask regardless of tier):
1. "What problem does this solve? Describe what happens today without this feature."
2. "How much time is this worth — meaning, if you had to cut scope to ship in that time, you would? Not an estimate — a maximum."
3. "Name 3 things that will NOT be built as part of this. Be specific."
4. "How will you know it's done? Give me 3 specific, testable criteria."

## Step 6: Produce the artifact

Write `docs/specs/[today's date]-[feature-slug]-pitch.md` using `templates/shaped-pitch.md`.

Date format: `2026-05-09`
Full filename example: `docs/specs/2026-05-09-connection-library-pitch.md`

For lite: fill in Problem, Appetite, Solution Outline, What's Included, What's Excluded, Done Means.
For pro: fill in all sections including Risks and Rabbit Holes.

## Step 7: Summarize

```
Pitch complete → docs/specs/[date]-[slug]-pitch.md

Feature: [Feature Name]
Appetite: [X weeks/days]
Inclusions: [N items]
Exclusions: [N items]
Done criteria: [N criteria]

Recommended next step:
  product:spec "[most important screen name]" — to spec the first screen
  
  Or if you want to verify build readiness first:
  product:build
```

## Fallback questions (if recipe unavailable)
1. "What problem does this solve? Describe what happens today without this feature."
2. "How much time is this worth — meaning, if you had to cut scope to ship in that time, you would? Not an estimate — a maximum."
3. "Name 3 things that will NOT be built as part of this. Be specific."
4. "What's the biggest risk — what could make this harder or take longer than expected?"
5. "How will you know it's done? Give 3 specific, testable done criteria."

## Pivot interrupt
If at any point the user signals the premise is wrong ("actually this is wrong", "I need to rethink", "let's pivot"):
1. Stop the interview immediately
2. Record what was learned so far as a partial artifact: `docs/product/[date]-[feature-slug]-partial.md` with `status: abandoned`
3. Update `docs/product/assumptions.md` — add a new entry noting the signal that triggered the pivot and why the current framing was abandoned
4. Say: "Pivot noted. New signal: [what changed]. Recommended: re-run product:shape with the corrected framing, or run product:discover if the problem statement has fundamentally changed."

## Artifact naming
Point-in-time artifact — never overwritten. If `docs/specs/` already contains a pitch for this slug, create a new date-prefixed file for this run. Both versions are preserved. `product:next` shows all versions grouped by slug, with the newest marked as current.

## Rules

- The appetite is a maximum, not an estimate. If the user says "I don't know how long it'll take," push them to define how much time it's worth.
- No-gos must be specific. Reject vague exclusions like "advanced features" — ask what specifically.
- Done criteria must be verifiable with a yes/no test. Reject criteria like "it works correctly."
- Never start writing the pitch until the interview is complete.
