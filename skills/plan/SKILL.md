---
name: plan
description: Use this skill when the user invokes `/product:plan` or asks to break a feature into tasks, plan the build, sequence implementation work, hand the build off to an agent, or check progress and appetite burn on a build that's underway. Runs after product:build says ready.
---
# product:plan — Build Plan & Agent Handoff

Use this skill when the user invokes `/product:plan [feature]` or has a ready build file and needs to turn it into an ordered sequence of small, verifiable tasks.

## Purpose

Bridge "ready to build" and "building". Decompose a ready build file into vertical tasks of at most two focused sessions each — walking skeleton first, riskiest work early — with a verifiable acceptance check per task, a coverage matrix proving every done criterion and screen state is planned, an appetite check that cuts scope instead of extending time, and (pro) self-contained handoff prompts for an execution agent. Produces `docs/specs/YYYY-MM-DD-[slug]-plan.md`.

Read recipe `recipes/25-build-plan.md` for the authoritative process.

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-build.md (required: no unresolved blockers), the docs/screens/ specs listed in its Execution Brief (required), docs/product/architecture.md (recommended)
Produces: docs/specs/YYYY-MM-DD-[slug]-plan.md
Updates: nothing upstream. Within the plan file, only task checkboxes and the Progress log change after creation (see Mode: progress).

## Step 0: Verify prerequisites (gate)

A plan built on an unready build file schedules the unknowns instead of resolving them.

**Check 1 — build file exists:**

Identify the feature (Step 1). If no `docs/specs/*-[slug]-build.md` exists:
```
✗ Cannot run product:plan yet.

Missing requirements:
  - docs/specs/*-[slug]-build.md — no build readiness check for "[feature]"

Run this first:
  product:build "[feature]"

Why this matters:
  The build file's Execution Brief is the plan's only source of scope,
  done criteria, and screen states.
```
Then STOP.

**Check 2 — build file has no unresolved blockers:**

Use the newest build file for the slug.
- **Primary signal — frontmatter `readiness:`** (written by `product:build`). `readiness: blocked` → blocked; the items are listed under **Readiness → Blockers**. `readiness: ready` → not blocked, regardless of `status:`.
- **Fallback, only for build files without `readiness:`** (written before the field existed): blocked if a `## Blockers` section has any unchecked `- [ ]` item or `✗` line, or any checkbox is unchecked in the **Domain Model**, **Screen Coverage**, or **Copy and Terminology** sections. (Execution Brief done-criteria boxes and Instrumentation boxes are build-time work and do not count.) Say: `⚠ Build file predates the readiness field — using the checklist fallback. Re-run product:build to record readiness explicitly.`

If blocked:
```
✗ Cannot run product:plan yet.

Build file [date]-[slug]-build.md has unresolved blockers:
  - [section]: [unchecked item]
  - [section]: [unchecked item]

Run this first:
  Fix the items above, then: product:build "[feature]"

Why this matters:
  Tasks planned around an unspecced state or an undefined object turn into
  mid-build design sessions that silently eat the appetite.
```
Then STOP.

`status: draft` on a build file is normal (build keeps it until every checklist box is ticked) and is never a blocker on its own.

**Check 3 — referenced screen specs exist:**

For every row in the Execution Brief's "Screens to build" table, the spec file must exist. If any is missing:
```
✗ Cannot run product:plan yet.

Missing requirements:
  - docs/screens/[name].md — listed in the build file, not found

Run this first:
  product:spec "[screen name]"
```
Then STOP.

**Warning — architecture:** if `docs/product/architecture.md` is missing: `⚠ No architecture.md — tasks will follow existing codebase patterns only. For a new codebase, run product:stack first.`

**Gate override.** `--skip-gate` proceeds past a refusal. Write `gate_override: true` in the plan frontmatter and add under Cuts & Risks: `Gate skipped — [which check failed]`.

## Step 1: Identify the feature

If no feature is given: find the most recent `*-build.md` in `docs/specs/` without a matching `*-plan.md` and ask: "Are we planning '[feature]'?"

If a feature name is given: match the slug. If a plan already exists for the slug and is newer than the build file, ask: "A plan from [date] exists. Re-plan from scratch, or update progress on the existing one (`product:plan progress [slug]`)?"

## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/architecture.md` exists → default to `pro`, announce: "Defaulting to pro — architecture found, so milestones and agent handoff blocks will be precise. Run lite? (y/n)"
3. Otherwise → default to `lite`, announce: "Defaulting to lite — ordered tasks, acceptance checks, coverage matrix (~10 min). Run pro for milestones + agent handoff blocks? (y/n)"

## Step 3: Read context

**1. Build file** — the Execution Brief is the source of scope, no-gos, done criteria, screens, and terminology. Do not re-derive scope from the pitch; read the pitch only if the brief lacks the appetite.
**2. Screen specs** listed in the brief — every state each screen requires.
**3. `docs/product/architecture.md`** — stack, managed capabilities, data model sketch, Not Now list.
**4. Codebase:** `find . -type d -not -path '*/node_modules/*' -not -path '*/.git/*' | head -40`; test/lint/dev commands from `package.json` scripts, `Makefile`, `pyproject.toml`, CI workflows; `git log --oneline -10`.
**5. User-specified files** (`from`, `using`) and `docs/intake/`.

## Step 4: Show context summary

