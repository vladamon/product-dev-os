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
