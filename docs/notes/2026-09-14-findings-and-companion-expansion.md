# Findings & decision — from "can this help my friend validate an idea?" to a founder companion

**Date:** 2026-09-14
**Format:** Claude Code session — blunt review of the OS against a real use case (a friend's unvalidated idea), then a repo audit while fixing
**Status:** decided and implemented (see Resolution column)

---

## The question

A friend has a product idea and doesn't know if it's viable or worth chasing. Can this OS run the discovery and critique the idea — and is it better than free-form conversation with Claude?

## Verdict given

Partially. Only 4 of 20 recipes (01, 02, 03, 03b) touch viability; the rest assume the decision to build is made. The structured parts beat free-form chat at the one thing that matters — preventing self-deception (named riskiest assumption, Mom Test discipline, pre-committed thresholds, recorded verdicts). Free-form chat beat the OS at adversarial critique, competitor research, and money questions, which the OS did not cover at all. Neither answers viability; only real users and money do.

---

## Part A — Findings from the idea-validation review

| ID | Finding | Evidence | Severity |
|---|---|---|---|
| F1 | `discover` promised competitive analysis it does not perform. Pro discover reads only recipe 03; opportunity map (04) and positioning (05) live in `product:model`. | `skills/discover/SKILL.md:23` | medium — doc lies to user and agent |
| F2 | Default discovery tier skips customer evidence. `discover` defaults to lite; recipe 03 (Mom Test) is pro-only. A default run yields a brief plus self-rated assumptions with zero evidence. | `skills/discover/SKILL.md:22-23`, `recipes/03-discovery.md:18` | high |
| F3 | The OS structures the founder's beliefs; it does not challenge them. Risk levels are self-rated; the "AI review prompts" are run by the same session that helped fill the artifact. No adversarial step exists. | `recipes/02-assumption-map.md:42-46` | high |
| F4 | No money layer. No pricing, willingness-to-pay, market sizing, unit economics, CAC, or business model. "Viability" is only a type label. | `recipes/02-assumption-map.md:36` | high |
| F5 | No competitor or market research anywhere. The alternatives question (pro Q7) asks the founder to list them; nothing searches. | `recipes/01-idea-brief.md:40` | high |
| F6 | Wrong order for a viability question: positioning and "why this instead of that" come in `product:model`, after `product:experiment`. | `CLAUDE.md` new-product track | medium |

## Part B — Findings from the repo audit (surfaced while fixing)

| ID | Finding | Evidence | Severity |
|---|---|---|---|
| F7 | **The plugin is not loadable from this repo.** No `.claude-plugin/` manifest is tracked. The installed plugin comes from a divergent clone (`~/tools/product-dev-os`, commit `c4aba72` "add proper Claude Code plugin structure and fix install docs" — absent from this repo's history), cached at a 2026-05-12 snapshot, and is disabled (`"product@product-dev-os-local": false`). Every skill/recipe change since May has never reached a running session. | `~/.claude/plugins/installed_plugins.json`, `~/.claude/settings.json`, `git cat-file -t c4aba72` → not found | critical |
| F8 | SKILL.md frontmatter uses `name: product:<x>`. Skill names must be short (lowercase/digits/hyphens); the plugin name supplies the `product:` namespace. The working cached copy used `name: next`. | all `skills/*/SKILL.md:2` | high |
| F9 | README install instructions describe a `"plugins": [path]` array in `settings.json`, which is not a Claude Code mechanism. Real path: marketplace + `/plugin install`. | `README.md:471-513` | high |
| F10 | Usage-log hook is dead. `LOG_FILE` points to `.../github-vladamon.com/product-dev-os/...` (does not exist) and the script is not wired in any settings file. The log's "auto-populated" claim is false; last auto row 2026-06-20. The freeze review has been collecting no evidence. | `scripts/log-skill-usage.sh:14`, grep of settings | high |
| F11 | `assumptions.md` format is inconsistent across skills. `discover` writes `Risk: high` in a numbered list plus a table without a Verdict column; `experiment` "appends to the row"; `shape`/`next` gates look for `Risk: high` + `Verdict:` text. Table-only rows are invisible to gates, and `Verdict: pending` is ambiguous (not in shape's accepted list, yet "present" for next). | `skills/discover/SKILL.md:89-101`, `skills/experiment/SKILL.md:101-107`, `skills/shape/SKILL.md:45`, `skills/next/SKILL.md:74` | high — gate can pass untested assumptions or block tested ones |
| F12 | `triage` scans the wrong directory. Skill uses cwd's **parent** as scan root; README and playbook 5 say run it **from** the parent directory — which then scans the grandparent. | `skills/triage/SKILL.md:24` vs `docs/playbooks.md:106` | medium |
| F13 | `--skip-gate` logging implemented only in `shape`; other gated skills accept the flag silently. (Previously documented as a backlog item.) | `CLAUDE.md` | medium |
| F14 | Recipes 13 and 16 are GlassFlow-specific (frontend feature folders; Kafka pipeline events) presented as general guidance. | `recipes/16-measure.md:31-42`, `recipes/13-technical-architecture.md:14` | low |
| F15 | Execution bridge missing: `build` hands off to an external plugin's `writing-plans`. (Earmarked 2026-08-29 as option B, `product:build-plan`.) | `skills/build/SKILL.md:216` | medium |
| F16 | Founder-journey coverage gaps: idea sourcing, adversarial critique, interview execution/synthesis, business model, go-to-market, project-level stack, launch, product-market fit, weekly accountability. | skill inventory | high |

---

## Decision — freeze lifted for the companion expansion

The 2026-06-19 freeze ("no skill without a scar") and the 2026-08-29 partial unfreeze are **superseded for process content** by explicit instruction on 2026-09-14: fix everything found, add the missing skills, and make the OS a real companion for solo builders, indie hackers, and aspiring founders.

**Why the scar rule no longer fits:** it assumed the OS's user was the author alone, collecting scars from their own runs. The friend's case is a scar from a user the OS was never designed for — and F7/F10 show the evidence pipeline the rule depended on was broken anyway (plugin stale, log dead), so the rule was blocking fixes on evidence that could not be collected.

**What stays:**
- `docs/os-usage-log.md` and the load-bearing review. After 5 load-bearing runs per new skill, skills with mostly `N` are demoted or cut. The expansion is a bet, and it gets a retro.
- The kill criterion: routine `--skip-gate` use, or artifacts written but never re-read → cut back.
- Spine, not catalog: every new skill sits on a stage (`docs/conventions.md` §1) and is routed by `product:next` and playbooks.

**New rule going forward:** a skill may be added without a personal scar when a concrete user situation (named in a playbook) has no route through the OS. It still needs a stage, a gate decision, and a playbook entry.

## Resolution

Design: `docs/superpowers/specs/2026-09-14-companion-expansion-design.md`. Contract: `docs/conventions.md`.

| Finding | Resolution | Files |
|---|---|---|
| F1, F2, F3, F5, F6 | `discover` rewritten around the canonical table; lite adds evidence check; AI rates risk independently; false promise removed. New `product:critique` (red team + desk research + verdict), new `product:interview` (prep + synthesize). New validation track and playbook. | `skills/discover`, `skills/critique`, `skills/interview`, recipes 01–03, 20, 21, `docs/playbooks.md` |
| F4 | New `product:viability` (ramen math, unit economics, funding path, verdict); pre-sale method added to `experiment`. | `skills/viability`, recipe 22, recipe 03b |
| F7, F9 | `.claude-plugin/plugin.json` + `marketplace.json` added (marketplace name kept `product-dev-os-local` for drop-in); README install section rewritten to the real flow. Local settings not modified — re-pointing the marketplace to this repo is a manual step listed in README. | `.claude-plugin/`, `README.md` |
| F8 | All SKILL.md `name:` fields shortened. | `skills/*/SKILL.md` |
| F10 | Hook shipped in `hooks/hooks.json`; script takes `PRODUCT_OS_USAGE_LOG` (defaults to `~/.claude/product-os/usage-log.md`) and creates the directory. | `hooks/hooks.json`, `scripts/log-skill-usage.sh`, `docs/os-usage-log.md` |
| F11 | Canonical assumption map defined once; all readers/writers aligned; legacy format still read. | `docs/conventions.md` §5, discover, experiment, shape, next, playbooks |
| F12 | Scan root = cwd's project subdirectories, parent only as fallback. | `skills/triage/SKILL.md` |
| F13 | Standard gate-override logging in every gated skill. | `docs/conventions.md` §3, gated skills, `CLAUDE.md` |
| F14 | Recipe 16 generalized; recipe 13 labeled feature-level and routed to `product:stack` for project level. | recipes 13, 16 |
| F15 | New `product:plan`; `build` hands off to it. | `skills/plan`, recipe 25, `skills/build` |
| F16 | New `ideate`, `gtm`, `stack`, `launch`, `pmf`, `checkin`; `next` gains situation mode and new stages; 11 new playbooks (9–19). | `skills/*`, recipes 19–28, `docs/playbooks.md` |

## Part C — seams found while implementing

The new skills were written in parallel against `docs/conventions.md`, then cross-checked. The review surfaced integration seams that no single file showed.

| ID | Finding | Resolution |
|---|---|---|
| F17 | `launch` routed to `product:measure`, whose gate requires a feature pitch — dead end for product-level activation; `pmf` had no home for retention data. | `measure` gained product mode → `docs/product/journeys/product-telemetry.md`; launch and pmf read it. |
| F18 | Build files never recorded readiness in a machine-readable way — "Ready / N blockers" existed only in chat output, so `plan` had to infer blockers from checkboxes. | `readiness: ready\|blocked` frontmatter + Readiness → Blockers section in the template; `plan` gates on it with a checkbox fallback for old files. |
| F19 | Three `phase:` vocabularies across recipes (`discovery/definition/design/delivery/learning/portfolio`, new stage names, and an unparseable `money & reach`). | Companion-map phase slugs defined in conventions §1; all 30 recipes normalized. |
| F20 | Kill criteria and deadlines lived only in prose, so `next` and `checkin` couldn't detect overdue decisions reliably. | Decision fields table in conventions §6: `kill_criterion`/`kill_date` (critique), `conclude_by` (experiment), `launch_date`/`verdict` (launch), `next_review` (pmf), `missed_streak` (checkin). |
| F21 | Post-launch feedback synthesized into the same evidence stream as pre-launch discovery would blur what validated the idea vs. what users of the product want. | `source_phase: pre-launch\|post-launch` on syntheses; never mixed in one file. |
| — | Conventions gaps: no `stack` Source value, CAC row type ambiguous, same-day filename collisions, `product` frontmatter meaningless for cwd artifacts, evidence overwrite rules, missing Discovery Evidence heading in legacy files, new high-risk rows silently blocking `shape`. | All pinned in `docs/conventions.md` §§2, 5, 6. |
