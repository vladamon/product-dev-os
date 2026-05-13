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
| `product:measure` | `skills/measure.md` | After ship — set up instrumentation before product:reflect needs evidence |
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
product:discover → product:model → product:journey → product:shape → product:spec → product:build → [ship] → product:measure → product:reflect
```

**Existing product / revamp:**
```
product:audit → product:model → product:shape → product:spec → product:build → [ship] → product:measure → product:reflect
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
