# Scenario Playbooks

The two tracks in `README.md` answer "what kind of product is this?" (new vs. existing). This file answers a different question: **"what situation am I in?"** — and routes from a recognizable situation to the exact sequence of skills to run, with the recipes each step reads and the artifacts it leaves behind.

Every sequence respects the Step 0 gates: followed in order, no playbook needs `--skip-gate`. Where a gate would bite, the playbook says so and names the legal way through.

## Routing table

| Your situation sounds like… | Playbook |
|---|---|
| "The product is nearly finished, a real customer is waiting — are all scenarios covered?" | [1. Pre-launch tightening](#1-pre-launch-tightening) |
| "I keep building but can't converge on the feature set or the offering" | [2. Unfocused build](#2-unfocused-build) |
| "Someone handed me a clear, ready-made idea and I intend to build it" | [3. Handed-over idea](#3-handed-over-idea) |
| "An existing product must be replaced with a modern implementation" | [4. Legacy replacement](#4-legacy-replacement) |
| "Too many projects and ideas — I don't know what to work on" | [5. Portfolio overload](#5-portfolio-overload) |
| "Brand-new idea, nothing validated yet" | [6. New idea, full validation](#6-new-idea-full-validation) |
| "I shipped something" | [7. Close the loop](#7-close-the-loop) |
| "Where was I?" | [8. Reorientation](#8-reorientation) |
| "Starting a new frontend codebase — want proven architecture, not a blank page" | [Stack profiles](#stack-profiles-seeding-from-arche-ui) |

---

## 1. Pre-launch tightening

**Situation:** The product is mostly built. A real user or customer is lined up. You need confidence that the important journeys and edge scenarios are covered — and a crisp answer to "who is this for" — before pre-launch.

**Core loop:** audit → model → journeys. Everything after is conditional on what those expose.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:audit pro` | Factual current state: screen inventory, extracted object model, terminology drift, missing states | 00 |
| 2 | `product:model` | Reconcile the extracted model with the intended one. **Positioning answers "who is the target audience"** (recipe 05); the glossary locks terminology | 04, 05, 06, 08 |
| 3 | `product:journey "<flow>"` — once per critical flow (typically 3–5) | **This is the scenario-coverage step.** Forces trigger, preconditions, per-step system responses, and failure states for every flow | 07 |
| 4 | `product:shape "pre-launch tightening"` (or one pitch per gap area) | Scope the fixes steps 1–3 exposed as a bounded slice with an appetite — prevents "tightening" from becoming a rewrite | 09 |
| 5 | `product:spec "<screen>"` — only for screens steps 1–3 flagged | The screen state checklist (loading / empty / error / degraded / permission-denied) is the scenario net at screen level | 10, 11 |
| 6 | `product:build` | Readiness check + self-contained execution brief for the fixes | 13, 14 |
| 7 | `product:measure` | Instrument **before** launch, while the baseline is clean | 16 |
| 8 | Ship to the customer, then `product:reflect` after real usage | Evidence-based continue / improve / simplify / pivot / kill | 16, 17 |

**Notes**
- If steps 1–3 expose no real build gaps, skip 4–6 — but still run a minimal `product:shape lite "launch"` before step 7: `product:measure`'s gate requires a pitch, and launch done-criteria are exactly what `product:reflect` will evaluate later.
- With a real customer available, a manual usability session before launch is high-leverage: follow `recipes/15-usability-testing.md` (deliberately not skill-driven).

---

## 2. Unfocused build

**Situation:** A prototype or partial build exists, but the feature set won't converge and you can't state the offering in one sentence.

**Diagnosis:** This is a positioning and non-goals problem, not a building problem. The convergence tools are the opportunity map and positioning recipes inside `product:model`, plus the explicit exclusions a pitch forces.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:audit lite` | Inventory what actually exists before deciding what it should be | 00 |
| 2 | `product:model pro` | Do **not** run lite here — the opportunity map (04) and positioning + main alternative + non-goals (05) are the whole point of this playbook | 04, 05, 06, 08 |
| 3 | `product:shape "<next slice>"` | Appetite + what's-excluded force the feature-set decision one slice at a time | 09 |
| 4 | Continue standard delivery: `product:spec` → `product:build` | | 10, 11, 13, 14 |

**Notes**
- Convergence comes from deciding what the product is **not**. The two artifacts to watch: Non-goals in `product-model.md` and No-gos in the pitch.
- If step 2 surfaces a high-risk demand assumption, the shape gate will require a verdict: run `product:experiment` (recipe 03b) or record an explicit `Verdict: waived — <reason>` in `docs/product/assumptions.md`.

---

## 3. Handed-over idea

**Situation:** Someone explained a clear, well-formed idea to you and agrees you build it. The idea needs no invention — but the demand validation is second-hand.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 0 | Drop everything you have (notes, chat transcript, sketches) into `docs/intake/` | Skills pre-populate from intake and interview you only on the gaps | — |
| 1 | `product:discover lite` | Idea brief + assumption map, fast — the idea is already clear, so this is mostly extraction and risk-rating | 01, 02, 03 |
| 2 | Decide the demand assumption **consciously**: run `product:experiment`, or edit `docs/product/assumptions.md` to `Verdict: waived — <reason>` | An enthusiastic idea-giver is not validated demand (Mom Test). The shape gate blocks untested high-risk assumptions; a written waiver is the legal shortcut — the point is deciding once, in writing | 03b |
| 3 | `product:model lite` | Objects, states, glossary — enough to spec against | 06 |
| 4 | `product:shape "<first slice>"` → `product:spec` → `product:build` | Standard delivery from here | 09, 10, 11, 13, 14 |

**Notes**
- If the idea-giver has access to the target users, the cheapest experiment is usually a concierge or smoke test through their network (see the methods table in recipe 03b) — often cheap enough that waiving is a false economy.
- If the idea-giver is also the first user, `waived — building for a committed first user` is an honest waiver. Write it down and move on.

---

## 4. Legacy replacement

**Situation:** An existing product must be replaced with a modern implementation.

**Rule: audit the legacy system even though you're replacing it.** The extracted object model, terminology, and screen inventory are your requirements baseline. Audit separates *what exists* from *what it should be* — and the gap between audit and model **is** the revamp scope.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:audit pro` (on the legacy codebase) | Requirements baseline: screens, objects, terminology, known problems | 00 |
| 2 | `product:model pro` | Target state. Explicitly reconcile: keep / rename / drop each legacy object | 04, 05, 06, 08 |
| 3 | `product:experiment` — only if the replacement introduces a high-risk assumption (new workflow, new pricing, platform change) | The rewrite itself isn't the risk; the *changes riding along with it* are | 03b |
| 4 | `product:journey "<flow>"` — for flows that change | Unchanged flows don't need remapping | 07 |
| 5 | `product:shape "<migration slice>"` — never shape "the rewrite" as one pitch | An appetite per slice is the guard against the classic rewrite death march | 09 |
| 6 | `product:spec` → `product:build` → ship the slice → `product:measure` → `product:reflect`, then repeat from step 5 for the next slice | | 10, 11, 13, 14, 16, 17 |

---

## 5. Portfolio overload

**Situation:** Several projects and ideas compete for attention. You feel scattered.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:triage` — from a parent directory containing the project repos | Six scoring dimensions → one focus project, secondary, do-not-touch, and kill candidates. Artifact lands in the cwd's `docs/triage/` | 18 |
| 2 | Open the focus project and match it to playbooks 1–4 or 6 | Triage picks the project; the playbook picks the sequence | — |
| 3 | Re-run when you feel scattered again — or weekly | The decision decays; the artifact records what you decided and why | 18 |

---

## 6. New idea, full validation

**Situation:** A brand-new idea of your own. Nothing validated, nothing built. This is the canonical new-product track.

| Step | Run | Recipes |
|---|---|---|
| 1 | `product:discover` | 01, 02, 03 |
| 2 | `product:experiment` — cheapest test for the riskiest assumption | 03b |
| 3 | `product:model` | 04, 05, 06, 08 |
| 4 | `product:journey "<flow>"` per primary journey | 07 |
| 5 | `product:shape "<first slice>"` | 09 |
| 6 | `product:spec "<screen>"` per screen | 10, 11 |
| 7 | `product:build` | 13, 14 |
| 8 | Ship → `product:measure` → `product:reflect` | 16, 17 |

---

## 7. Close the loop

**Situation:** You shipped something.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:measure "<feature>"` — if instrumentation was missed pre-ship, run it immediately | Before the baseline data disappears | 16 |
| 2 | `product:reflect "<feature>"` | Gate confirms it actually shipped; forces one of five decisions: continue / improve / simplify / pivot / kill | 16, 17 |

---

## 8. Reorientation

**Situation:** Returning to a project after a break, or unsure what phase you're in.

Run `product:next`. Read-only, writes nothing, safe any time. Reports what exists, what's missing, what's deferred, and the exact next command.

---

## Stack profiles: seeding from arche-ui

For frontend projects there is a companion repo — **arche-ui**
(`~/Documents/code/glassflow/arche-ui`) — holding canonical, production-extracted
architecture decisions for a Next.js/TypeScript/Zustand/Zod/shadcn stack: layered
request/hydration lifecycles, design tokens, CI-enforced guardrails, a deployment
recipe (k8s/Helm), a component gallery, and mechanical scaffolding skills
(`add-proxy-route`, `add-zustand-slice`, `add-zod-form`) plus a `review-changes`
drift review. It answers the two questions this OS deliberately leaves open:
project-level frontend architecture and deployment.

**Where it slots into any playbook:** after `product:model`, before
`product:journey` / `product:shape`. Seeding *is* the architecture decision, and
it needs core objects + IA to check fit against.

**Profile-fit check before seeding.** arche-ui docs 16–17 bake in *product*
decisions — workspace-as-tenant, roles, `/w/[workspaceId]` IA, onboarding — as
its `observability-saas` profile, enforced by a `tenant-scope` CI gate:

- **Full fit** (multi-tenant SaaS, workspace-as-tenant) → seed everything per
  the arche-ui README.
- **Different tenancy** → seed docs 00–15 only; delete doc 17 (and 16 if
  single-tenant), skip the `tenant-scope` gate; tenancy comes from *your*
  `product-model.md`.
- **Not a Next.js frontend** → arche-ui doesn't apply; architecture remains a
  manual step (no skill covers it yet).

**Known seam:** in an arche-ui-seeded repo, ignore the folder pattern in
`recipes/13-technical-architecture.md` — the architecture skeleton in
`product:build` must follow arche-ui docs 09/15 (`components/ui → common →
shared → modules/*`), which CI enforces there. The build skill's own rule
already defers to codebase patterns; this note makes the precedence explicit.

**Execution composition:** hand the execution agent the build file + screen
specs as usual; in seeded repos it should scaffold via arche-ui's `add-*` skills
and run `review-changes` on the diff before handing back.

---

## Reference: skill → recipes, gate, artifact

| Skill | Reads recipes | Gate (summary) | Produces |
|---|---|---|---|
| `product:next` | — | none (read-only) | nothing |
| `product:triage` | 18 | ≥2 project dirs in scan root | `docs/triage/YYYY-MM-DD-triage.md` (in cwd) |
| `product:discover` | 01, 02, 03 | none (entry point) | `product-model.md` (seed), `assumptions.md` |
| `product:audit` | 00 | none (entry point) | `docs/product/audit.md` |
| `product:experiment` | 03b | `assumptions.md` with ≥1 `Risk: high` | `docs/specs/…-experiment.md` + verdict in `assumptions.md` |
| `product:model` | 04, 05, 06, 08 | `assumptions.md` or `audit.md` exists | `product-model.md`, `glossary.md`, `information-architecture.md` |
| `product:journey` | 07 | product model with core objects non-deferred | `docs/product/journeys/<name>.md` |
| `product:shape` | 09 | model complete + every high-risk assumption has a verdict (or explicit waiver) | `docs/specs/…-pitch.md` |
| `product:spec` | 10, 11 | ≥1 pitch exists + glossary exists | `docs/screens/<name>.md` |
| `product:build` | 13, 14 | complete pitch + screen specs (+ product model for pro) | `docs/specs/…-build.md` (incl. self-contained execution brief) |
| `product:measure` | 16 | pitch with done criteria | `docs/product/journeys/<slug>-telemetry.md` |
| `product:reflect` | 16, 17 | pitch exists + feature actually shipped | `docs/specs/…-retro.md` |

**Manual recipes (no skill runs them — consult directly):**
- `recipes/12-ui-system.md` — during design-system work; project-specific design skills own this.
- `recipes/15-usability-testing.md` — before launch, when a real user is available (see playbook 1).
