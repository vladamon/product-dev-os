# Design — Product OS as a solo-founder companion

**Date:** 2026-09-14
**Status:** approved (explicit instruction; see `docs/notes/2026-09-14-findings-and-companion-expansion.md`)
**Supersedes nothing** — extends `2026-05-09-product-os-design.md`.

---

## Problem

The 12-skill OS answers "how do I build a coherent product?" well and "should this exist, can it pay, and will anyone hear about it?" barely at all. A friend's idea exposed it: the only validation tooling was `discover` + `experiment`, discovery defaulted to a tier that skips customer evidence, nothing researched competitors, nothing did the money math, and nothing covered launch, distribution, product-market fit, or the founder's own weekly accountability. For a solo builder, indie hacker, or aspiring founder, those are the failure modes that actually kill products.

## Principles for the expansion

1. **Spine, not catalog.** Every new skill sits on a stage of the companion map (`docs/conventions.md` §1), is gated where a dependency is real, and is routed to by `product:next` and `docs/playbooks.md`. The user never has to browse a list.
2. **Founder-centered, not PM-centered.** Questions are about one person with limited hours and money, not a product org.
3. **Evidence over opinion.** Outward-looking skills follow the research protocol (§7); judging skills follow the honesty protocol (§8).
4. **Same machinery.** Same artifact conventions, tiers, gates, context intake, pivot interrupts. The assumption map is the shared spine across validation skills.
5. **Short artifacts.** Every artifact must be usable in a later session in under two minutes of reading.

## Non-goals

- No fundraising deck / investor CRM skill. Funding path is a section of `viability`.
- No legal, tax, or incorporation advice — checklists only (§9).
- No hiring / co-founder matching skill.
- No code-execution skill — execution stays with Claude Code native tooling; `plan` produces the handoff.
- No design-system skill — project design skills own that (`recipes/12-ui-system.md` stays manual).

---

## New skills

Recipe numbers continue from 18; `phase` frontmatter carries the stage.

### `product:ideate` — Idea Sourcing · recipe `19-idea-sourcing.md` · stage 0

**For:** aspiring founders with no idea, or a pile of vague ones and no project yet.
**Contract:** Requires nothing (entry point; runs in cwd like triage). Produces `docs/ideas/YYYY-MM-DD-ideation.md` in cwd.
**Tier:** lite = founder constraints (3 q) + score ideas the founder already has; pro = full founder inventory + idea generation + scoring. Default: founder lists ≥3 ideas → lite; otherwise pro.
**Process:**
1. Founder inventory — skills you can sell, domains you have insider access to, communities you belong to, problems you've personally paid to solve, unfair advantages (audience, network, data, distribution), constraints (hours/week, runway months, income target, things you refuse to do: e.g. B2C, sales calls, hardware).
2. Sourcing lenses (pro) — own recurring pain; pain at your job/clients; repeated complaints in communities you're in; "boring" businesses with spreadsheet workflows; unbundling one feature of a bloated tool; services you could productize; tools people already pay for but hate.
3. Candidates — founder ideas + AI-proposed ideas, the latter labeled `[AI-proposed]` and anchored in the founder inventory, never generic.
4. Kill filters (any fail → out): can name 20 specific reachable target users without ads; problem already costs them time or money; a first version fits in ≤6 weeks of the founder's real hours; founder would still work on it after 12 months of slow growth.
5. Score survivors 1–5: pain intensity × frequency, evidence of spend, reachability, founder fit, build scope (inverted), market signals (research protocol).
6. Pick exactly one + a runner-up; name the first 5 people to talk to.
**Artifact sections:** Founder profile & constraints · Candidates table (source, filters passed/failed) · Scores · Pick + why · Runner-up · First 5 conversations · Next step.
**Next:** create/open a project dir → `product:discover using <ideation file>` (discover then `product:critique`).
**Rules:** exactly one pick; AI ideas labeled; ideas the founder cannot reach users for are cut regardless of score; "AI wrapper for X" requires a distribution answer to pass filters.

### `product:critique` — Idea Red Team · recipe `20-idea-critique.md` · stage 2

