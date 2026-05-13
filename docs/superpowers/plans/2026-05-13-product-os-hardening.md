# Product OS Hardening Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Apply 10 hardening fixes to the product-dev-os skill system — adding contracts, fallback questions, pivot interrupts, drift detection, an implementation bridge, a measure skill, immutability rules, normalized tier resolution, screen inventory, and a quick-start guide.

**Architecture:** Each task targets a single file in `/Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os/`. All tasks are independent and can be dispatched in parallel. The `skills/` directory contains the 9 skill files, `README.md` is in the repo root.

**Tech Stack:** Markdown files only. No build step, no tests in the traditional sense. Verification = read the file and confirm the content was inserted correctly in the right location.

---

## Shared Patterns (reference for all tasks)

### Contract block format
Insert after `## Purpose` section in each skill:

```markdown
## Contract
Requires: [inputs]
Produces: [outputs]
Updates: [living docs changed, or "nothing"]
```

### Tier resolution format (replace each skill's tier detection step)

```markdown
## Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. [signal A] → default to `pro`, announce: "Defaulting to pro because [reason]. Run lite? (y/n)"
3. [signal B] → default to `lite`, announce: "Defaulting to lite because [reason]. Run pro? (y/n)"
4. Otherwise → ask: "Run **lite** ([summary], ~[N] min) or **pro** ([summary], ~[N] min)?"
```

### Pivot interrupt block (insert before `## Rules` in interview skills)

```markdown
## Pivot interrupt
If at any point the user signals the premise is wrong ("actually this is wrong", "I need to rethink", "let's pivot"):
1. Stop the interview immediately
2. Record what was learned so far as a partial artifact: `docs/product/[date]-[slug]-partial.md` with `status: abandoned`
3. Update `docs/product/assumptions.md` — add a new entry under "Discovery signals" noting what changed and why
4. Say: "Pivot noted. New signal: [what changed]. Recommended: run [appropriate skill] to restart with this framing."
```

### Immutability rule (for point-in-time skills: shape, build, reflect)

```markdown
## Artifact naming
Point-in-time artifact — never overwritten. If `docs/specs/` already contains a [type] for this slug, create a new date-prefixed file for this run. Both versions are preserved. `product:next` will show all versions grouped by slug, with the newest marked as current.
```

---

## Task 1: Create `skills/measure.md` — new product:measure skill

**Files:**
- Create: `skills/measure.md`

- [ ] **Step 1: Create the file with complete content**

Write `/Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os/skills/measure.md` with this exact content:

```markdown
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

```markdown
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
```

- [ ] **Step 2: Verify the file was created**

Read `skills/measure.md` and confirm it starts with `# product:measure — Feature Instrumentation` and ends with the Rules section.

- [ ] **Step 3: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/measure.md
git commit -m "feat: add product:measure skill to complete Build-Measure-Learn loop"
```

---

## Task 2: Update `skills/build.md` — bridge to implementation tools + contract + immutability + tier

**Files:**
- Modify: `skills/build.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/build.md`, after the line `Read recipes \`recipes/14-build-checklist.md\` and \`recipes/13-technical-architecture.md\` for the authoritative process.`, insert:

```markdown

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-pitch.md (required), docs/screens/ matching the feature (recommended)
Produces: docs/specs/YYYY-MM-DD-[slug]-build.md
Updates: nothing (new date-prefixed file per run)
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 2: Determine tier` section (currently lines 18-22):

```markdown
## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- Otherwise: ask "Run **lite** (product readiness checklist only) or **pro** (checklist + architecture skeleton + instrumentation plan)?"
```

with:

```markdown
## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (readiness checklist only, ~5 min) or **pro** (checklist + architecture skeleton + instrumentation plan, ~15 min)?"
```

- [ ] **Step 3: Replace Step 9 summary to add implementation bridge**

Replace the entire `## Step 9: Summarize` section:

```markdown
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
```

- [ ] **Step 4: Add Artifact naming block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Artifact naming
Point-in-time artifact — never overwritten. If `docs/specs/` already contains a build file for this slug, create a new date-prefixed file for this run. Both versions are preserved. `product:next` will show all versions grouped by slug, with the newest marked as current.

