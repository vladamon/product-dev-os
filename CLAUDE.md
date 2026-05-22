# Product OS

A globally-installed Claude Code plugin providing a repeatable, AI-native product development operating system. Skills are available in every repo. Artifacts land in the current project's `docs/` tree.

## Available Skills

When the user invokes a `product:*` skill, load and follow the corresponding `SKILL.md` file from `skills/`.

Each skill is gated by a Step 0 prerequisite check. If upstream artifacts are missing or incomplete, the skill refuses with a specific "run X first" message rather than proceeding. Override with `--skip-gate` is possible but logged in the resulting artifact.

| Skill | File | When to use |
|-------|------|-------------|
| `product:next` | `skills/next/SKILL.md` | Orientation — returning to a project, need to know where you are |
| `product:triage` | `skills/triage/SKILL.md` | Portfolio layer — choose which project to work on this week |
| `product:discover` | `skills/discover/SKILL.md` | New product idea, blank canvas, no prior artifacts |
| `product:audit` | `skills/audit/SKILL.md` | Existing product — analyze, understand, prepare for revamp |
| `product:experiment` | `skills/experiment/SKILL.md` | After discover/audit — test the riskiest assumption cheaply before shaping |
| `product:model` | `skills/model/SKILL.md` | After discover or audit — formalize the product model |
| `product:journey` | `skills/journey/SKILL.md` | Before designing screens — map a specific user flow |
| `product:shape` | `skills/shape/SKILL.md` | Before building — scope a bounded feature slice |
| `product:spec` | `skills/spec/SKILL.md` | Before building a screen — write the screen specification |
| `product:build` | `skills/build/SKILL.md` | After shaping + speccing — verify build readiness |
| `product:measure` | `skills/measure/SKILL.md` | After ship — set up instrumentation before product:reflect needs evidence |
| `product:reflect` | `skills/reflect/SKILL.md` | After shipping — retrospective and iterate/kill decision |

## Plugin Structure

```
skills/     ← skill definitions (one file per skill)
recipes/    ← knowledge base (authoritative process docs, read by skills)
templates/  ← artifact templates (filled in by skills when producing output)
```

## Two Tracks

**New product:**
```
product:discover → product:experiment → product:model → product:journey → product:shape → product:spec → product:build → [ship] → product:measure → product:reflect
```

**Existing product / revamp:**
```
product:audit → product:model → (product:experiment if revamp introduces a high-risk assumption) → product:shape → product:spec → product:build → [ship] → product:measure → product:reflect
```

**Navigator (any time):**
```
product:next
```

**Portfolio (across projects):**
```
product:triage
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