**For:** "Is this idea any good?" — for your own idea or one someone handed you. The adversarial co-founder.
**Contract:** Requires nothing hard. **Warm mode** when `docs/product/assumptions.md` exists (reads it + seed product-model); **cold mode** when invoked with idea text and no artifacts. Produces `docs/specs/YYYY-MM-DD-<idea-slug>-critique.md`. Updates (warm only) `docs/product/assumptions.md` — adds critic-surfaced rows with `Source: critique`; risk changes to existing rows only after founder confirms.
**Tier:** lite = restatement + 6 core lenses + pre-mortem + verdict, light research (~15 min); pro = full research + all lenses + steelman + risk re-rating (~30–40 min). Default: warm → pro; cold → lite.
**Process:**
1. Restate the idea as one falsifiable sentence: `<specific user> in <situation> struggles with <problem>, today uses <workaround>; <product> does <core thing>.` Confirm before attacking.
2. Desk research (§7): direct competitors, indirect/substitutes (incl. spreadsheets, agencies, doing nothing), prior failed attempts and their post-mortems, pricing of alternatives, where the target users talk about the problem, search/community demand signals.
3. Attack lenses — each scored `fatal` / `serious` / `fixable` / `fine` with one-line reasoning:
   - Problem reality (hair-on-fire vs nice-to-have; frequency; evidence of spend)
   - User specificity (can you name 10 of them?)
   - Why now (what changed that makes this possible/necessary)
   - Why you (founder-market fit, access, unfair advantage)
   - Alternatives & switching cost
   - Willingness to pay (who pays, how much, from which budget)
   - Distribution (how the first 100 users hear about it, concretely)
   - Build scope vs founder capacity
   - Platform/commoditization risk (will an incumbent or a model provider ship this as a feature?)
   - Trust, legal, data sensitivity
   - Unit economics sanity (esp. per-user AI/infra cost vs plausible price)
   Lite uses the first six plus Distribution.
4. Pre-mortem: "It's 12 months later and this failed. The three most likely reasons."
5. Steelman (pro): the strongest honest case for pursuing it.
6. Risk re-rating (warm, pro): table of assumptions where the critic's rating differs from the founder's, with reasons; founder confirms per row.
7. Verdict — exactly one: **Pursue** (worth testing; name the test) · **Sharpen** (promising only with a reframe; state it) · **Park** (not now; state what would change that) · **Kill** (fatal flaw; state it). Plus: the single riskiest assumption, the cheapest test for it, and a kill criterion with a date.
**Artifact sections:** Idea (restated) · Research findings (labeled) · Competitive landscape table · Lens scorecard · Pre-mortem · Steelman · Risk re-rating · Verdict · Riskiest assumption + cheapest test + kill criterion · Sources.
**Next:** Pursue → `product:interview prep` (if no evidence yet) or `product:experiment`; Sharpen → `product:discover` with the reframe; Park/Kill → `product:triage` / `product:ideate`. Cold mode additionally → `product:discover using <critique file>`.
**Rules:** minimum 3 weaknesses rated serious or fatal *or* an explicit statement that fewer exist with reasons; never open with praise; every factual claim labeled; verdict mandatory; "no competitors" must be explained, not celebrated; the critic does not edit founder risk ratings without confirmation.

### `product:interview` — Customer Evidence · recipe `21-customer-interviews.md` (+ reads `03-discovery.md`) · stage 1

**For:** actually doing the customer conversations the rest of the OS assumes happened — and making sense of them, plus any other qualitative input (support tickets, feature requests, reviews, churn emails).
**Modes:**
- `product:interview prep [assumption IDs]` — **Requires** `docs/product/assumptions.md`. **Produces** `docs/research/YYYY-MM-DD-<slug>-interview-kit.md`. Contents: learning goals mapped to assumption IDs; who qualifies (screening criteria) and who doesn't; where to find them (named channels) + outreach message that asks for advice, never pitches; Mom Test script (situation → consequence → priority → workaround/spend → commitment ask) with each question tagged to an assumption; "what would change my mind" signals per assumption, decided up front; commitment ladder (time → reputation → money); note-taking template per conversation; target count (5 per segment) and a date.
- `product:interview synthesize` — **Requires** ≥1 notes/transcript file in `docs/intake/interviews/` or passed via `using` (warn below 3). **Produces** `docs/research/YYYY-MM-DD-<slug>-synthesis.md`. **Updates** `assumptions.md` Evidence column + Discovery Evidence section; proposes (never silently applies) risk changes; appends newly surfaced assumptions with `Source: interview`.
  Process: per source extract past behaviors, pains (with frequency/cost), workarounds, money spent, triggers, commitments given; flag compliments, hypotheticals, and feature requests as non-evidence; cluster patterns that appear in ≥2 sources; map each pattern to assumption IDs as supports/contradicts; for feature requests, restate each as the underlying job ("requests are not requirements"); recruiting-bias check (friends, same company, self-selected fans).
