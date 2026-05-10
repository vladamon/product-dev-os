---
type: design-spec
topic: product-os
created: 2026-05-09
status: approved
---

# Product OS — Design Spec

## Overview

A globally-installed Claude Code plugin that provides a repeatable, AI-native product development operating system. Skills are available in every project repo. Artifacts produced by skills land in the current project's `docs/` tree.

The OS has two layers:
- **Recipes** — authoritative markdown knowledge base (17 files). The source of truth for what to do and why.
- **Skills** — execution layer (9 skills). They read recipes, conduct interviews, read repo context, and produce artifacts.

---

## 1. Repository Structure

```
product-dev-os/
├── CLAUDE.md                            ← plugin manifest + skill registration
├── README.md                            ← full rationale and usage guide
├── skills/
│   ├── next.md
│   ├── discover.md
│   ├── audit.md
│   ├── model.md
│   ├── journey.md
│   ├── shape.md
│   ├── spec.md
│   ├── build.md
│   └── reflect.md
├── recipes/
│   ├── 01-idea-brief.md
│   ├── 02-assumption-map.md
│   ├── 03-discovery.md
│   ├── 04-opportunity-map.md
│   ├── 05-positioning.md
│   ├── 06-product-model.md
│   ├── 07-journey-map.md
│   ├── 08-information-architecture.md
│   ├── 09-shaped-pitch.md
│   ├── 10-screen-spec.md
│   ├── 11-interaction-rules.md
│   ├── 12-ui-system.md
│   ├── 13-technical-architecture.md
│   ├── 14-build-checklist.md
│   ├── 15-usability-testing.md
│   ├── 16-measure.md
│   └── 17-retrospective.md
├── templates/
│   ├── product-model.md
│   ├── journey-map.md
│   ├── shaped-pitch.md
│   ├── screen-spec.md
│   ├── audit-report.md
│   └── build-checklist.md
└── docs/
    └── superpowers/
        └── specs/
            └── 2026-05-09-product-os-design.md    ← this file
```

**Per-project artifact tree** (written into each project that uses the OS):

```
[your-project]/
└── docs/
    ├── intake/                          ← drop zone: raw context, never written by skills
    ├── product/
    │   ├── product-model.md             ← living document
    │   ├── glossary.md                  ← living document
    │   ├── information-architecture.md  ← living document
    │   ├── assumptions.md               ← living document
    │   ├── audit.md                     ← living document (revamp track only)
    │   └── journeys/
    │       └── [kebab-case-name].md     ← living document, one per journey
    ├── specs/
    │   ├── YYYY-MM-DD-[feature]-pitch.md       ← point-in-time
    │   ├── YYYY-MM-DD-[feature]-build.md       ← point-in-time
    │   └── YYYY-MM-DD-[feature]-retro.md       ← point-in-time
    └── screens/
        └── [kebab-case-name].md         ← living document, one per screen
```

---

## 2. The 9 Skills

### `product:next` — Navigator

**Purpose:** Orientation. Reads all artifacts in `docs/product/`, `docs/specs/`, and `docs/screens/`. Builds a status snapshot: what exists, what's missing, what's deferred, what phase the project is in. Outputs a clear "run this next" recommendation.

**Produces:** Nothing. Pure orientation output.

**When to use:** When returning to a project after a break, when disoriented about where you are in the process, or when starting a new work session.

---

### `product:discover` — New Product Entry Point

**Purpose:** Walks through idea brief → assumption mapping → discovery inputs for a brand-new product or feature with no prior artifacts.

**Context reading:**
- User-specified files (via `--from`, `--using`, or natural mention)
- `docs/intake/` if no files specified and folder exists
- Nothing from the codebase (blank project assumption)

**Interview covers:** The problem, target user, current workarounds, trigger moment, desired outcome, existing alternatives, risky assumptions, initial scope boundaries.

**Produces:**
- `docs/product/product-model.md` (seed version, lite or pro)
- `docs/product/assumptions.md`

**Tier difference:**
- `lite`: idea brief + top 5 assumptions only
- `pro`: full interview through opportunity mapping

---

### `product:audit` — Existing Product Entry Point

**Purpose:** Analyzes an existing product or codebase, reconstructs the mental model from what already exists, identifies flows and inconsistencies, and produces a current-state document that feeds the revamp track.

**Context reading:**
- Codebase structure: file/folder tree, route definitions, component names, TypeScript interfaces, navigation structure
- All existing `docs/` files
- User-specified files and `docs/intake/`

**Interview covers:** What's working, what's broken, what users complain about, what the revamp goal is, what must not change.

**Produces:**
- `docs/product/audit.md` — current-state document with: screen inventory, extracted object model, identified inconsistencies, terminology gaps, prioritized problem list

**Tier difference:**
- `lite`: screen inventory + top 5 problems
- `pro`: full extraction including object model, state language audit, terminology consistency check, IA gaps

---

### `product:model` — Product Definition

**Purpose:** Formalizes the product's internal world: core objects, relationships, lifecycle states, glossary, information architecture, primary user roles, and positioning.