```

- [ ] **Step 5: Verify the changes**

Read `skills/build.md` and confirm:
1. `## Contract` section appears after `## Purpose`
2. Step 2 says "Tier resolution" with 3 rules
3. Step 9 includes "Implementation handoff" with the `writing-plans` reference
4. `## Artifact naming` section appears before `## Rules`

- [ ] **Step 6: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/build.md
git commit -m "feat(build): add contract, tier normalization, implementation bridge, immutability rule"
```

---

## Task 3: Update `skills/next.md` — drift/orphan detection + multi-feature view

**Files:**
- Modify: `skills/next.md`

- [ ] **Step 1: Add Step 2b drift and orphan detection after Step 2**

In `skills/next.md`, after the entire `## Step 2: Determine the phase` section (the table that ends with `| Post-ship | docs/specs/ has a retro file |`), insert:

```markdown

## Step 2b: Check for drift, orphans, and blocking deferrals

After classifying the phase, perform these checks:

**Drift check** — compare file dates:
For each pitch file in `docs/specs/`, check if the pitch is significantly older than `docs/product/product-model.md`. If a pitch predates the product model by more than 30 days, flag:
```
⚠ Drift: [slug]-pitch.md ([date]) predates product-model.md update ([model date])
  → Review pitch for consistency with current model before building
```

**Orphan check** — look for mismatched document sets:
- A `*-build.md` with no matching `*-pitch.md` for the same slug:
  `⚠ Orphan: [date]-[slug]-build.md — no matching pitch found`
- A `*-retro.md` with no matching `*-build.md`:
  `⚠ Orphan: [date]-[slug]-retro.md — no matching build file found`

**Blocking deferrals** — check if deferred sections in living docs block the next skill:
- If `docs/product/product-model.md` contains `[deferred]` lifecycle states, and the recommended next step is `product:shape` or `product:spec`:
  `⚠ Blocking: product-model.md has deferred lifecycle states — product:shape will have incomplete context; consider running product:model pro first`

**Multi-feature state** — if multiple pitches exist without retros, list each:
```
Active features (shaped but not yet reflected):
  [date] [slug] — pitch ✓, build [✓/○], retro [✓/○]
  [date] [slug] — pitch ✓, build [✓/○], retro [✓/○]
```

```

- [ ] **Step 2: Update Step 3 output format to include drift/orphan findings**

In the Step 3 output template, after the `What's deferred:` block and before `Recommended next step:`, add:

```markdown
  Warnings:
    [list any drift, orphan, or blocking deferral findings from Step 2b, or "none"]

  Active features:
    [multi-feature state table if multiple pitches in flight, or omit if only one]

```

The full updated Step 3 format should be:

```
product:next — [Project Name if detectable, otherwise "this project"]

Phase: [Current phase]

What exists:
  ✓ [artifact] — [status: complete / draft / deferred]
  ✓ [artifact] — [status]
  ○ [artifact] — missing

What's deferred:
  [list any artifacts with status: deferred and which sections need completing]

Warnings:
  [drift / orphan / blocking deferral findings, or "none"]

Active features:
  [multi-feature state if applicable]

Intake:
  [X files in docs/intake/ ready to use] / [no intake files found]

Recommended next step:
  [Specific skill to run and why]
```

- [ ] **Step 3: Verify the changes**

Read `skills/next.md` and confirm:
1. `## Step 2b` section exists between Step 2 and Step 3
2. Step 3 output format includes `Warnings:` and `Active features:` blocks

- [ ] **Step 4: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/next.md
git commit -m "feat(next): add drift detection, orphan detection, multi-feature state view"
```

---

## Task 4: Update `skills/reflect.md` — contract + tier normalization + immutability

**Files:**
- Modify: `skills/reflect.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/reflect.md`, after the line `Read recipes \`recipes/17-retrospective.md\` and \`recipes/16-measure.md\` for the authoritative process.`, insert:

```markdown

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-pitch.md (required), docs/specs/YYYY-MM-DD-[slug]-build.md (recommended), docs/product/journeys/[slug]-telemetry.md (recommended)
Produces: docs/specs/YYYY-MM-DD-[slug]-retro.md
Updates: nothing (new date-prefixed file per run)
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 2: Determine tier` section:

