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
