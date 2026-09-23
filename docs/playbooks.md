# Scenario Playbooks

The companion map in `docs/conventions.md` §1 answers "what stage is this product in?" This file answers a different question: **"what situation am I in?"** — and routes from a recognizable situation to the exact sequence of skills to run, with the recipes each step reads and where to stop.

Every sequence respects the Step 0 gates: followed in order, no playbook needs `--skip-gate`. Where a gate would bite, the playbook says so and names the legal way through.

`product:next "<your situation in your own words>"` matches your words to a playbook and adjusts the sequence for what already exists in the project.

## Routing table

| Your situation sounds like… | Playbook |
|---|---|
| **Before building** | |
| "I want to start something but have no idea what" | [9. No idea yet](#9-no-idea-yet) |
| "I'm meeting a client / small businesses — is there a product in how they work?" | [20. Client discovery](#20-client-discovery) |
| "Is this idea any good?" — mine, or one a friend brought me | [10. Judge an idea](#10-judge-an-idea) |
| "Someone handed me a clear, ready-made idea and I intend to build it" | [3. Handed-over idea](#3-handed-over-idea) |
| "Brand-new idea, I want to do this properly end to end" | [6. New idea, full validation](#6-new-idea-full-validation) |
| "Will anyone pay? How do I price it? Can it replace my salary?" | [11. Money questions](#11-money-questions) |
| "I want to ship something small, fast" | [12. Fast MVP](#12-fast-mvp) |
| "Too many projects and ideas — I don't know what to work on" | [5. Portfolio overload](#5-portfolio-overload) |
| **While building** | |
| "What stack should I use? Am I over-engineering?" | [13. Stack decision](#13-stack-decision) |
| "I keep building but can't converge on the feature set or the offering" | [2. Unfocused build](#2-unfocused-build) |
| "Handoffs to the agent go badly — tasks are too big or wander" | [14. Build execution](#14-build-execution) |
| "An existing product must be replaced with a modern implementation" | [4. Legacy replacement](#4-legacy-replacement) |
| **Launching** | |
| "The product is nearly finished, a real customer is waiting — are all scenarios covered?" | [1. Pre-launch tightening](#1-pre-launch-tightening) |
| "I'm about to launch publicly" | [15. Public launch](#15-public-launch) |
| **After launch** | |
| "I shipped a feature" | [7. Close the loop](#7-close-the-loop) |
| "I launched and nobody came" | [16. Nobody came](#16-nobody-came) |
| "I have users but I'm not sure it's working — persevere, pivot, or quit?" | [17. Fit or quit](#17-fit-or-quit) |
| "Drowning in feature requests and feedback" | [18. Feedback flood](#18-feedback-flood) |
| **Any time** | |
| "I'm stuck, lost momentum, or keep building instead of selling" | [19. Stuck](#19-stuck) |
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
| 6 | `product:build` → `product:plan` | Readiness check + ordered tasks for the fixes | 13, 14, 25 |
| 7 | `product:measure product` (+ `product:measure "<fix slice>"` if step 4 shaped one) | Instrument activation and retention **before** launch, while the baseline is clean | 16 |
| 8 | `product:launch lite "<customer> pilot"` | Blocker-only readiness (payments, data, trust) + success threshold for the pilot. The launch gate accepts the audit as proof something is built | 26 |
| 9 | Ship to the customer → `product:launch record` → `product:reflect` per shaped slice, `product:pmf` once real usage accumulates | Evidence-based decisions at feature and product level | 17, 26, 27 |

**Notes**
- If steps 1–3 expose no real build gaps, skip 4–6 and go straight to step 7 — product-mode measurement and the launch gate need no pitch.
- With a real customer available, a manual usability session before launch is high-leverage: follow `recipes/15-usability-testing.md` (deliberately not skill-driven).

---

## 2. Unfocused build

**Situation:** A prototype or partial build exists, but the feature set won't converge and you can't state the offering in one sentence.

**Diagnosis:** This is a positioning and non-goals problem, not a building problem. The convergence tools are the opportunity map and positioning recipes inside `product:model`, plus the explicit exclusions a pitch forces.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:audit lite` | Inventory what actually exists before deciding what it should be | 00 |
| 2 | `product:critique` (warm, on the audit) | An outside view on who this is really for and what the market already covers — often the reason it won't converge | 20 |
| 3 | `product:model pro` | Do **not** run lite — the opportunity map (04) and positioning + main alternative + non-goals (05) are the whole point of this playbook | 04, 05, 06, 08 |
| 4 | `product:shape "<next slice>"` | Appetite + what's-excluded force the feature-set decision one slice at a time | 09 |
| 5 | Continue standard delivery: `product:spec` → `product:build` → `product:plan` | | 10, 11, 13, 14, 25 |

**Notes**
- Convergence comes from deciding what the product is **not**. The two artifacts to watch: Non-goals in `product-model.md` and No-gos in the pitch.
- `product:critique` warm mode needs `assumptions.md`; on an audit-only project run it cold with a one-paragraph description of the product.
- If step 3 surfaces a high-risk demand assumption, the shape gate will require a verdict: run `product:experiment` (recipe 03b) or set that row's Verdict to `waived — <reason>`.

---

## 3. Handed-over idea

**Situation:** Someone explained a clear, well-formed idea to you and agrees you build it. The idea needs no invention — but the demand validation is second-hand.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 0 | Drop everything you have (notes, chat transcript, sketches) into `docs/intake/` | Skills pre-populate from intake and interview you only on the gaps | — |
| 1 | `product:discover lite` | Idea brief + assumption map, fast — the idea is already clear, so this is mostly extraction and risk-rating | 01, 02, 03 |
| 2 | `product:critique` | Second-hand enthusiasm is the riskiest input in the OS. Research the landscape and get a verdict before you invest your time | 20 |
| 3 | Decide the demand assumption **consciously**: run `product:experiment`, or set the row's Verdict column to `waived — <reason>` | An enthusiastic idea-giver is not validated demand (Mom Test). The shape gate blocks untested high-risk assumptions; a written waiver is the legal shortcut — the point is deciding once, in writing | 03b |
| 4 | `product:model lite` → `product:stack` (if no codebase yet) | Objects, states, glossary — enough to spec against; then what to build it with | 06, 24 |
| 5 | `product:shape "<first slice>"` → `product:spec` → `product:build` → `product:plan` | Standard delivery from here | 09, 10, 11, 13, 14, 25 |

**Notes**
- If the idea-giver has access to the target users, the cheapest experiment is usually a concierge or pre-sale through their network (see recipe 03b) — often cheap enough that waiving is a false economy.
- If the idea-giver is also the first user, `waived — building for a committed first user` is an honest waiver. Write it down and move on.

---

## 4. Legacy replacement

**Situation:** An existing product must be replaced with a modern implementation.

**Rule: audit the legacy system even though you're replacing it.** The extracted object model, terminology, and screen inventory are your requirements baseline. Audit separates *what exists* from *what it should be* — and the gap between audit and model **is** the revamp scope.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:audit pro` (on the legacy codebase) | Requirements baseline: screens, objects, terminology, known problems | 00 |
| 2 | `product:model pro` | Target state. Explicitly reconcile: keep / rename / drop each legacy object | 04, 05, 06, 08 |
| 3 | `product:stack pro` | The modern implementation's stack, managed services, data model mapping, and not-now list | 24 |
| 4 | `product:experiment` — only if the replacement introduces a high-risk assumption (new workflow, new pricing, platform change) | The rewrite itself isn't the risk; the *changes riding along with it* are. No `assumptions.md` yet? The skill seeds one from the assumption you name. Finish with `product:experiment record` | 03b |
| 5 | `product:journey "<flow>"` — for flows that change | Unchanged flows don't need remapping | 07 |
| 6 | `product:shape "<migration slice>"` — never shape "the rewrite" as one pitch | An appetite per slice is the guard against the classic rewrite death march | 09 |
| 7 | `product:spec` → `product:build` → `product:plan` → ship the slice → `product:measure` → `product:reflect`, then repeat from step 6 | | 10, 11, 13, 14, 16, 17, 25 |

---

## 5. Portfolio overload

**Situation:** Several projects and ideas compete for attention. You feel scattered.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:triage` — from the directory that contains your project repos | Six scoring dimensions → one focus project, secondary, do-not-touch, and kill candidates. Artifact lands in the cwd's `docs/triage/` | 18 |
| 2 | Open the focus project and match it to a playbook here | Triage picks the project; the playbook picks the sequence | — |
| 3 | `product:checkin` at the end of each week inside the focus project | Keeps the focus honest between triages | 28 |
| 4 | Re-run triage when you feel scattered again — or weekly | The decision decays; the artifact records what you decided and why | 18 |

---

## 6. New idea, full validation

**Situation:** A brand-new idea of your own that you intend to take all the way. Nothing validated, nothing built.

| Step | Run | Recipes |
|---|---|---|
| 1 | `product:discover` | 01, 02, 03 |
| 2 | `product:critique` — red team + landscape research + verdict | 20 |
| 3 | `product:interview prep` → talk to 5 people → `product:interview synthesize` | 03, 21 |
| 4 | `product:viability` — money math | 22 |
| 5 | `product:gtm` — beachhead and first-10-customers plan | 23 |
| 6 | `product:experiment` — cheapest test for the riskiest remaining assumption | 03b |
| 7 | `product:model` | 04, 05, 06, 08 |
| 8 | `product:stack` | 24 |
| 9 | `product:journey "<flow>"` per primary journey | 07 |
| 10 | `product:shape "<first slice>"` | 09 |
| 11 | `product:spec "<screen>"` per screen | 10, 11 |
| 12 | `product:build` → `product:plan` | 13, 14, 25 |
| 13 | `product:measure product` → `product:launch` → ship → `product:launch record` | 16, 26 |
| 14 | `product:reflect` per feature; `product:pmf` after 4–8 weeks of real usage | 17, 27 |

Stop early whenever a verdict says so: critique Kill/Park, an invalidated experiment, or "math doesn't work" end the playbook — go to [5](#5-portfolio-overload) or [9](#9-no-idea-yet).

---

## 7. Close the loop

**Situation:** You shipped a feature.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:measure "<feature>"` — if instrumentation was missed pre-ship, run it immediately | Before the baseline data disappears | 16 |
| 2 | `product:reflect "<feature>"` | Gate confirms it actually shipped; forces one of five decisions: continue / improve / simplify / pivot / kill | 16, 17 |
| 3 | If the question is about the whole product rather than this feature → `product:pmf` | Feature retros can't answer "should this product exist" | 27 |

---

## 8. Reorientation

**Situation:** Returning to a project after a break, or unsure what stage you're in.

Run `product:next`. Read-only, writes nothing, safe any time. Reports stage, gaps behind it, overdue decisions, and the exact next command. `product:next "<situation>"` routes free-text situations to this file.

---

## 9. No idea yet

**Situation:** You want to build a product or start a business, but have no idea — or a pile of vague ones and no project.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:ideate pro` — from any directory (writes `docs/ideas/` in the cwd) | Founder inventory → idea sources → kill filters → one pick, anchored in what you can actually reach and build | 19 |
| 2 | Talk to the 5 people the ideation file names | Before creating a repo. If you can't reach 5, the pick fails its own filter — take the runner-up | 03 |
| 3 | Create a project directory → [10. Judge an idea](#10-judge-an-idea) with `product:discover using <ideation file>` | | 01, 02 |

**Stop condition:** a critique verdict on the pick.

**Alternative:** if you have access to businesses (clients, a trade you know), skip ideation and find the idea in their operations — [20. Client discovery](#20-client-discovery).

---

## 10. Judge an idea

**Situation:** "Is this idea any good? Is there an opportunity worth chasing?" — your own idea or one a friend brought you. The goal is a decision, **not** a build.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 0 | Write the idea down in the owner's own words: `docs/intake/idea.md` | Discover and critique pre-populate from it; the owner's phrasing reveals assumptions | — |
| 1 | `product:discover lite` (~10 min) | One-sentence brief, canonical assumption map, evidence level. The AI rates risk independently and shows disagreements | 01, 02, 03 |
| 2 | `product:critique pro` (~30–40 min) | Researches competitors, substitutes, and prior failures; attacks the idea through 11 lenses; pre-mortem; verdict Pursue / Sharpen / Park / Kill with a dated kill criterion | 20 |
| 3 | Kill or Park → **stop here.** Sharpen → re-run step 1 with the reframe. Pursue → continue | | — |
| 4 | `product:interview prep` → the owner talks to 5 target users → `product:interview synthesize` | The only step no tool can do for you — and the one that actually answers "is it viable" | 03, 21 |
| 5 | `product:viability lite` | Can it pay? Ramen math and a verdict | 22 |
| 6 | `product:experiment` on the riskiest remaining assumption — `pre-sale` when the question is money | Real behavior, pre-committed threshold, recorded verdict | 03b |

**Stop condition:** an experiment verdict on the riskiest assumption, or a Kill/Park verdict. Only then decide whether to continue into [6](#6-new-idea-full-validation) or [12](#12-fast-mvp).

**Notes**
- **15-minute version:** in an empty directory, `product:critique "<the idea in a paragraph>"` runs cold (lite) and gives a first verdict before anyone commits to the full playbook.
- Judging someone else's idea: the owner should answer the interviews in steps 1 and 4 — second-hand answers are opinions about opinions.
- Critique, viability, and gtm add high-risk rows to the assumption map. Each blocks `product:shape` until tested or waived (`Verdict: waived — <reason>` in the table). That is intended: if you continue past this playbook, you decide about every row once, in writing.

---

## 11. Money questions

**Situation:** "Will anyone pay? How should I price it? Can this replace my salary? Should I raise money?"

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:viability` (lite first; pro for unit economics, cost, funding path) | Founder goal → revenue model → price anchored to value and alternatives → ramen math → verdict | 22 |
| 2 | `product:experiment` with **pre-sale** on the price/willingness-to-pay row | Stated willingness to pay is worthless; deposits and signed commitments aren't | 03b |
| 3 | `product:gtm` if the math depends on acquisition cost | CAC per channel decides whether the price works | 23 |

**Gate note:** viability needs `assumptions.md` or `audit.md`. Existing product → `product:audit lite` first; new idea → `product:discover lite` first.

---

## 12. Fast MVP

**Situation:** You want to ship something small in days or a couple of weeks — a weekend project, an indie micro-SaaS, a tool for a niche. Minimum ceremony that still passes every gate.

| Step | Run | Time | Recipes |
|---|---|---|---|
| 1 | `product:discover lite` | 10 min | 01, 02 |
| 2 | `product:critique lite` | 15 min | 20 |
| 3 | `product:experiment lite` — one test, ≤3 days (or waive with a written reason) | 5 min + run | 03b |
| 4 | `product:model lite` | 10 min | 06 |
| 5 | `product:shape lite "<mvp>"` — appetite ≤2 weeks, 3 no-gos | 5 min | 09 |
| 6 | `product:spec lite "<the one key screen>"` — or write "No new screens" in the pitch | 5 min | 10 |
| 7 | `product:build lite` → `product:plan lite` | 15 min | 14, 25 |
| 8 | Build → `product:launch lite` → ship → `product:launch record` | | 26 |
| 9 | `product:pmf lite` after 4 weeks | 10 min | 27 |

**Gate notes:** shape needs Core Objects + Lifecycle States — model lite fills exactly those. Build requires a screen spec only when the pitch names screens. Skipping `stack` is fine when you use a stack you already know; run it if you're choosing.

---

## 13. Stack decision

**Situation:** Starting a codebase and choosing a stack, services, and hosting — or suspecting you're over-engineering.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:model lite` (new) or `product:audit lite` (existing codebase) | The stack gate needs core objects to map a data model and check fit | 06 / 00 |
| 2 | `product:stack` | Use-what-you-know constraints, build-vs-buy per capability (default: managed), max 2 innovation tokens, cost at 0/100/1,000 users, not-now list | 24 |
| 3 | Next.js frontend → profile-fit check in [Stack profiles](#stack-profiles-seeding-from-arche-ui) | Seed proven architecture instead of inventing it | — |
| 4 | Continue with `product:journey` / `product:shape` | `product:build` reads `architecture.md` and flags scope that contradicts it | 07, 09 |

---

## 14. Build execution

**Situation:** You have a shaped, specced feature but execution goes badly — agent handoffs wander, tasks balloon, appetite blows up.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:build` (if the build file is missing or stale) | Self-contained execution brief; blockers resolved | 13, 14 |
| 2 | `product:plan pro` | Walking skeleton first, risk-first order, tasks ≤2 sessions with verifiable acceptance checks, per-task agent handoff blocks, coverage matrix, cuts when estimates exceed appetite | 25 |
| 3 | Hand the agent **one task's handoff block at a time**; tick the box when its acceptance check passes | Small verified steps are what keep agents on track | — |
| 4 | New ideas mid-build → the plan's parking lot, never the task list | Scope creep is the usual cause of blown appetite | — |
| 5 | `product:checkin` weekly — plan progress vs appetite burn | Catches overrun at the first milestone, not the last | 28 |

---

## 15. Public launch

**Situation:** The product works and you're about to put it in front of the public.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:gtm` (if missing) | Channels and messaging come from your beachhead, not from a generic launch list | 23 |
| 2 | `product:measure product` | Without an activation event you can't judge the launch | 16 |
| 3 | `product:launch pro "<public launch>"` | Readiness (blockers vs nice), threshold set in advance, channel sequence, T-14 → T+7 timeline, launch-day runbook | 26 |
| 4 | Fix blockers only → launch → `product:launch record <slug>` | Nice-to-haves never delay a launch | 26 |
| 5 | Put user feedback into `docs/intake/interviews/` → `product:interview synthesize` | | 21 |
| 6 | `product:pmf` after 4–8 weeks | | 27 |

**Note:** launches are plural. A private beta to your waitlist (`product:launch lite`) before the public launch is almost always worth it.

---

## 16. Nobody came

**Situation:** You launched. Few or no signups, or signups that never came back.

**First, diagnose which funnel stage failed** (from telemetry, or estimates if you have none):
- **Nobody visited** → distribution problem → steps 2–4
- **Visited, didn't sign up** → messaging/positioning problem → step 2 (messaging) + `product:critique` re-run on the positioning
- **Signed up, never activated** → onboarding/value problem → `product:journey "onboarding"` → `product:shape`
- **Activated, didn't return** → value problem → [17. Fit or quit](#17-fit-or-quit)

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:launch record <slug>` (if not done) and `product:measure product` (if no telemetry) | You can't fix the funnel stage you can't see | 16, 26 |
| 2 | `product:gtm pro` | Narrower beachhead, named watering holes, a first-10 plan done by hand | 23 |
| 3 | `product:interview prep` → talk to the people who signed up *and* those who looked and left → `product:interview synthesize` | They know why | 21 |
| 4 | `product:experiment` smoke test on one new inner-ring channel | One channel at a time, threshold set first | 03b |
| 5 | `product:checkin` weekly with at least one distribution commitment | Most "nobody came" launches are followed by more building instead of more reaching out | 28 |

---

## 17. Fit or quit

**Situation:** You have real users but can't tell whether it's working. Keep going, change direction, or stop?

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:measure product` if retention can't be seen | Fit is read from retention, not signups | 16 |
| 2 | `product:pmf` | Cohort retention, Sean Ellis survey, segment pull, vanity metrics excluded, sunk-cost question → verdict + decision + next review date | 27 |
| 3 | Follow the decision | Persevere-narrow → `product:gtm` + `product:shape` · Iterate core → `product:interview synthesize` + `product:shape` · Pivot → `product:discover` / `product:critique` · Kill → shutdown plan, then `product:triage` | — |

**Note:** under 10 active users the verdict is "Too early" by design — the job is getting users ([16](#16-nobody-came)), not building features.

---

## 18. Feedback flood

**Situation:** Users send more feature requests, tickets, and suggestions than you can handle, and you can't tell signal from noise.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | Export requests, tickets, and emails into `docs/intake/interviews/` | Synthesize reads the drop zone | — |
| 2 | `product:interview synthesize` | Restates requests as underlying jobs, clusters patterns across ≥2 sources, separates evidence from wishes | 21 |
| 3 | `product:model` (update) — opportunities from the synthesis | Decide which job matters against the product's positioning and non-goals | 04, 05 |
| 4 | `product:shape "<top job>"` — the rest become explicit no-gos | Saying no in writing is what stops the flood from steering the product | 09 |
| 5 | Ship → `product:reflect` | Did solving the job reduce the requests? | 17 |

---

## 19. Stuck

**Situation:** Momentum is gone, commitments keep slipping, you're polishing instead of shipping or building instead of selling — or a shiny new idea is pulling you away.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:checkin pro` | Commitments vs evidence, the one number, time split, energy, and pattern detection across the last 4 weeks — named bluntly | 28 |
| 2 | Follow the escalation | 3 missed weeks → `product:triage` (maybe the wrong project) or halve commitment size · tripped kill criterion → `product:pmf` or `product:triage` · energy ≤2 for 2+ weeks → cut scope or take a deliberate break · new-idea itch → write it into `docs/ideas/` and triage it next week, not today | 18, 27 |
| 3 | Next week: max 3 commitments, at least one user-facing | Small, verifiable, and aimed at users breaks the loop | 28 |

---

## 20. Client discovery

**Situation:** You're talking to a client, or to several small businesses, and you don't have an idea yet. You want to find out — from how they actually work — whether there's a problem worth a product, a service, or a paid pilot. And you want to interview properly: no pitching, no compliments counted, nothing invented.

| Step | Run | Why | Recipes |
|---|---|---|---|
| 1 | `product:field prep` (pro when you need outreach) | Founder Context (what you'll build), ≤3 objectives as problem hypotheses, change-my-mind signals, coverage map, one-page card in the interview language | 29, 30 |
| 2 | `product:field rehearse` (optional, ~15 min) | Practice against an owner who generalizes, compliments, and asks what you're building; lint report by rule ID | 29, 30 |
| 3 | The conversation — card in hand; `product:field live` alongside if it's a call | You run it. Live copilot names the signal and the next probe; `pitch` checks the permission rule before any mode switch | 29, 30 |
| 4 | Drop notes / transcript / photos into `docs/intake/interviews/<engagement>/` → `product:field debrief` — **same day** | Verbatim ledger L0–L5, PRE/POST split, workflow with citations, workarounds, cost, stakeholders, Unknowns, resume card, one directive | 29, 30 |
| 5 | Repeat 3–4 per person. After 3–5 sessions: `product:field synthesize` | Pattern matrix with earned statuses, severity, founder-fit filter, adversarial pass, one directive | 29, 30 |
| 6 | Follow the directive | `CONTINUE_INTERVIEWING` / `DECOMPOSE_OPPORTUNITY` → back to 1 · `HALT_FOR_TECHNICAL_SPIKE` → spike on their real files · `PIVOT` → new objective or `product:triage` · `TEST_ASSUMPTION` → step 7 | 30 |
| 7 | New project dir → `product:discover using docs/research/field/<engagement>/<date>-synthesis.md` → `product:experiment` (concierge or pre-sale) | Hands the validated opportunity to the main track with its evidence intact | 01, 02, 03b |

**Stop condition:** a synthesis with `TEST_ASSUMPTION` (continue into [10](#10-judge-an-idea) from step 5, or straight to the experiment), or `PIVOT` with the reason recorded.

**Notes**
- **Client scope** (one business, several people) can reach `client-validated` — enough for a paid pilot or custom work for that client, never enough to claim a market. For a product, open a **segment** engagement and find the same structure in ≥3 businesses.
- Owners rarely give 45 minutes. Plan 10–20 minute sessions; each debrief writes a resume card for the next micro-session.
- Low response to outreach is data (DOC-RULE-24): after ~20 contacts with <10% replies, change the framing or the segment before sending more.
- Already have an idea and an assumption map? Use `product:interview` instead — it tests assumptions; this finds them.

---

## Stack profiles: seeding from arche-ui

For frontend projects there is a companion repo — **arche-ui**
(`~/Documents/code/glassflow/arche-ui`) — holding canonical, production-extracted
architecture decisions for a Next.js/TypeScript/Zustand/Zod/shadcn stack: layered
request/hydration lifecycles, design tokens, CI-enforced guardrails, a deployment
recipe (k8s/Helm), a component gallery, and mechanical scaffolding skills
(`add-proxy-route`, `add-zustand-slice`, `add-zod-form`) plus a `review-changes`
drift review. It answers frontend project architecture and deployment for that stack.

**Where it slots into any playbook:** inside `product:stack`, after `product:model`
and before `product:journey` / `product:shape`. Seeding *is* the architecture
decision, and it needs core objects + IA to check fit against. `product:stack`
records the seeding decision in `docs/product/architecture.md`.

**Profile-fit check before seeding.** arche-ui docs 16–17 bake in *product*
decisions — workspace-as-tenant, roles, `/w/[workspaceId]` IA, onboarding — as
its `observability-saas` profile, enforced by a `tenant-scope` CI gate:

- **Full fit** (multi-tenant SaaS, workspace-as-tenant) → seed everything per
  the arche-ui README.
- **Different tenancy** → seed docs 00–15 only; delete doc 17 (and 16 if
  single-tenant), skip the `tenant-scope` gate; tenancy comes from *your*
  `product-model.md`.
- **Not a Next.js frontend** → arche-ui doesn't apply; `product:stack` covers the
  architecture decision on its own.

**Deployment profile** (the second axis of the same check):

| Project shape | Path |
|---|---|
| Scalable SaaS, multi-env fleet (GlassFlow lineage) | arche-ui doc 12 as-is: `k8s-helm` profile — Helm/GHCR, init-container migrations |
| Simple project, single node or managed container host | Keep arche-ui docs 01/12's *image* half (one container, `startup.sh` runtime env); borrow orchestration from the host's proven recipe — Kamal or Docker Compose on a VPS, Fly.io, Coolify, Railway. No arche-ui doc covers this yet, by design: it gets written by extraction after the first such project ships |
| Frontend-only / serverless (e.g. next-forge on Vercel) | Vercel's own recipes; arche-ui docs 01 and 12 don't apply |

**Known seam:** in an arche-ui-seeded repo, ignore the folder pattern in
`recipes/13-technical-architecture.md` — the architecture skeleton in
`product:build` must follow arche-ui docs 09/15 (`components/ui → common →
shared → modules/*`), which CI enforces there. The build skill already applies
this precedence: `architecture.md` → codebase patterns → recipe 13 example.

**Execution composition:** hand the execution agent the plan's task handoff blocks
plus the screen specs; in seeded repos it should scaffold via arche-ui's `add-*`
skills and run `review-changes` on the diff before handing back.

---

## Reference: skill → recipes, gate, artifact

| Stage | Skill | Reads recipes | Gate (summary) | Produces |
|---|---|---|---|---|
| ∞ | `product:next` | — | none (read-only) | nothing |
| ∞ | `product:checkin` | 28 | none | `docs/checkins/YYYY-MM-DD-checkin.md` |
| 0 | `product:ideate` | 19 | none (entry point) | `docs/ideas/YYYY-MM-DD-ideation.md` (in cwd) |
| 0 | `product:triage` | 18 | ≥2 projects in scan root | `docs/triage/YYYY-MM-DD-triage.md` (in cwd) |
| 1 | `product:discover` | 01, 02, 03 | none (entry point) | `product-model.md` (seed), `assumptions.md` |
| 1 | `product:audit` | 00 | none (entry point) | `docs/product/audit.md` |
| 1 | `product:interview` | 03, 21 | prep: `assumptions.md` · synthesize: ≥1 source file | `docs/research/…-interview-kit.md` / `…-synthesis.md`; Evidence in `assumptions.md` |
| 1 | `product:field` | 29, 30 | prep: none (entry point) · debrief: engagement + raw source · synthesize: ≥1 debrief | `docs/research/field/<engagement>/` — engagement, card, live logs, session debriefs, syntheses |
| 2 | `product:critique` | 20 | none (warm mode if `assumptions.md` exists) | `docs/specs/…-critique.md`; critic rows in `assumptions.md` |
| 3 | `product:viability` | 22 | `assumptions.md` or `audit.md` + Product Promise/Primary Users | `docs/product/business-model.md`; viability rows |
| 3 | `product:gtm` | 23 | Product Promise + Primary Users non-deferred | `docs/product/go-to-market.md`; distribution rows |
| 4 | `product:experiment` | 03b | ≥1 untested high-risk row (audited product with no map: seeds one) | `docs/specs/…-experiment.md`; Test/Verdict in `assumptions.md` |
| 5 | `product:model` | 04, 05, 06, 08 | `assumptions.md` or `audit.md` exists | `product-model.md`, `glossary.md`, `information-architecture.md` |
| 5 | `product:journey` | 07 | product model with core objects non-deferred | `docs/product/journeys/<name>.md` |
| 6 | `product:stack` | 24 | Core Objects non-deferred, or `audit.md` | `docs/product/architecture.md` |
| 7 | `product:shape` | 09 | model complete + every high-risk row has a verdict or waiver; warns without business model / go-to-market | `docs/specs/…-pitch.md` |
| 7 | `product:spec` | 10, 11 | ≥1 pitch exists + glossary exists | `docs/screens/<name>.md` |
| 8 | `product:build` | 13, 14 | complete pitch + screen specs (+ product model for pro) | `docs/specs/…-build.md` (incl. self-contained execution brief) |
| 8 | `product:plan` | 25 | build file with no unresolved blockers | `docs/specs/…-plan.md` |
| 9 | `product:launch` | 26 | something built (build file, or `audit.md` for an existing product) | `docs/specs/…-launch.md` |
| 9 | `product:measure` | 16 | feature: pitch with done criteria · `product` mode: Product Promise | `docs/product/journeys/<slug>-telemetry.md` · `product-telemetry.md` |
| 10 | `product:reflect` | 16, 17 | pitch exists + feature actually shipped | `docs/specs/…-retro.md` |
| 10 | `product:pmf` | 27 | live with real users (launch results or confirmation) | `docs/specs/…-pmf.md` |

**Manual recipes (no skill runs them — consult directly):**
- `recipes/12-ui-system.md` — during design-system work; project-specific design skills own this.
- `recipes/15-usability-testing.md` — before launch, when a real user is available (see playbook 1).
