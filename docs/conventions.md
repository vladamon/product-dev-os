# Conventions — how skills, recipes, and artifacts fit together

The contract every `product:*` skill and recipe follows. Read this before adding or editing a skill. If a skill contradicts this file, the skill is wrong.

---

## 1. The companion map — stages of the builder journey

Every skill belongs to exactly one stage. `product:next` routes by stage; `docs/playbooks.md` routes by situation. A skill that fits no stage does not belong in the OS.

| # | Stage | `phase:` slug | Question it answers | Skills |
|---|---|---|---|---|
| 0 | Choose | `choose` | What should I work on at all? | `ideate` (no idea yet), `triage` (too many projects) |
| 1 | Understand | `understand` | Who has what problem, really? | `discover` (new), `audit` (existing), `interview` (evidence for an idea), `field` (find the opportunity inside a client's or segment's operations — before any idea) |
| 2 | Challenge | `challenge` | Is this idea any good? What kills it? | `critique` |
| 3 | Money & reach | `money-reach` | Can it pay? Can I reach buyers? | `viability`, `gtm` |
| 4 | Test | `test` | Is the riskiest assumption true? | `experiment` |
| 5 | Define | `define` | What is the product's world? | `model`, `journey` |
| 6 | Architect | `architect` | What do I build it with? | `stack` |
| 7 | Scope | `scope` | What exactly do I build next? | `shape`, `spec` |
| 8 | Build | `build` | Ready? In what order? | `build`, `plan` |
| 9 | Launch | `launch` | Is it safe to ship, and who hears about it? | `launch`, `measure` |
| 10 | Learn | `learn` | Did it work? Keep going? | `reflect` (feature), `pmf` (product) |
| ∞ | Always | `always` | Where am I? Am I on track? | `next` (navigator), `checkin` (weekly) |

Stages are an ordering of *concerns*, not a mandatory pipeline. Gates enforce only the dependencies that would otherwise produce fiction (e.g. shaping without a model).

---

## 2. Skill anatomy

File: `skills/<name>/SKILL.md`. The plugin is named `product`, so Claude Code exposes `skills/critique/` as `product:critique`.

### Frontmatter

```yaml
---
name: critique            # short name only — lowercase, digits, hyphens. NEVER "product:critique"
description: Use this skill when the user invokes `/product:critique` or asks <trigger phrases>.
---
```

The `description` is what makes the skill trigger. Include the natural-language situations, not just the command.

### Sections, in order

1. `# product:<name> — <Role>` then one line: when to use.
2. `## Purpose` — what it produces and why. Name the recipe(s) it reads: "Read `recipes/NN-x.md` for the authoritative process."
3. `## Contract` — three lines: `Requires:` / `Produces:` / `Updates:`.
4. `## Step 0: Verify prerequisites (gate)` — only if something upstream must exist. Omit for entry points and say "nothing (entry point)" in Contract.
5. `## Step 1: Tier resolution` — numbered rules, first match wins (see §4). Skills with modes resolve the mode here too.
6. `## Step 2: Read context` — user-specified files → `docs/intake/` → upstream artifacts.
7. `## Step 3: Show context summary` — fenced block, then "Correct anything?" and wait.
8. `## Step 4: Conduct the interview` — reads the recipe's lite/pro set; names the questions that are always asked.
9. `## Step 5: Produce the artifact` — exact path, frontmatter, structure.
10. `## Step 6: Update related artifacts` — when the skill writes into a shared living doc (usually `assumptions.md`). Skills that update nothing keep the heading and write "None."
11. `## Step 7: Summarize` — fenced block ending in `Recommended next step:` with concrete invocations.
12. `## Fallback questions (if recipe unavailable)` — 3–5 questions.
13. `## Pivot interrupt` — where the interview can reveal the premise is wrong.
14. `## Artifact naming` — living vs point-in-time behavior.
15. `## Rules` — the non-negotiables. Short, imperative, testable.

Modes (e.g. `product:experiment record <slug>`, `product:interview synthesize`, `product:measure product`) get their own `## Mode: <name>` section after Step 7, or explicit per-mode branches inside the steps.

Adding a skill also requires: a stage in §1, a row in §6, a playbook entry in `docs/playbooks.md`, a row in the `CLAUDE.md` skill table, and a README entry.

### Recipe anatomy

File: `recipes/NN-name.md`. Recipes are the authority; skills are runners.

```yaml
---
id: NN-name
phase: <phase slug from §1>
tier-lite: true|false
tier-pro: true|false
produces: <artifact path(s)>
skill: product:<name>[, product:<other>]
---
```

