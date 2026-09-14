# Product OS

A companion for solo builders, indie hackers, and aspiring founders — from "I don't know what to build" to "is this idea any good" to "it's launched, should I keep going?" Installed once as a Claude Code plugin, available in every repo.

It interviews you, researches the market, reads your codebase, and writes short artifacts into your project's `docs/`. It tells you what to do next — and, when the evidence says so, that you should stop.

## Quick Start

**Tell it your situation:**

```
product:next "my friend has an idea and wants to know if it's worth pursuing"
product:next "launched two weeks ago, 3 signups"
product:next "I keep building and can't decide what the product is"
```

It matches your words to one of 19 [playbooks](docs/playbooks.md) and gives you the exact sequence, adjusted for what already exists in the project.

**Or start directly:**

| You are… | Run |
|---|---|
| Judging an idea (yours or someone's) in 15 minutes | `product:critique "the idea in a paragraph"` |
| Judging an idea properly | `product:discover lite` → `product:critique` → [playbook 10](docs/playbooks.md#10-judge-an-idea) |
| Without an idea | `product:ideate` |
| Juggling several projects | `product:triage` (from the folder that holds them) |
| Improving a product that exists | `product:audit` |
| Returning after a break | `product:next` |
| Stuck or drifting | `product:checkin` |

---

## What this is

Five layers:

- **Skills** (22) — runners that interview you, read context, and write artifacts. Each gated skill refuses to run when upstream work is missing, so the sequence is enforced by structure, not willpower.
- **Recipes** (30) — the authoritative process: what to ask, what good output looks like, what "done" means. Improving a recipe improves its skill.
- **Templates** (9) — the shape of living documents.
- **Conventions** — [`docs/conventions.md`](docs/conventions.md): the companion map, the canonical assumption map, the artifact map, gates, and the research and honesty protocols every skill follows.
- **Playbooks** — [`docs/playbooks.md`](docs/playbooks.md): situation → skill sequence.

## The companion map

| # | Stage | Question | Skills |
|---|---|---|---|
| 0 | Choose | What should I work on at all? | `ideate` · `triage` |
| 1 | Understand | Who has what problem, really? | `discover` · `audit` · `interview` |
| 2 | Challenge | Is this idea any good? What kills it? | `critique` |
| 3 | Money & reach | Can it pay? Can I reach buyers? | `viability` · `gtm` |
| 4 | Test | Is the riskiest assumption true? | `experiment` |
| 5 | Define | What is the product's world? | `model` · `journey` |
| 6 | Architect | What do I build it with? | `stack` |
| 7 | Scope | What exactly do I build next? | `shape` · `spec` |
| 8 | Build | Ready? In what order? | `build` · `plan` |
| 9 | Launch | Safe to ship? Who hears about it? | `launch` · `measure` |
| 10 | Learn | Did it work? Keep going? | `reflect` · `pmf` |
| ∞ | Always | Where am I? Am I on track? | `next` · `checkin` |

Stages order concerns; they are not a mandatory pipeline. Enter wherever you are.

---

## Why this exists

Building alone means you are also the researcher, the PM, the designer, the salesperson, and the co-founder who says "this isn't working." The structure those roles provide is what's missing — not ability.

Solo products rarely die from bad code. They die because:

- **Nobody had the problem badly enough.** The founder asked friends, who were polite.
- **Nobody would pay.** The price was never tested; the math never worked.
- **Nobody heard about it.** Distribution was "later."
- **It never converged.** No positioning, no non-goals, features accumulated.
- **It never shipped.** Scope grew past any appetite; agent handoffs wandered.
- **Nobody decided.** It limped on for a year because no one set a kill criterion.

And there's the opposite failure: a planning system that becomes the product. Long PRDs nobody reads.

This OS attacks both: every stage has a skill that forces the decision it's responsible for, and every artifact is short enough to re-read in two minutes.

### Why an adversary, not just structure

Structuring your beliefs is not the same as testing them. A skill that helps you fill in an assumption map will happily record "people will pay $30/month" as low risk. So the OS includes skills whose job is to disagree: `critique` researches the landscape and attacks the idea through fixed lenses, `discover` rates risk independently and shows where it disagrees, `viability` does the arithmetic, `pmf` excludes vanity metrics, `checkin` names avoidance. Their verdicts come from fixed sets — "it depends" isn't one.

### Why evidence labels

An AI that invents a competitor or a market size is worse than no research. Outward-looking skills label every claim `[sourced: url]`, `[estimate: method]`, or `[founder-stated]`, and produce a research checklist instead of fiction when web search isn't available.

### Why a spine, not a catalog

Big skill catalogs reintroduce the friction a scattered founder is trying to escape: choice. Here, every skill belongs to a stage, gates enforce the dependencies that matter, and `product:next` plus the playbooks do the choosing. You never browse a list.

---

## Design decisions

### One system, two depth tiers

`lite` (3–5 questions, essential sections, rest `[deferred]`) and `pro` (everything). Same skill, same file. Start lite; a pro run later fills the gaps without starting over.

### Interview-first, context-aware

Skills read your repo, `docs/intake/`, and upstream artifacts first, show what they found, and ask only about what's missing. Draft-first anchors you to the AI's guess; interview-first doesn't.

### Recipes are the authority

Process lives in `recipes/`, not in skill files. Refine the recipe; the skill improves.

### One assumption map, shared

`docs/product/assumptions.md` has one canonical table (ID, type, risk, source, evidence, test, verdict). Discover creates it (or experiment, for an audited product that has none); critique, interview, viability, gtm, stack, and experiment write to it; `shape` refuses to run while high-risk rows are untested or unwaived. Interviews add evidence; only experiments (or an explicit written waiver) set verdicts.

### Gates that refuse — and log when overridden

A gated skill that lacks its inputs stops and names the command that fixes it. `--skip-gate` works, but the artifact records `gate_override: true` and `product:next` reports it. Routine overrides are a signal the OS isn't fitting.

### Point-in-time decisions, living definitions

Critiques, experiments, pitches, build files, plans, launches, retros, PMF reviews, check-ins: date-prefixed, never rewritten (only their result fields get filled). Product model, assumptions, business model, go-to-market, architecture, journeys, screens: living, updated in place with change notes.

### Conflicts are flagged, never silently resolved

Code that contradicts the model, a positioning that contradicts the critique, scope that contradicts the architecture — the skill shows the conflict and you decide.

### A navigator, not an orchestrator

`product:next` reads, reports, and recommends. You invoke. Skills stay independent; you can enter at any stage.

### `docs/intake/` is yours

Drop briefs, notes, transcripts, tickets, exports there (interview material in `docs/intake/interviews/`). Skills read it; nothing writes to it.

---

## The 22 skills

Where a skill has more than one mode, every mode is shown. "Pro adds" marks what a `lite` run leaves `[deferred]`.

### Always

**`product:next`** — Status: stage, gaps behind it, overdue decisions (kill dates, overrun experiments, unrecorded launches, due PMF reviews), and the next command. Situation mode: `product:next "<situation>"` → playbook. Read-only.

**`product:checkin`** — Weekly, ~10 min. Last week's commitments vs evidence, the one number, energy, and ≤3 verifiable commitments for next week (at least one user-facing once an MVP exists). Escalations are stated, not suggested: 3 missed weeks → `product:triage`; low energy two weeks running → cut scope or take a break. Pro adds the time split, the kill-criteria check, and pattern detection over the last 4 check-ins (building instead of selling, polishing without users, new-idea itch, appetite overrun, repeat miss, low energy). → `docs/checkins/YYYY-MM-DD-checkin.md`

### 0 · Choose

**`product:ideate`** — Your constraints (hours, runway, what you refuse to do) → candidates → four kill filters (20 reachable users without ads · the problem already costs them time or money · a first version fits ≤6 weeks of your real hours · you'd still work on it after 12 months of slow growth) → scoring → exactly one pick, a runner-up, and the first 5 people to talk to. Zero survivors → a 2-week pain journal; the filters never get lowered. Pro adds a founder inventory (skills, access, audiences) and sourcing lenses. → `docs/ideas/YYYY-MM-DD-ideation.md` (cwd)

**`product:triage`** — Run it from the folder that holds your projects (from inside a project it scans the parent; or pass paths). Needs ≥2 projects; ideation files count as ideas without a repo. Scores each on six dimensions (lite asks 4 questions per project), forces one focus, at most one secondary, an explicit do-not-touch list, and kill candidates — dormant with no next milestone, or a Kill/Park verdict already on file. → `docs/triage/YYYY-MM-DD-triage.md` (cwd)

### 1 · Understand

**`product:discover`** — Idea brief → canonical assumption map (must cover desirability, viability, distribution) with independent AI risk rating → evidence check (none / opinion / behavioral). → `docs/product/product-model.md` (seed), `docs/product/assumptions.md`

**`product:audit`** — Reads the codebase (routes, components, types, nav) and interviews you → screen inventory and prioritized problems. Pro adds the extracted object model and terminology and state gaps. A re-run updates the existing audit. → `docs/product/audit.md`

**`product:interview`** — `prep`: who qualifies, where to find them, a non-pitching outreach message, a Mom Test script mapped to assumption IDs, what would change your mind. `synthesize`: reads notes, transcripts, tickets, and feature requests; separates behavior from compliments; clusters patterns across ≥2 sources; updates evidence. → `docs/research/…-interview-kit.md`, `…-synthesis.md`

### 2 · Challenge

**`product:critique`** — The red team. Restates the idea as a falsifiable sentence, researches competitors, substitutes, and prior failures, runs a pre-mortem, and scores lenses — 7 in lite (problem reality, user specificity, why now, why you, alternatives, willingness to pay, distribution), 11 in pro (adds build scope, commoditization, trust/data, unit economics) plus a steelman. Ends with **Pursue / Sharpen / Park / Kill**, the riskiest assumption, the cheapest test, and a dated kill criterion. Cold on a paragraph, it writes only the critique; warm on discovery artifacts, it adds high-risk rows to the assumption map (and in pro re-rates your risks). → `docs/specs/…-critique.md`

### 3 · Money & reach

**`product:viability`** — Founder income goal → who pays → price anchored to value and alternatives → ramen math (customers needed, churn replacement, trials per month) → **Math works / works only if… / doesn't work**, with the lever that would change a "doesn't work". Adds price, willingness-to-pay, and churn rows to the assumption map. Pro adds bottom-up market sizing, unit economics incl. per-user AI cost, runway, and funding path. → `docs/product/business-model.md`

**`product:gtm`** — Narrow beachhead ICP → named watering holes → one inner-ring channel checked against your CAC ceiling → first-10-customers plan with real names or places → a one-liner. Adds distribution rows to the assumption map. Pro adds the full channel bullseye, messaging, distribution time budget, and channel experiments. Also the post-launch "nobody came" diagnosis. → `docs/product/go-to-market.md`

### 4 · Test

**`product:experiment`** — One of six methods (landing page, concierge, wizard of oz, fake door, smoke test, **pre-sale**), threshold set before running, hard time budget. `product:experiment record [slug]` writes the verdict — validated / invalidated / inconclusive — into the assumption map; a row not worth testing gets `waived — <reason>` by hand instead. On an audited product with no assumption map yet, it creates one around the assumption under test. → `docs/specs/…-experiment.md`

### 5 · Define

**`product:model`** — Core objects, relationships, lifecycle states, glossary, and an IA skeleton. Pro adds opportunities, positioning (main alternative pre-filled from the critique; primary user checked against go-to-market), non-goals, and a full information architecture. Needs an assumption map or an audit. → `docs/product/product-model.md`, `docs/product/glossary.md`, `docs/product/information-architecture.md` (pro)

**`product:journey "<flow>"`** — Trigger → steps (user action + system response) → failure states → completion. Lite maps the happy path and the top 2 failure states; pro covers every failure state, decisions, and preconditions. → `docs/product/journeys/<name>.md`

### 6 · Architect

**`product:stack`** — Use-what-you-know constraints, build-vs-buy per capability (auth, billing, tax, email, storage, jobs, search, analytics, error monitoring, admin, AI — default: managed), max 2 innovation tokens, hosting picked from the deployment rubric, the [arche-ui profile-fit check](docs/playbooks.md#stack-profiles-seeding-from-arche-ui) for Next.js frontends, and a not-now list of at least 3 items. Pro adds a data model sketch, cost at 0/100/1,000 users, and a security baseline. → `docs/product/architecture.md`

### 7 · Scope

**`product:shape "<feature>"`** — Problem, appetite (a maximum, not an estimate), solution outline, no-gos, testable done criteria; pro adds risks, rabbit holes, and the user flow. Refuses until the model's core objects and lifecycle states exist and every high-risk assumption is tested or waived; on a new product, warns when business model or go-to-market is missing. → `docs/specs/…-pitch.md`

**`product:spec "<screen>"`** — Purpose, primary user question, layout, primary action, and core states (loading, empty, error, main). Pro adds entry points, data, domain-specific states, copy rules, and acceptance criteria. Needs a pitch and the glossary. → `docs/screens/<name>.md`

### 8 · Build

**`product:build`** — Readiness checklist and a self-contained execution brief; records `readiness: ready|blocked` (missing screen states and scope that contradicts `architecture.md` are blockers). Pro adds an architecture skeleton and an instrumentation plan. → `docs/specs/…-build.md`

**`product:plan`** — Walking skeleton first, riskiest work early, tasks ≤2 sessions with verifiable acceptance checks, coverage of every done criterion and screen state, cuts proposed when the estimate passes 80% of the appetite, parking lot. Pro adds milestones and per-task agent handoff blocks. `product:plan progress [slug]` ticks tasks against their checks and flags appetite burn. → `docs/specs/…-plan.md`

### 9 · Launch

**`product:launch`** — Readiness where every item — payments, legal, and ops included — is a blocker (loses data, money, or trust) or nice; launch threshold set in advance; channel sequence from your go-to-market; launch day through T+7. Pro adds the full nice list, the T-14 → T-1 timeline, and a launch-day runbook. `product:launch record [slug]` fills results and a hit / partial / miss verdict. Needs a build file, or an audit for an existing product. → `docs/specs/…-launch.md`

**`product:measure`** — `product:measure "<feature>"`: primary metric from the pitch's done criteria, baseline, target; pro adds secondary metrics, false positives, events, and a first review date. `product:measure product`: activation moment, active-user definition, activation and week-4 retention targets, the analytics tool; pro adds acquisition sources, revenue events, a north-star number, and a cohort review cadence. → `docs/product/journeys/<slug>-telemetry.md` · `docs/product/journeys/product-telemetry.md`

### 10 · Learn

**`product:reflect "<feature>"`** — Evaluates the pitch's bet against evidence → continue / improve / simplify / pivot / kill. For a feature cancelled before it shipped: `product:reflect --pre-ship "<feature>"`. → `docs/specs/…-retro.md`

**`product:pmf`** — Cohort retention, pull signals, vanity metrics excluded, and the sunk-cost question → a verdict (Too early / No fit / Signal in a segment / Approaching / Strong) and a decision (persevere-narrow / iterate core / pivot / kill with a shutdown plan), with a next review date and flip thresholds. Under 10 active users the verdict is capped at Too early; Strong needs a Sean Ellis survey at ≥40% "very disappointed" from ≥30 responses. Pro adds the survey, segments, and revenue quality. → `docs/specs/…-pmf.md`

---

## Tracks

**Judge an idea — stop before building:**
```
product:discover lite → product:critique → product:interview prep → [talk to 5 people] → product:interview synthesize → product:viability → product:experiment → [run it] → product:experiment record
```

**New product, full:**
```
(product:ideate) → product:discover → product:critique → product:interview prep → [talk to 5 people] → product:interview synthesize → product:viability → product:gtm → product:experiment → [run it] → product:experiment record → product:model → product:stack → product:journey → product:shape → product:spec → product:build → product:plan → [build] → product:measure product → product:launch → [ship] → product:launch record → product:reflect / product:pmf
```

**Fast MVP:**
```
product:discover lite → product:critique lite → product:experiment lite → [run it, ≤3 days] → product:experiment record → product:model lite → product:shape lite → product:spec lite → product:build lite → product:plan lite → [build] → product:launch lite → [ship] → product:launch record → product:pmf lite
```

**Existing product / revamp:**
```
product:audit → product:model → (product:stack) → (product:experiment → [run it] → product:experiment record) → product:shape → product:spec → product:build → product:plan → [build] → product:measure → product:launch → [ship] → product:launch record → product:reflect / product:pmf
```

**Any time:** `product:next` · `product:checkin` weekly · `product:triage` across projects

Every track passes the gates in order. Two legal shortcuts: a high-risk assumption not worth testing can be waived instead of tested (`Verdict: waived — <reason>` in the assumption map), and `spec` can be skipped when the pitch says "No new screens". The matching playbooks carry the gate notes.

---

## Scenario playbooks

[`docs/playbooks.md`](docs/playbooks.md) — 19 situations, each an exact sequence that passes every gate:

| Before building | While building | Launching & after |
|---|---|---|
| No idea yet · Judge an idea · Handed-over idea · New idea, full · Money questions · Fast MVP · Portfolio overload | Stack decision · Unfocused build · Build execution · Legacy replacement | Pre-launch tightening · Public launch · Close the loop · Nobody came · Fit or quit · Feedback flood · Stuck · Reorientation |

Plus [**Stack profiles**](docs/playbooks.md#stack-profiles-seeding-from-arche-ui): the deployment rubric `product:stack` picks hosting from, and when to seed a Next.js frontend from the arche-ui companion repo instead of designing its architecture from scratch.

---

## Depth tiers

| | `lite` | `pro` |
|---|---|---|
| Questions | 3–5 essential (critique: 8 short steps) | The full set — 5 to 14, depending on the skill |
| Optional sections | `[deferred]` | Required |
| Time | ~5–15 min | ~15–40 min |
| Use for | Fast validation, small projects | Decisions you'll build months on |

```
product:critique lite
product:critique pro
product:critique          ← picks a default from project state and says why — or asks when nothing decides it
```

---

## Context input

```
product:discover                                      ← reads docs/intake/ by default
product:discover from docs/research/                 ← a folder
product:discover using docs/brief.md, docs/notes.md  ← specific files
product:critique "a paragraph describing the idea"    ← cold start, no files needed
product:audit — also read docs/old-spec.md           ← natural language
```

---

## Artifacts

Full map with readers and writers: [`docs/conventions.md` §6](docs/conventions.md).

```
docs/product/     living: product-model, assumptions, audit, glossary, information-architecture,
                  business-model, go-to-market, architecture, journeys/, journeys/*-telemetry
docs/specs/       point-in-time: critique, experiment, pitch, build, plan, launch, retro, pmf
docs/screens/     living screen specs
docs/research/    interview kits and syntheses
docs/checkins/    weekly check-ins
docs/intake/      yours — read by skills, never written (interview material in intake/interviews/)
docs/ideas/, docs/triage/   written in the folder where you run ideate/triage
```

Standard frontmatter: `type`, `product`, `tier`, `status`, `created`, `updated`, `skill`, `related`, plus decision fields other skills read (`verdict`, `kill_date`, `conclude_by`, `readiness`, `next_review`, …) and `gate_override: true` when a gate was skipped.

---

## Frameworks this draws from

| Area | Source |
|---|---|
| Customer conversations | *The Mom Test* (Rob Fitzpatrick) — past behavior, not opinions |
| Opportunity structuring | *Continuous Discovery Habits* (Teresa Torres) |
| Validated learning | *The Lean Startup* (Eric Ries) — cheapest experiment first |
| Red-teaming | Pre-mortem (Gary Klein); steelmanning |
| Business model | Ramen profitability (Paul Graham); bottom-up market sizing; LTV/CAC unit economics |
| Distribution | *Traction* Bullseye (Weinberg & Mares); "do things that don't scale" (Graham) |
| Stack choices | *Choose Boring Technology* innovation tokens (Dan McKinley) |
| Feature scoping | *Shape Up* (Ryan Singer) — appetite, no-gos, rabbit holes |
| Build sequencing | Walking skeleton (Alistair Cockburn); vertical slices |
| User intent | Jobs-to-be-Done |
| Product-market fit | Sean Ellis 40% test; retention-curve flattening; segment-first PMF (Rahul Vohra) |

Ingredients, not religion.

---

## What this is not

- **Not a replacement for talking to users.** It prepares the conversations and makes sense of them; it can't have them for you.
- **Not legal, tax, or financial advice.** Those topics appear as checklists for a professional.
- **Not a project management tool.** Plans have checkboxes; there are no tickets or sprints.
- **Not a design system.** It writes specs; design skills implement them.
- **Not a catalog.** Every skill has a stage and a route; you shouldn't have to browse.
- **Not a pipeline you must finish.** A Kill verdict is the system working.

---

## Installation

Product OS is a Claude Code plugin (`product`) served from a local marketplace (`product-dev-os-local`) defined in this repo's `.claude-plugin/`.

**Prerequisite:** [Claude Code](https://claude.ai/code). `jq` if you want the usage log.

### 1. Clone

```bash
git clone https://github.com/vladamon/product-dev-os.git ~/tools/product-dev-os
```

### 2. Add the marketplace and install the plugin

```bash
claude plugin marketplace add ~/tools/product-dev-os
claude plugin install product@product-dev-os-local
```

Or inside a Claude Code session: `/plugin` and follow the prompts.

### 3. Verify

Open any project and run `product:next`. You should get a status report (or "No product artifacts found").

### Updating

```bash
cd ~/tools/product-dev-os && git pull
claude plugin marketplace update product-dev-os-local
```

Then start a new session. Installed plugins run from a cache copy keyed by the git commit, so `git pull` alone does not change what Claude Code loads. (`plugin.json` intentionally has no `version` field — pinning one would freeze the cache until someone bumps it.)

### Moving an existing install to another clone

If `claude plugin marketplace list` shows `product-dev-os-local` pointing at an old path, or the plugin shows as disabled:

```bash
claude plugin marketplace remove product-dev-os-local
claude plugin marketplace add /absolute/path/to/product-dev-os
claude plugin install product@product-dev-os-local
claude plugin enable product@product-dev-os-local
```

### Usage log (optional)

The plugin's hook logs every `product:*` run so you can see which skills pull weight. Point it at the repo's log in `~/.claude/settings.json`:

```json
{
  "env": {
    "PRODUCT_OS_USAGE_LOG": "/absolute/path/to/product-dev-os/docs/os-usage-log.md"
  }
}
```

Without it, rows go to `~/.claude/product-os/usage-log.md`.

### Without installing

For a one-off — say, a friend who wants their idea judged and doesn't use Claude Code — give any Claude conversation `recipes/20-idea-critique.md` plus sections 7–8 of `docs/conventions.md`, and ask it to follow the recipe on the idea. You lose the gates and artifacts; you keep the method.
