---
id: 25-build-plan
phase: build
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[slug]-plan.md
skill: product:plan
---

# Recipe: Build Plan

## When to use

Use this after `product:build` reports a feature ready and before writing code. The build file says *what* must be true; the plan says *in what order*, *in what size*, and *how each step is verified*.

Solo builds overrun in predictable ways: the risky integration is left to the end, tasks are sized as "the backend", nothing runs end-to-end until week three, and new ideas slip in mid-build. Agent-executed builds add one more: a task handed over without its context produces confident, wrong code. This recipe prevents all five.

## Inputs

- Build file with no unresolved blockers — its Execution Brief (scope, no-gos, done criteria, screens, terminology)
- Screen specs listed in the brief
- Architecture decision (`docs/product/architecture.md`) if it exists
- The codebase's verification commands (tests, lint, type check, dev server)

## Principles

1. **Walking skeleton first.** Task 1 runs end-to-end through every layer, however thin.
2. **Risk first.** The thing most likely to blow the appetite is proven in the first third.
3. **Vertical, small tasks.** Each delivers a user-visible or verifiable increment in ≤ 2 focused sessions.
4. **Verifiable or it isn't done.** Every task has a check a stranger could run.
5. **Appetite is fixed.** Plan to 80% of the session budget; when over, cut scope.
6. **Park, don't absorb.** New ideas go to the parking lot.

## Lite version (5 questions)

1. **What's the riskiest part of this feature — the thing most likely to blow the appetite?**
2. **How long is a realistic focused session for you, and how many per week?**
3. **What is the thinnest slice that runs end-to-end — UI to data — even if ugly?**
4. **For each remaining piece of scope: what's the smallest vertical task, and what check proves it done?**
5. **Does the total fit within 80% of the session budget? If not, which scope moves to no-gos?**

Produce: Source + Budget + ordered Tasks with acceptance checks + Coverage Matrix + Cuts & Risks + Parking Lot.

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **Where are the demoable checkpoints?** Group tasks into milestones; for each, how many sessions should be used by then?
7. **What does an execution agent need to know for each task that isn't in the screen spec?** (constraints, files, glossary terms, no-gos, test plan)
8. **What could force a re-plan mid-build?** (spike results, vendor limits, data model surprises) — and what's the trigger to stop?

Produce: all sections, including Milestones and Handoff Blocks.

## Output structure

`docs/specs/YYYY-MM-DD-[slug]-plan.md`:

```markdown
---
type: build-plan
product: [Product Name]
feature: [Feature Name]
tier: [lite|pro]
status: [active|complete|abandoned]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:plan
related:
  build: docs/specs/YYYY-MM-DD-[slug]-build.md
  pitch: docs/specs/YYYY-MM-DD-[slug]-pitch.md
  architecture: docs/product/architecture.md
---

# Build Plan: [Feature Name]

## Source
Build file: [link] · Pitch: [link] · Architecture: [link or "none"]

## Budget
**Appetite:** [from brief]
**Session:** [hours] × [per week] → **budget:** [M] sessions · **plan ceiling (80%):** [N]
**Estimate:** [sum] sessions ([P]% of budget)

## Milestones
| Milestone | Demo | After task | Sessions used by then |
|-----------|------|------------|-----------------------|
| M1 Skeleton runs | [what you can show] | T1 | [n] |

## Tasks

- [ ] **T1 — Walking skeleton: [thin slice]** · est [n] sessions · risk [high|med|low]
  - Goal: [one sentence]
  - Likely files: [paths or areas]
  - Acceptance check: [command / test / observable behavior]
  - Advances: [DC1, [screen]/[state]]
  - Depends on: —

## Coverage Matrix
| Item | Kind | Tasks |
|------|------|-------|
| DC1 — [done criterion, verbatim] | done criterion | T1, T4 |
| [screen]/empty | screen state | T3 |

## Cuts & Risks
- **Cut:** [scope moved to no-gos] — saves [n] sessions — accepted YYYY-MM-DD
- **Re-plan trigger:** [what would force stopping and re-planning]

## Parking Lot
- [idea raised during planning/build] — [date]

## Handoff Blocks

### T1 — [title]
**Context:** [product one-liner; the problem this feature solves; what exists after previous tasks]
**Goal:** [one sentence]
**Constraints:** [stack and managed services to use; appetite remaining; glossary terms for user-facing copy]
**Files:** [create / modify]
**Screen spec:** docs/screens/[name].md — states: [list]
**Acceptance check:** [exact command or behavior]
**Non-goals:** [no-gos relevant to this task]
**Test plan:** [tests to add or run]
**When done:** tick T1 in this plan. Do not start T2.

## Progress Log
| Date | Tasks ticked | Sessions used | Note |
|------|--------------|---------------|------|
```

## Exit condition

Someone who has never seen the pitch could start T1 tomorrow and know, for every task, when it is done — and the coverage matrix shows nothing in the build file is unplanned.

## AI review prompt

1. Does T1 actually run end-to-end, or is it a horizontal layer ("set up the database") in disguise?
2. Is the riskiest task really in the first third, or was the comfortable work front-loaded?
3. Can every acceptance check be executed by someone else with a yes/no result?
4. Is any task secretly larger than 2 sessions (multiple screens, a new integration plus UI)?
5. Does every done criterion and required screen state appear in the coverage matrix?
6. Did the appetite check cut scope — or did estimates quietly shrink to fit?
7. Could an agent execute each handoff block without opening any document besides the named screen spec?

## Checklist

- [ ] T1 is a walking skeleton through every layer
- [ ] Riskiest work is in the first third
- [ ] Every task ≤ 2 sessions, with goal, likely files, acceptance check, advances, depends-on
- [ ] Every done criterion and screen state is covered by ≥ 1 task
- [ ] Estimate ≤ 80% of session budget, or cuts were accepted
- [ ] No cut removes a done criterion (that goes back to `product:shape`)
- [ ] Parking lot exists, even if empty
- [ ] (pro) Milestones with sessions-used checkpoints
- [ ] (pro) Every task has a self-contained handoff block
