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
