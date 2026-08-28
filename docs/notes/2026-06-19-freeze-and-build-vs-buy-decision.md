# Decision log — Freeze Product OS & build-vs-buy verdict

**Date:** 2026-06-19
**Format:** grilling session (decision tree walked to a verdict)
**Status:** decided

---

## The question I brought

I built this Product OS (12 skills, 20 recipes, templates, Step 0 gates) to drive
solo development of features and micro-SAAS products from idea → spec → handoff →
execution. My daily workflow is scattered and high-friction. I used it on a couple
of occasions (GlassFlow + micro-SAAS) but stopped when higher-priority issues took
over. I'm now returning to it.

I wanted an honest critique and a build-vs-buy decision: should I keep refining my
own, or rely on proven projects (phuryn/pm-skills, deanpeters/Product-Manager-Skills,
carlvellotti/carls-product-os, ai-pm-os, Superpowers, GTD-style systems)?

## What the grilling surfaced

- **It has been used and it helped** — and it stalled for a legitimate reason
  (higher-priority work), not because it failed.
- **I can't yet name the gems vs. the jewelry.** I've used `audit`, `discover`,
  `build`, `journey`, `shape` "a lot" but the runs were exploratory, not load-bearing.
  I have **never run `triage` or `reflect`** — the two skills that map most directly
  to my actual stated need ("assess where I am, decide what to finish").
- Therefore: **I cannot polish my way to knowing what's valuable. Only usage tells me.**
  "Polish, then freeze, then use" is backwards. Correct order: **freeze → use → let
  the evidence decide what to cut.**

## The verdict — keep my own, don't adopt any of them as the operating model

1. **The strongest candidates are in a different layer.** Superpowers (and GTD-style
   systems) answer *how* to build well — TDD, debugging, planning. Mine answers *what*
   to build and whether it's coherent. **They compose; they don't compete.** Run both.
2. **Against the PM catalogs, my differentiator fixes my specific pain.** My problem is
   scatter and decision fatigue. A 100-skill catalog (phuryn) re-introduces the exact
   friction I'm killing — choice. My enforced sequence + Step 0 gates answer "what next?"
   automatically. For a scattered solo builder, the opinionated spine *is* the point.
3. **Maintenance cost is near zero** (markdown read by an agent), so the usual
   "buy to avoid maintenance" argument doesn't apply.

The two advisors quoted in `EXPAND_INTO_PRODUCT_OS.md` independently reached the same
conclusion: keep the spine yours, treat the others as libraries, steal narrowly.

## The risk I'm guarding against

Methodology addiction — refining the OS as a substitute for shipping. Re-asking
build-vs-buy is itself a flavor of that (I've now answered it three times in three docs).

## Rules I'm committing to

- **Freeze now.** Tag `v0.1-frozen`. No skill edits.
- **Blocker-only fixes:** a run breaks / a gate misfires / a recipe reference is dead —
  fixed only when hit during real use, logged as a GitHub issue first.
- **No skill without a scar:** add/refine a skill only after the same friction hits twice.
- **No revisiting build-vs-buy until 5 real, load-bearing runs are logged.**
- **Freeze bar** (a skill is frozen-ready if): (1) runs end-to-end without stalling,
  (2) output is good enough to act on, (3) `product:next` reports its state correctly.

## Next actions

1. Tag the repo `v0.1-frozen`.
2. Run `product:triage` first — it's the "which micro-SAAS do I finish" tool I came back for.
3. Run the spine on the project triage names.
4. Keep `docs/os-usage-log.md` (auto-populated by hook) and fill the "load-bearing?" column.
5. After ~5 load-bearing runs, review the log → decide what pulls weight, what gets demoted.

## Deferred (only if a scar appears)

- Feature-by-feature diff of phuryn/pm-skills + carls-product-os against my skill set,
  to "steal narrowly" for a specific underserved need.

---

## Addendum — 2026-08-29 (build-vs-buy round 4: company-backed entrants)

Revisited ahead of the 5-run bar, deliberately: the June survey covered only
community PM catalogs, and company-backed spec-driven tooling has shipped since.
Recorded so the next run diffs against these findings instead of starting over.

### Surveyed (2026-08-29)

| Candidate | Backer | Layer | Finding |
|---|---|---|---|
| **Spec Kit** | GitHub (MIT, OSS) | shape → spec → tasks → implement | Strongest entrant. `/speckit.specify → plan → tasks → implement`, works with Claude Code among 30+ agents. Covers exactly our missing task-decomposition bridge. Has no discovery, validation, journeys, triage, or measure/reflect. |
| **Kiro** | AWS (GA 2026-05) | requirements → design → tasks | Same segment, but a standalone IDE — adopting it displaces Claude Code as the driver. Steal narrowly: EARS notation for acceptance criteria. |
| **next-forge 6** | Vercel | stack canon | arche-ui alternative only for Vercel-deployed generic SaaS; conflicts with our k8s deployments. Ships an agent skill (same move as arche-ui's skills). |
| **Epic Stack** | Kent C. Dodds | stack canon (Remix/Fly) | Wrong stack for us; validates arche-ui's documented-decisions philosophy. |
| **BMAD-METHOD** | community, ~49k stars, v6.8 | full lifecycle via agent personas | The persona-catalog shape rejected in June — heavier agile ceremony, no refusing gates, no portfolio layer. |

### Verdict — unchanged: compose, don't switch

No candidate, company-backed or community, covers the front half: validation
gates before building, portfolio triage, journeys + screen specs with state
checklists, or the measure/reflect kill-decision loop. The unique ground holds.

### Earmark: the execution bridge (decide at scar time, not now)

When the task-decomposition scar hits (the first execution handoff that goes
badly), two options, decided then:

- **A — compose GitHub Spec Kit:** hand the build file's execution brief to
  `/speckit.plan → tasks → implement`. Zero maintenance, GitHub-maintained.
- **B — build `product:build-plan` in-house** (already specced in
  `EXPAND_INTO_PRODUCT_OS.md`): same language, gates, artifact conventions, and
  tiers as the rest of the OS — one spine, no impedance mismatch between a
  foreign spec format and our pitch/screen-spec artifacts.

Leaning **B** for coherence — the OS's whole value is the single opinionated
spine, and a foreign format in the middle of it cuts against that. A wins only
if B's maintenance cost proves real. Log the scarring run either way.

### Same audit: deployment profiles (arche-ui doc 12)

Doc 12 is extracted from a k8s/Helm fleet deployment — too heavy for simple
self-running projects. Decision: profile it rather than generalize it. Simple
projects keep the image + runtime-env half (docs 01/12) and borrow
orchestration from a proven external recipe (Kamal / Docker Compose / Fly.io /
Coolify); serverless (Vercel) replaces docs 01/12 outright. No new arche-ui doc
until a shipped simple deploy earns one by extraction. Implemented: doc 12
profile label + README seeding step 3 in arche-ui; deployment rubric in
`docs/playbooks.md` here.

### Next review trigger

After 5 load-bearing runs, or when a company-backed entrant covers validation,
triage, or the UX layer — not before.