```markdown
## Step 2: Determine tier

If no tier specified: ask "Run **lite** (what shipped + decision, ~5 min) or **pro** (full retrospective with evidence and next slice, ~15 min)?"
```

with:

```markdown
## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Build file found for this feature → default to `pro`, announce: "Defaulting to pro — build file found. Run lite? (y/n)"
3. Only pitch found, no build file → default to `lite`, announce: "Defaulting to lite — no build file found. Run pro? (y/n)"
4. Otherwise → ask: "Run **lite** (what shipped + decision, ~5 min) or **pro** (full retrospective with evidence and next slice, ~15 min)?"
```

- [ ] **Step 3: Add Artifact naming block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Artifact naming
Point-in-time artifact — never overwritten. If `docs/specs/` already contains a retro for this slug, create a new date-prefixed file. Both versions are preserved. `product:next` shows all versions grouped by slug.

```

- [ ] **Step 4: Verify the changes**

Read `skills/reflect.md` and confirm:
1. `## Contract` block appears after `## Purpose`
2. Step 2 says "Tier resolution" with 4 rules
3. `## Artifact naming` block appears before `## Rules`

- [ ] **Step 5: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/reflect.md
git commit -m "feat(reflect): add contract, tier normalization, immutability rule"
```

---

## Task 5: Update `skills/shape.md` — contract + fallback + pivot + immutability + tier

**Files:**
- Modify: `skills/shape.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/shape.md`, after the line `Read recipe \`recipes/09-shaped-pitch.md\` for the authoritative process.`, insert:

```markdown

## Contract
Requires: docs/product/product-model.md (recommended), docs/product/journeys/ (recommended)
Produces: docs/specs/YYYY-MM-DD-[slug]-pitch.md
Updates: nothing (new date-prefixed file per run; see Artifact naming)
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 2: Determine tier` section:

```markdown
## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- No product model → suggest `lite` (note: "For best results, run `product:model` first")
- Otherwise: ask "Run **lite** (problem + appetite + inclusions/exclusions + done criteria, ~5 min) or **pro** (full pitch with risks, rabbit holes, user flow, ~15 min)?"
```

with:

```markdown
## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. No product model → default to `lite`, announce: "Defaulting to lite — no product model found (for best results, run product:model first). Run pro anyway? (y/n)"
4. Otherwise → ask: "Run **lite** (problem + appetite + in/out + done criteria, ~5 min) or **pro** (full pitch with risks, rabbit holes, user flow, ~15 min)?"
```

- [ ] **Step 3: Add Fallback questions block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Fallback questions (if recipe unavailable)
1. "What problem does this solve? Describe what happens today without this feature."
2. "How much time is this worth — meaning, if you had to cut scope to ship in that time, you would? Not an estimate — a maximum."
3. "Name 3 things that will NOT be built as part of this. Be specific."
4. "What's the biggest risk — what could make this harder or take longer than expected?"
5. "How will you know it's done? Give 3 specific, testable done criteria."

```

- [ ] **Step 4: Add Pivot interrupt block before `## Rules`**

Insert before the `## Rules` section (after Fallback questions):

```markdown
## Pivot interrupt
If at any point the user signals the premise is wrong ("actually this is wrong", "I need to rethink", "let's pivot"):
1. Stop the interview immediately
2. Record what was learned so far as a partial artifact: `docs/product/[date]-[feature-slug]-partial.md` with `status: abandoned`
3. Update `docs/product/assumptions.md` — add a new entry noting the signal that triggered the pivot and why the current framing was abandoned
4. Say: "Pivot noted. New signal: [what changed]. Recommended: re-run product:shape with the corrected framing, or run product:discover if the problem statement has fundamentally changed."

```

- [ ] **Step 5: Add Artifact naming block before `## Rules`**

Insert before the `## Rules` section (after Pivot interrupt):

```markdown
## Artifact naming
Point-in-time artifact — never overwritten. If `docs/specs/` already contains a pitch for this slug, create a new date-prefixed file for this run. Both versions are preserved. `product:next` shows all versions grouped by slug, with the newest marked as current.

```

- [ ] **Step 6: Verify the changes**

Read `skills/shape.md` and confirm:
1. `## Contract` block appears after `## Purpose`
2. Step 2 says "Tier resolution" with 4 rules
3. `## Fallback questions` block appears before `## Rules`
4. `## Pivot interrupt` block appears before `## Rules`
5. `## Artifact naming` block appears before `## Rules`

