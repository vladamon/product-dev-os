---
name: product:build
description: Use this skill when the user invokes `/product:build` or asks to verify a feature is ready to build.
---
# product:build — Build Readiness

Use this skill when the user invokes `/product:build` or asks to verify a feature is ready to build.

## Purpose

Verify that a shaped feature has everything needed to start building. Run the build checklist. Optionally produce an architecture skeleton. Produces `docs/specs/YYYY-MM-DD-[feature]-build.md`.

Read recipes `recipes/14-build-checklist.md` and `recipes/13-technical-architecture.md` for the authoritative process.

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-pitch.md (required), docs/screens/ matching the feature (recommended)
Produces: docs/specs/YYYY-MM-DD-[slug]-build.md
Updates: nothing (new date-prefixed file per run)

## Step 1: Identify the feature

If the user invoked `product:build` without specifying a feature:
- Read `docs/specs/` and find the most recent pitch file without a corresponding build file
- Ask: "Are we building the readiness check for '[feature name from latest pitch]'?"

If a feature name is passed: search `docs/specs/` for a matching pitch file.

## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (readiness checklist only, ~5 min) or **pro** (checklist + architecture skeleton + instrumentation plan, ~15 min)?"

## Step 3: Read context

**1. Shaped pitch:** `docs/specs/[date]-[feature]-pitch.md` — read fully
**2. Screen specs:** `docs/screens/` — find screens related to this feature (match by feature name)
**3. Product model:** `docs/product/product-model.md`
**4. Codebase structure** (for pro architecture section):
   - Run: `find . -type d -not -path '*/node_modules/*' -not -path '*/.git/*' | head -40`
   - Look for existing feature/domain folder patterns

## Step 4: Show context summary

```
product:build — checking readiness for "[Feature Name]"

Found:
  Pitch: [date]-[feature]-pitch.md ✓
  Screen specs: [list matching screens or "none found"]
  Product model: [found/not found]

Done criteria from pitch:
  [list done criteria]

Will check: [list checklist sections to run]

Correct anything?
```

## Step 5: Run the checklist

Work through `recipes/14-build-checklist.md` systematically.

For each item, check it against what you found in Step 3. For items that can be verified by reading existing files (e.g., "all screens have loading states specced"), do so automatically. Only ask the user about items that require judgment or information not in the docs.

Flag any failures:
```
✗ Screen spec for "pipeline-builder-wizard" is missing the error state.
  Fix before building, or proceed anyway? (fix / proceed / defer)
```

## Step 6: Architecture skeleton (pro only)

Read `recipes/13-technical-architecture.md`.

Based on the pitch + codebase structure, propose a file structure:

```
Proposed structure for [Feature Name]:

New files:
  domain/[object]/types.ts          — TypeScript types for [object]
  domain/[object]/service.ts        — API calls + data transformation
  features/[feature]/index.tsx      — Route component
  features/[feature]/[Screen].tsx   — [description]
  components/domain/[Component].tsx — [description]

Modified files:
  [existing file] — [what changes]
```

Ask: "Does this structure fit your codebase patterns, or should we adjust?"

## Step 7: Instrumentation plan (pro only)

Based on the shaped pitch and journeys, propose events to track:

```
Instrumentation plan:

Event                    | When it fires              | Properties
-------------------------|----------------------------|------------
[feature]_started        | User enters the flow       | user_id
[feature]_step_completed | User completes step N      | step, duration
[feature]_completed      | User finishes the journey  | duration, method
[feature]_abandoned      | User exits without finish  | last_step
[feature]_error          | Error occurs               | error_type, step
```

## Step 8: Produce the artifact

Write `docs/specs/[today's date]-[feature-slug]-build.md` using `templates/build-checklist.md`.

## Step 9: Summarize

```
Build readiness complete → docs/specs/[date]-[slug]-build.md

Status: [Ready to build / [N] blockers found]

Blockers to fix: [list if any]
```

[If blockers]: Fix the [N] blockers above, then re-run `product:build`.

[If ready]:
```
Implementation handoff:
  All specs are ready. To turn this build doc into an executable plan:

  If using superpowers: invoke `writing-plans` and pass:
    - This build file:  docs/specs/[date]-[slug]-build.md
    - The shaped pitch: docs/specs/[date]-[slug]-pitch.md
    - Screen specs:     docs/screens/[matching screens]

  The architecture skeleton above maps directly to a task decomposition —
  "New files" → create tasks, "Modified files" → modify tasks.

  Or run `product:measure "[feature]"` first if instrumentation is not yet set up.
```

## Artifact naming
Point-in-time artifact — never overwritten. If `docs/specs/` already contains a build file for this slug, create a new date-prefixed file for this run. Both versions are preserved. `product:next` will show all versions grouped by slug, with the newest marked as current.

## Rules

- Do not mark a feature as "ready to build" if any screen spec is missing required states.
- Architecture proposals are suggestions — the implementer adapts them to the actual codebase.
- Instrumentation events should cover: start, key steps, completion, abandonment, and errors.
