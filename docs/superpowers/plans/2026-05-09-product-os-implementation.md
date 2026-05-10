# Product OS Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a globally-installed Claude Code plugin with 9 skills, 18 recipes, 6 templates, and a plugin manifest that together form a repeatable AI-native product development operating system.

**Architecture:** Three layers — plugin manifest (CLAUDE.md registers skills and provides context), recipes (authoritative markdown knowledge base that defines what to do and how), and skills (execution layer that reads recipes, interviews users, reads repo context, and writes artifacts). Skills are runners; recipes are authorities. Artifacts always land in the current project's `docs/` tree.

**Tech Stack:** Markdown, YAML frontmatter, Claude Code plugin system (no code, no dependencies)

**Phases:**
- Phase 1 (Tasks 1–2): Plugin infrastructure — CLAUDE.md + 6 templates
- Phase 2 (Tasks 3–9): Recipes — 18 recipe files
- Phase 3 (Tasks 10–18): Skills — 9 skill files
- Phase 4 (Task 19): Validation

Each phase is independently committable. Complete Phase 1 before Phase 2; complete Phase 2 before Phase 3.

---

## File Map

**Create:**
```
CLAUDE.md
templates/product-model.md
templates/journey-map.md
templates/shaped-pitch.md
templates/screen-spec.md
templates/audit-report.md
templates/build-checklist.md
recipes/00-audit.md
recipes/01-idea-brief.md
recipes/02-assumption-map.md
recipes/03-discovery.md
recipes/04-opportunity-map.md
recipes/05-positioning.md
recipes/06-product-model.md
recipes/07-journey-map.md
recipes/08-information-architecture.md
recipes/09-shaped-pitch.md
recipes/10-screen-spec.md
recipes/11-interaction-rules.md
recipes/12-ui-system.md
recipes/13-technical-architecture.md
recipes/14-build-checklist.md
recipes/15-usability-testing.md
recipes/16-measure.md
recipes/17-retrospective.md
skills/next.md
skills/audit.md
skills/discover.md
skills/model.md
skills/journey.md
skills/shape.md
skills/spec.md
skills/build.md
skills/reflect.md
```

**Already exist (do not overwrite):**
```
README.md
docs/superpowers/specs/2026-05-09-product-os-design.md
INITIAL_BRAINSTORMING.md
```

---

## Phase 1: Plugin Infrastructure

### Task 1: Plugin Manifest

**Files:**
- Create: `CLAUDE.md`

- [ ] **Create `CLAUDE.md` with the following content:**

```markdown
# Product OS

A globally-installed Claude Code plugin providing a repeatable, AI-native product development operating system. Skills are available in every repo. Artifacts land in the current project's `docs/` tree.

## Available Skills

When the user invokes a `product:*` skill, load and follow the corresponding skill file from `skills/`.

| Skill | File | When to use |
|-------|------|-------------|
| `product:next` | `skills/next.md` | Orientation — returning to a project, need to know where you are |
| `product:discover` | `skills/discover.md` | New product idea, blank canvas, no prior artifacts |
| `product:audit` | `skills/audit.md` | Existing product — analyze, understand, prepare for revamp |
| `product:model` | `skills/model.md` | After discover or audit — formalize the product model |
| `product:journey` | `skills/journey.md` | Before designing screens — map a specific user flow |
| `product:shape` | `skills/shape.md` | Before building — scope a bounded feature slice |
| `product:spec` | `skills/spec.md` | Before building a screen — write the screen specification |
| `product:build` | `skills/build.md` | After shaping + speccing — verify build readiness |
| `product:reflect` | `skills/reflect.md` | After shipping — retrospective and iterate/kill decision |

## Plugin Structure

```
skills/     ← skill definitions (one file per skill)
recipes/    ← knowledge base (authoritative process docs, read by skills)
templates/  ← artifact templates (filled in by skills when producing output)
```

## Two Tracks

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

## Depth Tiers

Every skill supports two depth tiers:
- `lite` — 3–5 questions, compact artifact, optional sections deferred (~5–10 min)
- `pro` — full interview, all sections required (~20–40 min)

Invoke with: `product:shape lite` or `product:shape pro`. Without a tier, the skill auto-detects from project state.

## Context Input Convention

All skills accept external context at invocation:
```
product:discover from docs/research/
product:discover using docs/brief.md
product:discover using docs/brief.md, docs/notes.md
product:audit — also read docs/old-spec.md
product:discover                             ← checks docs/intake/ by default
```

## Artifact Locations

Skills write into the **current project's** `docs/` tree:
- `docs/product/` — living documents (updated in place)
- `docs/specs/` — point-in-time decisions (date-prefixed, never overwritten)
- `docs/screens/` — screen specifications
- `docs/intake/` — user-managed drop zone (read by skills, never written by skills)
```

- [ ] **Verify the file exists:**

```bash
ls -la CLAUDE.md
```

Expected: file exists, non-zero size.

- [ ] **Commit:**

```bash
git add CLAUDE.md
git commit -m "feat: add plugin manifest (CLAUDE.md)"
```

---

### Task 2: Artifact Templates

**Files:**
- Create: `templates/product-model.md`
- Create: `templates/journey-map.md`
- Create: `templates/shaped-pitch.md`
- Create: `templates/screen-spec.md`
- Create: `templates/audit-report.md`
- Create: `templates/build-checklist.md`

- [ ] **Create `templates/product-model.md`:**

```markdown
---
type: product-model
product: PRODUCT_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:model
---

# Product Model — PRODUCT_NAME

## Product Promise

[One sentence: what this product helps users accomplish and for whom]

## Primary Users

[Who uses it, what skill level, what context they come from]

## Core Objects

[The domain objects that make up this product's world]

| Object | Description | Owned by |
|--------|-------------|----------|
| | | |

## Object Relationships

[How objects connect — parent/child, references, lifecycle dependencies. Use a tree or table.]

## Object Lifecycle States

[For each primary object, the states it can be in and what triggers each transition]

### [Object Name] States

| State | Meaning | Triggered by |
|-------|---------|--------------|
| | | |

## User Roles

[Who can do what. If single-user product, describe the one role.]

| Role | Can do | Cannot do |
|------|--------|-----------|
| | | |

## Product Areas

[Main navigation areas and the user question each answers]

| Area | User question answered | Contains |
|------|----------------------|----------|
| | | |

## Positioning

**Category:** [What kind of product is this — control plane, dashboard, builder, etc.]
**Primary user:** [Specific role and context]
**Main pain:** [The situation that drives them to need this]
**Main promise:** [The outcome they get]
**Main alternative:** [What they'd use instead — even if "nothing" or "spreadsheet"]
**Differentiation:** [What makes this better for them specifically]

## Non-Goals

[What this product will deliberately not become. Be specific.]

- This product will not become [X].
- This product will not try to [Y].

---
*Updated YYYY-MM-DD via product:model*
```

- [ ] **Create `templates/journey-map.md`:**

```markdown
---
type: journey
product: PRODUCT_NAME
journey: JOURNEY_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:journey
---

# Journey: JOURNEY_NAME

## User Goal

[What the user is trying to accomplish — one sentence in the user's terms]

## Trigger

[The specific moment or situation that sends the user into this journey]

## Entry Point

[Where in the product this journey starts]

## Preconditions

[What must already exist or be true for this journey to be possible]

- [ ] [Precondition 1]
- [ ] [Precondition 2]

## Steps

| # | User action | System response | Screen |
|---|-------------|-----------------|--------|
| 1 | | | |
| 2 | | | |

## Required Decisions

[Choices the user must make — these become your most important design moments]

- **[Decision]:** Options are [A] or [B]. Default is [A] because [reason].

## Failure States

[What can go wrong and where. For lite: top 2. For pro: all.]

| Step | Failure | How user recovers |
|------|---------|-------------------|
| | | |

## Completion State

[What the user sees and knows when the journey is done. Must be unambiguous.]

## Follow-Up Actions

[What the user is likely to do next after completing this journey]

---
*Updated YYYY-MM-DD via product:journey*
```

- [ ] **Create `templates/shaped-pitch.md`:**

```markdown
---
type: shaped-pitch
product: PRODUCT_NAME
feature: FEATURE_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:shape
---

# Shaped Pitch: FEATURE_NAME

## Problem

[What user pain or opportunity does this address? What happens today without this?]

## Appetite

[How much time is this worth? This is a maximum, not an estimate.]

**Appetite:** [1 week / 2 weeks / 6 weeks]

## Solution Outline

[The rough approach — enough detail to validate feasibility, not enough to over-specify. Leave room for the implementer to solve problems.]

## User Flow

[How it works from the user's perspective, step by step]

1. [Step 1]
2. [Step 2]

## What's Included

[Explicit list of what is in scope]

- [ ] [Included item 1]
- [ ] [Included item 2]

## What's Excluded (No-Gos)

[Explicit list of what is out of scope. Being specific here prevents scope creep.]

- [Excluded item 1] — [why excluded]
- [Excluded item 2] — [why excluded]

## Risks

[What could derail this? Technical, UX, dependency, or product risks.]

- **[Risk]:** [What could go wrong and why it matters]

## Rabbit Holes

[Where could we overbuild? What details might pull us in?]

- **[Rabbit hole]:** [What it is and how to avoid it]

## Done Means

[Specific, testable criteria. Not "it works" — what specifically must be true.]

- [ ] [Done criterion 1]
- [ ] [Done criterion 2]

---
*Updated YYYY-MM-DD via product:shape*
```

- [ ] **Create `templates/screen-spec.md`:**

```markdown
---
type: screen-spec
product: PRODUCT_NAME
screen: SCREEN_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:spec
related:
  journey: docs/product/journeys/JOURNEY_NAME.md
  pitch: docs/specs/YYYY-MM-DD-FEATURE-pitch.md
---

# Screen: SCREEN_NAME

## Purpose

[What this screen is for — one sentence]

## Primary User Question

[The single most important thing a user needs to know or do on this screen]

## Secondary Questions

[Other things the user might need to know or do here]

- [Secondary question 1]
- [Secondary question 2]

## Entry Points

[How the user gets to this screen]

- [Entry point 1]
- [Entry point 2]

## Primary Action

[The one most important action available on this screen]

## Secondary Actions

[Other available actions, in priority order]

1. [Action 1]
2. [Action 2]

## Layout

[Describe the screen structure — header, main content areas, panels, tabs]

**Header:** [What's in the header]
**Main content:** [What occupies the primary area]
**Side panel / tabs:** [If applicable]
**Footer / action bar:** [If applicable]

## Data Required

[All data fields that must be loaded or displayed]

| Field | Source | Notes |
|-------|--------|-------|
| | | |

## States

[Every state this screen must handle]

- **Loading:** [What the user sees while data loads]
- **Empty:** [What the user sees when there's no data yet]
- **Populated (healthy):** [The main happy-path state]
- **Error:** [If data fails to load]
- **Permission denied:** [If user lacks access — if applicable]
- **[Additional states]:** [Any domain-specific states: degraded, failed, out-of-sync, etc.]

## Components Used

[Reusable components from the design system]

- [Component 1]
- [Component 2]

## Copy Rules

[Terminology and label rules specific to this screen]

- Use "[term]" not "[alternative]"
- [Copy rule 2]

## Acceptance Criteria

[What must be true for this screen to be considered done]

- [ ] [Criterion 1]
- [ ] [Criterion 2]

---
*Updated YYYY-MM-DD via product:spec*
```

- [ ] **Create `templates/audit-report.md`:**