**Tier:** lite = prep script only / synthesis patterns + assumption mapping; pro = adds screening, recruiting plan, bias check, per-conversation table. Default: prep → lite; synthesize with ≥5 sources → pro.
**Next:** prep → go run the conversations, then `product:interview synthesize`; synthesize → `product:experiment` for remaining high-risk rows, or `product:critique` re-run if a core assumption was contradicted.
**Rules:** never ask "would you use/pay for this"; a conversation with only opinions counts as zero evidence; ≥2 sources before calling something a pattern; evidence cites the source file; interviews never set verdicts.

### `product:viability` — Business Model & Money Math · recipe `22-business-model.md` · stage 3

**For:** "Can this make money? How should I price it? Can it replace my salary? Should I raise?"
**Contract:** Requires `docs/product/assumptions.md` OR `docs/product/audit.md`, and a product model with Product Promise + Primary Users (discover seed suffices). Produces/updates `docs/product/business-model.md` (living). Updates `assumptions.md` with viability rows (price point, willingness to pay, churn, CAC) `Source: viability`.
**Tier:** lite = goal + revenue model + price hypothesis + ramen math + verdict (~10 min); pro = adds bottom-up market size, unit economics, cost structure, channel CAC, funding path (~30 min). Default: existing product (audit) → pro; otherwise lite.
**Process:**
1. Founder goal — side income / ramen-profitable / replace salary / venture-scale; monthly income target and by when; hours/week available.
2. Revenue model — subscription, usage-based, one-time/lifetime, marketplace take rate, services-first then productize; who pays vs who uses; which budget it comes from.
3. Price hypothesis — anchored to value created and to alternatives' prices (research §7), not to cost; tiers if any.
4. Ramen math — target MRR ÷ ARPU = paying customers needed; with assumed monthly churn → new customers needed per month to hold; ÷ plausible conversion → leads/trials needed per month. Show formulas.
5. Bottom-up market (pro) — count of reachable target customers with sources; realistic capture → revenue ceiling. Top-down TAM numbers are ignored.
6. Unit economics (pro) — ARPU, gross margin after infra/AI/API/payment fees (per-user AI cost explicit for AI products), LTV = ARPU × margin ÷ churn, CAC per candidate channel, LTV:CAC, payback months.
7. Cost structure & runway (pro) — monthly fixed costs at 0 / 100 / 1,000 customers; break-even customers; months to target at plausible growth vs founder runway.
8. Funding path (pro) — bootstrap / pre-sales / services revenue / grants / angels / VC; when each fits; VC only if market ceiling and growth ambition match. §9 boundary.
9. Red flags check — e.g. low-price B2C relying on paid ads; market ceiling below the income target; AI cost per user near price; needs >10% conversion to work.
10. **Verdict** — exactly one: **Math works** · **Math works only if <named assumption>** · **Math doesn't work** (+ the lever that would change it: price, segment, model).
**Artifact sections:** Goal & constraints · Revenue model · Pricing hypothesis · Ramen math · Market (bottom-up) · Unit economics · Cost & runway · Funding path · Red flags · Verdict · Viability assumptions added.
**Next:** "only if" / doesn't work → `product:experiment` with a pre-sale test, or re-run with a different segment; works → `product:gtm` if missing, else `product:model`.
**Rules:** every number labeled (§7); formulas shown; no top-down TAM as justification; price is set from value and alternatives; verdict mandatory; not financial advice.

### `product:gtm` — Go-to-Market & First Customers · recipe `23-go-to-market.md` · stage 3

