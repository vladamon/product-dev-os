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

## Step 2b: Check for drift, orphans, and blocking deferrals

After classifying the phase, perform these checks:

**Drift check** — compare file dates:
For each pitch file in `docs/specs/`, check if the pitch is significantly older than `docs/product/product-model.md`. If a pitch predates the product model by more than 30 days, flag:
```
⚠ Drift: [slug]-pitch.md ([date]) predates product-model.md update ([model date])
  → Review pitch for consistency with current model before building
```

**Orphan check** — look for mismatched document sets:
- A `*-build.md` with no matching `*-pitch.md` for the same slug:
  `⚠ Orphan: [date]-[slug]-build.md — no matching pitch found`
- A `*-retro.md` with no matching `*-build.md`:
  `⚠ Orphan: [date]-[slug]-retro.md — no matching build file found`

**Blocking deferrals** — check if deferred sections in living docs block the next skill:
- If `docs/product/product-model.md` contains `[deferred]` lifecycle states, and the recommended next step is `product:shape` or `product:spec`:
  `⚠ Blocking: product-model.md has deferred lifecycle states — product:shape will have incomplete context; consider running product:model pro first`

**Multi-feature state** — if multiple pitches exist without retros, list each:
```
Active features (shaped but not yet reflected):
  [date] [slug] — pitch ✓, build [✓/○], retro [✓/○]
  [date] [slug] — pitch ✓, build [✓/○], retro [✓/○]
```

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

Warnings:
  [drift / orphan / blocking deferral findings from Step 2b, or "none"]

Active features:
  [multi-feature state table if multiple pitches in flight, otherwise omit]

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