```markdown
---
type: audit
product: PRODUCT_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:audit
---

# Product Audit — PRODUCT_NAME

## What This Product Is

[One sentence description extracted or confirmed during audit]

## Revamp Goal

[What the user wants this audit to enable — the "why now"]

## Screen Inventory

[Every screen or major view that currently exists]

| Screen | Purpose | Keep / Fix / Remove | Problem |
|--------|---------|---------------------|---------|
| | | | |

## Extracted Object Model

[Domain objects inferred from codebase + confirmed with user]

| Object | Where found | Appears consistent? | Notes |
|--------|-------------|---------------------|-------|
| | | | |

## Identified Inconsistencies

[Places where the product contradicts itself — terminology, behavior, layout, or model]

1. **[Inconsistency]:** [Where it appears, why it matters]

## Terminology Gaps

[Concepts that have multiple names, or names that are unclear]

| Concept | Names used | Recommended term |
|---------|-----------|-----------------|
| | | |

## State Language Audit

[How the product currently communicates object states — and where it fails]

| State | How it's shown today | Problem |
|-------|---------------------|---------|
| | | |

## Information Architecture Gaps

[Missing areas, misplaced features, navigation problems]

1. **[Gap]:** [What's missing or wrong]

## Prioritized Problem List

[Top problems to address, ordered by impact]

| Priority | Problem | Impact | Effort |
|----------|---------|--------|--------|
| 1 | | | |
| 2 | | | |

## What Must Not Change

[What's working well or what users depend on]

- [Constraint 1]
- [Constraint 2]

## Recommended Next Step

[Which skill to run next and why]

---
*Updated YYYY-MM-DD via product:audit*
```

- [ ] **Create `templates/build-checklist.md`:**

```markdown
---
type: build-checklist
product: PRODUCT_NAME
feature: FEATURE_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:build
related:
  pitch: docs/specs/YYYY-MM-DD-FEATURE-pitch.md
---

# Build Checklist: FEATURE_NAME

## Domain Model

- [ ] Core objects for this feature exist in the codebase (types, interfaces, or models defined)
- [ ] Object states are mapped to UI status values — no raw backend states exposed
- [ ] Object relationships are reflected in the data layer

## Screen Coverage

- [ ] All screens in scope have a spec in `docs/screens/`
- [ ] Loading state is specced and will be implemented for every screen
- [ ] Empty state is specced and will be implemented for every screen
- [ ] Error state is specced and will be implemented for every screen
- [ ] Domain-specific states (degraded, failed, out-of-sync, etc.) are specced

## Copy and Terminology

- [ ] All user-facing copy uses glossary terms from `docs/product/glossary.md`
- [ ] No raw backend identifiers or internal jargon in user-facing strings
- [ ] Error messages explain what happened and what to do next

## Architecture

**Proposed structure:**

```
[Describe folder/file structure for this feature]
```

- [ ] Feature structure follows existing codebase patterns
- [ ] Domain logic is separated from UI components
- [ ] No circular dependencies introduced

## Instrumentation

[Events to track for this feature]

| Event | When it fires | Properties |
|-------|--------------|------------|
| | | |

- [ ] Key user actions are tracked
- [ ] Failure events are tracked
- [ ] Completion/success events are tracked

## Acceptance Criteria (from pitch)

[Copy done criteria from the shaped pitch]

- [ ] [Criterion 1]
- [ ] [Criterion 2]

---
*Updated YYYY-MM-DD via product:build*
```

- [ ] **Verify all templates exist:**

```bash
ls templates/
```

Expected output:
```
audit-report.md
build-checklist.md
journey-map.md
product-model.md
screen-spec.md
shaped-pitch.md
```

- [ ] **Commit:**

```bash
git add templates/
git commit -m "feat: add artifact templates (6 files)"
```

---

## Phase 2: Recipes

### Task 3: Audit Recipe

**Files:**
- Create: `recipes/00-audit.md`

- [ ] **Create `recipes/00-audit.md`:**

```markdown
---
id: 00-audit
phase: discovery
tier-lite: true
tier-pro: true
produces: docs/product/audit.md
skill: product:audit
---

# Recipe: Product Audit

## When to use

Use this recipe when you have an existing product, codebase, or MVP that needs to be understood before it can be improved. This is the entry point for the revamp track — it replaces `product:discover` when the product already exists.

Use it when:
- A product feels incoherent and you can't articulate why
- You're inheriting a codebase someone else built
- You're starting a major revamp and need to understand current state before designing future state
- The gap between what the product is and what it should be is unclear

## Inputs

- The codebase (read file tree, routes, components, type definitions)
- Any existing docs (`docs/product/`, `docs/specs/`, `docs/screens/`)
- Optional: user-specified context files (`docs/intake/`, passed via `--from`/`--using`)

No formal inputs required — the skill extracts what it can from what exists.

## Lite version (3–5 questions)

Ask these questions one at a time:

1. **What is this product?** One sentence — what it does and who it's for.
2. **What are the top 3 things that are broken, inconsistent, or confusing?**
3. **What must not change?** What's working or what users depend on.
4. **What is the goal of this revamp?** What does success look like?
5. **Who are the primary users and how technical are they?** (Skip if clearly inferable.)

Produce: Screen inventory (from codebase reading) + top 5 problems.

## Pro version (8–12 questions)

Ask lite questions 1–5, then continue:

6. **Walk me through the main user journey.** From arrival to primary goal accomplished.
7. **What does the current terminology look like?** Concepts with multiple names, or confusing names?
8. **What states can the main entity be in?** Does the UI represent those states clearly?
9. **What are the most common user complaints or support requests?**
10. **How does the current information architecture feel?** Can users find what they need?
11. **What technical debt or frontend architectural decisions are making the product harder to improve?**
12. **Are there any screens or features that should be removed entirely?**

Produce: Full audit report including object model, state language audit, terminology gaps, IA gaps, and prioritized problem list.

## Output structure

Use `templates/audit-report.md`. All sections required for pro; screen inventory + prioritized problem list minimum for lite.

## Exit condition

The audit is done when you can answer: "What are the 5 most important problems to solve and in what order?" If you cannot answer that, the audit is incomplete.

## AI review prompt

After producing the artifact, review it against:
1. Is the prioritized problem list actually prioritized, or is it just a list?
2. Is every inconsistency specific enough to act on, or is it vague?
3. Does the extracted object model reflect what's actually in the codebase?
4. Is the "what must not change" section honest, or does it just say "everything is fine"?
5. Does the recommended next step follow logically from the findings?

## Checklist

- [ ] Screen inventory covers all pages/views in the product
- [ ] Object model matches what was actually found in the codebase
- [ ] Inconsistencies are specific (not "navigation is confusing" — but "the term 'destination' is used in 3 different ways across 4 screens")
- [ ] Prioritized problem list has no more than 7 items
- [ ] Recommended next step is specified
```

- [ ] **Commit:**

```bash
git add recipes/00-audit.md
git commit -m "feat: add audit recipe"
```

---

### Task 4: Discovery Recipes (01–03)

**Files:**
- Create: `recipes/01-idea-brief.md`
- Create: `recipes/02-assumption-map.md`
- Create: `recipes/03-discovery.md`

- [ ] **Create `recipes/01-idea-brief.md`:**

```markdown
---
id: 01-idea-brief
phase: discovery
tier-lite: true
tier-pro: true
produces: docs/product/product-model.md (seed)
skill: product:discover
---

# Recipe: Idea Brief

## When to use

Use this at the very start of a new product or major feature. You have an idea but nothing is written down yet. The goal is to make the idea concrete enough to evaluate — to move from "I have an idea" to "I can explain this in one sentence without sounding vague."

A good one-sentence explanation:
- Bad: "An AI assistant for productivity."
- Good: "A tool that helps solo consultants turn messy client conversations into structured proposals, tasks, and follow-ups."

## Inputs

- The user's mind (nothing formal required)
- Optional: any notes, briefs, or documents the user has (via `--from`/`--using` or `docs/intake/`)

## Lite version (5 questions)

Ask one at a time:

1. **What is the product idea?** Describe it — what it does and who it's for.
2. **Who specifically has the problem?** Not "teams" or "developers" — a specific person in a specific situation.
3. **What painful situation exists today?** What happens when this person tries to do what your product will help them do?
4. **How do they solve it today?** What tools, manual processes, or workarounds do they use?
5. **What would change for them if your product worked perfectly?**

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **When does the user feel this pain?** What is the specific trigger moment?
7. **What alternatives exist?** Name specific products, not categories.
8. **What is intentionally out of scope?** What will this product never try to do?

## Output structure

Seed version of `docs/product/product-model.md` using the template. Fill in: Product Promise, Primary Users, and a partial Core Objects section (objects that came up in the conversation, even if incomplete).

## Exit condition

You can explain the idea in one sentence that is specific enough that a stranger could tell you whether they have the problem described.

## AI review prompt

Review the idea brief against:
1. Is the target user specific enough? "Small business owners" is not specific. "Freelance consultants who send proposals via email" is.
2. Is the problem described in terms of a situation, not a missing feature?
3. Is the current workaround mentioned? If not, the problem may not be real enough.
4. Is the scope boundary clear? What will this NOT do?

## Checklist

- [ ] Product idea is one sentence, specific, and jargon-free
- [ ] Target user is a specific person, not a category
- [ ] Problem is described as a situation, not a missing feature
- [ ] Current workaround is identified
- [ ] At least one scope boundary is defined
```

- [ ] **Create `recipes/02-assumption-map.md`:**

```markdown
---
id: 02-assumption-map
phase: discovery
tier-lite: true
tier-pro: true
produces: docs/product/assumptions.md
skill: product:discover
---

# Recipe: Assumption Map

## When to use

Use this after the idea brief, before doing any design work. The goal is to identify what could kill the idea before you invest in it.

Most product failures are not execution failures — they are assumption failures. The team built the right thing for the wrong assumptions. This recipe forces you to name the assumptions before they become invisible.

## Inputs

- Completed idea brief (or seed product model)
- The user's knowledge of the market and users

## Lite version (3 questions)

1. **List 3–5 things that must be true for this idea to work.** These are your assumptions.
2. **Which assumption would kill the idea if it turned out to be false?** That's your riskiest assumption.
3. **How could you test the riskiest assumption with minimal effort?**

## Pro version (full)

For each assumption identified, classify it:

| Type | Question it answers |
|------|---------------------|
| Desirability | Do people want this? |
| Viability | Can this become sustainable? |
| Feasibility | Can I build it? |
| Usability | Can users understand it? |
| Distribution | Can I reach users? |
| Trust | Will users believe it's safe/reliable? |

For each assumption:
- What type is it?
- What is the risk level (high/medium/low)?
- How could you test it?
- What evidence already exists?

## Output structure

`docs/product/assumptions.md` — a table of assumptions with type, risk, and test method.

```markdown
# Assumptions — [Product Name]

| Assumption | Type | Risk | Evidence | Test method |
|------------|------|------|----------|-------------|
| | | | | |

## Riskiest Assumptions

[Top 3 assumptions that would kill the idea if false]

## Next Steps

[How to test the riskiest assumptions before building]
```

## Exit condition

You have identified the top 3–5 assumptions that could kill the idea, and for each you know either: (a) how you would test it, or (b) why you're proceeding despite the risk.

## AI review prompt

Review the assumption map against:
1. Are these actual assumptions (things that might be false) or facts?
2. Is the riskiest assumption actually the most dangerous one, or is something more fundamental being ignored?
3. Are the test methods realistic — could they actually be done?
4. Is the distribution assumption covered? Many products solve real problems but can't reach users.

## Checklist

- [ ] At least 5 assumptions identified
- [ ] Each assumption is classified by type
- [ ] Top 3 riskiest assumptions are explicitly named
- [ ] Each risky assumption has a test method or a stated reason for proceeding
- [ ] Distribution is covered as an assumption
```

- [ ] **Create `recipes/03-discovery.md`:**

