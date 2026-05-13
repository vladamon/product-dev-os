# product:model — Product Definition

Use this skill when the user invokes `/product:model` or asks to formalize the product model, objects, glossary, or information architecture.

## Purpose

Formalize the product's internal world: core objects, relationships, lifecycle states, user-facing terminology, information architecture, and positioning. Produces three living documents: `product-model.md`, `glossary.md`, and `information-architecture.md`.

Read recipes `04-opportunity-map.md`, `05-positioning.md`, `06-product-model.md`, and `08-information-architecture.md` for the authoritative process.

## Contract
Requires: docs/product/assumptions.md or docs/product/audit.md (recommended)
Produces: docs/product/product-model.md, docs/product/glossary.md, docs/product/information-architecture.md (pro)
Updates: docs/product/product-model.md (in update mode if file exists), docs/product/glossary.md

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/audit.md` exists → default to `pro`, announce: "Defaulting to pro — audit found. Run lite? (y/n)"
3. `docs/product/product-model.md` exists with `[deferred]` sections → default to `pro` (update mode), announce: "Defaulting to pro — model has deferred sections to complete. Run lite? (y/n)"
4. No existing product docs → default to `lite`, announce: "Defaulting to lite for initial model. Run pro? (y/n)"
5. Otherwise → ask: "Run **lite** (objects + states + IA skeleton, ~5–10 min) or **pro** (full model + positioning + non-goals + complete IA, ~20–40 min)?"

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

## Fallback questions (if recipe unavailable)
1. "What are the main things this product creates, manages, or tracks? List them all — we'll define each one."
2. For each object: "What states can a [object] be in? Beginning state, end state, and anything in between."
3. For each object: "What does a [object] belong to or reference?"
4. "What term does your target user use for [key object] in their day-to-day language?"
5. "What is the one thing this product does that no current workaround does as well?"

## Pivot interrupt
If at any point the model reveals a fundamental mismatch ("that object doesn't exist", "our mental model is completely wrong"):
1. Stop the interview immediately
2. Record what was defined so far in `docs/product/product-model.md` with `status: draft` (partial)
3. Note the conflict explicitly in the file: `<!-- PIVOT: [what was wrong] — restart from product:audit or product:discover -->`
4. Say: "Model paused. Conflict found: [what's wrong]. Recommended: run product:audit to reconstruct from what actually exists, then re-run product:model."

## Rules

- The glossary must have one entry per core object. Never leave an object unnamed.
- Object states must be complete — if a state exists in the codebase that isn't in the model, flag it.
- Never create terminology in the product model that contradicts the glossary.
