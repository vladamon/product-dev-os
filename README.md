# Product OS

A repeatable, AI-native product development operating system. Globally installed as a Claude Code plugin. Works across every project repo.

---

## What this is

A system for turning ideas into coherent, buildable, shippable products — and for auditing and revamping products that already exist but have grown incoherent.

It has two layers:

- **Recipes** — 17 markdown files that define the process. The authoritative knowledge base. What to do, why to do it, what questions to ask, what a good artifact looks like, and what "done" means.
- **Skills** — 9 Claude Code skills that execute the recipes. They read your repo, interview you, and produce structured artifacts into your project's `docs/` folder.

The skills are runners. The recipes are the authority. Improving a recipe improves the skill that uses it automatically.

---

## Why this exists

### The problem it solves

Building products alone — without a designer, without a researcher, without a product manager — is hard not because you lack the ability, but because you lack the **structure** to compensate for those missing roles.

The typical failure mode is not "bad execution." It's building the wrong thing with coherence problems that compound over time:

- Screens that don't know what question they're answering
- Terminology that drifts across the codebase, the UI, and the docs
- Features that were never scoped so they grow forever
- A product model that lives only in one person's head and slowly becomes wrong
- Components that create consistent incoherence rather than fixing it

The other failure mode is the opposite: creating an elaborate planning system that becomes the thing you build instead of the product. Long PRDs nobody reads. Beautiful frameworks that gather dust.

This OS is designed to prevent both failure modes at once. It enforces discipline without bureaucracy. It produces artifacts that are short enough to actually use and specific enough to actually guide decisions.

### Why AI-native

The previous generation of product frameworks assumed you'd write documents manually and follow checklists in your head. That works with a team. Alone, it collapses under execution pressure.

This OS is different: the AI interviews you, reads your codebase, pre-populates what it already knows, and writes the artifacts. You provide judgment; the system provides structure. The result is that you get the benefits of a thorough process in a fraction of the time.

### Why skills over documents

A document you read is a reference. A skill you invoke is a process. The OS is built as skills because the goal is not for you to know the framework — it's for the framework to run when you need it.

You don't need to remember the 17 steps. You need to know: "I have an idea, so I run `product:discover`." Everything else follows.

---

## The rationale behind every major decision

### One unified system with tiered depth — not two separate systems

The temptation is to build a "lite" system for personal projects and a "pro" system for serious products. That creates two things to maintain and two mental models to hold.

Instead: one system, two depth tiers. The same skill, the same artifact template, the same output location. The tier controls how thorough the interview is and which sections are required vs. deferred. A lite run produces the same file as a pro run — lite just leaves some sections marked `[deferred]`.

This means you can start lite on a personal project, decide it's worth investing in, and deepen it with a pro run without starting over. Same artifacts, additive process.

### Interview-first, repo-aware — not template-first

Most productivity frameworks give you templates and expect you to fill them in. That requires you to already know what to write, which defeats the purpose.

This OS flips it: the skill reads your repo first, then interviews you on what it couldn't determine from context. The interview is dynamic — questions you can answer from existing artifacts are pre-populated and shown for confirmation, not asked again. Only missing or stale information gets asked about.

The draft-from-context mode (where the skill generates a first draft and you refine it) exists as a fallback, but the default is interview-first because generating a draft too early anchors you to whatever the AI guessed, which is often close enough to accept but wrong in subtle ways.

### Skills read recipes — recipes are the authority

This is the most important architectural decision in the system.

If the interview logic lived inside the skill files, improving the process would require editing skill files. That's fine while the system is new, but as you learn what works and what doesn't, you want to refine the process without touching skill infrastructure.

By separating recipes (what to ask, what constitutes good output, exit conditions) from skills (the runner that conducts the interview), you get a clean upgrade path: refine the recipe, the skill improves automatically.

### Two tracks — not one linear flow

"New product" and "existing product" are fundamentally different starting conditions. Forcing an existing product through a discovery process it doesn't need is waste. Forcing a new product through an audit process that has nothing to audit is nonsense.

The two tracks diverge at the entry point and converge at `product:model`. After that, the process is the same: shape a slice, spec the screens, build it, reflect.

The audit skill is arguably the most valuable skill in the set for anyone working on a product that already exists, which is most products most of the time. It reconstructs the mental model from what's actually there, rather than from what you think is there.

### `docs/intake/` as a read-only drop zone

Context documents — a brief you wrote, research notes, competitor analysis, user feedback, a Slack thread, a Linear issue — are often the starting point for product work. Without a designated place for them, they end up scattered, linked, or lost.

`docs/intake/` is the designated drop zone. Skills read from it. Nothing writes to it. It's yours.

You can also bypass the default and point skills at any folder or file at invocation time:

```
product:shape using docs/brief.md, docs/research/competitors.md
```

The system is flexible about where context comes from. The important thing is that it reads it before asking you to repeat it.

### Point-in-time artifacts for decisions, living documents for definitions

Shaped pitches, build checklists, and retrospectives are decisions made at a point in time. They should be immutable — you want to be able to look back at what you decided and why, without the artifact being updated to match current reality.