**Context reading:**
- `docs/product/audit.md` (if revamp track)
- `docs/product/assumptions.md` (if new product track)
- TypeScript type definitions from codebase (to extract domain object candidates)

**Interview covers:** Core objects + relationships, object lifecycle states, user-facing terminology, information architecture, product positioning, non-goals.

**Produces:**
- `docs/product/product-model.md` (full version)
- `docs/product/glossary.md`
- `docs/product/information-architecture.md`

**Tier difference:**
- `lite`: objects, states, IA skeleton only
- `pro`: full object graph, all lifecycle states, complete IA, positioning brief, non-goals

---

### `product:journey` — Journey Mapping

**Purpose:** Maps a specific named user journey from trigger to completion.

**Invocation:** Takes a journey name as argument — `product:journey "create pipeline"`

**Context reading:**
- `docs/product/product-model.md`
- Existing journey files in `docs/product/journeys/`

**Interview covers:** User goal, trigger, entry point, preconditions, required decisions per step, system responses, failure states, completion criteria, follow-up actions.

**Produces:**
- `docs/product/journeys/[kebab-case-name].md`

**Tier difference:**
- `lite`: happy path + 2 key failure states
- `pro`: full journey with all failure states, edge cases, and recovery paths

---

### `product:shape` — Feature Scoping

**Purpose:** Shapes a bounded, buildable feature slice using Shape Up principles. Defines appetite, solution outline, what's in/out, risks, rabbit holes, and done criteria.

**Invocation:** Takes a feature idea as argument — `product:shape "reusable connection library"`

**Context reading:**
- `docs/product/product-model.md`
- `docs/product/journeys/`
- Existing shaped pitches in `docs/specs/`
- User-specified context files (Slack threads, Linear issues, idea notes)

**Interview covers:** Problem statement, appetite (time budget), solution outline, user flow, inclusions, explicit exclusions, risks, rabbit holes, done criteria.

**Produces:**
- `docs/specs/YYYY-MM-DD-[feature]-pitch.md`

**Tier difference:**
- `lite`: problem + appetite + inclusions/exclusions + done criteria
- `pro`: full Shape Up pitch with risks, rabbit holes, user flow

---

### `product:spec` — Screen Specification

**Purpose:** Produces a complete specification for a single screen — the text-based replacement for Figma in this workflow.

**Invocation:** Takes a screen name as argument — `product:spec "pipeline detail overview"`

**Context reading:**
- Relevant journey file from `docs/product/journeys/`
- Relevant shaped pitch from `docs/specs/`
- Existing screen specs in `docs/screens/` (for consistency reference)
- Component library structure from codebase (if detectable)

**Interview covers:** Purpose, primary user question, secondary questions, entry points, primary action, layout, required data, all states (loading, empty, healthy, degraded, failed, permission denied), components used, copy rules, acceptance criteria.

**Produces:**
- `docs/screens/[kebab-case-name].md`

**Tier difference:**
- `lite`: purpose + primary question + layout + happy path states
- `pro`: all states, full component list, copy rules, acceptance criteria

---

### `product:build` — Build Readiness

**Purpose:** Verifies that a shaped feature is ready to build. Runs the build checklist, generates an architecture skeleton suggestion, and produces the build plan document.

**Context reading:**
- Shaped pitch from `docs/specs/`
- Screen specs from `docs/screens/` for the feature
- Codebase architecture and folder structure

**Interview covers:** Domain model existence, empty/loading/error state coverage, glossary term usage in copy, instrumentation plan, architecture fit.

**Produces:**
- `docs/specs/YYYY-MM-DD-[feature]-build.md`

**Tier difference:**
- `lite`: checklist only
- `pro`: checklist + architecture skeleton + instrumentation plan

---

### `product:reflect` — Retrospective

**Purpose:** Closes the loop on a shipped feature. Forces a structured decision: continue / improve / simplify / pivot / kill.

**Context reading:**
- Shaped pitch from `docs/specs/`
- Build checklist from `docs/specs/`
- User-specified metrics exports, user feedback, or analytics docs

**Interview covers:** What shipped, what you expected vs. what happened, evidence, problems found, decision.

**Produces:**
- `docs/specs/YYYY-MM-DD-[feature]-retro.md`

**Tier difference:**
- `lite`: what shipped + decision only
- `pro`: full retrospective with evidence, problem list, and next slice definition

---

## 3. The Two Tracks

**New product track:**
```
product:discover → product:model → product:journey → product:shape → product:spec → product:build → product:reflect
```

**Existing product / revamp track:**
```
product:audit → product:model → product:shape → product:spec → product:build → product:reflect
```

**Navigator (any time):**
```
product:next
```

Not every project runs every skill. A mature project with a solid product model might go straight to `product:shape`. A revamp might skip `product:journey` if the journeys are already well-understood. The skills are independent — use what you need.

---

## 4. Depth Tier System

| | `lite` | `pro` |
|---|---|---|
| Questions per skill | 3–5 | 8–15 |
| Optional sections | Skipped, marked `[deferred]` | Required |
| Interview style | Conversational | Structured |
| Artifact output | Essential sections only | All sections complete |
| Time per run | ~5–10 min | ~20–40 min |
| Best for | Personal projects, early exploration, fast validation | GlassFlow-level, team-facing docs, serious investment |