Sections: `## When to use` · `## Inputs` · `## Lite version (N questions)` · `## Pro version` · `## Output structure` · `## Exit condition` · `## AI review prompt` · `## Checklist`.

---

## 3. Gates

Refusal format (always a fenced block, always names the exact command that unblocks):

```
✗ Cannot run product:<name> yet.

Missing requirements:
  - <file> <what is missing or incomplete>

Run this first:
  product:<skill> [args]

Why this matters:
  <one or two lines>
```

Then STOP.

**Warnings** (`⚠`) never stop the skill. Use them for "recommended" inputs.

**Gate override — every gated skill.** `--skip-gate` proceeds past a refusal. The skill MUST:
1. write `gate_override: true` into the produced artifact's frontmatter, and
2. add one line to the artifact's risks/notes section: `Gate skipped — <which check failed>`.

No silent overrides. `product:next` reports every artifact with `gate_override: true`.

**Entry points have no gate** and ignore `--skip-gate`: `ideate`, `discover`, `audit`, `critique`, `checkin`, `next`, and `field prep` (its other modes are gated).

---

## 4. Tiers

- `lite` — 3–5 questions, essential sections, other sections marked `[deferred]`.
- `pro` — full question set, every section required.

Tier resolution is a numbered list; the first matching rule wins. Rule 1 is always "user specified `lite` or `pro` → use it, no questions asked". When the skill picks a default, it announces it in one line and offers the other: `Defaulting to lite — <reason>. Run pro? (y/n)`.

A pro run on a lite artifact enters update mode: fill deferred sections, never overwrite what exists.

---

## 5. The assumption map — canonical format

`docs/product/assumptions.md` is the single index of what must be true. Many skills write to it; all gates read it. It MUST use this shape:

```markdown
---
type: assumptions
product: <name>
tier: lite|pro
status: draft|complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:discover
---

# Assumptions — <Product Name>

## Riskiest Assumptions

1. **A3** — <assumption> — why it kills the idea if false: <one line>
2. **A1** — ...
3. **A5** — ...

## Assumption Map

| ID | Assumption | Type | Risk | Source | Evidence | Test | Verdict |
|----|------------|------|------|--------|----------|------|---------|
| A1 | <falsifiable statement> | desirability | high | discover | none yet | interview | pending |

## Discovery Evidence

<evidence level; appended by product:interview synthesize — conversations table, patterns, surprises>
```

**Column rules**

| Column | Allowed values | Written by |
|---|---|---|
| ID | `A1`, `A2`, … — next unused number, never reused, never renumbered | whoever adds the row |
| Type | `desirability` · `viability` · `feasibility` · `usability` · `distribution` · `trust` | adder |
| Risk | `high` · `medium` · `low` | adder; changed later only with founder confirmation |
| Source | `discover` · `audit` · `critique` · `interview` · `field` · `viability` · `gtm` · `stack` · `experiment` · `founder` | adder |
| Evidence | short summary + link, e.g. `4/5 interviews: pays VA $400/mo → docs/research/…-synthesis.md` | interview, field, experiment, critique, viability, gtm |
| Test | method + link to experiment/kit file | experiment, interview |
| Verdict | blank · `pending` · `validated` · `invalidated` · `inconclusive` · `waived — <reason>` | experiment (`record`), or the founder by hand (waiver) |

**Typing rules.** Price, willingness to pay, churn, margin → `viability`. Reach, channel, CAC, conversion from a channel → `distribution` (even when `viability` adds the row). Build capacity, technical unknowns → `feasibility`.

**Gate rule (used by `shape`, `next`, `experiment`):** a row is an *untested high-risk assumption* when `Risk` is `high` AND `Verdict` is blank or `pending`. `validated`/`invalidated`/`inconclusive` require a link to an experiment file in `Test`. `waived` requires a reason after the dash.

**Adding rows blocks shaping — by design.** `critique`, `viability`, `gtm`, and `stack` can add high-risk rows; each one blocks `product:shape` until it is tested or waived. When a row isn't worth a test, waive it with a real reason — that is a decision recorded, not a gate dodged.

**Interviews produce evidence, not verdicts.** `product:interview` and `product:field` update evidence on the ladder in `recipes/30-discovery-doctrine.md` §3 (L0 opinion … L5 commitment). `product:interview` updates `Evidence` and may *propose* a risk change; only `product:experiment record` (or an explicit founder waiver) sets a verdict.

**Evidence is append-only.** Add new evidence after `;` with its link. Never delete earlier evidence, and never replace sourced or behavioral evidence with an estimate. Changing a Risk value adds a note to Evidence: `risk high→medium YYYY-MM-DD (<why>)`.

