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
