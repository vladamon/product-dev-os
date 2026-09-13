---
name: next
description: Use this skill when the user invokes `/product:next`, asks where they are or what to do next in a project, returns after a break, or describes their situation as a founder ("launched and nobody came", "not sure what to build", "stuck") and needs routing.
---
# product:next — Navigator

Use this skill when the user invokes `/product:next`, asks where they are in the product journey, or describes a situation and wants to know which skills to run.

## Purpose

Orientation. Two modes, both read-only:
- **Status mode** (no argument) — read the project's `docs/` tree, place it on the companion map (`docs/conventions.md` §1), surface warnings, and name the next skill.
- **Situation mode** (argument is a free-text situation, e.g. `product:next "launched two weeks ago, 3 signups"`) — match the situation to a playbook in the plugin's `docs/playbooks.md` and give the exact sequence, adjusted for the artifacts that already exist.

Do not ask questions. Do not produce artifacts.

## Step 1: Read all product artifacts

Use the artifact map in `docs/conventions.md` §6. In the current project, look for:

**Living documents** (existence + `status` frontmatter + `[deferred]` markers):
- `docs/product/product-model.md`, `assumptions.md`, `audit.md`, `glossary.md`, `information-architecture.md`
- `docs/product/business-model.md`, `go-to-market.md`, `architecture.md`
- `docs/product/journeys/` — journeys and `*-telemetry.md`
- `docs/screens/`

**Point-in-time documents** (existence, date, frontmatter `status` / `verdict` / `decision`):
- `docs/specs/` — group by slug: `critique`, `experiment`, `pitch`, `build`, `plan`, `launch`, `retro`, and `*-pmf.md`
- `docs/research/` — interview kits and syntheses
- `docs/checkins/` — latest check-in date and its commitments

**Outside the project:** `docs/ideas/` and `docs/triage/` in the cwd or its parent.

**Intake:** `docs/intake/` — note files ready to use (and `docs/intake/interviews/` separately).

## Step 2: Place the project on the companion map

Report the **furthest stage reached** and any **gaps behind it**.

| Stage | Signal |
|-------|--------|
| 0 Choose | No project docs; ideation or triage file nearby |
| 1 Understand | `assumptions.md` or `audit.md` exists |
| 2 Challenge | a `*-critique.md` exists |
| 3 Money & reach | `business-model.md` and/or `go-to-market.md` exist |
| 4 Test | a `*-experiment.md` exists (note `verdict`) |
| 5 Define | `product-model.md` without `[deferred]` Core Objects; journeys exist |
| 6 Architect | `architecture.md` exists |
| 7 Scope | a pitch exists; screen specs match it |
| 8 Build | a build file matches a pitch; a plan exists (note ticked / total tasks) |
| 9 Launch | a `*-launch.md` exists (note whether Results are recorded); telemetry exists |
| 10 Learn | a retro or `*-pmf.md` exists (note decision) |

Track: **new product** if `assumptions.md` exists without `audit.md`; **revamp** if `audit.md` exists.

## Step 2b: Checks

Run every check; report findings as warnings.

**Overdue decisions (highest priority)** — read the frontmatter decision fields (`docs/conventions.md` §6):
- Newest critique with `kill_date` in the past → `⚠ Kill criterion due: [kill_criterion] ([kill_date]) — decide now`
- Experiment with `verdict: pending` and `conclude_by` in the past → `⚠ Experiment [slug] overran its budget — product:experiment record [slug] (inconclusive is a valid verdict)`
- Launch with `verdict: pending` and `launch_date` more than 14 days ago → `⚠ Launch [slug] never recorded — product:launch record [slug]`
- Newest pmf with `next_review` in the past → `⚠ PMF review due — product:pmf`
- Newest check-in with `missed_streak` ≥ 3 → `⚠ 3+ missed weeks — product:triage`

**Untested high-risk assumptions** (gate rule, `docs/conventions.md` §5): rows with Risk `high` and Verdict blank or `pending`. Legacy list format counts. List each ID and text:
`⚠ Blocking: [N] high-risk assumption(s) untested — product:shape will refuse; run product:experiment`