**Invocation:**
```
product:shape lite
product:shape pro
product:shape          ← auto-detected from project state
```

**Auto-detection logic:**
- `docs/product/product-model.md` exists → suggest `pro`
- `docs/product/audit.md` exists → suggest `pro`
- `docs/product/` empty or missing → suggest `lite`
- Ambiguous → ask once at skill start

**Tier escalation:** A `lite` run and a `pro` run produce the same file. Sections skipped by lite are marked `status: deferred` in frontmatter. Running pro on a lite artifact enters update mode — asks only about deferred sections, never overwrites existing content silently.

---

## 5. Context Input Convention

All skills accept external context at invocation:

```
product:discover                                    ← checks docs/intake/ as default
product:discover from docs/research/               ← reads entire folder
product:discover using docs/brief.md               ← reads specific file
product:discover using docs/brief.md, docs/notes.md ← reads multiple files
product:audit — also read docs/old-spec.md         ← natural language mention
```

**Reading priority:**
1. User-specified files or folders
2. `docs/intake/` (if no files specified and folder exists)
3. Existing product artifacts (`docs/product/`, `docs/specs/`, `docs/screens/`)
4. Codebase signals (routes, types, components — for `product:audit` and `product:build` only)

**Context summary shown before interview:** Every skill shows what it found and inferred before asking a single question. User confirms, corrects, or adds before the interview begins. Skills never run on wrong assumptions.

---

## 6. Artifact Conventions

**Two artifact types:**

- **Living documents** — updated in place. No date prefix. Source of truth at any point in time. Re-running the relevant skill enters update mode.
- **Point-in-time documents** — date-prefixed (`YYYY-MM-DD`), never modified retroactively. Represent decisions made at a specific moment.

**Standard frontmatter (all artifacts):**

```yaml
---
type: product-model | journey | shaped-pitch | screen-spec | build-checklist | retro | audit | assumptions
product: [product name]
tier: lite | pro
status: draft | complete | deferred
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:[skill-name]
related:
  journey: docs/product/journeys/[name].md        ← optional
  pitch: docs/specs/YYYY-MM-DD-[feature]-pitch.md ← optional
---
```

**Update mode behavior:**
1. Reads existing document
2. Shows what's already there
3. Asks only about `deferred` sections or information that looks stale
4. Appends change note: `Updated YYYY-MM-DD via product:[skill]`
5. Never silently overwrites — shows diff on significant changes and asks for confirmation

**Conflict detection:** If codebase state contradicts docs (e.g., a route exists that isn't in the IA), the skill flags it explicitly and asks for a decision. The user resolves; the skill never silently resolves conflicts.

**`docs/intake/` contract:** Skills read from intake, never write to it. Raw input zone only.

---

## 7. Recipe Structure

Every recipe follows this template:

```markdown
---
id: [number]-[slug]
phase: discovery | definition | design | delivery | learning
tier-lite: true | false
tier-pro: true
produces: [artifact path pattern]
skill: product:[skill-name]
---

# Recipe: [Name]

## When to use
[Trigger condition]

## Inputs
[What must exist before running]

## Lite version
[3–5 essential questions only]

## Pro version
[Full interview structure]

## Output structure
[Required artifact sections]

## Exit condition
[What "done" looks like — specific and testable]

## AI review prompt
[Prompt the skill uses to self-critique the finished artifact]

## Checklist
[Verification items]
```

**Principle:** Skills are runners, recipes are authorities. Improving a recipe automatically improves the skill that runs it. No skill file needs to change when the process improves.

**Recipe to skill mapping:**

| Skill | Recipes |
|---|---|
| `product:discover` | 01, 02, 03 |
| `product:audit` | audit recipe (new) |
| `product:model` | 04, 05, 06, 08 (glossary produced as output of 06) |
| `product:journey` | 07 |
| `product:shape` | 09 |
| `product:spec` | 10, 11 |
| `product:build` | 13, 14 |
| `product:reflect` | 16, 17 |
| Manual reference only | 12 (UI System), 15 (Usability Testing) |

Recipes 12 and 15 are not skill-driven. UI system work is handled by project-specific design system skills (e.g., `glassflow-ui-design` for GlassFlow). Usability testing is a manual process that cannot be meaningfully automated.

---

## 8. Implementation Sequence

Build in this order:

1. `CLAUDE.md` — plugin manifest and skill registration
2. `templates/` — all 6 artifact templates
3. `recipes/` — all 17 recipe files (start with 01–09, ship the rest)
4. `skills/product:next.md` — navigator (simplest skill, good smoke test)
5. `skills/product:audit.md` — highest immediate value (GlassFlow use case)
6. `skills/product:model.md`
7. `skills/product:shape.md`
8. `skills/product:spec.md`
9. `skills/product:discover.md`
10. `skills/product:journey.md`
11. `skills/product:build.md`
12. `skills/product:reflect.md`
13. `README.md` — comprehensive rationale and usage guide

First real use: run `product:audit` on GlassFlow to validate the system end-to-end before building remaining skills.