**For:** "How will anyone find this?" — before building, and again after a launch nobody noticed.
**Contract:** Requires product model with Product Promise + Primary Users non-deferred. Produces/updates `docs/product/go-to-market.md` (living). Updates `assumptions.md` with distribution rows `Source: gtm`. Reads `business-model.md` (CAC ceiling) and critique/synthesis files if present.
**Tier:** lite = beachhead ICP + where they gather + one channel + first-10 plan + one-liner (~10 min); pro = full channel bullseye, messaging, content/audience plan, channel experiments (~30 min). Default: post-launch (launch file exists) → pro; else lite.
**Process:**
1. Beachhead ICP — the narrowest segment that has the problem worst and is reachable: role, context, trigger event, where the budget is. Exclusions listed.
2. Watering holes — named communities, subreddits, Slack/Discord groups, newsletters, podcasts, events, marketplaces/app stores, search queries they type (research §7).
3. Channel bullseye (pro) — brainstorm across traction channels (communities, content/SEO, cold outreach, partnerships/integrations, marketplaces/app stores, product-led/viral loops, paid, audience/build-in-public, directories/launch sites, sales) → middle ring of 3–5 plausible → inner ring of 1–2 to test now, each with cost, time, and CAC fit vs `business-model.md`.
4. First 10 customers plan — unscalable, founder-led: a named list or exact source of the first 30 prospects, the outreach script, the offer (e.g. concierge onboarding, founding-member price), weekly outreach quota.
5. Messaging — one-liner in the user's words; pain-led headline; 3 proof points; top 3 objections + answers; the "instead of <alternative>" line.
6. Distribution time budget — hours/week; rule of thumb surfaced: once an MVP exists, at least half of founder hours go to distribution.
7. Channel experiments — per inner-ring channel: success threshold + time box → hand to `product:experiment` (smoke test).
**Artifact sections:** Beachhead ICP · Watering holes (labeled) · Channel bullseye · Inner-ring channels · First-10 plan · Messaging · Time budget · Channel experiments · Distribution assumptions added.
**Next:** `product:experiment` on the riskiest distribution row; pre-launch → `product:launch` later reads this file.
**Rules:** "social media", "SEO", "word of mouth" are not channels until named concretely; "build it and they will come" is rejected; the first-10 plan names people or exact places; channel choice must fit the CAC ceiling when a business model exists.

### `product:stack` — Project Architecture & Build-vs-Buy · recipe `24-stack-decision.md` · stage 6

**For:** starting a codebase — choosing stack, managed services, hosting, and what *not* to build. Covers the project-level architecture gap (recipe 13 is feature-level frontend only).
**Contract:** Requires `docs/product/product-model.md` with Core Objects non-deferred, OR `docs/product/audit.md` (existing codebase). Produces/updates `docs/product/architecture.md` (living). Read by `build` (skeleton) and `plan`.
**Tier:** lite = constraints + capability build-vs-buy table + hosting + not-now list (~10 min); pro = adds data model sketch, cost table, security/privacy baseline, innovation-token ledger, arche-ui profile-fit (~25 min). Default: product model complete → pro; else lite.
**Process:**
1. Constraints — languages/frameworks the founder already ships fast in ("use what you know"); monthly budget ceiling; realistic scale in 12 months; platform needs (web, mobile, desktop, offline); compliance/data residency; AI/LLM needs; existing codebase (audit).
2. Capability build-vs-buy — auth, billing/subscriptions, tax (merchant of record vs self), email (transactional/marketing), file storage, background jobs/queues, search, analytics, error monitoring, logs, admin/back-office, feature flags, AI provider/model. Default is **buy/managed**; "build" requires a product reason.
3. Architecture shape — monolith by default; one database; starter kit if one fits; justify anything else.
4. Innovation tokens (pro) — max 2 novel technologies; each named with the product requirement that justifies it.
5. Data model sketch (pro) — core objects from the product model → tables/collections, relationships, lifecycle states as columns/enums.
6. Hosting & deploy profile — per `docs/playbooks.md` deployment rubric; arche-ui profile-fit check for Next.js frontends.
7. Cost table (pro) — monthly cost at 0 / 100 / 1,000 active users, per vendor, with pricing sources (§7).
8. Security & privacy baseline (pro) — secrets management, auth hardening, backups with a tested restore, least-privilege keys, PII inventory, deletion path. §9 boundary for compliance.
9. Not-now list — explicit things deliberately postponed (e.g. microservices, k8s, multi-region, custom auth, mobile app).
**Artifact sections:** Constraints · Capabilities (build/buy + vendor + why) · Architecture shape · Innovation tokens · Data model sketch · Hosting & deploy · Cost at scale · Security & privacy baseline · Not now · Decisions log (dated changes).
**Next:** `product:journey` / `product:shape`; existing product revamp → `product:shape "<migration slice>"`.
**Rules:** every "build" and every novel tech names its product reason; default managed; the not-now list is mandatory; costs sourced or labeled estimates; never recommend a stack the founder doesn't know unless a hard requirement forces it, and then say so.

