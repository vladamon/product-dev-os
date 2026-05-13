# product:reflect — Retrospective

Use this skill when the user invokes `/product:reflect` or asks to do a retrospective after shipping a feature.

## Purpose

Close the loop on a shipped feature. Gather evidence. Force a decision. Produces `docs/specs/YYYY-MM-DD-[feature]-retro.md`.

Read recipes `recipes/17-retrospective.md` and `recipes/16-measure.md` for the authoritative process.

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-pitch.md (required), docs/specs/YYYY-MM-DD-[slug]-build.md (recommended), docs/product/journeys/[slug]-telemetry.md (recommended)
Produces: docs/specs/YYYY-MM-DD-[slug]-retro.md
Updates: nothing (new date-prefixed file per run)

## Step 1: Identify the feature

If no feature specified:
- Read `docs/specs/` and find the most recent build file without a corresponding retro file
- Ask: "Are we reflecting on '[feature name]'?"

If a feature name is passed: search for matching pitch and build files.

## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Build file found for this feature → default to `pro`, announce: "Defaulting to pro — build file found. Run lite? (y/n)"
3. Only pitch found, no build file → default to `lite`, announce: "Defaulting to lite — no build file found. Run pro? (y/n)"
4. Otherwise → ask: "Run **lite** (what shipped + decision, ~5 min) or **pro** (full retrospective with evidence and next slice, ~15 min)?"

## Step 3: Read context

**1. User-specified files** (metrics exports, user feedback docs, analytics — from `--from`, `--using`, or `docs/intake/`)
**2. Shaped pitch:** `docs/specs/[date]-[feature]-pitch.md` — read the done criteria and expected outcomes
**3. Build checklist:** `docs/specs/[date]-[feature]-build.md`

## Step 4: Show context summary

```
product:reflect — retrospective for "[Feature Name]"

Pitch found: [date] — done criteria: [N]
Build checklist: [found/not found]
Evidence files: [list any intake or specified files]

Done criteria from pitch:
  [list each criterion]

Will ask about: what happened, evidence, decision
```

## Step 5: Conduct the interview

Read `recipes/17-retrospective.md` for the exact question set. Follow lite or pro version.

**For every done criterion in the pitch, ask:**
"[Criterion] — did this happen? What evidence do you have?"

This is the core of the retrospective. The pitch made a bet. The retrospective asks if the bet paid off.

**Always ask the decision question (even in lite):**
"Based on what you know now: Continue (build on it) / Improve (fix specific problems) / Simplify (cut back) / Pivot (different approach) / Kill (doesn't work, remove it)?"

Push back on non-answers: "I need a decision, not a 'let's wait and see.' Which is it?"

## Step 6: Produce the artifact

Write `docs/specs/[today's date]-[feature-slug]-retro.md`.

Use this structure:

```markdown
---
type: retro
product: [Product Name]
feature: [Feature Name]
tier: [lite|pro]
status: complete
created: [date]
updated: [date]
skill: product:reflect
related:
  pitch: docs/specs/[date]-[feature]-pitch.md
  build: docs/specs/[date]-[feature]-build.md
---

# Retrospective: [Feature Name]

## What Shipped
[One sentence]

## What We Expected
[Done criteria from the pitch]

## What Happened
[Actual outcomes vs. expected]

## Evidence
[Quantitative and qualitative evidence]

## Problems Found
[Issues discovered post-ship]

## Decision
**[Continue / Improve / Simplify / Pivot / Kill]**
[Rationale]

## Next Slice
[What to shape next, if applicable]
```

## Step 7: Summarize

```
Retrospective complete → docs/specs/[date]-[slug]-retro.md

Decision: [DECISION]
[One sentence rationale]

Recommended next step:
  [If continue/improve]: product:shape "[next feature]"
  [If pivot]: product:shape "[different approach]"
  [If kill]: Plan removal of [feature] from the product
  [If simplify]: product:shape "[simplified version]" with explicit no-gos for cut parts
```

## Artifact naming
Point-in-time artifact — never overwritten. If `docs/specs/` already contains a retro for this slug, create a new date-prefixed file. Both versions are preserved. `product:next` shows all versions grouped by slug.

## Rules

- A decision is mandatory. "Need more data" is not a decision — it is avoidance. Push for a decision with whatever evidence exists.
- If the decision is "kill" — acknowledge that this is the right call when warranted and help define the removal plan.
- Done criteria from the pitch must be explicitly evaluated — not glossed over.
- The next slice must be specific enough to be shaped immediately. Not "do more work on X" — but "shape [specific thing]."