- [ ] **Step 7: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/shape.md
git commit -m "feat(shape): add contract, tier normalization, fallback questions, pivot interrupt, immutability rule"
```

---

## Task 6: Update `skills/spec.md` — contract + fallback + pivot + immutability + tier + screen inventory

**Files:**
- Modify: `skills/spec.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/spec.md`, after the line `Read recipes \`recipes/10-screen-spec.md\` and \`recipes/11-interaction-rules.md\` for the authoritative process.`, insert:

```markdown

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-pitch.md (recommended), docs/product/journeys/ (recommended)
Produces: docs/screens/[kebab-case-name].md
Updates: docs/screens/[kebab-case-name].md (in update mode if screen already exists; screen specs are living documents)
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 2: Determine tier` section:

```markdown
## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- Otherwise: ask "Run **lite** (purpose + question + layout + core states, ~5 min) or **pro** (full spec with all states, copy rules, acceptance criteria, ~15 min)?"
```

with:

```markdown
## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (purpose + question + layout + core states, ~5 min) or **pro** (full spec with all states, copy rules, acceptance criteria, ~15 min)?"
```

- [ ] **Step 3: Add screen inventory to Step 4 (Read context)**

In the `## Step 4: Read context` section, after the existing context items, add a new item:

```markdown
**5. Screen inventory from pitch:** If a related pitch was found, scan it for screen names implied by the "What's Included" section and done criteria. Build a list of screens this feature requires.
```

- [ ] **Step 4: Update Step 5 context summary to show screen inventory**

Replace the existing `## Step 5: Show context summary` block:

```markdown
## Step 5: Show context summary

```
product:spec — speccing "[Screen Name]"

Context found:
  Journey: [related journey or "none found"]
  Pitch: [related pitch or "none found"]
  Nearby screens for consistency reference: [list]
  Components available: [list of component directories]