### `product:plan` — Build Plan & Agent Handoff · recipe `25-build-plan.md` · stage 8

**For:** turning a ready build file into an ordered sequence of small, verifiable tasks an execution agent (or the founder) can run one at a time — the execution bridge earmarked as option B in the 2026-08-29 addendum.
**Contract:** Requires `docs/specs/*-<slug>-build.md` with no unresolved blockers; screen specs referenced by it. Recommended: `docs/product/architecture.md`. Produces `docs/specs/YYYY-MM-DD-<slug>-plan.md` (point-in-time; task checkboxes may be ticked as work progresses).
**Tier:** lite = ordered task list with acceptance checks (~5–10 min); pro = adds milestones, per-task agent handoff blocks, appetite burn check, risk-first ordering rationale (~20 min). Default: pro when architecture.md exists; else lite.
**Process:**
1. Walking skeleton first — task 1 produces something runnable end-to-end (thin vertical slice through UI → logic → data) even if ugly.
2. Risk-first ordering — the riskiest integration or unknown is tackled within the first third of the plan.
3. Decompose into vertical tasks, each ≤ 1–2 focused sessions (~2–4 h). Each task: goal; likely files/areas; acceptance check that is verifiable (a command, a test, an observable behavior); done criteria it advances (from the build file); depends-on.
4. Coverage check — every done criterion and every screen state from the build file maps to ≥1 task; list any uncovered.
5. Appetite check — sum of session estimates vs pitch appetite. Over → propose cuts (move to no-gos); appetite is fixed, scope flexes.
6. Milestones (pro) — demoable checkpoints; at each, stop and compare appetite burn.
7. Agent handoff blocks (pro) — per task, a self-contained prompt: context, goal, constraints, files, acceptance check, non-goals, test plan. Nothing requires opening other docs except the named screen spec.
8. Parking lot — ideas that arise during the build go here, not into tasks.
**Artifact sections:** Source (build/pitch links) · Appetite & estimate · Milestones · Tasks (checkbox list, each with the fields above) · Coverage matrix · Cuts proposed · Parking lot · Handoff blocks.
**Next:** execute task 1; after the last milestone → `product:measure` (if missing) → `product:launch`.
**Rules:** no task over 2 sessions; task 1 is a walking skeleton; every done criterion covered; estimates never extend appetite; parking lot items never silently enter the plan.

### `product:launch` — Launch Readiness & Launch Plan · recipe `26-launch.md` · stage 9

