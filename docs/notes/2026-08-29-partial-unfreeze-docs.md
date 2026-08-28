# Decision log — Partial unfreeze: documentation layer

**Date:** 2026-08-29
**Format:** explicit decision during a Claude Code session (full gap analysis of the OS)
**Status:** decided

---

## What changed

The 2026-06-19 freeze ("no skill edits") **stays in force for process content** — skill steps, gates, interview questions, checklists, methods. Unfrozen, effective now: the **documentation layer** — README, CLAUDE.md, `docs/`, and recipe/spec *metadata* (frontmatter, addenda) — may be amended whenever it has drifted from reality.

Rationale: documentation that lies about the system misleads both the user and the agent that routes on it. Keeping it truthful is maintenance, not methodology polishing.

## What was fixed under this unfreeze (2026-08-29)

1. `docs/superpowers/specs/2026-05-09-product-os-design.md` — claimed 9 skills / 17 recipes (actual: 12 / 20). Fixed with a dated **addendum**; the approved body is preserved as history.
2. `recipes/16-measure.md` frontmatter — didn't record `product:measure` as a consumer (only `product:reflect`). Fixed.
3. `CLAUDE.md` — claimed `--skip-gate` overrides are "logged in the resulting artifact" for all skills; only `product:shape` implements logging. Claim corrected to match reality (**behavior unchanged** — the logging gap itself stays a backlog item until it earns a scar).

Added in the same session: `docs/playbooks.md` (situation → skill-sequence routing) plus README and CLAUDE.md pointers to it.

## What stays frozen

- Skill behavior: SKILL.md process steps, gates, outputs.
- Recipe process content: questions, checklists, methods, thresholds.
- **No skill without a scar** — unchanged. The gap backlog from the 2026-08-29 analysis (fast-follow entry track, project-level architecture, build-plan task decomposition, ship/deploy phase) remains a **backlog, not a roadmap**. Nothing gets built until the same friction hits twice in real runs.

## Trigger discipline (unchanged)

Behavior changes still require: hit during real use → GitHub issue → fix.