Will ask about: [what's needed for the spec]

Correct anything?
```
```

with:

```markdown
## Step 5: Show context summary

```
product:spec — speccing "[Screen Name]"

Context found:
  Journey: [related journey or "none found"]
  Pitch: [related pitch or "none found"]
  Nearby screens for consistency reference: [list]
  Components available: [list of component directories]

Screen inventory for this feature (from pitch):
  ✓ [screen-name].md — already specced
  → [screen-name].md — speccing now
  ○ [screen-name].md — not yet specced
  [or "Pitch not found — cannot determine remaining screens"]

Will ask about: [what's needed for the spec]

Correct anything?
```

The screen inventory gives a complete picture of how much spec work remains for the feature.
```

- [ ] **Step 5: Add Artifact naming block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Artifact naming
Screen specs are living documents — always updated in place using update mode (Step 3). Never create a new file for the same screen name. To record that a screen was redesigned, add a change note in the frontmatter before updating:
```yaml
changes:
  - date: YYYY-MM-DD
    note: "Redesigned for [feature] — previous version archived in git history"
```

```

- [ ] **Step 6: Add Fallback questions block before `## Rules`**

Insert before the `## Rules` section (after Artifact naming):

```markdown
## Fallback questions (if recipe unavailable)
1. "What is the primary user question this screen answers? One sentence."
2. "What brings the user to this screen? Name 2–3 entry points."
3. "What data or content does this screen need to display?"
4. "What does this screen look like when: data is loading / there's no data yet / something went wrong?"
5. "What's the primary action a user takes on this screen? What happens next?"

```

- [ ] **Step 7: Add Pivot interrupt block before `## Rules`**

Insert before the `## Rules` section (after Fallback questions):

```markdown
## Pivot interrupt
If at any point the user signals the screen's purpose is unclear or the design needs rethinking:
1. Stop the interview immediately
2. Record what was learned as a partial artifact: `docs/screens/[name]-partial.md` with `status: abandoned`
3. Say: "Spec paused. Recommended: clarify the screen's purpose with product:journey first, then re-run product:spec."

```

- [ ] **Step 8: Verify the changes**

Read `skills/spec.md` and confirm:
1. `## Contract` block appears after `## Purpose`
2. Step 2 says "Tier resolution" with 3 rules
3. Step 4 includes item 5 about screen inventory from pitch
4. Step 5 context summary includes `Screen inventory for this feature` block
5. `## Artifact naming` block appears before `## Rules`
6. `## Fallback questions` block appears before `## Rules`
7. `## Pivot interrupt` block appears before `## Rules`

- [ ] **Step 9: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/spec.md
git commit -m "feat(spec): add contract, tier normalization, screen inventory, fallback questions, pivot interrupt, immutability rule"
```

---

## Task 7: Update `skills/discover.md` — contract + fallback + pivot + tier

**Files:**
- Modify: `skills/discover.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/discover.md`, after the line `Read recipes \`recipes/01-idea-brief.md\`, \`recipes/02-assumption-map.md\`, and \`recipes/03-discovery.md\` for the authoritative process.`, insert:

```markdown

## Contract
Requires: nothing (blank-slate entry point; reads docs/intake/ if present)
Produces: docs/product/product-model.md (seed version), docs/product/assumptions.md
Updates: nothing (creates new; if files exist, shows conflict and asks to overwrite or merge)
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 1: Determine tier` section:

```markdown
## Step 1: Determine tier

If no tier specified:
- `docs/product/` exists with other products → likely `lite` (scoping a new feature area)
- No existing product docs → ask "Run **lite** (idea brief + top 5 assumptions, ~10 min) or **pro** (full discovery through opportunity mapping, ~30 min)?"
```

with:

```markdown
## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/` exists with product docs → default to `lite`, announce: "Defaulting to lite — scoping a new area in an existing product. Run pro for full discovery? (y/n)"
3. No existing product docs → default to `lite`, announce: "Defaulting to lite for initial discovery. Run pro for full opportunity mapping including competitive analysis? (y/n)"
```

- [ ] **Step 3: Renumber subsequent steps**

After replacing Step 1, the remaining steps (currently numbered Step 2–6) need to be renumbered to Step 2–6 (they stay the same numbers since we replaced Step 1 in-place, not inserted before it). Confirm the step sequence is: Tier resolution (Step 1) → Read context (Step 2) → Show context summary (Step 3) → Conduct interview (Step 4) → Produce artifacts (Step 5) → Summarize (Step 6). No renumbering needed since we replaced Step 1.

- [ ] **Step 4: Add Fallback questions block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Fallback questions (if recipe unavailable)
1. "What problem does this product solve? Describe what users do today without it."
2. "Who is the specific target user? Describe one real person, not a demographic."
3. "What is the trigger moment — what just happened that makes them need this right now?"
4. "What is the riskiest assumption? If it turns out to be false, the whole idea fails."
5. "How would you test that assumption without building anything?"

```

- [ ] **Step 5: Add Pivot interrupt block before `## Rules`**

Insert before the `## Rules` section (after Fallback questions):

```markdown
## Pivot interrupt
If at any point the user signals the idea has fundamentally changed ("actually the real problem is...", "wrong user", "I need to rethink this"):
1. Stop the interview immediately
2. Record what was learned as a partial artifact: `docs/product/[date]-discovery-partial.md` with `status: abandoned`
3. Note the new insight in the partial doc's frontmatter: `pivot_signal: "[what changed]"`
4. Say: "Pivot noted. New signal: [what changed]. Restart with product:discover with this corrected framing."

```

- [ ] **Step 6: Verify the changes**

Read `skills/discover.md` and confirm:
1. `## Contract` block appears after `## Purpose`
2. Step 1 says "Tier resolution" with 3 rules
3. `## Fallback questions` block appears before `## Rules`
4. `## Pivot interrupt` block appears before `## Rules`

- [ ] **Step 7: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/discover.md
git commit -m "feat(discover): add contract, tier normalization, fallback questions, pivot interrupt"
```

---

## Task 8: Update `skills/model.md` — contract + fallback + pivot + tier

**Files:**
- Modify: `skills/model.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/model.md`, after the line `Read recipes \`04-opportunity-map.md\`, \`05-positioning.md\`, \`06-product-model.md\`, and \`08-information-architecture.md\` for the authoritative process.`, insert:

```markdown

## Contract
Requires: docs/product/assumptions.md or docs/product/audit.md (recommended)
Produces: docs/product/product-model.md, docs/product/glossary.md, docs/product/information-architecture.md (pro)
Updates: docs/product/product-model.md (in update mode if file exists), docs/product/glossary.md
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 1: Determine tier` section:

```markdown
## Step 1: Determine tier

If no tier specified:
- `docs/product/audit.md` exists → suggest `pro`
- `docs/product/product-model.md` exists with deferred sections → suggest `pro` (update mode)
- No existing product docs → suggest `lite`
- Otherwise: ask "Run **lite** (objects + states + IA skeleton, ~5–10 min) or **pro** (full model + positioning + non-goals + complete IA, ~20–40 min)?"
```

with:

```markdown
## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/audit.md` exists → default to `pro`, announce: "Defaulting to pro — audit found. Run lite? (y/n)"
3. `docs/product/product-model.md` exists with `[deferred]` sections → default to `pro` (update mode), announce: "Defaulting to pro — model has deferred sections to complete. Run lite? (y/n)"
4. No existing product docs → default to `lite`, announce: "Defaulting to lite for initial model. Run pro? (y/n)"
5. Otherwise → ask: "Run **lite** (objects + states + IA skeleton, ~5–10 min) or **pro** (full model + positioning + non-goals + complete IA, ~20–40 min)?"
```

- [ ] **Step 3: Add Fallback questions block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Fallback questions (if recipe unavailable)
1. "What are the main things this product creates, manages, or tracks? List them all — we'll define each one."
2. For each object: "What states can a [object] be in? Beginning state, end state, and anything in between."
3. For each object: "What does a [object] belong to or reference?"
4. "What term does your target user use for [key object] in their day-to-day language?"
5. "What is the one thing this product does that no current workaround does as well?"

```

- [ ] **Step 4: Add Pivot interrupt block before `## Rules`**

Insert before the `## Rules` section (after Fallback questions):

```markdown
## Pivot interrupt
If at any point the model reveals a fundamental mismatch ("that object doesn't exist", "our mental model is completely wrong"):
1. Stop the interview immediately
2. Record what was defined so far in `docs/product/product-model.md` with `status: draft` (partial)
3. Note the conflict explicitly in the file: `<!-- PIVOT: [what was wrong] —- restart from product:audit or product:discover -->`
4. Say: "Model paused. Conflict found: [what's wrong]. Recommended: run product:audit to reconstruct from what actually exists, then re-run product:model."

```

- [ ] **Step 5: Verify the changes**

Read `skills/model.md` and confirm:
1. `## Contract` block appears after `## Purpose`
2. Step 1 says "Tier resolution" with 5 rules
3. `## Fallback questions` block appears before `## Rules`
4. `## Pivot interrupt` block appears before `## Rules`

- [ ] **Step 6: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/model.md
git commit -m "feat(model): add contract, tier normalization, fallback questions, pivot interrupt"
```

---

## Task 9: Update `skills/audit.md` — contract + fallback + tier

**Files:**
- Modify: `skills/audit.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/audit.md`, after the line `Read recipe \`recipes/00-audit.md\` for the authoritative process. This skill executes that recipe.`, insert:

```markdown

## Contract
Requires: existing codebase (reads structure automatically via find/grep); docs/intake/ (optional)
Produces: docs/product/audit.md
Updates: docs/product/audit.md (in update mode if file exists — asks about what's changed or missing)
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 1: Determine tier` section:

```markdown
## Step 1: Determine tier

Check if the user specified a tier in the invocation (`product:audit lite` or `product:audit pro`).

If no tier specified:
- If `docs/product/product-model.md` exists → suggest `pro`
- If `docs/product/audit.md` already exists → this is an update run → suggest `pro`
- Otherwise → ask: "Run **lite** (screen inventory + top 5 problems, ~5–10 min) or **pro** (full extraction including object model, state audit, terminology, ~20–40 min)?"
```

with:

```markdown
## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found (full audit will be more valuable). Run lite? (y/n)"
3. `docs/product/audit.md` already exists → default to `pro` (update mode), announce: "Defaulting to pro — updating existing audit. Run lite? (y/n)"
4. Otherwise → ask: "Run **lite** (screen inventory + top 5 problems, ~5–10 min) or **pro** (full extraction including object model, state audit, terminology, ~20–40 min)?"
```

- [ ] **Step 3: Add Fallback questions block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Fallback questions (if recipe unavailable)
1. "List every screen or page in the product, even half-built or rarely-used ones."
2. "What do users complain about most? What breaks, confuses, or frustrates them?"
3. "What's inconsistent — the same term used two different ways, or features that partially overlap?"
4. "If you had to cut 30% of the product to make the rest coherent, what would you remove?"
5. "What was the original design assumption that is no longer true?"

```

- [ ] **Step 4: Verify the changes**

Read `skills/audit.md` and confirm:
1. `## Contract` block appears after `## Purpose`
2. Step 1 says "Tier resolution" with 4 rules
3. `## Fallback questions` block appears before `## Rules`

- [ ] **Step 5: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/audit.md
git commit -m "feat(audit): add contract, tier normalization, fallback questions"
```

---

## Task 10: Update `skills/journey.md` — contract + fallback + pivot + tier

**Files:**
- Modify: `skills/journey.md`

- [ ] **Step 1: Insert Contract block after `## Purpose`**

In `skills/journey.md`, after the line `Read recipe \`recipes/07-journey-map.md\` for the authoritative process.`, insert:

```markdown

## Contract
Requires: docs/product/product-model.md (recommended)
Produces: docs/product/journeys/[kebab-case-name].md
Updates: docs/product/journeys/[kebab-case-name].md (in update mode if journey already exists)
```

- [ ] **Step 2: Replace the tier detection step**

Replace the entire `## Step 2: Determine tier` section:

```markdown
## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- Otherwise: ask "Run **lite** (happy path + 2 failure states, ~5 min) or **pro** (full journey with all states, decisions, edge cases, ~15 min)?"
```

with:

```markdown
## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (happy path + 2 failure states, ~5 min) or **pro** (full journey with all states, decisions, edge cases, ~15 min)?"
```

- [ ] **Step 3: Add Fallback questions block before `## Rules`**

Insert before the `## Rules` section:

```markdown
## Fallback questions (if recipe unavailable)
1. "What is the user trying to accomplish? One sentence — their goal."
2. "What triggers this journey? What just happened that makes them need this now?"
3. "Walk me through the happy path step by step. For each step: what does the user do, and what does the system do?"
4. "For each step: what can go wrong? What does the user see and how do they recover?"
5. "How does the user know the journey succeeded? What is the completion signal?"

```

- [ ] **Step 4: Add Pivot interrupt block before `## Rules`**

Insert before the `## Rules` section (after Fallback questions):

```markdown
## Pivot interrupt
If the user signals the journey's framing is wrong ("this isn't how users actually do it", "we're mapping the wrong flow"):
1. Stop the interview immediately
2. Record what was captured as a partial artifact: `docs/product/journeys/[name]-partial.md` with `status: abandoned`
3. Say: "Journey paused. Recommended: clarify which journeys matter most with product:model (information architecture section), then re-run product:journey with the corrected framing."

```

- [ ] **Step 5: Verify the changes**

Read `skills/journey.md` and confirm:
1. `## Contract` block appears after `## Purpose`
2. Step 2 says "Tier resolution" with 3 rules
3. `## Fallback questions` block appears before `## Rules`
4. `## Pivot interrupt` block appears before `## Rules`

- [ ] **Step 6: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add skills/journey.md
git commit -m "feat(journey): add contract, tier normalization, fallback questions, pivot interrupt"
```

---

## Task 11: Update `README.md` — add Quick Start section

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Add Quick Start section after the opening paragraph**

In `README.md`, after line 4 (`A repeatable, AI-native product development operating system. Globally installed as a Claude Code plugin. Works across every project repo.`) and before the `---` separator, insert a new Quick Start section:

```markdown

## Quick Start

**New to Product OS? Run these three commands in order:**

```
product:discover        ← new product idea → 10 min → produces: product-model.md + assumptions.md
product:model           ← formalize the model → 20 min → produces: glossary.md + full product-model.md
product:shape "your feature"  ← scope what to build → 10 min → produces: dated pitch doc
```

Not sure where you are? `product:next` reads your project and tells you exactly what to run.

**Existing product?** Start with `product:audit` instead — it reads your codebase and produces a current-state analysis before you touch anything.

---
```

- [ ] **Step 2: Update the "First use" section at the bottom to be more specific**

Replace the existing `## First use` section (currently lines 453-470):

```markdown
## First use

Run `product:audit` on an existing product to validate the system end-to-end. The audit skill is the highest-value entry point for any product that already exists and needs clarity.

```
product:audit
```

Or if you're starting fresh:

```
product:discover
```

Or if you don't know where to start:

```
product:next
```
```

with:

```markdown
## First use

**Existing product (recommended starting point):**
```
product:audit
```
Reads your codebase, interviews you on what works and what doesn't, produces `docs/product/audit.md` — a current-state analysis ready to feed into `product:model`.

**New product:**
```
product:discover
```
Runs idea brief → assumption mapping → discovery inputs. Produces a seed product model and a ranked assumption list.

**Not sure where to start:**
```
product:next
```
Reads all existing artifacts and tells you exactly what phase you're in and what to run next. Safe to run any time — read-only, never writes anything.

**After shipping a feature, always close the loop:**
```
product:measure "feature name"   ← set up measurement before data disappears
product:reflect "feature name"   ← evaluate the bet with evidence
```
```

- [ ] **Step 3: Update the two-tracks section to mention product:measure**

Find the "Two tracks" section (`## The two tracks`) and update the "New product" track to include `product:measure`:

Replace:
```markdown
**New product:**
```
product:discover → product:model → product:journey → product:shape → product:spec → product:build → product:reflect
```
```

with:
```markdown
**New product:**
```
product:discover → product:model → product:journey → product:shape → product:spec → product:build → [ship] → product:measure → product:reflect
```
```

And replace the "Existing product" track:
```markdown
**Existing product / revamp:**
```
product:audit → product:model → product:shape → product:spec → product:build → product:reflect
```
```

with:
```markdown
**Existing product / revamp:**
```
product:audit → product:model → product:shape → product:spec → product:build → [ship] → product:measure → product:reflect
```
```

- [ ] **Step 4: Add product:measure to the skill list**

Find the `## The 9 skills` section header and update it to `## The 10 skills`.

After the `### product:reflect` section (around line 228), add:

```markdown

---

### `product:measure`

**When to use:** After `product:build`, before or immediately after ship. Run this before `product:reflect` needs evidence to evaluate.

**What it does:** Defines the primary success metric and baseline from the shaped pitch's done criteria. Plans analytics events covering the feature's lifecycle (entered, completed, abandoned, error). Sets targets and a review cadence. For pro: adds secondary metrics and false-positive signals.

**Produces:**
- `docs/product/journeys/[feature]-telemetry.md`
```

- [ ] **Step 5: Verify the changes**

Read `README.md` and confirm:
1. `## Quick Start` section appears near the top with the three commands
2. `## First use` section includes all four entry points
3. Both tracks now include `product:measure` between `[ship]` and `product:reflect`
4. Skill list includes `product:measure` and section header says "10 skills"

- [ ] **Step 6: Commit**

```bash
cd /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os
git add README.md
git commit -m "docs: add quick start guide, add product:measure to tracks and skill list"
```

---

## Self-Review

Spec coverage check:

| Fix | Task | Status |
|-----|------|--------|
| 1. Bridge product:build → implementation tools | Task 2, Step 3 | ✓ |
| 2. Input/output contracts per skill | Tasks 1–10, Step 1 each | ✓ |
| 3. Harden product:next with drift/orphan detection | Task 3 | ✓ |
| 4. Recipe-independent fallback questions | Tasks 5–10, Fallback step each | ✓ |
| 5. Pivot/abort exit path | Tasks 5–10, Pivot step each (discover, model, journey, shape, spec) | ✓ |
| 6. Explicit immutability rules | Tasks 2, 4, 5, 6 (build, reflect, shape, spec) | ✓ |
| 7. Add product:measure skill | Task 1 | ✓ |
| 8. Normalize tier resolution | Tasks 2–10, Tier resolution step each | ✓ |
| 9. Screen inventory from pitch in product:spec | Task 6, Steps 3–4 | ✓ |
| 10. Quick-start in README | Task 11 | ✓ |

No placeholder scan issues found — all steps contain complete content.
