---
name: stack
description: Use this skill when the user invokes `/product:stack` or asks what stack to use for a new project, whether to build or buy a capability (auth, billing, email, background jobs, search, AI provider), where and how to host and deploy, what the product will cost to run, or whether they are over-engineering. Produces the project-level architecture decision.
---
# product:stack — Project Architecture & Build-vs-Buy

Use this skill when the user invokes `/product:stack` or is about to start (or restart) a codebase and needs to decide what it is built with — and what not to build.

## Purpose

Decide the project-level architecture for a solo builder: stack, managed services, hosting, data model shape, running costs, security baseline, and an explicit list of things deliberately postponed. Produces `docs/product/architecture.md` (living).

Read recipe `recipes/24-stack-decision.md` for the authoritative process.

**Scope boundary:** this skill decides the *project*. Feature-level structure for one shaped slice stays in `recipes/13-technical-architecture.md`, used by `product:build`. `product:build pro` reads `architecture.md` so its skeleton follows these decisions; `product:plan` reads it for task constraints.

## Contract
Requires: docs/product/product-model.md (Core Objects non-deferred) OR docs/product/audit.md (existing codebase)
Produces: docs/product/architecture.md
Updates: docs/product/architecture.md (update mode — every change appends a dated Decisions log entry); proposes feasibility rows for docs/product/assumptions.md (founder confirms)

## Step 0: Verify prerequisites (gate)

A stack chosen before the product's objects are known is chosen for the résumé, not the product.

**Check — grounding exists:**

If `docs/product/audit.md` is missing AND (`docs/product/product-model.md` is missing OR its Core Objects section is empty or marked `[deferred]`):
```
✗ Cannot run product:stack yet.

Missing requirements:
  - docs/product/product-model.md — Core Objects [missing | deferred]
  - docs/product/audit.md — missing

Run this first:
  product:model lite     (new product — ~10 min, objects + states is enough)
  product:audit          (existing codebase)

Why this matters:
  The data model sketch and the build-vs-buy calls depend on what the product
  creates and tracks. Without objects, the stack answers a question nobody asked.
```
Then STOP.

**Gate override.** `--skip-gate` proceeds. Write `gate_override: true` in the artifact frontmatter and add to Decisions log: `Gate skipped — no product model or audit; data model sketch is speculative.`

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/architecture.md` exists → update mode in its recorded tier, announce: "Architecture exists from [date] ([tier]). I'll ask what changed. Run pro to fill deferred sections? (y/n)"
3. `docs/product/product-model.md` has Core Objects AND Lifecycle States complete → default to `pro`, announce: "Defaulting to pro — product model is complete, so the data model sketch and cost table are worth doing. Run lite? (y/n)"
4. Otherwise → default to `lite`, announce: "Defaulting to lite — constraints, build-vs-buy, hosting, not-now list (~10 min). Run pro? (y/n)"

## Step 2: Read context

**1. User-specified files** (`from`, `using`, or natural mention)
**2. `docs/intake/`** — if exists and no files specified
**3. Product docs:**
- `docs/product/product-model.md` — core objects, lifecycle states, user roles, non-goals
- `docs/product/audit.md` — existing tech, technical debt, what must not change
- `docs/product/business-model.md` — price point, budget ceiling, per-user AI/infra cost assumptions
- `docs/product/assumptions.md` — feasibility rows
**4. Codebase signals** (if a codebase exists):
- `package.json`, lockfiles, `pyproject.toml`, `go.mod`, `Gemfile`, `Cargo.toml` — languages, frameworks, vendor SDKs already installed
- `Dockerfile`, `docker-compose.yml`, `fly.toml`, `vercel.json`, `render.yaml`, `helm/`, `.github/workflows/` — current hosting and CI
- `.env.example` — vendors already wired in
**5. `docs/playbooks.md` → "Stack profiles"** — the deployment rubric and the arche-ui profile-fit check. Reference them; never restate them.
**6. Research (conventions §7):** vendor pricing pages and free-tier limits for every managed service proposed. If search is unavailable, say so in the context summary and label all costs `[estimate]`.

## Step 3: Show context summary

```
product:stack — deciding architecture for [Product Name]

Grounding:
  Product model: [N core objects, lifecycle states complete | deferred]
  Audit: [found — current stack: ... | not found]
  Business model: [price ≈ X, budget ceiling Y | not found]

Codebase signals:
  Languages/frameworks: [detected or "no codebase"]
  Vendors already wired: [list or "none"]
  Current hosting/CI: [detected or "none"]

Research: [web search available | unavailable — costs will be labeled estimates]

Will ask about: constraints, build-vs-buy per capability, hosting profile[, data model, costs, security (pro)]

Correct anything?
```

Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/24-stack-decision.md`. Follow lite or pro question set. Ask one question at a time.