Product model, glossary, information architecture, screen specs, and journeys are definitions of the current state of the product. They should be updated as the product evolves. Re-running the relevant skill enters update mode — asks only about what changed, appends a change note, never silently overwrites.

The date prefix on decision artifacts (`YYYY-MM-DD-feature-pitch.md`) makes it obvious which are which.

### Conflict detection — never silent resolution

When a skill reads the codebase and finds something that contradicts the existing docs — a route that isn't in the IA, an object that exists in code but not in the product model, a screen that was removed but still has a spec — it flags the discrepancy and asks you to decide.

It never silently resolves conflicts. Silent resolution is how documentation diverges from reality and becomes worthless. You always own the resolution.

### No full orchestrator — a lightweight navigator instead

The temptation is to build a `product:next` skill that reads the project state and automatically kicks off the right next skill. That's a beautiful concept that becomes fragile in practice.

Instead, `product:next` is a navigator: it reads artifacts, reports what exists vs. what's missing, and tells you what to run next. You make the invocation. The system gives you orientation, not automation.

This keeps the skills independent. You can enter at any phase. A mature project with a solid product model can go straight to `product:shape` without running `product:model` again. A project that needs one specific screen spec doesn't have to run the full journey mapping phase first.

### The `product:audit` skill as the GlassFlow entry point

This OS was designed first with GlassFlow in mind — a product that already exists, is partially incoherent, and needs a revamp rather than a ground-up rebuild. That's the hardest case: you have context, constraints, existing users, existing code. You can't ignore what exists, but you also can't be constrained by every decision that was made when the product was simpler.

`product:audit` handles this by separating **what exists** from **what it should be**. It reads the codebase and produces a factual current-state document. Then `product:model` takes that and helps you formalize the target state. The gap between them is the revamp scope.

---

## The 9 skills

### `product:next`

**When to use:** Orientation. Use it when returning to a project after a break, when you're not sure where you are in the process, or when starting a new work session.

**What it does:** Reads all artifacts in `docs/`, builds a status snapshot, tells you what exists vs. what's missing vs. what's deferred. Outputs a "run this next" recommendation.

**Produces:** Nothing. Pure output.

---

### `product:discover`

**When to use:** You have a new product idea and nothing exists yet, or you're starting a fresh feature area with no prior artifacts.

**What it does:** Walks you through idea brief → assumption mapping → discovery inputs. Reads `docs/intake/` or any specified context files first. Pre-populates what it can from context. Interviews you on the problem, target user, current workarounds, trigger moments, desired outcome, existing alternatives, risky assumptions, and scope boundaries.

**Produces:**
- `docs/product/product-model.md` (seed version)
- `docs/product/assumptions.md`

---

### `product:audit`

**When to use:** You have an existing product, codebase, or MVP that needs to be understood, revamped, or made coherent. This is the starting point for any revamp track.

**What it does:** Reads the codebase structure, route definitions, component names, TypeScript interfaces, navigation structure, and all existing docs. Interviews you on what's working, what's broken, what users complain about, and what the revamp goal is. Produces a current-state document with a screen inventory, extracted object model, identified inconsistencies, terminology gaps, and prioritized problem list.

**Produces:**
- `docs/product/audit.md`

---

### `product:model`

**When to use:** After `product:discover` or `product:audit`. When you need to formalize the product's internal world before designing screens or shaping features.

**What it does:** Formalizes core objects + relationships, lifecycle states, user-facing terminology, information architecture, product positioning, and non-goals. For revamp track: reconciles the extracted model from audit with what you want it to be.

**Produces:**
- `docs/product/product-model.md` (full version)
- `docs/product/glossary.md`
- `docs/product/information-architecture.md`

---

### `product:journey`

**When to use:** Before designing screens for a specific user flow. Run once per primary journey — typically 3–5 journeys per product.

**Invocation:** `product:journey "create pipeline"`

**What it does:** Maps the named journey from trigger to completion. Reads the product model. Interviews you on: user goal, trigger, entry point, preconditions, required decisions per step, system responses, failure states, completion criteria, follow-up actions.

**Produces:**
- `docs/product/journeys/[kebab-case-name].md`

---

### `product:shape`

**When to use:** Before building any feature. This is the gate between "thinking about it" and "building it."

**Invocation:** `product:shape "reusable connection library"`

**What it does:** Shapes a bounded, buildable feature slice. Reads the product model, existing journeys, existing pitches, and any specified context. Interviews you on: problem statement, appetite (time budget), solution outline, what's explicitly in and out, risks, rabbit holes, done criteria.

**Produces:**
- `docs/specs/YYYY-MM-DD-[feature]-pitch.md`

---

### `product:spec`

**When to use:** Before building a specific screen. One spec per screen.

**Invocation:** `product:spec "pipeline detail overview"`

**What it does:** Produces a complete screen specification. Reads the relevant journey, shaped pitch, existing screen specs (for consistency), and component library structure. Interviews you on: purpose, primary user question, entry points, layout, required data, all states (loading, empty, healthy, degraded, failed, permission denied), components, copy rules, acceptance criteria.