```
product:plan — planning "[Feature Name]"

Build file: [date]-[slug]-build.md ✓ (no blockers)
Appetite: [from brief]
Done criteria: [N]  ·  Screens: [N] with [N] required states
No-gos: [N]
Architecture: [found | not found]
Verification commands detected: [test / lint / dev — or "none"]

Will ask about: riskiest part, session length, sessions per week[, milestones (pro)]

Correct anything?
```

Wait for confirmation.

## Step 5: Conduct the interview and draft

Read `recipes/25-build-plan.md`. Follow lite or pro question set.

**Always ask:**
1. "What's the riskiest part — the thing most likely to blow the appetite?"
2. "How long is one realistic focused session for you, and how many per week?" → converts appetite into a session budget.
3. If no verification command was detected: "What proves a change works here — a test command, a URL, a manual check?"

**Then draft, and show the draft before writing:**
- **T1 is the walking skeleton** — a thin vertical slice running end-to-end through UI → logic → data, ugly is fine.
- **Riskiest work lands in the first third** of the task list.
- **Each task ≤ 2 sessions**, with: goal · likely files · acceptance check (a command, test, or observable behavior — never "works") · advances (done criterion IDs / screen states) · depends on.
- **Coverage matrix:** number done criteria `DC1…DCn` verbatim from the brief; list screen states as `[screen]/[state]`. Every row maps to ≥ 1 task.
- **Appetite check:** planned sessions must fit within 80% of the session budget. If over, show a cuts block — never extend the appetite:
```
⚠ Estimate [N] sessions > budget [M] (80% of [appetite]).

Proposed cuts (move to no-gos):
  - [scope item] — saves [N] sessions
  - [scope item] — saves [N] sessions

Cutting a done criterion changes the bet → re-run product:shape instead.
Which cuts?
```

Ask: "Does this order match reality? Anything missing, too big, or in the wrong place?" Revise until confirmed.

## Step 6: Produce the artifact

Write `docs/specs/[today's date]-[slug]-plan.md` using the Output structure in `recipes/25-build-plan.md`.

For lite: fill Source, Budget, Tasks, Coverage Matrix, Cuts & Risks, Parking Lot. Mark Milestones and Handoff Blocks `[deferred]`.
For pro: fill all sections. Every handoff block is self-contained: an execution agent reads that block plus the named screen spec and nothing else.

Frontmatter `related:` links the build file, pitch, and architecture.

The plan never edits the build file, pitch, or screen specs. Scope changes discovered while planning go back through `product:shape`.

## Step 7: Summarize

```
Build plan → docs/specs/[date]-[slug]-plan.md

Tasks: [N]  ·  Milestones: [N] (pro)
Estimate: [N] sessions of [M] budget ([P]%)
Coverage: [N]/[N] done criteria · [N]/[N] screen states
Cuts accepted: [N]  ·  Parking lot: [N]

Recommended next step:
  Execute T1 — [title]. Acceptance check: [check]
  [pro]: hand the T1 handoff block to the execution agent; tick T1 when its check passes.

  Track progress: product:plan progress [slug]
  After the last milestone: product:measure "[feature]" (if no telemetry yet) → product:launch
```

## Mode: progress

`product:plan progress [slug]` — update an existing plan.

1. Read the plan and `git log --since=[plan created date] --oneline`.
2. For each unticked task, run its acceptance check if it is a safe, read-only command (tests, lint, type check); otherwise ask "Did T[n]'s acceptance check pass?"
3. Tick passed tasks. Append to Progress log: date, tasks ticked, sessions used so far.
4. Appetite burn: if sessions used exceed the planned sessions for completed tasks by more than 25%, or more than half the budget is gone with less than half the tasks done:
```
⚠ Appetite burn: [used]/[budget] sessions, [done]/[total] tasks.
  Stop and cut. Candidates: [untouched lowest-priority scope].
```
5. New ideas mentioned during progress go to Parking Lot, never into Tasks.

## Fallback questions (if recipe unavailable)
1. "What's the thinnest version that runs end-to-end — UI to data — even if ugly?"
2. "What's the riskiest part, and how early can we prove it works?"
3. "Break the rest into pieces of at most two sessions. For each: how do we verify it's done?"
4. "Does every done criterion and every screen state have a task?"
5. "Does the total fit the appetite? If not, what do we cut?"

## Pivot interrupt
If planning reveals the build file is wrong ("this can't work with that data model", "the riskiest part needs a spike before anything is plannable", "this is three features"):
1. Stop drafting immediately
2. Write the partial plan to `docs/specs/[date]-[slug]-plan.md` with `status: abandoned` and a comment: `<!-- PIVOT: [what broke] -->`
3. Say: "Plan paused. Problem: [what]. Recommended: product:shape "[feature]" to re-scope (split or add a spike slice), or product:stack if the architecture can't support it."

## Artifact naming
Point-in-time. After creation only task checkboxes and the Progress log change. Re-planning creates a new date-prefixed file; the old one stays as history. `product:next` shows the newest plan per slug as current.

## Rules

- T1 is always a walking skeleton that runs end-to-end.
- The riskiest task lands in the first third.
- No task exceeds 2 sessions. Bigger → split.
- Every acceptance check is verifiable by a command, test, or observable behavior.
- Every done criterion and every required screen state maps to at least one task before the plan is written.
- Appetite is fixed. Over budget → propose cuts; cutting a done criterion → back to `product:shape`.
- Parking lot items never enter Tasks without re-planning.
- Handoff blocks are self-contained — no "see the pitch".