```markdown
---
id: 03-discovery
phase: discovery
tier-lite: false
tier-pro: true
produces: docs/product/assumptions.md (updated with evidence)
skill: product:discover
---

# Recipe: Customer Discovery

## When to use

Use this when you have real or potential users to talk to, and you want to validate (or invalidate) your assumptions before building.

This recipe is based on The Mom Test principle: do not ask people if your idea is good. Ask about their actual past behavior, current problems, and existing workarounds. Opinions about future hypotheticals are worthless. Past behavior is evidence.

**Lite tier:** This recipe is pro-only. For lite projects, skip to Opportunity Map (recipe 04) using whatever evidence you have.

## Inputs

- Assumption map (recipe 02)
- Access to potential users (even 3–5 conversations is enough)

## The Interview Structure

### What to ask

Focus on these question types:

**Situation questions (what is true now):**
- Tell me about the last time [situation] happened.
- How often does this come up?
- What did you do when it happened?
- What tools do you use for this?
- What's annoying about how you do it now?

**Consequence questions (what it costs them):**
- What happens if you don't solve this?
- How much time does this take?
- Have you paid to solve this? What did you try?

**Priority questions (how important it is):**
- Where does this fit in your list of problems?
- What would make this urgent?
- Who else is affected by this?

### What NOT to ask

These produce fake validation:
- Would you use this?
- Would you pay for this?
- Do you like this idea?
- Would AI help you here?
- What features would you want?

## Output structure

Update `docs/product/assumptions.md` with a new section:

```markdown
## Discovery Evidence

### Conversations

| Date | Person | Key insight | Assumption affected |
|------|--------|-------------|---------------------|
| | | | |

### Patterns Found

[What appeared in 2+ conversations]

### Assumptions Validated

[Assumptions that now have positive evidence]

### Assumptions Invalidated

[Assumptions that turned out to be false]

### New Assumptions Surfaced

