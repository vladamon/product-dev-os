---
name: product:discover
description: Use this skill when the user invokes `/product:discover` or asks to start working on a new product idea with no prior artifacts.
---
# product:discover — New Product Entry Point

Use this skill when the user invokes `/product:discover` or asks to start working on a new product idea with no prior artifacts.

## Purpose

Walk through idea brief → assumption mapping → discovery inputs for a brand-new product or feature. Produces `docs/product/product-model.md` (seed version) and `docs/product/assumptions.md`.

Read recipes `recipes/01-idea-brief.md`, `recipes/02-assumption-map.md`, and `recipes/03-discovery.md` for the authoritative process.

## Contract
Requires: nothing (blank-slate entry point; reads docs/intake/ if present)
Produces: docs/product/product-model.md (seed version), docs/product/assumptions.md
Updates: nothing (creates new; if files exist, shows conflict and asks to overwrite or merge)

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/` exists with product docs → default to `lite`, announce: "Defaulting to lite — scoping a new area in an existing product. Run pro for full discovery? (y/n)"
3. No existing product docs → default to `lite`, announce: "Defaulting to lite for initial discovery. Run pro for full opportunity mapping including competitive analysis? (y/n)"

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

## Fallback questions (if recipe unavailable)
1. "What problem does this product solve? Describe what users do today without it."
2. "Who is the specific target user? Describe one real person, not a demographic."
3. "What is the trigger moment — what just happened that makes them need this right now?"
4. "What is the riskiest assumption? If it turns out to be false, the whole idea fails."
5. "How would you test that assumption without building anything?"

## Pivot interrupt
If at any point the user signals the idea has fundamentally changed ("actually the real problem is...", "wrong user", "I need to rethink this"):
1. Stop the interview immediately
2. Record what was learned as a partial artifact: `docs/product/[date]-discovery-partial.md` with `status: abandoned`
3. Note the new insight in the partial doc's frontmatter: `pivot_signal: "[what changed]"`
4. Say: "Pivot noted. New signal: [what changed]. Restart with product:discover with this corrected framing."

## Rules

- Never read from the codebase (this is for blank-slate products).
- Pre-populate from context documents but always confirm with the user.
- The riskiest assumption must be explicitly named — not buried in a list.
- If the user can't explain who the target user is specifically, push back before continuing.