**Produces:**
- `docs/screens/[kebab-case-name].md`

---

### `product:build`

**When to use:** After shaping a feature and speccing its screens, before writing code.

**What it does:** Runs a build readiness checklist. Verifies: domain model exists, empty/loading/error states are specced, copy uses glossary terms, instrumentation is planned. Optionally generates an architecture skeleton suggestion based on the product model and codebase structure.

**Produces:**
- `docs/specs/YYYY-MM-DD-[feature]-build.md`

---

### `product:reflect`

**When to use:** After a feature ships. Always. This is the loop-closer.

**What it does:** Reads the shaped pitch and build checklist. Accepts metrics exports, user feedback, or analytics docs as context. Interviews you on what shipped, what you expected vs. what happened, evidence, and problems found. Forces a structured decision: continue / improve / simplify / pivot / kill.

**Produces:**
- `docs/specs/YYYY-MM-DD-[feature]-retro.md`

---

## The two tracks

**New product:**
```
product:discover → product:model → product:journey → product:shape → product:spec → product:build → product:reflect
```

**Existing product / revamp:**
```
product:audit → product:model → product:shape → product:spec → product:build → product:reflect
```

**Navigator (any time):**
```
product:next
```

Skills are independent. You don't have to run the full track. Enter at the phase you need.

---

## Depth tiers

Every skill runs in one of two depths:

| | `lite` | `pro` |
|---|---|---|
| Questions | 3–5 essential | 8–15 full |
| Optional sections | Skipped, marked `[deferred]` | Required |
| Interview style | Conversational | Structured |
| Artifacts | Essential sections only | All sections complete |
| Time | ~5–10 min | ~20–40 min |
| Use for | Personal projects, fast validation | GlassFlow-level, team-facing docs |

**Invoke a tier:**
```
product:shape lite
product:shape pro
product:shape          ← auto-detected from project state
```

**Auto-detection:**
- `docs/product/product-model.md` exists → suggest `pro`
- `docs/product/audit.md` exists → suggest `pro`
- `docs/product/` empty or missing → suggest `lite`
- Ambiguous → asks once at start

**Tier escalation:** Start lite, go pro later. Running pro on a lite artifact enters update mode — fills in deferred sections, never overwrites what exists.

---

## Context input

Pass existing documents to any skill at invocation:

```
product:discover                                      ← checks docs/intake/ by default
product:discover from docs/research/                 ← reads entire folder
product:discover using docs/brief.md                 ← specific file
product:discover using docs/brief.md, docs/notes.md  ← multiple files
product:audit — also read docs/old-spec.md           ← natural language
```

The skill reads what you point it at, extracts relevant context, pre-populates what it can, and interviews you only on what's missing or ambiguous.

The `docs/intake/` folder is the default drop zone. Put any raw context there before running a skill. It's read-only from the skill's perspective — nothing writes to it.

---

## Artifact conventions

### Living documents (updated in place, no date prefix)
```
docs/product/product-model.md
docs/product/glossary.md
docs/product/information-architecture.md
docs/product/assumptions.md
docs/product/audit.md
docs/product/journeys/[name].md
docs/screens/[name].md
```

### Point-in-time documents (date-prefixed, never modified)
```
docs/specs/YYYY-MM-DD-[feature]-pitch.md
docs/specs/YYYY-MM-DD-[feature]-build.md
docs/specs/YYYY-MM-DD-[feature]-retro.md
```

### Standard frontmatter
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
  journey: docs/product/journeys/[name].md
  pitch: docs/specs/YYYY-MM-DD-[feature]-pitch.md
---
```

`status: deferred` marks sections a lite run skipped. A pro run fills them in and updates the status.

---

## Frameworks this draws from

This OS is not a single framework. It combines proven building blocks:

| Area | Source |
|---|---|
| Customer discovery | The Mom Test — ask about behavior, not opinions |
| Opportunity structuring | Continuous Discovery Habits (Teresa Torres) — outcomes → opportunities → solutions |
| Feature scoping | Shape Up (Basecamp) — appetite, boundaries, rabbit holes |
| Validated learning | Lean Startup — Build → Measure → Learn |
| User intent | Jobs-to-be-Done — what is the user trying to accomplish |
| Navigation | Information architecture principles |
| Screen definition | Screen spec pattern (text-based Figma replacement) |
| Delivery | Scrumban/Kanban — WIP limits, feedback loops |

The important principle: use them as ingredients, not religion. The cookbook approach means you extract what's useful from each framework and discard the ceremony.

---

## What this is not

- A project management system. It doesn't track tickets or sprints.
- A design system. It produces specs; you implement the design system separately.
- A replacement for user research. It structures what you know; it can't generate evidence you don't have.
- A one-size-fits-all process. Lite runs exist because not every idea deserves a 40-page PRD.
- Something to follow step-by-step every time. Enter at the phase you need. Use what's useful.

---

## Installation

Add this repo as a globally-installed Claude Code plugin:

```json
// ~/.claude/settings.json
{
  "plugins": [
    "/path/to/product-dev-os"
  ]
}
```

After installation, all `product:*` skills are available in every repo.

---

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