[Things you didn't expect to find]
```

## Exit condition

After 3–5 conversations you have evidence for:
- Real pain (not just agreement that the problem exists)
- Repeated behavior (they already do something related)
- Current workaround (they solve it somehow today)
- Clear target user (you can name the specific person, not the category)
- Specific trigger moment (when the pain occurs)

If you cannot find these after 5 conversations, the idea is weak.

## AI review prompt

Review the discovery findings against:
1. Is the evidence based on past behavior, or on opinions about hypotheticals?
2. Is there a single clear pattern, or are different users describing different problems?
3. Was a current workaround identified? If not, is the problem real enough?
4. Did any conversation invalidate a core assumption? If so, is that reflected?

## Checklist

- [ ] At least 3 conversations completed
- [ ] Evidence is based on past behavior, not opinions
- [ ] A repeated pattern was found
- [ ] Current workaround is documented
- [ ] At least one assumption was either validated or invalidated
```

- [ ] **Commit:**

```bash
git add recipes/01-idea-brief.md recipes/02-assumption-map.md recipes/03-discovery.md
git commit -m "feat: add discovery recipes (01-03)"
```

---

### Task 5: Definition Recipes Part 1 (04–06)

**Files:**
- Create: `recipes/04-opportunity-map.md`
- Create: `recipes/05-positioning.md`
- Create: `recipes/06-product-model.md`

- [ ] **Create `recipes/04-opportunity-map.md`:**

```markdown
---
id: 04-opportunity-map
phase: definition
tier-lite: false
tier-pro: true
produces: docs/product/product-model.md (opportunity section)
skill: product:model
---

# Recipe: Opportunity Map

## When to use

Use this after discovery, when you need to organize what you learned into product opportunities before deciding what to build. This is the bridge between "we know users have problems" and "we know which problems to solve first."

Based on Teresa Torres' Opportunity Solution Tree: start from an outcome you want to achieve, map user opportunities (problems/desires), then connect possible solutions. This prevents jumping directly from discovery to feature lists.

**Lite tier:** Skip this recipe. For lite projects, go directly from idea brief to product model.

## Inputs

- Discovery findings (recipe 03) or existing knowledge of user problems
- A desired product outcome (what behavioral change do you want users to make?)

## The Structure

```
Desired Outcome
  ├── Opportunity 1 (user problem/desire)
  │    ├── Solution A
  │    ├── Solution B
  │    └── Experiment to test
  ├── Opportunity 2
  │    ├── Solution C
  │    └── Experiment
  └── Opportunity 3
       ├── Solution D
       └── Experiment
```

## Interview Questions

1. **What is the one behavioral outcome you want users to achieve?** (Not a business metric — a user behavior. "Users successfully deploy their first pipeline within 30 minutes of signing up.")
2. **What are the top 3 user problems or desires that prevent that outcome?**
3. **For each problem: what solutions could address it?** Generate 2–3, don't commit to one yet.
4. **For each solution: what's the smallest experiment that would tell you if it works?**
5. **Which opportunity has the highest impact and lowest uncertainty?** That's where to start.

## Output structure

Add an "Opportunities" section to `docs/product/product-model.md`:

```markdown
## Opportunities

**Desired outcome:** [The user behavioral outcome]

| Opportunity | Evidence | Solutions considered | Chosen approach |
|-------------|----------|---------------------|-----------------|
| | | | |
```

## Exit condition

You are not just collecting feature ideas. You understand which user opportunities each potential feature serves, and you've chosen a starting opportunity based on evidence and impact.

## AI review prompt

1. Is the desired outcome a user behavior, not a business metric?
2. Are these genuine user opportunities, or just feature ideas dressed up as opportunities?
3. Is the chosen starting opportunity the highest-impact one, or the most comfortable one?

## Checklist

- [ ] Desired outcome is a specific user behavior
- [ ] At least 3 opportunities identified
- [ ] Each opportunity has at least 2 solutions considered
- [ ] One opportunity is chosen as the starting point with a rationale
```

- [ ] **Create `recipes/05-positioning.md`:**

```markdown
---
id: 05-positioning
phase: definition
tier-lite: false
tier-pro: true
produces: docs/product/product-model.md (positioning section)
skill: product:model
---

# Recipe: Positioning Brief

## When to use

Use this when you need to define what the product is and what it is not — before designing screens or building anything. Without this, features accumulate without a gravitational center. Every new idea seems relevant. The product expands until it collapses.

Positioning prevents product sprawl.

**Lite tier:** Skip this recipe. For lite projects, a one-sentence product promise is enough.

## Inputs

- Idea brief (recipe 01)
- Assumption map (recipe 02)
- Discovery findings if available (recipe 03)

## Interview Questions

1. **What category does this product belong to in the user's mind?** Not what you call it — what they'd call it when describing it to a colleague. ("It's like a dashboard for our pipelines." "It's a Kafka-to-ClickHouse config tool." "It's a control plane.")
2. **Who specifically is it for?** One sentence. Role + context. Not a company type.
3. **What is the main pain it solves?** One sentence. The situation, not the missing feature.
4. **What outcome does it create?** What's different for the user after using it successfully?
5. **What would the user use instead if this didn't exist?** Be honest — even if the answer is "they'd use a spreadsheet" or "they'd do it manually."
6. **Why this instead of that?** The real differentiation — not marketing copy.
7. **What will this product deliberately NOT do?** Be specific. Non-goals prevent scope creep.

## Output structure

Add a "Positioning" section to `docs/product/product-model.md`:

```markdown
## Positioning

**Category:** [How users would describe it to a colleague]
**Primary user:** [Specific role + context]
**Main pain:** [The situation being solved]
**Main promise:** [The outcome created]
**Main alternative:** [What they'd use instead]
**Differentiation:** [Why this instead]

## Non-Goals

- This product will not [specific thing].
- This product will not try to [specific thing].
```

## Exit condition

You can fill in the non-goals section with at least 3 specific things this product will not do. If you can't name what you won't do, you don't know what you will do.

## AI review prompt

1. Is the category something users would actually say, or product-team jargon?
2. Is the differentiation real and specific, or generic ("better UX", "easier to use")?
3. Are the non-goals specific enough to actually prevent scope creep in practice?
4. Is the primary user description specific enough to make design decisions with?

## Checklist

- [ ] Category is a phrase users would use, not internal terminology
- [ ] Primary user is specific (role + context, not demographic)
- [ ] Non-goals include at least 3 specific things
- [ ] Differentiation is specific and verifiable, not generic
```

- [ ] **Create `recipes/06-product-model.md`:**

```markdown
---
id: 06-product-model
phase: definition
tier-lite: true
tier-pro: true
produces: docs/product/product-model.md (core sections), docs/product/glossary.md
skill: product:model
---

# Recipe: Product Model

## When to use

Use this to formalize the product's internal world: the core objects, their relationships, their lifecycle states, and the terminology that names them. This is the most important definition work you can do. If the model is wrong, every screen built on top of it will be wrong in a consistent, structural way.

The product model is the backbone. Wizard, canvas, AI builder — all creation modes should update the same canonical model. Screens should reflect it. The glossary should enforce it.

Use it:
- After discovery or audit (first time)
- When the product grows a new major object
- When terminology is drifting and needs to be locked down
- When building a new team member onboarding

## Inputs

- Idea brief or audit report
- Any existing type definitions from the codebase (extract domain object candidates)
- User roles known from discovery

## Lite version (4 questions)

1. **What are the main things this product creates, manages, or tracks?** List them — these are your core objects.
2. **For the most important object, what states can it be in?** (e.g., Draft, Running, Failed, Stopped)
3. **How are the objects related?** Which ones belong to which? Which reference others?
4. **What is the most confusing or ambiguous term in the product today?** Define it clearly.

Produce: Core Objects table + States for primary object + 1 glossary entry per object.

## Pro version (8 questions)

Ask lite questions 1–4, then:

5. **For each supporting object, what states can it be in?**
6. **Who owns which objects?** (UI, backend, API — which system is the authority for each?)
7. **What is the information architecture?** What are the main navigation areas and what objects live in each?
8. **Are there any objects that don't have a clear name yet?** Let's name them.

Produce: Full product model + complete glossary + information architecture.

## Output structure

Two files:

**`docs/product/product-model.md`** — use `templates/product-model.md`. Fill in all sections.

**`docs/product/glossary.md`:**

```markdown
---
type: glossary
product: [Product Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:model
---

# Glossary — [Product Name]

[One entry per core concept. Primary user-facing term first, then technical equivalents if relevant.]

## [Term]

**Definition:** [What it means in this product specifically]
**Use in UI:** [How it appears to users]
**Do not use:** [Alternative terms to avoid]
**Technical equivalent:** [Backend/API term if different]

---

[Repeat for each term]
```

## Exit condition

You can draw the product's object model on a whiteboard and explain what state each object is in right now for a specific example. If you can't do that, the model is incomplete.

## AI review prompt

1. Are these real domain objects, or are some of them UI elements disguised as objects (e.g., "wizard step" is not a domain object)?
2. Are the lifecycle states complete? Is there a state the object can be in that isn't listed?
3. Does the information architecture reflect the object model? Every major object should live in exactly one place in the IA.
4. Are there terms in the glossary that still have multiple names? Each concept should have exactly one primary term.
5. Is there any object whose ownership is unclear — could be UI or backend?

## Checklist

- [ ] All core objects identified and named
- [ ] Every primary object has complete lifecycle states
- [ ] Object relationships are explicit (not implied)
- [ ] Every object has a glossary entry with primary term and alternatives to avoid
- [ ] Information architecture covers all major objects
- [ ] No object is "owned" by two systems simultaneously
```

- [ ] **Commit:**

```bash
git add recipes/04-opportunity-map.md recipes/05-positioning.md recipes/06-product-model.md
git commit -m "feat: add definition recipes part 1 (04-06)"
```

---

### Task 6: Definition Recipes Part 2 (07–08)

**Files:**
- Create: `recipes/07-journey-map.md`
- Create: `recipes/08-information-architecture.md`

- [ ] **Create `recipes/07-journey-map.md`:**

```markdown
---
id: 07-journey-map
phase: definition
tier-lite: true
tier-pro: true
produces: docs/product/journeys/[name].md
skill: product:journey
---

# Recipe: Journey Map

## When to use

Use this before designing any screens for a user flow. Screens without a journey are just panels — they don't add up to a coherent experience. The journey is the skeleton; screens are the flesh.

Run once per primary journey. Most products have 3–5 primary journeys. Start with the golden path (the most important thing a new user needs to accomplish successfully).

## Inputs

- Product model with core objects and states
- A specific journey name (passed as argument to `product:journey`)

## Lite version (5 questions)

1. **What is the user trying to accomplish?** One sentence in the user's terms.
2. **What triggers this journey?** The specific moment that sends them into it.
3. **Walk me through the steps.** Just the happy path — what does the user do, step by step?
4. **What can go wrong?** Top 2 failure states.
5. **How does the user know it's done?** What do they see or receive that confirms success?

Produce: Happy path steps + 2 failure states + completion state.

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **What must already exist before this journey is possible?** (Preconditions)
7. **What decisions does the user have to make along the way?** For each: what are the options, and what's the recommended default?
8. **What does the user do next after completing this journey?** (Follow-up actions — these often reveal gaps)

Produce: Full journey with all steps, all failure states, all decisions, preconditions, and follow-up actions.

## Output structure

`docs/product/journeys/[kebab-case-name].md` — use `templates/journey-map.md`.

## Exit condition

A developer can read this journey map and know exactly what screens need to exist and in what order. They shouldn't need to invent any transitions or intermediate states.

## AI review prompt

1. Does every step have both a user action AND a system response? A journey with only user actions is incomplete.
2. Are the failure states specific? "Something goes wrong" is not a failure state. "User submits a connection config but the credentials are invalid" is.
3. Are the required decisions fully specified? Each decision should have: options, recommended default, and consequences of each option.
4. Does the completion state make the user feel confident they succeeded?
5. Do the follow-up actions reveal any missing journeys that need to be mapped?

## Checklist

- [ ] User goal is one sentence in the user's terms (not system terms)
- [ ] Every step has a user action and a system response
- [ ] At least 2 failure states documented with recovery paths
- [ ] Required decisions have explicit options and recommended defaults
- [ ] Completion state is unambiguous — user knows they succeeded
- [ ] Follow-up actions are listed
```

- [ ] **Create `recipes/08-information-architecture.md`:**

```markdown
---
id: 08-information-architecture
phase: definition
tier-lite: false
tier-pro: true
produces: docs/product/information-architecture.md
skill: product:model
---

# Recipe: Information Architecture

## When to use

Use this after the product model is defined, when you need to organize the product's navigation and screen hierarchy. The IA answers: where does every object, action, and screen live?

Without an IA, products become collections of screens that the user navigates by guessing. With an IA, every new screen has a home before it's built.

**Lite tier:** Skip this recipe. For lite projects, a simple list of screens in the product model is enough.

## Inputs

- Product model (core objects and product areas)
- List of known or planned screens

## Interview Questions

1. **What are the top-level navigation areas?** (Usually 3–6 areas. Each should map to a product area from the product model.)
2. **For each area: what objects live there?** And what are the main screens within each area?
3. **Where does the user go to create a new [primary object]?** This is often the most important navigation decision.
4. **Where does the user go when something breaks or needs attention?** Operations/monitoring should have a clear home.
5. **Is there anything that doesn't fit cleanly in the IA?** Orphaned features often signal a product model problem.

## Output structure

`docs/product/information-architecture.md`:

```markdown
---
type: information-architecture
product: [Product Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:model
---

# Information Architecture — [Product Name]

## Navigation Structure

[Top-level areas and their contents]

[Area 1]
  ├── [Screen 1]
  ├── [Screen 2]
  └── [Object Detail]
       ├── [Tab 1]
       ├── [Tab 2]
       └── [Tab 3]

[Area 2]
  ...

## Screen Inventory

[Every screen with its type and parent area]

| Screen | Type | Area | Status |
|--------|------|------|--------|
| | overview / list / detail / builder / inspector / settings / confirm | | planned / exists / remove |

## Navigation Decisions

[Key navigation choices and why they were made]

- [Decision]: [Rationale]
```

## Exit condition

Every planned screen has a home in the IA. Every existing screen either has a home or is marked for removal. If you can't place a feature in the IA, the feature is underdefined.

## AI review prompt

1. Does every major object from the product model appear in the IA?
2. Is there a clear path from the landing page to the most important user action?
3. Are there any screens that appear in two places? (Usually indicates a model problem.)
4. Is the operations/monitoring area distinct from the configuration area? Mixing them creates confusion.
5. Are there any "junk drawer" areas — places where unrelated things accumulate?

## Checklist

- [ ] Every product area from the product model maps to a navigation area
- [ ] Every known screen is placed in exactly one location
- [ ] Creation flow for the primary object is explicitly located
- [ ] Operations/monitoring has a dedicated area
- [ ] No screen appears in two places
- [ ] Orphaned features are either placed or marked for removal
```

- [ ] **Commit:**

```bash
git add recipes/07-journey-map.md recipes/08-information-architecture.md
git commit -m "feat: add definition recipes part 2 (07-08)"
```

---

### Task 7: Design Recipes (09–11)

**Files:**
- Create: `recipes/09-shaped-pitch.md`
- Create: `recipes/10-screen-spec.md`
- Create: `recipes/11-interaction-rules.md`

- [ ] **Create `recipes/09-shaped-pitch.md`:**

```markdown
---
id: 09-shaped-pitch
phase: design
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-pitch.md
skill: product:shape
---

# Recipe: Shaped Pitch

## When to use

Use this before building any feature — always. This is the gate between "thinking about it" and "building it." The shaped pitch defines appetite, solution outline, what's explicitly in and out, risks, and done criteria.

Based on Ryan Singer's Shape Up (Basecamp). The key insight: instead of asking "how long will this take?", ask "how much time is this worth?" Appetite is a time budget, not an estimate. Working within appetite forces you to descope rather than overrun.

## Inputs

- Product model (so the pitch is grounded in the domain)
- Any context from `docs/intake/`, Linear issues, Slack threads, or specified files
- Journey maps if the feature touches a known journey

## Lite version (5 questions)

1. **What problem does this solve?** One sentence. What's happening today that shouldn't be?
2. **How much time is this worth?** Not an estimate — a maximum. Would you cut scope to ship in that time?
3. **What's the core solution?** Describe the approach in 2–3 sentences.
4. **What is explicitly excluded?** Name at least 3 things you won't build.
5. **How will you know it's done?** Name 3 specific, testable done criteria.

Produce: Problem + appetite + solution + no-gos + done criteria.

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **Walk me through how it works.** Step by step from the user's perspective.
7. **What could derail this?** Technical, UX, or dependency risks.
8. **Where could we overbuild?** What rabbit holes should we deliberately avoid?

Produce: Full pitch with all sections.

## Output structure

`docs/specs/YYYY-MM-DD-[feature]-pitch.md` — use `templates/shaped-pitch.md`.

Date prefix format: `2026-05-09-connection-library-pitch.md`

## Exit condition

You could hand this pitch to someone else and they could build the right thing without asking you to define scope. The no-gos are specific enough to reject scope creep. The done criteria are specific enough to pass/fail.

## AI review prompt

1. Is the appetite realistic given the solution? If the solution sounds like 6 months of work and the appetite is 1 week, one of them is wrong.
2. Are the no-gos specific enough to actually prevent scope creep? "No advanced features" is not a no-go. "No bulk import, no connection versioning, no secret rotation" is.
3. Are the done criteria verifiable? Each one should pass a yes/no test.
4. Are the rabbit holes things that would genuinely tempt the implementer? If not, they're not real rabbit holes.
5. Is the problem statement describing a situation, not a missing feature?

## Checklist

- [ ] Problem is a situation, not a missing feature
- [ ] Appetite is stated and would actually constrain scope
- [ ] Solution outline is rough enough to leave room for implementation decisions
- [ ] At least 3 specific no-gos are listed
- [ ] Risks are specific and actionable
- [ ] Done criteria are verifiable (yes/no tests, not vibes)
```

- [ ] **Create `recipes/10-screen-spec.md`:**

```markdown
---
id: 10-screen-spec
phase: design
tier-lite: true
tier-pro: true
produces: docs/screens/[screen-name].md
skill: product:spec
---

# Recipe: Screen Specification

## When to use

Use this before building any screen — always. This is the text-based replacement for Figma in this workflow. A screen spec answers: what is this screen for, what does it show, what can the user do, and what are all the states it can be in.

The screen spec does NOT replace visual design judgment. It defines what must exist and when. The implementer decides exactly how it looks.

## Inputs

- Product model (for terminology and object states)
- Relevant journey map (so the screen has context in a flow)
- Relevant shaped pitch (so the screen has context in a feature)

## Lite version (5 questions)

1. **What is this screen for?** One sentence — the screen's job.
2. **What is the primary user question?** The single most important thing a user needs to know or do on this screen.
3. **What does the layout look like?** Describe the structure: header, main content, side panel if any.
4. **What are the main actions?** List in priority order.
5. **What states does this screen need to handle?** At minimum: loading, empty, and main state.

Produce: Purpose + primary question + layout + main actions + core states.

## Pro version (10 questions)

Ask lite questions 1–5, then:

6. **What are the entry points?** How does a user get to this screen?
7. **What data is required?** List every field that needs to be fetched or displayed.
8. **What are the error and edge-case states?** Beyond loading/empty — what domain-specific states exist?
9. **What components will this use?** Reference the design system.
10. **What are the acceptance criteria?** Specific, testable conditions for "done."

Produce: Full screen spec with all sections.

## Output structure

`docs/screens/[kebab-case-name].md` — use `templates/screen-spec.md`.

Name format: `pipeline-detail-overview.md`, `connections-list.md`, `pipeline-builder-wizard.md`

## Enterprise screen state checklist

Every screen must specify these states before it can be considered complete:

| State | Required for |
|-------|-------------|
| Loading | All screens that fetch data |
| Empty | All list screens + detail screens on first use |
| Populated (happy path) | All screens |
| Error (fetch failure) | All screens that fetch data |
| Permission denied | Any screen with access control |
| Degraded / warning | Domain-specific (pipelines, operations) |
| Failed / critical | Domain-specific (pipelines, incidents) |
| Out of sync | Domain-specific (deployed vs. draft state) |

Missing states are the most common cause of poor enterprise UX. "Loading" is not a nice-to-have.

## Exit condition

A developer can build this screen without inventing any UX decisions. They know exactly what to show in every state, what actions are available, what data to fetch, and what "done" looks like.

## AI review prompt

1. Is the primary user question specific enough to make layout decisions with?
2. Are all realistic states covered? What happens when the data is loading, missing, or broken?
3. Are the acceptance criteria specific enough to pass/fail, or are they vague ("looks good", "works correctly")?
4. Does the copy section use glossary terms, or does it introduce new terminology?
5. Are there any actions on this screen that are destructive? If so, is there a confirmation pattern specified?

## Checklist

- [ ] Primary user question is one sentence and answerable
- [ ] Loading state is specified
- [ ] Empty state is specified (with explanation and CTA)
- [ ] Error state is specified (with message and recovery path)
- [ ] All domain-specific states are covered
- [ ] Destructive actions have confirmation pattern specified
- [ ] Acceptance criteria are verifiable
- [ ] Terminology matches the glossary
```

- [ ] **Create `recipes/11-interaction-rules.md`:**

```markdown
---
id: 11-interaction-rules
phase: design
tier-lite: false
tier-pro: true
produces: docs/product/interaction-rules.md
skill: product:spec
---

# Recipe: Interaction Rules

## When to use

Use this when you have multiple screens built and notice that similar actions behave differently across the product. Interaction rules create consistency — the same concept behaves the same way everywhere.

Define these rules once. Reference them in screen specs. Update them when you find a new pattern.

**Lite tier:** Skip this recipe. For lite projects, document rules inline in screen specs.

## Inputs

- Multiple completed screen specs
- Observed inconsistencies during development

## The Rule Inventory

Define explicit rules for each of these interaction types:

### Create
How does the user create a new [object]? (Modal? New page? Inline? Sheet?)
What happens after creation? (Stay on page? Navigate to detail? Show confirmation?)

### Edit
How does the user enter edit mode? (Click-to-edit? Edit button? Dedicated edit page?)
Are edits saved automatically or explicitly?
What happens to unsaved changes if the user navigates away?

### Save
What does "save" mean in this product? (Auto-save? Explicit save? Draft vs. published?)
How does the user know their changes are saved?

### Validate
When does validation run? (On submit? On blur? On change?)
How are validation errors shown? (Inline? Summary? Toast?)
Can the user submit with warnings (non-blocking issues)?

### Deploy
What's the difference between "save" and "deploy"?
What confirmation does the user see before deploying?
What does the user see during deployment?
What does the user see after deployment succeeds or fails?

### Delete / Destructive Actions
How is a delete action presented? (Never as a primary button)
What confirmation is required?
Is deletion reversible? If not, how is that communicated?

### Navigation Away With Unsaved Changes
What happens if the user navigates away from a screen with unsaved changes?
Is there a confirmation dialog, auto-save, or silent discard?

## Output structure

`docs/product/interaction-rules.md`:

```markdown
---
type: interaction-rules
product: [Product Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:spec
---

# Interaction Rules — [Product Name]

## Create
[Rule + rationale]

## Edit
[Rule + rationale]

## Save
[Rule + rationale]

## Validate
[Rule + rationale]

## Deploy
[Rule + rationale]

## Delete
[Rule + rationale]

## Navigation with unsaved changes
[Rule + rationale]
```

## Exit condition

The same concept behaves identically on every screen that uses it. You can answer "how does the user save their changes?" with a single answer that applies everywhere.

## AI review prompt

1. Are there any rules missing for interactions that exist in the product?
2. Are any rules contradicted by existing screen specs?
3. Is the delete/destructive action rule specific about what requires confirmation vs. what doesn't?
4. Are these rules opinionated enough to actually prevent inconsistency?

## Checklist

- [ ] Create pattern is defined
- [ ] Edit pattern is defined
- [ ] Save behavior is defined (including auto-save vs explicit)
- [ ] Delete/destructive actions have explicit rules
- [ ] Navigation-away-with-unsaved-changes behavior is defined
- [ ] Each rule has a rationale, not just a description
```

- [ ] **Commit:**

```bash
git add recipes/09-shaped-pitch.md recipes/10-screen-spec.md recipes/11-interaction-rules.md
git commit -m "feat: add design recipes (09-11)"
```

---

### Task 8: Delivery and Learning Recipes (12–17)

**Files:**
- Create: `recipes/12-ui-system.md`
- Create: `recipes/13-technical-architecture.md`
- Create: `recipes/14-build-checklist.md`
- Create: `recipes/15-usability-testing.md`
- Create: `recipes/16-measure.md`
- Create: `recipes/17-retrospective.md`

- [ ] **Create `recipes/12-ui-system.md`:**

```markdown
---
id: 12-ui-system
phase: design
tier-lite: false
tier-pro: true
produces: docs/design/ui-system.md
skill: manual (not skill-driven)
---

# Recipe: UI System

## When to use

Use this when building components that will be reused across multiple screens. This is a reference for defining your product's visual grammar — not a comprehensive design system, but the minimum opinionated set of rules and components that makes the product feel like one product.

**This recipe is manual — there is no `product:*` skill for it.** Use it as a reading reference when defining your design system or project-specific design skill.

## What a UI system is NOT

A UI system does not create coherence. A UI system only makes incoherence reusable. Build it after the product model and screen specs are stable — not before.

Wrong order: Components → screens → coherence (never happens)
Right order: Product model → journeys → screen specs → patterns → components

## Foundations to define

Define these before touching components:

- **Typography scale** — heading sizes, body sizes, label sizes, mono sizes
- **Spacing scale** — base unit (4px or 8px) and multipliers
- **Color roles** — background, surface, border, text, interactive, status colors
- **Status colors** — healthy, degraded, failed, deploying, stopped, draft, unknown
- **Border radius** — one or two values used consistently
- **Density** — compact vs. comfortable; when each applies

## Component priority

Build components in this order (stop when you have enough):

**Tier 1 (build first — appear on every screen):**
- StatusBadge
- EmptyState
- ErrorState
- PageHeader / EntityHeader
- MetricCard

**Tier 2 (build when first screen needs them):**
- ValidationPanel
- ConfigDiff / ConfigPreview
- Timeline
- ResourceSelector
- IncidentRow

**Tier 3 (build only when needed):**
- All other components

## Layout primitives

- AppShell — app frame, navigation, sidebar
- PageLayout — standard page with header + content
- DetailLayout — header + status strip + tabs
- BuilderLayout — left nav + center canvas + right inspector
- SplitPaneLayout — two resizable panes

## Output structure

`docs/design/ui-system.md` — document your decisions as you build them. Do not plan the full system upfront.

## Checklist

- [ ] Status colors defined for all pipeline/entity states
- [ ] Spacing scale is consistent (not ad-hoc pixel values)
- [ ] EmptyState component exists with: icon, explanation, CTA
- [ ] StatusBadge covers all states in the product model
- [ ] No inline styles for colors that have design tokens
```

- [ ] **Create `recipes/13-technical-architecture.md`:**

```markdown
---
id: 13-technical-architecture
phase: delivery
tier-lite: false
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-build.md (architecture section)
skill: product:build
---

# Recipe: Technical Architecture

## When to use

Use this when planning the frontend architecture for a new feature. The architecture should reflect the product model — if the product model says "PipelineDraft" is a central object, the code should have a strong PipelineDraft concept too.

Architecture that diverges from the product model creates a maintenance tax: every change requires translating between what the product means and what the code calls it.

**Lite tier:** Skip this recipe. For lite projects, follow existing codebase patterns without planning.

## Principles

1. **Domain model first, screens second, components third.** Never start with components.
2. **The code structure should match the product structure.** `features/pipeline-builder/` not `components/forms/pipeline/`.
3. **Domain logic belongs in domain modules, not in components.**
4. **Screens are thin.** They compose domain modules and components — they don't contain business logic.

## Structure pattern for feature work

```
domain/
  [object]/
    types.ts          ← TypeScript types for this domain object
    service.ts        ← API calls and data transformation
    store.ts          ← state management (if needed)
    validation.ts     ← validation logic

features/
  [feature-name]/
    index.tsx         ← entry point / route component
    [ScreenName].tsx  ← one file per screen
    components/       ← feature-local components only
      [ComponentName].tsx

components/
  ui/                 ← primitives (Button, Input, etc.)
  layout/             ← layout primitives (PageLayout, DetailLayout, etc.)
  domain/             ← domain-specific reusable components (StatusBadge, MetricCard, etc.)
```

## Interview Questions

1. **What domain objects does this feature introduce or modify?** Where do they currently live in the codebase?
2. **What new API endpoints will this feature call?** What data transformation is needed between API response and UI state?
3. **Does this feature require new global state, or is all state local to the feature?**
4. **What existing components can be reused?** What new components need to be created?
5. **Are there any circular dependency risks?** (Feature A importing from Feature B importing from Feature A)

## Output structure

Architecture section in `docs/specs/YYYY-MM-DD-[feature]-build.md`:

```markdown
## Architecture

**New files:**
- `domain/[object]/types.ts` — [what it contains]
- `features/[feature]/[Screen].tsx` — [what it does]

**Modified files:**
- `[existing file]` — [what changes]

**New components:**
- `[ComponentName]` — [what it does, props]

**Data flow:**
[Description of how data flows from API to UI state to components]
```

## Checklist

- [ ] Domain objects from the product model have corresponding code structures
- [ ] Feature folder structure follows existing codebase patterns
- [ ] No business logic in components — only in domain modules
- [ ] New API surface is documented
- [ ] No circular dependencies introduced
```

- [ ] **Create `recipes/14-build-checklist.md`:**

```markdown
---
id: 14-build-checklist
phase: delivery
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-build.md
skill: product:build
---

# Recipe: Build Checklist

## When to use

Use this after shaping a feature and writing screen specs, before writing code. It verifies that the feature is genuinely ready to build — not just "there's a rough idea, let's start."

## The Checklist

### Product readiness
- [ ] Shaped pitch exists with explicit done criteria and no-gos
- [ ] Every screen in scope has a screen spec
- [ ] Every screen spec has loading, empty, and error states defined
- [ ] Domain-specific states (degraded, failed, out-of-sync, etc.) are specced
- [ ] All copy uses glossary terms
- [ ] Destructive actions have confirmation patterns specified

### Domain model readiness
- [ ] Core objects for this feature exist in the product model
- [ ] Object states are mapped — no raw backend states in UI
- [ ] Object relationships are reflected in the data layer plan

### Architecture readiness (pro only)
- [ ] Domain module structure is planned
- [ ] New API endpoints and data transformations are identified
- [ ] Existing components to reuse are identified
- [ ] New components to build are identified

### Instrumentation
- [ ] Key user actions are planned for tracking
- [ ] Failure events are planned for tracking
- [ ] Success/completion events are planned for tracking

## Lite version

Run: product readiness checklist only. Skip architecture and instrumentation sections.

## Pro version

Run all sections including architecture and instrumentation.

## Output structure

`docs/specs/YYYY-MM-DD-[feature]-build.md` — use `templates/build-checklist.md`.

## Exit condition

All product readiness items are checked. The feature can be handed to an implementation agent or started immediately without requiring clarification on scope, states, or terminology.

## AI review prompt

1. Are there any screen specs that don't have error states defined?
2. Is there any copy in the specs that uses terms not in the glossary?
3. Are there any done criteria from the pitch that don't map to screen specs?
4. Is there any ambiguity about what "done" means that would cause a disagreement during review?

## Checklist

- [ ] All product readiness items checked
- [ ] At least one instrumentation event per user journey covered
- [ ] Done criteria from the pitch are reflected in acceptance criteria in screen specs
```

- [ ] **Create `recipes/15-usability-testing.md`:**

```markdown
---
id: 15-usability-testing
phase: delivery
tier-lite: false
tier-pro: true
produces: [no artifact — manual process]
skill: manual (not skill-driven)
---

# Recipe: Usability Testing

## When to use

Use this after building a feature and before declaring it done. The goal is to find confusion before it reaches all users.

**This recipe is manual — there is no `product:*` skill for it.** You need a real person and a working product. You cannot test usability with an AI.

## How to run a lightweight usability test

### Setup
1. Find 2–3 people who match your target user profile. Internal team members can work if genuine users aren't available — but note their proximity to the product.
2. Prepare 2–3 task scenarios. These are goals, not instructions.

### Task scenarios

Good task scenarios describe a goal, not a path:
- ✓ "You need to connect to a new Kafka cluster. Do that."
- ✓ "Find out if this pipeline is healthy and how many events it's processing per second."
- ✗ "Click the 'Connections' link in the sidebar, then click 'New Connection'."

### The session
1. Give the user the task scenario.
2. Ask them to think aloud as they work.
3. Do not explain, help, or react to confusion.
4. Write down: where they hesitate, what they click first, what they say.

### After the session
Ask:
- "What did you expect to happen when you [did X]?"
- "Was there anything confusing or unexpected?"
- "What would you have called that [feature/button/section]?"

## What to do with findings

Classify each finding:
- **Blocker:** User could not complete the task
- **Friction:** User completed the task but with significant confusion
- **Confusion:** User was uncertain but succeeded
- **Suggestion:** User had an idea for improvement

Fix blockers before shipping. Fix friction if time allows. Log confusion and suggestions for the next iteration.

## Minimum test

If you can only do one thing: give one person a task and watch them try to do it without explaining anything. Even one session reveals problems you can't see yourself.

## Checklist

- [ ] At least 2 task scenarios prepared (goal-framing, not instruction-framing)
- [ ] At least 1 person observed using the feature
- [ ] Blockers fixed before shipping
- [ ] Findings logged for next iteration
```

- [ ] **Create `recipes/16-measure.md`:**

```markdown
---
id: 16-measure
phase: learning
tier-lite: false
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-retro.md (evidence section)
skill: product:reflect
---

# Recipe: Measure

## When to use

Use this after shipping a feature, to gather evidence before deciding what to do next. Lean Startup's Build → Measure → Learn loop only works if you actually measure.

**Lite tier:** Skip this recipe. For lite projects, use observation and user conversations instead of instrumentation.

## What to measure

For every feature, measure at minimum:

| Metric | What it tells you |
|--------|------------------|
| Activation | Did users discover and try the feature? |
| Completion rate | Did users who started the journey finish it? |
| Drop-off step | Where in the journey do users stop? |
| Time to complete | Is the journey fast enough to not be frustrating? |
| Error frequency | How often do users hit validation errors or failures? |
| Return usage | Do users use the feature more than once? |

For your pipeline product specifically:

| Event | Why it matters |
|-------|---------------|
| wizard_started | Feature discovery |
| connection_selected | First meaningful step completion |
| validation_failed | Pain point identification |
| validation_passed | Journey progress |
| config_reviewed | Pre-deploy engagement |
| pipeline_deployed | Journey completion |
| pipeline_creation_abandoned | Drop-off detection |
| time_to_first_successful_deployment | Core success metric |

## What "actionable metrics" means

An actionable metric can change a decision. A vanity metric cannot.

- Vanity: "10,000 users viewed the pipeline creation page"
- Actionable: "62% of users who started pipeline creation abandoned at the connection selection step"

The second one tells you exactly what to fix.

## Evidence gathering checklist

- [ ] Activation rate measured (what % of active users tried the feature)
- [ ] Completion rate measured (what % who started, finished)
- [ ] Drop-off step identified if completion < 80%
- [ ] At least 3 user conversations or support tickets reviewed
- [ ] Key metric compared to pre-ship baseline (if baseline exists)

## Output structure

Evidence section in `docs/specs/YYYY-MM-DD-[feature]-retro.md`:

```markdown
## Evidence

### Quantitative
- Activation: [X]% of active users used the feature
- Completion: [X]% who started finished the journey
- Drop-off: [Step] had [X]% drop-off
- Error rate: [X]% of sessions hit a validation error

### Qualitative
- [Finding from user conversation or support ticket]
- [Finding 2]

### Baseline comparison
[How does this compare to before the feature shipped?]
```
```

- [ ] **Create `recipes/17-retrospective.md`:**

```markdown
---
id: 17-retrospective
phase: learning
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-retro.md
skill: product:reflect
---

# Recipe: Retrospective

## When to use

Use this after every shipped feature, without exception. This is the loop-closer. Without it, you are not learning from what you build — you are just shipping and moving on.

The retrospective forces one decision: what do you do next with this feature? You must choose one of: continue / improve / simplify / pivot / kill. No option to "keep building indefinitely" without re-scoping.

## Lite version (3 questions)

1. **What shipped?** One sentence — what is now in the product that wasn't before?
2. **Did it work?** What evidence do you have (observations, user reactions, metrics)?
3. **Decision:** Continue (it worked, build on it) / Improve (it works but has problems) / Simplify (too complex, cut it back) / Pivot (different approach needed) / Kill (doesn't work, remove it)?

Produce: What shipped + decision.

## Pro version (5 questions)

Ask lite questions 1–3, then:

4. **What problems did you find?** What didn't work as expected? What confused users?
5. **What is the next slice?** Given what you learned, what should you shape next?

Produce: Full retrospective with evidence, problem list, decision, and next slice definition.

## The five decisions

| Decision | Meaning |
|----------|---------|
| **Continue** | The feature worked as intended. Keep building in this direction. |
| **Improve** | The feature works but has specific problems. Fix them in the next slice. |
| **Simplify** | The feature is too complex. Identify what to cut in the next slice. |
| **Pivot** | The approach is wrong. Define a different approach in a new pitch. |
| **Kill** | The feature doesn't serve a real need. Remove it (or plan to). |

"Kill" feels harsh. It is. It's also the most valuable decision you can make — because it frees time for something better. A product that never kills features becomes a junkyard.

## Output structure

`docs/specs/YYYY-MM-DD-[feature]-retro.md`:

```markdown
---
type: retro
product: [Product Name]
feature: [Feature Name]
tier: [lite|pro]
status: complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:reflect
related:
  pitch: docs/specs/YYYY-MM-DD-[feature]-pitch.md
  build: docs/specs/YYYY-MM-DD-[feature]-build.md
---

# Retrospective: [Feature Name]

## What Shipped

[One sentence]

## What We Expected

[What did the shaped pitch predict?]

## What Happened

[What actually occurred — user behavior, metrics, feedback]

## Evidence

[Quantitative and qualitative evidence]

## Problems Found

[Issues discovered post-ship]

## Decision

**[Continue / Improve / Simplify / Pivot / Kill]**

[Rationale for the decision]

## Next Slice

[If continue/improve/simplify: what to shape next]
[If pivot: what different approach to try]
[If kill: what to remove and when]
```

## AI review prompt

1. Is the decision supported by the evidence, or is it wishful thinking?
2. If the decision is "continue" — is there actually evidence it worked, or just absence of evidence it failed?
3. If the decision is "kill" — is there a plan to remove it?
4. Is the next slice specific enough to be shaped immediately?

## Checklist

- [ ] What shipped is one specific sentence
- [ ] Evidence section has at least one data point (not just vibes)
- [ ] A decision is made — no "TBD" or "need more time to evaluate"
- [ ] If decision is not "kill," next slice is defined
```

- [ ] **Commit:**

```bash
git add recipes/12-ui-system.md recipes/13-technical-architecture.md recipes/14-build-checklist.md recipes/15-usability-testing.md recipes/16-measure.md recipes/17-retrospective.md
git commit -m "feat: add delivery and learning recipes (12-17)"
```

---

## Phase 3: Skills

### Task 9: product:next Skill

**Files:**
- Create: `skills/next.md`

- [ ] **Create `skills/next.md`:**

```markdown
# product:next — Navigator

Use this skill when the user invokes `/product:next` or asks where they are in the product development process.

## Purpose

Orientation. Read the current project's docs structure and produce a status snapshot: what exists, what's missing, what's deferred, and what to do next. Do not ask any questions. Do not produce any artifacts. This skill is read-only.

## Step 1: Read all product artifacts

Look for these files in the current project:

**Living documents (check existence and status frontmatter):**
- `docs/product/product-model.md`
- `docs/product/glossary.md`
- `docs/product/information-architecture.md`
- `docs/product/assumptions.md`
- `docs/product/audit.md`
- `docs/product/journeys/` — list all files

**Point-in-time documents (check existence and date):**
- `docs/specs/` — list all files, group by feature (by shared date prefix)

**Screen specs:**
- `docs/screens/` — list all files

**Intake:**
- `docs/intake/` — note if files exist (context ready to use)

## Step 2: Determine the phase

Based on what exists, classify the project:

| Phase | Signal |
|-------|--------|
| Pre-discovery | No docs/product/ directory or all files missing |
| Discovery in progress | assumptions.md exists but no product-model.md |
| Audit complete | audit.md exists but no full product-model.md |
| Model defined | product-model.md exists (check status: complete vs. deferred) |
| Journey mapped | journeys/ has files |
| Feature shaped | docs/specs/ has a pitch file |
| Feature specced | docs/screens/ has files matching a shaped feature |
| Build ready | docs/specs/ has a build file matching a pitch |
| Post-ship | docs/specs/ has a retro file |

## Step 3: Output the status report

Format:

```
product:next — [Project Name if detectable, otherwise "this project"]

Phase: [Current phase]

What exists:
  ✓ [artifact] — [status: complete / draft / deferred]
  ✓ [artifact] — [status]
  ○ [artifact] — missing

What's deferred:
  [list any artifacts with status: deferred and which sections need completing]

Intake:
  [X files in docs/intake/ ready to use] / [no intake files found]

Recommended next step:
  [Specific skill to run and why]

  Example: Run `product:model pro` — product-model.md exists but 3 sections
  are deferred from a previous lite run (lifecycle states, positioning, non-goals).
```

## Rules

- Never ask questions. Read and report only.
- Never produce artifacts. This skill is read-only.
- If no docs exist at all: "No product artifacts found. If this is a new product, run `product:discover`. If this is an existing product you want to audit, run `product:audit`."
- If intake files exist: always mention them and which skill would benefit from them.
```

- [ ] **Commit:**

```bash
git add skills/next.md
git commit -m "feat: add product:next skill"
```

---

### Task 10: product:audit Skill

**Files:**
- Create: `skills/audit.md`

- [ ] **Create `skills/audit.md`:**

```markdown
# product:audit — Existing Product Entry Point

Use this skill when the user invokes `/product:audit` or asks to analyze or understand an existing product, codebase, or MVP.

## Purpose

Analyze an existing product. Reconstruct the mental model from what actually exists. Identify inconsistencies, terminology gaps, and prioritized problems. Produce `docs/product/audit.md` — the current-state document that feeds the revamp track.

Read recipe `recipes/00-audit.md` for the authoritative process. This skill executes that recipe.

## Step 1: Determine tier

Check if the user specified a tier in the invocation (`product:audit lite` or `product:audit pro`).

If no tier specified:
- If `docs/product/product-model.md` exists → suggest `pro`
- If `docs/product/audit.md` already exists → this is an update run → suggest `pro`
- Otherwise → ask: "Run **lite** (screen inventory + top 5 problems, ~5–10 min) or **pro** (full extraction including object model, state audit, terminology, ~20–40 min)?"

## Step 2: Check for existing audit

If `docs/product/audit.md` already exists:
- Read it
- Enter **update mode**: "An audit already exists from [date]. I'll ask only about what's changed or missing."
- Ask only about sections marked `status: deferred` or information that looks outdated

## Step 3: Read context

Read in this order:

**1. User-specified files** (from `--from`, `--using`, or natural mention in invocation)

**2. `docs/intake/`** — read all files if folder exists and no files were specified

**3. Existing docs:**
- `docs/product/` — all files
- `docs/specs/` — all files
- `docs/screens/` — all files

**4. Codebase signals** (read these systematically):
- File/folder tree: run `find . -type d -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/dist/*' -not -path '*/build/*' | head -60`
- Routes: look for `src/app/`, `src/pages/`, `app/`, `pages/`, router config files
- Component names: look for `src/components/`, list directory names (not individual files)
- TypeScript types: look for `*.types.ts`, `types/`, `interfaces/`, `src/types/`
- Navigation config: look for sidebar config, nav config, route definitions

## Step 4: Show context summary

Before asking any questions:

```
product:audit — reading project...

Codebase signals found:
  Routes/pages: [list detected routes or "none found"]
  Component directories: [list detected component directories]
  Domain types: [list detected type files]

Existing docs:
  [list files found in docs/ with their status]

Context files:
  [list intake or specified files read]

Will ask about: [what couldn't be determined from reading]

Does this look right? Anything to correct before we start?
```

Wait for confirmation.

## Step 5: Conduct the interview

Read `recipes/00-audit.md` for the exact questions to ask. Follow the lite or pro question set based on tier.

Ask one question at a time. Wait for a complete answer before proceeding.

## Step 6: Produce the artifact

Write `docs/product/audit.md` using `templates/audit-report.md`.

Fill in all sections with information from:
- Codebase reading (Step 3)
- User answers (Step 5)

For lite: fill in Screen Inventory + Prioritized Problem List. Mark other sections `[deferred]` in frontmatter.

For pro: fill in all sections.

## Step 7: Summarize and recommend

After writing:

```
Audit complete → docs/product/audit.md

Key findings:
  • [Most important finding 1]
  • [Most important finding 2]
  • [Most important finding 3]

Top problem: [The single highest-priority problem]

Recommended next step:
  product:model — to formalize the target product model based on this audit

  Or if you want to jump straight to scoping the most important fix:
  product:shape "[description of top problem]"
```

## Rules

- Never silently resolve conflicts between codebase state and existing docs. Flag them explicitly.
- Never overwrite an existing audit.md without showing what will change and getting confirmation.
- The context summary is not optional — always show it before the first question.
- `docs/intake/` is read-only. Never write to it.
```

- [ ] **Commit:**

```bash
git add skills/audit.md
git commit -m "feat: add product:audit skill"
```

---

### Task 11: product:model Skill

**Files:**
- Create: `skills/model.md`

- [ ] **Create `skills/model.md`:**

```markdown
# product:model — Product Definition

Use this skill when the user invokes `/product:model` or asks to formalize the product model, objects, glossary, or information architecture.

## Purpose

Formalize the product's internal world: core objects, relationships, lifecycle states, user-facing terminology, information architecture, and positioning. Produces three living documents: `product-model.md`, `glossary.md`, and `information-architecture.md`.

Read recipes `04-opportunity-map.md`, `05-positioning.md`, `06-product-model.md`, and `08-information-architecture.md` for the authoritative process.

## Step 1: Determine tier

If no tier specified:
- `docs/product/audit.md` exists → suggest `pro`
- `docs/product/product-model.md` exists with deferred sections → suggest `pro` (update mode)
- No existing product docs → suggest `lite`
- Otherwise: ask "Run **lite** (objects + states + IA skeleton, ~5–10 min) or **pro** (full model + positioning + non-goals + complete IA, ~20–40 min)?"

## Step 2: Check for existing model

If `docs/product/product-model.md` exists:
- Read it and check `status` frontmatter
- Enter **update mode**: "A product model exists from [date]. I'll fill in deferred sections and ask about anything that looks stale."
- Detect deferred sections by looking for `[deferred]` markers or checking frontmatter

## Step 3: Read context

**1. User-specified files** (from `--from`, `--using`, or natural mention)
**2. `docs/intake/`** — if exists and no files specified
**3. Existing product docs:** `docs/product/audit.md`, `docs/product/assumptions.md`
**4. TypeScript types:** look for `*.types.ts`, `types/`, `interfaces/` — extract domain object candidates

## Step 4: Show context summary

```
product:model — reading project...

Found:
  [list existing docs with status]

Domain objects detected from codebase:
  [list TypeScript types/interfaces found, if any]

Will ask about: [what's missing]

Correct anything? 
```

Wait for confirmation.

## Step 5: Conduct the interview

Read `recipes/06-product-model.md` for the exact question set. For pro, also read `recipes/04-opportunity-map.md`, `recipes/05-positioning.md`, and `recipes/08-information-architecture.md`.

Ask one question at a time. Wait for complete answers.

**Core object question (always ask, even in update mode if objects are sparse):**
"What are the main things this product creates, manages, or tracks? List them all — we'll define each one."

For each object mentioned, follow up with:
- "What states can a [object] be in?"
- "What does [object] belong to or reference?"

## Step 6: Produce the artifacts

Write three files:

**`docs/product/product-model.md`** using `templates/product-model.md`
**`docs/product/glossary.md`** — one entry per core object + key domain terms
**`docs/product/information-architecture.md`** — navigation structure + screen inventory (pro only; lite: add a minimal IA section to product-model.md)

For lite: fill in Core Objects, Object Relationships, Object Lifecycle States. Mark Positioning and Non-Goals as `[deferred]`.

For pro: fill in all sections.

## Step 7: Conflict detection

After writing, compare domain objects found in the codebase (Step 3) against the documented model. Flag any discrepancies:

```
⚠ Discrepancy: TypeScript interface `DeduplicationRule` found in codebase
  but not documented in the product model.
  Add it? (y / n / defer)
```

## Step 8: Summarize

```
Product model complete.

Produced:
  docs/product/product-model.md — [N] objects, [N] lifecycle state sets
  docs/product/glossary.md — [N] terms defined
  docs/product/information-architecture.md — [if written]

Recommended next step:
  product:journey "[primary journey name]" — to map the most important user flow
  
  Or if you need to scope a specific improvement:
  product:shape "[feature idea]"
```

## Rules

- The glossary must have one entry per core object. Never leave an object unnamed.
- Object states must be complete — if a state exists in the codebase that isn't in the model, flag it.
- Never create terminology in the product model that contradicts the glossary.
```

- [ ] **Commit:**

```bash
git add skills/model.md
git commit -m "feat: add product:model skill"
```

---

### Task 12: product:shape Skill

**Files:**
- Create: `skills/shape.md`

- [ ] **Create `skills/shape.md`:**

```markdown
# product:shape — Feature Scoping

Use this skill when the user invokes `/product:shape [feature idea]` or asks to scope, plan, or define a feature before building it.

## Purpose

Shape a bounded, buildable feature slice. Define appetite, solution outline, what's explicitly in and out, risks, rabbit holes, and done criteria. Produces `docs/specs/YYYY-MM-DD-[feature]-pitch.md`.

Read recipe `recipes/09-shaped-pitch.md` for the authoritative process.

## Step 1: Extract feature name

The feature idea is passed as an argument: `product:shape "reusable connection library"`

If no argument is given, ask: "What feature or problem are you scoping?"

Derive a kebab-case slug from the feature name for the filename: `connection-library`

## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- No product model → suggest `lite` (note: "For best results, run `product:model` first")
- Otherwise: ask "Run **lite** (problem + appetite + inclusions/exclusions + done criteria, ~5 min) or **pro** (full pitch with risks, rabbit holes, user flow, ~15 min)?"

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

## Rules

- The appetite is a maximum, not an estimate. If the user says "I don't know how long it'll take," push them to define how much time it's worth.
- No-gos must be specific. Reject vague exclusions like "advanced features" — ask what specifically.
- Done criteria must be verifiable with a yes/no test. Reject criteria like "it works correctly."
- Never start writing the pitch until the interview is complete.
```

- [ ] **Commit:**

```bash
git add skills/shape.md
git commit -m "feat: add product:shape skill"
```

---

### Task 13: product:spec Skill

**Files:**
- Create: `skills/spec.md`

- [ ] **Create `skills/spec.md`:**

```markdown
# product:spec — Screen Specification

Use this skill when the user invokes `/product:spec [screen name]` or asks to specify, define, or document a screen before building it.

## Purpose

Produce a complete specification for a single screen — the text-based replacement for Figma. Produces `docs/screens/[screen-name].md`.

Read recipes `recipes/10-screen-spec.md` and `recipes/11-interaction-rules.md` for the authoritative process.

## Step 1: Extract screen name

The screen name is passed as an argument: `product:spec "pipeline detail overview"`

If no argument: ask "Which screen are you speccing?"

Derive a kebab-case filename: `pipeline-detail-overview.md`

## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- Otherwise: ask "Run **lite** (purpose + question + layout + core states, ~5 min) or **pro** (full spec with all states, copy rules, acceptance criteria, ~15 min)?"

## Step 3: Check for existing spec

If `docs/screens/[screen-name].md` already exists:
- Read it
- Enter **update mode**: "A spec for this screen exists from [date]. I'll ask only about what's missing or deferred."
- Ask only about sections marked `[deferred]` or visibly incomplete

## Step 4: Read context

**1. User-specified files** (from `--from`, `--using`, or natural mention)
**2. Related journey:** `docs/product/journeys/` — find the journey this screen is part of
**3. Related pitch:** `docs/specs/` — find the pitched feature this screen belongs to
**4. Existing screens:** `docs/screens/` — read 2–3 nearby screens for terminology and pattern consistency
**5. Component library:** look for `src/components/`, `components/ui/` — list available component names

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

## Step 6: Conduct the interview

Read `recipes/10-screen-spec.md` for the exact question set.

**Key question (always ask):** "What is the primary user question this screen answers?" 
This single question forces clarity about the screen's job. If the user can't answer it in one sentence, the screen's purpose is unclear and needs to be defined before speccing it.

**States (always ask, always pro):**

After covering the basic screen structure, always ask about ALL states — even in lite mode:

"What does this screen look like when:
- Data is loading?
- There's no data yet (first use / empty)?
- Something has gone wrong (error loading data)?
- [domain-specific state]?"

Missing states are the most common cause of incomplete screen specs.

## Step 7: Produce the artifact

Write `docs/screens/[kebab-case-name].md` using `templates/screen-spec.md`.

For lite: fill in Purpose, Primary User Question, Layout, Primary Action, and core states (loading, empty, main).
For pro: fill in all sections.

## Step 8: Consistency check

After writing, check the spec against:
1. **Glossary:** Does the copy use the correct terms from `docs/product/glossary.md`?
2. **Interaction rules:** If `docs/product/interaction-rules.md` exists, are all relevant rules reflected?
3. **Nearby screens:** Are patterns consistent with `docs/screens/` files read in Step 4?

Flag any inconsistencies:
```
⚠ Terminology: This spec uses "destination" — glossary specifies "Sink" as the primary term.
  Update? (y / keep "destination" / defer)
```

## Step 9: Summarize

```
Screen spec complete → docs/screens/[slug].md

Screen: [Screen Name]
Primary question: "[user question]"
States covered: [list]
Acceptance criteria: [N criteria]

Recommended next step:
  product:spec "[next screen in the journey]"
  
  Or when all screens for the feature are specced:
  product:build — to verify build readiness
```

## Rules

- The primary user question must be answerable in one sentence. Push back on vague answers.
- Loading, empty, and error states are NEVER optional. Always ask about them.
- Never use terminology that contradicts the glossary. Always check.
- Acceptance criteria must be verifiable (yes/no tests). Reject vague criteria.
```

- [ ] **Commit:**

```bash
git add skills/spec.md
git commit -m "feat: add product:spec skill"
```

---

### Task 14: product:discover Skill

**Files:**
- Create: `skills/discover.md`

- [ ] **Create `skills/discover.md`:**

```markdown
# product:discover — New Product Entry Point

Use this skill when the user invokes `/product:discover` or asks to start working on a new product idea with no prior artifacts.

## Purpose

Walk through idea brief → assumption mapping → discovery inputs for a brand-new product or feature. Produces `docs/product/product-model.md` (seed version) and `docs/product/assumptions.md`.

Read recipes `recipes/01-idea-brief.md`, `recipes/02-assumption-map.md`, and `recipes/03-discovery.md` for the authoritative process.

## Step 1: Determine tier

If no tier specified:
- `docs/product/` exists with other products → likely `lite` (scoping a new feature area)
- No existing product docs → ask "Run **lite** (idea brief + top 5 assumptions, ~10 min) or **pro** (full discovery through opportunity mapping, ~30 min)?"

## Step 2: Read context (intake)

**1. User-specified files** (from `--from`, `--using`, or natural mention)
**2. `docs/intake/`** — read all files if folder exists and no files were specified

Extract from context files (if any):
- Problem description → pre-populate idea brief question
- Target user description → pre-populate user question
- Existing notes on assumptions → pre-populate assumption map
- Competitor mentions → note alternatives

## Step 3: Show context summary (only if context was found)

If files were read:
```
product:discover — reading context...

Found in [source]:
  Problem described: "[extracted problem]"
  Target user mentioned: "[extracted user]"
  Assumptions mentioned: [list]

I'll skip questions I can answer from context and confirm with you.
Anything to correct?
```

If no context found: skip this step and go directly to the interview.

## Step 4: Conduct the interview

Read `recipes/01-idea-brief.md` for the idea brief question set.

For pre-populated questions (from context), show the extracted answer and ask:
"I found this in [source]: '[extracted answer]'. Is this right, or should we refine it?"

For missing questions, ask directly.

After idea brief (always):
Read `recipes/02-assumption-map.md` and ask the assumption mapping questions.

For pro only:
Read `recipes/03-discovery.md` and ask about discovery evidence. Note: if the user hasn't done customer conversations yet, help them identify what to learn and how to learn it — don't skip this section, just adapt it.

## Step 5: Produce the artifacts

**`docs/product/product-model.md`** — seed version using `templates/product-model.md`
Fill in: Product Promise, Primary Users, partial Core Objects (from objects mentioned in the conversation).
Mark all other sections as `[deferred]` — they'll be filled in during `product:model`.

**`docs/product/assumptions.md`:**

```markdown
---
type: assumptions
product: [Product Name]
tier: [lite|pro]
status: [draft|complete]
created: [date]
updated: [date]
skill: product:discover
---

# Assumptions — [Product Name]

## Riskiest Assumptions

[Top 3 assumptions that would kill the idea if false]

1. [Assumption] — Type: [type], Risk: [high/medium/low], Test: [how to test]
2. [Assumption] — Type: [type], Risk: [high/medium/low], Test: [how to test]
3. [Assumption] — Type: [type], Risk: [high/medium/low], Test: [how to test]

## Full Assumption Map

| Assumption | Type | Risk | Evidence | Test method |
|------------|------|------|----------|-------------|
| | | | | |

## Discovery Evidence

[Empty section, filled in after customer conversations]
```

## Step 6: Summarize

```
Discovery complete.

Produced:
  docs/product/product-model.md — seed version
  docs/product/assumptions.md — [N] assumptions mapped, [N] high-risk

Top riskiest assumption: [The one that would kill the idea]
Suggested test: [How to test it]

Recommended next step:
  product:model — to formalize the full product model, objects, and glossary
```

## Rules

- Never read from the codebase (this is for blank-slate products).
- Pre-populate from context documents but always confirm with the user.
- The riskiest assumption must be explicitly named — not buried in a list.
- If the user can't explain who the target user is specifically, push back before continuing.
```

- [ ] **Commit:**

```bash
git add skills/discover.md
git commit -m "feat: add product:discover skill"
```

---

### Task 15: product:journey Skill

**Files:**
- Create: `skills/journey.md`

- [ ] **Create `skills/journey.md`:**

```markdown
# product:journey — Journey Mapping

Use this skill when the user invokes `/product:journey [journey name]` or asks to map a specific user flow.

## Purpose

Map a specific named user journey from trigger to completion. Produces `docs/product/journeys/[name].md`.

Read recipe `recipes/07-journey-map.md` for the authoritative process.

## Step 1: Extract journey name

The journey name is passed as an argument: `product:journey "create pipeline"`

If no argument: ask "Which user journey are you mapping? Describe it in 3–5 words."

Derive a kebab-case filename: `create-pipeline.md`

## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- Otherwise: ask "Run **lite** (happy path + 2 failure states, ~5 min) or **pro** (full journey with all states, decisions, edge cases, ~15 min)?"

## Step 3: Check for existing journeys

Read all files in `docs/product/journeys/`. If a similar journey already exists, flag it:
"A journey called '[existing name]' already exists. Is this a new journey or an update to that one?"

## Step 4: Read context

**1. User-specified files** (from `--from`, `--using`, or natural mention)
**2. Product model:** `docs/product/product-model.md` — read to understand objects and states
**3. Existing journeys:** `docs/product/journeys/` — check for dependencies or overlaps

## Step 5: Show context summary

```
product:journey — mapping "[Journey Name]"

Product model found: [yes/no]
  Primary object: [the object this journey centers on, if detectable]
  Object states: [relevant states from the model]

Existing journeys: [list]

Will ask about: [steps, states, decisions]

Correct anything?
```

## Step 6: Conduct the interview

Read `recipes/07-journey-map.md` for the exact question set.

**Critical follow-up for every step:** After the user describes the happy path, ask:
"For step [N] — what can go wrong here? What does the user see and how do they recover?"

This is the most commonly skipped part of journey mapping. Do not let the user stop at the happy path.

## Step 7: Produce the artifact

Write `docs/product/journeys/[kebab-case-name].md` using `templates/journey-map.md`.

For lite: fill in User Goal, Trigger, Steps (happy path), top 2 Failure States, Completion State.
For pro: fill in all sections including all failure states, required decisions with options and defaults, preconditions, and follow-up actions.

## Step 8: Follow-up actions → new journeys

After listing follow-up actions, flag any that imply an unmapped journey:
"You mentioned users often [follow-up action]. That sounds like it might need its own journey map. Want to map it now or defer?"

## Step 9: Summarize

```
Journey map complete → docs/product/journeys/[name].md

Journey: [Name]
Steps: [N]
Failure states: [N]
Unmapped follow-up journeys: [list if any]

Recommended next step:
  product:journey "[next journey]" — to map the next primary flow
  
  Or when primary journeys are mapped:
  product:shape "[feature idea]" — to scope a feature that improves a journey
```

## Rules

- Every step must have both a user action and a system response. Push back if the user only describes user actions.
- Failure states are not optional in pro mode. Ask about every step.
- Required decisions must include options and recommended defaults — not just "the user chooses."
- The completion state must be specific enough that the user unambiguously knows they succeeded.
```

- [ ] **Commit:**

```bash
git add skills/journey.md
git commit -m "feat: add product:journey skill"
```

---

### Task 16: product:build Skill

**Files:**
- Create: `skills/build.md`

- [ ] **Create `skills/build.md`:**

```markdown
# product:build — Build Readiness

Use this skill when the user invokes `/product:build` or asks to verify a feature is ready to build.

## Purpose

Verify that a shaped feature has everything needed to start building. Run the build checklist. Optionally produce an architecture skeleton. Produces `docs/specs/YYYY-MM-DD-[feature]-build.md`.

Read recipes `recipes/14-build-checklist.md` and `recipes/13-technical-architecture.md` for the authoritative process.

## Step 1: Identify the feature

If the user invoked `product:build` without specifying a feature:
- Read `docs/specs/` and find the most recent pitch file without a corresponding build file
- Ask: "Are we building the readiness check for '[feature name from latest pitch]'?"

If a feature name is passed: search `docs/specs/` for a matching pitch file.

## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- Otherwise: ask "Run **lite** (product readiness checklist only) or **pro** (checklist + architecture skeleton + instrumentation plan)?"

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

Recommended next step:
  [If ready]: Start building. Use the done criteria from the pitch as your acceptance test.
  [If blockers]: Fix the [N] blockers, then re-run `product:build`.
```

## Rules

- Do not mark a feature as "ready to build" if any screen spec is missing required states.
- Architecture proposals are suggestions — the implementer adapts them to the actual codebase.
- Instrumentation events should cover: start, key steps, completion, abandonment, and errors.
```

- [ ] **Commit:**

```bash
git add skills/build.md
git commit -m "feat: add product:build skill"
```

---

### Task 17: product:reflect Skill

**Files:**
- Create: `skills/reflect.md`

- [ ] **Create `skills/reflect.md`:**

```markdown
# product:reflect — Retrospective

Use this skill when the user invokes `/product:reflect` or asks to do a retrospective after shipping a feature.

## Purpose

Close the loop on a shipped feature. Gather evidence. Force a decision. Produces `docs/specs/YYYY-MM-DD-[feature]-retro.md`.

Read recipes `recipes/17-retrospective.md` and `recipes/16-measure.md` for the authoritative process.

## Step 1: Identify the feature

If no feature specified:
- Read `docs/specs/` and find the most recent build file without a corresponding retro file
- Ask: "Are we reflecting on '[feature name]'?"

If a feature name is passed: search for matching pitch and build files.

## Step 2: Determine tier

If no tier specified: ask "Run **lite** (what shipped + decision, ~5 min) or **pro** (full retrospective with evidence and next slice, ~15 min)?"

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

## Rules

- A decision is mandatory. "Need more data" is not a decision — it is avoidance. Push for a decision with whatever evidence exists.
- If the decision is "kill" — acknowledge that this is the right call when warranted and help define the removal plan.
- Done criteria from the pitch must be explicitly evaluated — not glossed over.
- The next slice must be specific enough to be shaped immediately. Not "do more work on X" — but "shape [specific thing]."
```

- [ ] **Commit:**

```bash
git add skills/reflect.md
git commit -m "feat: add product:reflect skill"
```

---

## Phase 4: Validation

### Task 18: End-to-End Validation

**Files:** None new. Read-only verification.

- [ ] **Verify complete file structure:**

```bash
find . -not -path '*/.git/*' -not -path '*/node_modules/*' -type f | sort
```

Expected output includes all of these (among others):
```
./CLAUDE.md
./README.md
./recipes/00-audit.md
./recipes/01-idea-brief.md
./recipes/02-assumption-map.md
./recipes/03-discovery.md
./recipes/04-opportunity-map.md
./recipes/05-positioning.md
./recipes/06-product-model.md
./recipes/07-journey-map.md
./recipes/08-information-architecture.md
./recipes/09-shaped-pitch.md
./recipes/10-screen-spec.md
./recipes/11-interaction-rules.md
./recipes/12-ui-system.md
./recipes/13-technical-architecture.md
./recipes/14-build-checklist.md
./recipes/15-usability-testing.md
./recipes/16-measure.md
./recipes/17-retrospective.md
./skills/audit.md
./skills/build.md
./skills/discover.md
./skills/journey.md
./skills/model.md
./skills/next.md
./skills/reflect.md
./skills/shape.md
./skills/spec.md
./templates/audit-report.md
./templates/build-checklist.md
./templates/journey-map.md
./templates/product-model.md
./templates/screen-spec.md
./templates/shaped-pitch.md
```

- [ ] **Verify CLAUDE.md lists all 9 skills:**

```bash
grep "product:" CLAUDE.md | wc -l
```

Expected: 9 or more lines matching (one per skill in the table).

- [ ] **Verify every skill file references its recipes:**

```bash
for f in skills/*.md; do echo "=== $f ==="; grep -c "recipes/" "$f" || echo "0 recipe references"; done
```

Expected: each skill except `next.md` has at least 1 recipe reference.

- [ ] **Verify every recipe has required frontmatter fields:**

```bash
for f in recipes/*.md; do
  echo "=== $f ==="
  grep -E "^id:|^phase:|^produces:|^skill:" "$f" | head -4
done
```

Expected: each recipe has `id`, `phase`, `produces`, and `skill` fields.

- [ ] **Verify every template has frontmatter fields:**

```bash
for f in templates/*.md; do
  echo "=== $f ==="
  grep -E "^type:|^product:|^status:" "$f" | head -3
done
```

Expected: each template has `type`, `product`, and `status` fields.

- [ ] **Final commit:**

```bash
git add .
git commit -m "feat: complete Product OS plugin — 9 skills, 18 recipes, 6 templates"
```

---

## Self-Review Notes

**Spec coverage check:**

| Spec requirement | Task covering it |
|-----------------|-----------------|
| CLAUDE.md plugin manifest | Task 1 |
| 6 artifact templates | Task 2 |
| 18 recipes (17 + audit) | Tasks 3–8 |
| product:next skill | Task 9 |
| product:audit skill | Task 10 |
| product:model skill | Task 11 |
| product:shape skill | Task 12 |
| product:spec skill | Task 13 |
| product:discover skill | Task 14 |
| product:journey skill | Task 15 |
| product:build skill | Task 16 |
| product:reflect skill | Task 17 |
| End-to-end validation | Task 18 |
| Depth tier system (lite/pro) | All skill tasks — each skill has tier detection and tier-specific behavior |
| Context input convention | All skill tasks — each skill reads user-specified files + intake |
| Conflict detection | Tasks 10, 11, 13 (audit, model, spec skills) |
| Update mode for living docs | Tasks 10, 11, 13 (audit, model, spec skills) |
| Frontmatter on all artifacts | Task 2 (templates), Task 14 (discover produces assumptions.md directly) |

No spec requirements without a covering task.