**Always ask, regardless of tier:**
1. "Which languages and frameworks have you shipped something real in during the last two years?" — this is the default stack.
2. "What's the most you'll spend per month on running this before it earns anything?"
3. "Realistically, how many active users in 12 months — not the hope, the plan?"
4. Present the capability table pre-filled with managed defaults (recipe 24), then ask: "Which of these do you intend to build yourself — and what product requirement forces it?"

**Push back on:**
- Any "build" with no product reason → default to managed.
- Any technology the founder hasn't shipped with → it spends an innovation token; more than 2 → pick which to drop.
- Microservices, Kubernetes, multi-region, event sourcing, or a custom auth system for a product under ~1,000 users → move to Not now unless a named requirement forces it, and record the requirement.

**Hosting & deploy:** pick the matching row of the deployment rubric in `docs/playbooks.md` ("Stack profiles") and record its name. **Next.js frontend:** run the arche-ui profile-fit check from the same section and record the outcome: full fit / docs 00–15 only / not applicable.

**Pro additionally:** map each core object and its lifecycle states to storage (table/collection, key relationships, state column/enum); price every managed service at 0 / 100 / 1,000 active users; walk the security & privacy baseline.

## Step 5: Produce the artifact

Write `docs/product/architecture.md` using `templates/architecture.md`.

For lite: fill Constraints, Capabilities, Architecture Shape, Hosting & Deploy, Not Now. Mark Innovation Tokens, Data Model Sketch, Cost at Scale, Security & Privacy Baseline as `[deferred]`.
For pro: fill all sections.

Frontmatter `related:` links product-model, audit, and business-model where they exist. Every vendor price and limit carries a §7 label. The Security & Privacy Baseline section carries the §9 line: `Not legal/compliance advice — verify with a qualified professional in your jurisdiction.`

## Step 6: Update related artifacts

If a decision rests on something unproven (e.g. "vendor X's API supports bulk export", "LLM cost per active user stays under $0.40") and `docs/product/assumptions.md` exists, propose a row: `Type: feasibility`, `Source: founder`, Risk as the founder rates it, `Verdict: pending`. Show the rows and ask before writing. Never edit existing rows.

## Step 7: Summarize

```
Architecture decided → docs/product/architecture.md

Stack: [language/framework] · [database] · [hosting profile]
Managed: [N] capabilities · Built: [N] (each with a product reason)
Innovation tokens spent: [N]/2
Monthly cost: [0 users] / [100] / [1,000]   (pro)
Not now: [N] items
arche-ui fit: [full | docs 00–15 only | n/a]

Recommended next step:
  [arche-ui full fit]:   seed from arche-ui per its README, then continue below
  [new product]:         product:journey "[primary journey]"
  [journeys exist]:      product:shape "[first slice]"
  [existing / revamp]:   product:shape "[migration slice]"
  [cost at 1,000 users > plausible revenue, or no business model]:
                         product:viability — check the math before building
```

## Fallback questions (if recipe unavailable)
1. "What languages and frameworks have you shipped real things in recently?"
2. "What's your monthly spend ceiling before revenue?"
3. "For auth, payments, email, background jobs, and file storage — which will you build yourself, and why?"
4. "Where will it run, and how does a change get from your laptop to production?"
5. "What are you deliberately not building yet?"

## Pivot interrupt
If the interview shows the product can't be built within the founder's skills, budget, or constraints ("this needs real-time video and I've never touched WebRTC", "per-user model cost exceeds any price they'd pay"), or the objects don't survive contact with a data model:
1. Stop the interview immediately
2. Write what was decided to `docs/product/architecture.md` with `status: draft` and a comment: `<!-- PIVOT: [what blocks feasibility] -->`
3. Say: "Stack paused. Blocker: [what]. Recommended: product:critique (feasibility lens) or product:viability (cost vs price) — or product:model if the object model is wrong."

## Artifact naming
Living document — updated in place. Update mode never rewrites prior decisions silently: each change appends a Decisions log row (date, decision, replaces, reason) and marks the superseded row `superseded YYYY-MM-DD`. `product:next` treats `status: draft` as incomplete.

## Rules

- Default is managed. Every "build" names the product requirement that forces it.
- Use what the founder knows. A stack they haven't shipped with needs a hard requirement, stated in the artifact.
- Maximum 2 innovation tokens. A third forces a choice.
- Monolith, one database, one deploy target unless a named requirement says otherwise.
- The Not Now list is mandatory and must name at least 3 specific things.
- Every price and free-tier limit is `[sourced]` or `[estimate]` — never unlabeled, never invented.
- Deployment rubric and arche-ui fit check are referenced from `docs/playbooks.md`, not re-derived.
- Never read or edit application code beyond the signal files in Step 2.