**For:** "Is it safe to put this in front of real users, and how do people find out?"
**Contract:** Requires ≥1 `docs/specs/*-build.md` (something was built). Warnings if no `go-to-market.md` (channels will be generic) or no telemetry file (launch can't be judged). Produces `docs/specs/YYYY-MM-DD-<launch-slug>-launch.md`. Mode `product:launch record <slug>` fills Results.
**Tier:** lite = blockers-only readiness + one-channel launch plan + threshold (~10 min); pro = full readiness + multi-channel sequence + timeline + runbook (~30 min). Default: public launch → pro; private beta → lite.
**Process:**
1. Launch type — private beta (waitlist/invite) → public beta → public launch. Launches are plural; this file is one of them.
2. Readiness checklist, each item marked **blocker** (loses users' data, money, or trust) or **nice**:
   - Product: core journey works end-to-end in production; first-run/onboarding; empty/error states; signup→activation path under N minutes.
   - Payments: live mode tested with a real card; refunds; receipts/invoices; sales tax/VAT approach (merchant of record vs self-managed) — §9.
   - Trust & legal: privacy policy, terms, cookie consent where required, data deletion path, company/invoicing basics — §9.
   - Ops: error monitoring, uptime check, backups with a tested restore, logs, support channel + response expectation.
   - Measurement: activation event defined and verified firing (`product:measure`).
   - Security basics: secrets out of the repo, rate limiting on auth/forms, admin protected.
   - Marketing surface: landing page with the gtm one-liner, pricing page, social preview images, a short demo (video/GIF/screens).
3. Launch threshold — set before launch: e.g. N signups, N activated, N paying within 14 days.
4. Channel sequence — from `go-to-market.md` watering holes: communities, Show HN, Product Hunt, Reddit, Indie Hackers, X/LinkedIn/Bluesky, newsletters, directories, personal network, waitlist email — each with the asset needed and platform rules respected (no spam, self-promo rules).
5. Timeline — T-14 → T-1 prep, launch day, T+1 → T+7 follow-up.
6. Launch-day runbook — monitoring, who answers comments, how bugs are triaged same-day, what gets postponed.
7. Follow-up loop — reply to everyone; offer onboarding calls to first users; collect feedback into `docs/intake/interviews/` for `product:interview synthesize`.
**Mode `record`:** raw numbers vs threshold, what channel worked, surprises, verdict (hit / partial / miss) and what it changes.
**Artifact sections:** Launch type · Readiness (blockers / nice) · Threshold · Channels & assets · Timeline · Runbook · Follow-up · Results (record) · Verdict (record).
**Next:** before launch → fix blockers; after `record` → `product:measure` if missing, then `product:pmf` after 4–8 weeks of usage; miss → `product:gtm pro`.
**Rules:** only blockers block; the threshold is set before launch; no launch without a way to observe activation; platform self-promotion rules are respected; not legal/tax advice.

### `product:pmf` — Product-Market Fit Review · recipe `27-product-market-fit.md` · stage 10

**For:** "I have users — is this working? Double down, pivot, or quit?" The product-level counterpart to feature-level `reflect`.
**Contract:** Requires the product to be live with real users: a `*-launch.md` with Results, OR founder confirmation. Warning under 10 active users — verdict capped at **Too early**. Produces `docs/specs/YYYY-MM-DD-pmf.md`. Reads telemetry files, business-model.md, go-to-market.md, retros, synthesis files.
**Tier:** lite = retention + pull signals + decision (~10 min); pro = adds segment analysis, Sean Ellis survey design/interpretation, revenue quality, pivot-type analysis (~30 min). Default: ≥30 active users or paying customers → pro; else lite.
**Process:**
1. Evidence inventory — active users, cohort retention at week 1/4/8 (does the curve flatten?), usage frequency vs the problem's natural frequency, paying conversion, revenue churn, organic/referral share of signups, qualitative pull (users complain when it breaks, ask for more, pay without negotiation).
2. Sean Ellis test (pro) — generate the survey ("How would you feel if you could no longer use <product>?") for users active in the last 2 weeks; interpret: ≥40% "very disappointed" is the benchmark; below 40% find which segment is closest.
3. Segment analysis (pro) — which user segment shows the strongest retention/pull; is it the ICP in `go-to-market.md`?
4. Vanity check — reject signups, pageviews, followers, and praise as fit evidence.
5. Sunk-cost question — "If you were starting today knowing what you know, would you start this?"
6. Fit verdict — **Too early** · **No fit** · **Signal in <segment>** · **Approaching** · **Strong**.
7. Decision — **Persevere-narrow** (double down on the segment with pull) · **Iterate core** (value proposition not landing; name what to change) · **Pivot** (type: customer segment, problem, solution, channel, revenue model, platform) · **Kill** (with a shutdown plan: notify users, data export, refunds, sunset date).
8. Next review — date and the metric thresholds that would flip the decision.
**Artifact sections:** Evidence inventory · Retention · Survey (pro) · Segments (pro) · Vanity metrics excluded · Sunk-cost answer · Verdict · Decision · Shutdown plan (if kill) · Next review & thresholds.
**Next:** persevere → `product:gtm` (narrow ICP) + `product:shape`; iterate → `product:interview synthesize` then `product:shape`; pivot → `product:discover` (new framing) or `product:critique`; kill → `product:triage`.
**Rules:** decision mandatory; every claim tied to a number or a quote with source; vanity metrics excluded; under 10 users the verdict is Too early and the next step is getting users, not building features; next review date mandatory.

### `product:checkin` — Weekly Founder Check-in · recipe `28-weekly-checkin.md` · stage ∞

**For:** the accountability partner a solo founder doesn't have. Weekly, 10 minutes. Catches drift, avoidance, burnout, and shiny-object switching early.
**Contract:** Requires nothing. Reads the previous `docs/checkins/*-checkin.md`, latest triage (cwd or parent `docs/triage/`), active plan progress, telemetry/business-model "one number", and `git log --since='7 days ago'`. Produces `docs/checkins/YYYY-MM-DD-checkin.md`.
**Tier:** lite = commitments review + one number + next commitments (~5 min); pro = adds time split, pattern detection over the last 4 check-ins, kill-criteria check, energy trend (~15 min). Default: ≥3 previous check-ins → pro; else lite.
**Process:**
1. Last week's commitments — each: done / partial / not done, with evidence (commit, deploy, message sent, call held).
2. What actually moved — shipped, users talked to, revenue/signups.
3. The one number — from telemetry or business-model (MRR, activated users, interviews completed pre-launch); trend vs last check-in.
4. Time split (pro) — hours on building vs distribution/sales vs admin/learning.
5. Energy 1–5 and one line on motivation.
6. Pattern detection (pro, across last 4 check-ins) — building instead of selling (0 user contact ≥3 weeks after MVP), polishing without users, new-idea itch (a new project appeared), plan tasks overrunning appetite, same commitment missed repeatedly, energy ≤2 for 2+ weeks. Named bluntly per §8.
7. Kill-criteria check — any kill criterion from critique/experiment/pmf whose date has passed or threshold tripped.
8. Next week — max 3 commitments, each specific and verifiable; once an MVP exists at least one must touch users or distribution.
**Artifact sections:** Last commitments review · What moved · One number · Time split · Energy · Patterns · Kill criteria · Next commitments · Escalation (if any).
**Escalations:** 3 consecutive weeks of missed commitments → `product:triage` (maybe the wrong project) or halve commitment size; energy ≤2 for 2+ weeks → recommend reducing scope or a deliberate break, never "push harder"; tripped kill criterion → `product:pmf` or `product:triage`.
**Rules:** commitments are verifiable; no shaming, but missed items are recorded honestly with a count; max 3 commitments; ≥1 user-facing commitment post-MVP; escalation is stated, not suggested softly.

---

## Changes to existing skills

| Skill / recipe | Change | Finding |
|---|---|---|
| all SKILL.md | `name:` short form (plugin loading); gate override logging per conventions §3 | F8, F13 |
| `discover` + recipes 01–03 | canonical assumptions table; lite gets a 2-question evidence check; AI rates risk independently and shows disagreements; remove false "competitive analysis" promise; route to critique / interview / viability / gtm | F1–F6, F11 |
| `experiment` + 03b | sixth method: **pre-sale / letter of intent** (tests willingness to pay); canonical table; `record` writes Verdict column | F4, F11 |
| `shape` | gate reads canonical table; warnings when business-model / go-to-market missing on a new-product track | F11, F16 |
| `next` | new stages and artifacts; situation mode (free-text → playbook); check-in staleness; gate-override report | F16 |
| `triage` | scan root = cwd subdirectories (bug); money score reads business-model.md when present | F12 |
| `build` + 13 | handoff → `product:plan`; skeleton reads architecture.md; recipe 13 labeled feature-level | F15 |
| `model` | positioning reads critique landscape + go-to-market | F6 |
| `reflect` | routes product-level questions to `pmf` | F16 |
| recipe 16 | GlassFlow pipeline events generalized | F14 |
| `measure` | product mode `product:measure product` → `product-telemetry.md` (activation, active-user definition, retention cohorts); no pitch needed | F17 |
| `build` + template | frontmatter `readiness: ready\|blocked` + Readiness → Blockers section; `plan` gates on it | F18 |
| all recipes | `phase:` normalized to companion-map slugs | F19 |
| critique, experiment | parseable `kill_criterion`/`kill_date`, `conclude_by` read by `next` and `checkin` | F20 |
| interview | `source_phase` keeps pre- and post-launch evidence apart | F21 |
| plugin | `.claude-plugin/{plugin,marketplace}.json`, `hooks/hooks.json`; usage-log path via `PRODUCT_OS_USAGE_LOG` | F7, F9, F10 |

## Tracks after the expansion

**Validate an idea (yours or a friend's) — stop before building:**
`discover lite → critique → interview prep → [talk to 5 people] → interview synthesize → experiment`

**New product, full:**
`(ideate) → discover → critique → interview → viability → gtm → experiment → model → stack → journey → shape → spec → build → plan → [build] → launch → measure → reflect → pmf`

**Fast track (weekend/indie MVP):**
`discover lite → critique lite → experiment → model lite → shape lite → build lite → plan lite → launch lite → pmf`

**Existing product / revamp:**
`audit → model → (stack) → (experiment) → shape → spec → build → plan → launch → measure → reflect → pmf`

**Always:** `next` (where am I) · `checkin` (weekly) · `triage` (portfolio)
