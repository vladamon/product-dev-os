# Product OS

A globally-installed Claude Code plugin (`product`) that acts as a solo-founder companion — from "I have no idea" through "is this idea any good", building, launching, and "should I keep going". Skills are available in every repo. Artifacts land in the current project's `docs/` tree.

**The contract for skills, recipes, and artifacts is `docs/conventions.md`.** Read it before adding or changing a skill.

## Available Skills

When the user invokes a `product:*` skill, load and follow `skills/<name>/SKILL.md`.

Gated skills run a Step 0 prerequisite check and refuse with a specific "run X first" message when upstream artifacts are missing. `--skip-gate` overrides; every gated skill then writes `gate_override: true` into the artifact frontmatter and a `Gate skipped — …` note. Entry points (`ideate`, `discover`, `audit`, `critique`, `checkin`, `next`) have no gate.

| Stage | Skill | When to use |
|-------|-------|-------------|
| ∞ | `product:next` | Where am I / what next — or `product:next "<situation>"` to route a situation to a playbook |
| ∞ | `product:checkin` | Weekly accountability — commitments vs evidence, one number, avoidance and burnout patterns |
| 0 Choose | `product:ideate` | Want to start something but have no idea (or a pile of vague ones) |
| 0 Choose | `product:triage` | Several projects compete — pick one focus, name kill candidates |
| 1 Understand | `product:discover` | New idea — brief, canonical assumption map, evidence level |
| 1 Understand | `product:audit` | Existing product — reconstruct current state before a revamp |
| 1 Understand | `product:interview` | `prep`: Mom Test kit + recruiting · `synthesize`: turn notes, tickets, requests into evidence |
| 2 Challenge | `product:critique` | "Is this idea any good?" — landscape research, 11 lenses, pre-mortem, Pursue/Sharpen/Park/Kill |
| 3 Money & reach | `product:viability` | Pricing, ramen math, unit economics, funding path — "does the math work?" |
| 3 Money & reach | `product:gtm` | Beachhead ICP, watering holes, channel bullseye, first-10-customers plan, messaging |
| 4 Test | `product:experiment` | Cheapest test for the riskiest assumption (6 methods incl. pre-sale); `record` the verdict |
| 5 Define | `product:model` | Objects, states, glossary, IA, positioning, non-goals |
| 5 Define | `product:journey` | Map one user flow with failure states, before screens |
| 6 Architect | `product:stack` | Stack, build-vs-buy per capability, hosting, cost at scale, not-now list |
| 7 Scope | `product:shape` | Bounded feature slice: appetite, no-gos, done criteria |
| 7 Scope | `product:spec` | One screen's specification with all states |
| 8 Build | `product:build` | Build readiness + self-contained execution brief (`readiness: ready\|blocked`) |
| 8 Build | `product:plan` | Ordered tasks ≤2 sessions, walking skeleton first, agent handoff blocks |
| 9 Launch | `product:launch` | Readiness (blockers vs nice), threshold, channel sequence, runbook; `record` results |
| 9 Launch | `product:measure` | Feature metrics, or `product` mode: activation + retention for the whole product |
| 10 Learn | `product:reflect` | Retro on one shipped feature: continue / improve / simplify / pivot / kill |
| 10 Learn | `product:pmf` | Product-market fit review: retention, Sean Ellis, segments → persevere / iterate / pivot / kill |

## Plugin Structure

```
.claude-plugin/  ← plugin.json + marketplace.json (plugin "product", marketplace "product-dev-os-local")
hooks/           ← hooks.json — PostToolUse on Skill → scripts/log-skill-usage.sh
scripts/         ← usage logger (log path from PRODUCT_OS_USAGE_LOG)
skills/          ← one directory per skill: skills/<name>/SKILL.md (frontmatter name = short name)
recipes/         ← knowledge base — authoritative process docs read by skills (00–28, 03b)
templates/       ← living-document templates filled in by skills
docs/            ← conventions.md (contract), playbooks.md (situations), notes/ (decisions), superpowers/specs/ (designs)
```

## Tracks

**Judge an idea (yours or someone else's) — stop before building:**
```
product:discover lite → product:critique → product:interview prep → [talk to 5 people] → product:interview synthesize → product:viability → product:experiment
```

**New product, full:**
```
(product:ideate) → product:discover → product:critique → product:interview → product:viability → product:gtm → product:experiment → product:model → product:stack → product:journey → product:shape → product:spec → product:build → product:plan → [build] → product:measure product → product:launch → product:reflect / product:pmf
```

**Fast MVP:**
```
product:discover lite → product:critique lite → product:experiment → product:model lite → product:shape lite → product:build lite → product:plan lite → product:launch lite → product:pmf
```

**Existing product / revamp:**
```
product:audit → product:model → (product:stack) → (product:experiment) → product:shape → product:spec → product:build → product:plan → product:launch → product:measure → product:reflect / product:pmf
```

**Always:** `product:next` · `product:checkin` (weekly) · `product:triage` (portfolio)

## Scenario Playbooks

When the user describes a **situation** rather than naming a skill ("my friend has an idea", "launched and nobody came", "not sure it's working", "stuck", "too many feature requests", "what stack", "no idea what to build"), consult `docs/playbooks.md` — it maps 19 situations to exact skill sequences that pass every gate without `--skip-gate`. `product:next "<situation>"` does the matching.

## Depth Tiers

Every skill supports two depth tiers:
- `lite` — 3–5 questions, compact artifact, optional sections deferred (~5–15 min)
- `pro` — full interview, all sections required (~20–40 min)

Invoke with: `product:shape lite` or `product:shape pro`. Without a tier, the skill picks a default from project state and announces it.

## Protocols

- **Research** (`critique`, `viability`, `gtm`, `stack`, `ideate`, `launch`): real web search when available; every claim labeled `[sourced]` / `[estimate]` / `[founder-stated]`; never invent competitors, numbers, or URLs.
- **Honesty** (`critique`, `viability`, `pmf`, `checkin`, `reflect`, `triage`, `launch record`): own assessment first, decisions from fixed sets, compliments and hypotheticals are not evidence, sunk cost named.
- **Advice boundaries:** legal, tax, fundraising, and compliance appear as checklists for a professional, never as advice.

## Context Input Convention

All skills accept external context at invocation:
```
product:discover from docs/research/
product:discover using docs/brief.md, docs/notes.md
product:critique "a tool that turns client calls into proposals for solo consultants"
product:audit — also read docs/old-spec.md
product:discover                             ← checks docs/intake/ by default
```

## Artifact Locations

Skills write into the **current project's** `docs/` tree (full map: `docs/conventions.md` §6):
- `docs/product/` — living documents: product model, assumptions, audit, glossary, IA, business model, go-to-market, architecture, journeys, telemetry
- `docs/specs/` — point-in-time decisions (date-prefixed): critique, experiment, pitch, build, plan, launch, retro, pmf
- `docs/screens/` — screen specifications
- `docs/research/` — interview kits and syntheses
- `docs/checkins/` — weekly check-ins
- `docs/ideas/`, `docs/triage/` — written in the cwd, outside any single project
- `docs/intake/` — user-managed drop zone (read by skills, never written by skills); `docs/intake/interviews/` for notes, transcripts, tickets, feature requests

## Usage evidence

`docs/os-usage-log.md` tracks which skills are load-bearing (hook-populated when `PRODUCT_OS_USAGE_LOG` points at it). After ~5 load-bearing runs per skill, mostly-`N` skills are demoted or cut. Decision history: `docs/notes/`.