**Legacy files.** Older `assumptions.md` files list assumptions as `N. <text> — Type: x, Risk: high, Test: y` lines with `Verdict:` appended. Gates treat those lines as equivalent rows. The next skill that writes the file offers to migrate it to the table (shows the diff, asks first). A skill that appends evidence creates the `## Discovery Evidence` heading if it is missing.

Escape `|` inside cells as `\|`.

---

## 6. Artifact map

**Living** documents are updated in place (update mode, change note in frontmatter). **Point-in-time** documents are date-prefixed and never rewritten — except the explicitly allowed fields noted below.

| Artifact | Kind | `type:` | Written by | Read by |
|---|---|---|---|---|
| `docs/ideas/YYYY-MM-DD-ideation.md` (cwd) | point-in-time | `ideation` | ideate | discover, triage |
| `docs/triage/YYYY-MM-DD-triage.md` (cwd) | point-in-time | `triage` | triage | checkin, next |
| `docs/product/product-model.md` | living | `product-model` | discover (seed), model | most skills |
| `docs/product/assumptions.md` | living | `assumptions` | discover (or experiment, seeding it for an audited product); updated by critique, interview, viability, gtm, stack, experiment | experiment, shape, next, critique, model |
| `docs/product/audit.md` | living | `audit` | audit | model, stack, viability, launch |
| `docs/product/glossary.md` | living | `glossary` | model | spec, build |
| `docs/product/information-architecture.md` | living | `information-architecture` | model | spec |
| `docs/product/business-model.md` | living | `business-model` | viability | gtm, model, triage, measure, pmf, checkin |
| `docs/product/go-to-market.md` | living | `go-to-market` | gtm | launch, model, measure, pmf, checkin |
| `docs/product/architecture.md` | living | `architecture` | stack | build, plan |
| `docs/product/journeys/<name>.md` | living | `journey` | journey | spec, measure |
| `docs/product/journeys/<slug>-telemetry.md` | living | `telemetry` (`scope: feature`) | measure | reflect, launch |
| `docs/product/journeys/product-telemetry.md` | living | `telemetry` (`scope: product`) | measure (`product` mode) | launch, pmf, checkin |
| `docs/screens/<name>.md` | living | `screen-spec` | spec | build, plan |
| `docs/research/YYYY-MM-DD-<slug>-interview-kit.md` | point-in-time | `interview-kit` | interview (prep) | interview (synthesize) |
| `docs/research/YYYY-MM-DD-<slug>-synthesis.md` | point-in-time | `research-synthesis` | interview (synthesize) | critique, viability, model, shape, pmf |
| `docs/research/field/<engagement>/engagement.md` | living | `field-engagement` | field (prep; updated by debrief, synthesize) | field |
| `docs/research/field/<engagement>/card.md` | regenerated by each prep | — | field (prep) | the founder, in the room |
| `docs/research/field/<engagement>/live/YYYY-MM-DD-<P#>-live.md` | point-in-time (appended during the session) | — | field (live) | field (debrief) |
| `docs/research/field/<engagement>/sessions/YYYY-MM-DD-<S##>-<P#>.md` | point-in-time | `field-session` | field (debrief) | field (synthesize) |
| `docs/research/field/<engagement>/YYYY-MM-DD-synthesis.md` | point-in-time | `field-synthesis` | field (synthesize) | discover, critique, experiment, next |
| `docs/specs/YYYY-MM-DD-<slug>-critique.md` | point-in-time | `idea-critique` | critique | discover, experiment, model, next, checkin |
| `docs/specs/YYYY-MM-DD-<slug>-experiment.md` | point-in-time (Results, Verdict, What this changes + status/verdict/ran/concluded filled by `record`) | `experiment` | experiment | shape, next, checkin |
| `docs/specs/YYYY-MM-DD-<slug>-pitch.md` | point-in-time | `shaped-pitch` | shape | spec, build, measure, reflect |
| `docs/specs/YYYY-MM-DD-<slug>-build.md` | point-in-time | `build-checklist` | build | plan, reflect |
| `docs/specs/YYYY-MM-DD-<slug>-plan.md` | point-in-time (task checkboxes and Progress Log may be updated) | `build-plan` | plan | checkin, next |
| `docs/specs/YYYY-MM-DD-<slug>-launch.md` | point-in-time (Results, Verdict + status/verdict filled by `record`) | `launch` | launch | pmf, next, checkin |
| `docs/specs/YYYY-MM-DD-<slug>-retro.md` | point-in-time | `retro` | reflect | next |
| `docs/specs/YYYY-MM-DD-pmf.md` | point-in-time | `pmf-review` | pmf | checkin, next, triage |
| `docs/checkins/YYYY-MM-DD-checkin.md` | point-in-time | `checkin` | checkin | checkin, next, triage |
| `docs/intake/` (incl. `docs/intake/interviews/`) | user-owned drop zone | — | **never written by skills** | all skills |