**Gate overrides:** every artifact with `gate_override: true` → `⚠ Gate skipped in [file] — upstream work may be missing`

**Drift:** a pitch predating the latest `product-model.md` update by more than 30 days → `⚠ Drift: [slug]-pitch.md predates product-model.md — review before building`

**Orphans:** build without pitch · plan without build · launch without build · retro without build.

**Blocking deferrals:** `product-model.md` has `[deferred]` Core Objects or Lifecycle States while the next step is shape/spec → `⚠ Blocking: run product:model pro first`

**Money & reach gap (new-product track):** a pitch exists but `business-model.md` or `go-to-market.md` is missing → `⚠ Building before viability/distribution is checked — run product:viability / product:gtm`

**Launch without measurement:** a launch file exists but no telemetry file → `⚠ Launch can't be judged — run product:measure`

**Post-launch without fit review:** launch Results recorded more than 28 days ago and no pmf file since → `⚠ Run product:pmf — four weeks of usage is enough for a first read`

**Check-in staleness:** an active plan or recorded launch exists and the latest check-in is older than 7 days (or none exists) → `⚠ No check-in in [N] days — run product:checkin`

**Multi-feature state:** if several pitches lack retros, list each:
```
Active features:
  [date] [slug] — pitch ✓, build [✓/○], plan [x/y tasks], launch [✓/○], retro [✓/○]
```

## Step 3: Output — status mode

```
product:next — [Project Name if detectable, otherwise "this project"]

Track: [new product | revamp]
Stage: [N — name]   Gaps behind: [e.g. "no critique", "no go-to-market", or "none"]

What exists:
  ✓ [artifact] — [status / verdict / decision]
  ○ [artifact] — missing

What's deferred:
  [artifacts with [deferred] sections and which sections]

Warnings:
  [findings from Step 2b, overdue decisions first, or "none"]

Active features:
  [table if several, otherwise omit]

Intake:
  [N files in docs/intake/ — useful for product:<skill>] / [none]

Recommended next step:
  [one specific invocation and why]
```

**Choosing the recommendation — first match wins:**
1. An overdue decision → the skill that records it (`product:experiment record`, `product:pmf`, `product:triage`)
2. No artifacts at all → `product:discover` (new) or `product:audit` (existing codebase); no idea yet → `product:ideate`
3. Assumptions exist, no critique → `product:critique`
4. Evidence level none/opinion and no synthesis → `product:interview prep`
5. Untested high-risk assumptions → `product:experiment`
6. New-product track missing business model or go-to-market → `product:viability` / `product:gtm`
7. Model missing or deferred → `product:model`
8. No architecture and no code yet → `product:stack`
9. No pitch → `product:shape "[top opportunity]"`
10. Pitch without specs/build → `product:spec` / `product:build`
11. Build ready, no plan → `product:plan`
12. Plan complete, no launch → `product:launch`
13. Launch without telemetry → `product:measure`
14. Launch recorded ≥4 weeks, no pmf → `product:pmf`
15. Shipped feature without retro → `product:reflect`
16. Otherwise → `product:checkin`

## Step 3b: Output — situation mode

Match the situation to the routing table in the plugin's `docs/playbooks.md`. If two playbooks fit, show both with one line on how to choose.

```
product:next — situation: "[user's words]"

Closest playbook: [N. Name]
Why: [one line]

Sequence (adjusted for what exists here):
  ✓ [skill] — already done ([artifact])
  → [skill] — start here
  ○ [skill] — then
  ○ [skill] — then

Stop condition: [when this playbook is done]
```

## Rules

- Never ask questions. Read and report only.
- Never produce artifacts. This skill is read-only.
- If no docs exist at all: "No product artifacts found. No idea yet → `product:ideate`. New idea → `product:discover`. Existing codebase → `product:audit`."
- If intake files exist, always mention them and which skill would use them.
- Overdue decisions are always reported first — they outrank the next stage.