**Standard frontmatter** on every artifact: `type`, `product`, `tier`, `status`, `created`, `updated`, `skill`, and `related:` links where they exist. Add `gate_override: true` when §3 applies. Artifacts written in the cwd outside a project (`ideation`, `triage`) omit `product`.

**Decision fields** — frontmatter that other skills parse. Keep the exact names:

| Artifact | Fields |
|---|---|
| critique | `mode`, `verdict` (pursue/sharpen/park/kill), `kill_criterion`, `kill_date`, `research` |
| experiment | `assumption_id`, `status`, `verdict`, `conclude_by`, `ran`, `concluded` |
| build | `readiness` (ready/blocked) |
| launch | `launch_type`, `status` (planned/launched/complete), `verdict` (pending/hit/partial/miss), `launch_date` |
| pmf | `verdict`, `decision`, `next_review` |
| research-synthesis | `sources`, `source_phase` (pre-launch/post-launch) |
| field-engagement | `scope` (client/segment), `directive` |
| field-session | `pitch_exposed`, `evidence_counts`, `next_action` |
| field-synthesis | `scope`, `decision` (CONTINUE_INTERVIEWING/DECOMPOSE_OPPORTUNITY/TEST_ASSUMPTION/HALT_FOR_TECHNICAL_SPIKE/PIVOT), `target_opportunity` |
| checkin | `commitments_total`, `commitments_done`, `missed_week`, `missed_streak`, `energy`, `user_contacts`, `mvp_exists` |
| telemetry | `scope` (feature/product) |

**"MVP exists"** (used by checkin and next): any `*-launch.md` exists, OR the newest plan has every task ticked, OR the founder says so.

**Slugs:** kebab-case, 3–5 words, derived from the feature/assumption/idea name.

**Same-day collisions:** when a point-in-time file for the same path already exists today, append `-2`, `-3`: `2026-09-14-pmf-2.md`.

---

## 7. Research protocol

Skills that look outward — `critique`, `viability`, `gtm`, `stack`, `ideate`, `launch` — must separate what is known from what is guessed.

1. **Use real search when available** (WebSearch/WebFetch). Search for competitors, substitutes, prior failed attempts, pricing pages, community discussions, and market data before forming a view.
2. **Label every factual claim** in the artifact:
   - `[sourced: <url>, accessed YYYY-MM-DD]` — found and read
   - `[estimate: <method>]` — derived; show the arithmetic
   - `[founder-stated]` — came from the interview, unverified
3. **Never invent** competitors, numbers, quotes, or URLs. If search is unavailable, say so in the context summary and produce a *research checklist* (queries to run, pages to read) instead of fabricated findings.
4. Absence of competitors is a finding to interrogate ("no market?"), not good news.

## 8. Honesty protocol

The OS exists to replace the co-founder who tells you the truth. Skills that judge — `critique`, `viability`, `pmf`, `checkin`, `reflect`, `triage`, `launch` (record) — must:

- State their own assessment before asking the founder to agree. Disagreement is recorded, not smoothed over.
- Name at least the required number of weaknesses/risks even when the founder is enthusiastic.
- End with a decision from a fixed set. "It depends" and "needs more data" are not decisions; "run test X by date Y, kill if Z" is.
- Treat compliments, "I'd use that", and hypothetical future behavior as non-evidence.
- Never soften a verdict because the founder has already invested time (sunk cost is named explicitly when detected).

## 9. Advice boundaries

Legal, tax, accounting, securities/fundraising, and privacy-compliance topics appear as **checklists and questions to take to a professional**, never as definitive advice. Mark those sections: `Not legal/tax advice — verify with a qualified professional in your jurisdiction.`

## 10. Recommended-next-step routing

Every summary ends with `Recommended next step:` naming real invocations. Common routes:

- field synthesis `TEST_ASSUMPTION` → `product:discover using <synthesis>` (new project) → `product:experiment`
- critique verdict Pursue → `product:interview prep` or `product:experiment`
- critique verdict Sharpen → `product:discover` (re-run with the reframe)
- critique verdict Park/Kill → `product:triage` or `product:ideate`
- experiment validated → `product:viability` / `product:gtm` if missing, else `product:model`
- build ready → `product:plan`
- plan done → `product:measure product` (if missing) → `product:launch`
- launch recorded → after ~4–8 weeks of usage `product:pmf`
- pmf Kill/Pivot → `product:triage` / `product:discover`
- checkin with 3 missed weeks → `product:triage`
