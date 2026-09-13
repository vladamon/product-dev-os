---
name: gtm
description: Use this skill when the user invokes `/product:gtm` or asks how anyone will find the product — "how do I get my first customers", "where do my users hang out", "marketing plan", "distribution plan", "go-to-market", "launched and nobody came", "no signups", "which channel should I use".
---
# product:gtm — Go-to-Market & First Customers

Use this skill when the user invokes `/product:gtm` or asks how the product will reach its users — before building, or after a launch nobody noticed.

## Purpose

Replace "build it and they will come" with a concrete, testable distribution plan: the narrowest reachable beachhead, the named places those people gather, one or two channels to test now, a founder-led plan for the first 10 customers, and the words that make them care. Produces `docs/product/go-to-market.md` (living) and adds distribution assumptions to `docs/product/assumptions.md`.

Read recipe `recipes/23-go-to-market.md` for the authoritative process. Follow `docs/conventions.md` §7 (research) and §8 (honesty).

## Contract
Requires: docs/product/product-model.md with Product Promise + Primary Users non-deferred
Produces: docs/product/go-to-market.md
Updates: docs/product/go-to-market.md (update mode if it exists), docs/product/assumptions.md (adds rows with Source `gtm`)

## Step 0: Verify prerequisites (gate)

You can't find the watering holes of a user you haven't defined.

**Check — promise and primary users exist:**

If `docs/product/product-model.md` is missing, or Product Promise or Primary Users is empty or `[deferred]`:
```
✗ Cannot run product:gtm yet.

Missing requirements:
  - docs/product/product-model.md — [Product Promise | Primary Users | file] missing or deferred

Run this first:
  product:discover lite

Why this matters:
  A channel plan for "small businesses" or "developers" is a plan for nobody.
  The beachhead has to be a specific person in a specific situation.
```
Then STOP.

**Gate override.** `--skip-gate` proceeds past the refusal. Write `gate_override: true` into the frontmatter of `go-to-market.md` and add under Channel Experiments: `Gate skipped — product promise / primary users not defined`.

## Step 1: Tier resolution
1. User specified `lite` or `pro` → use it, no questions asked
2. Any `docs/specs/*-launch.md` exists (post-launch — "nobody came") → default to `pro`, announce: "Defaulting to pro — a launch already happened; the full channel analysis is the point. Run lite? (y/n)"
3. `docs/product/go-to-market.md` exists with `[deferred]` sections → default to `pro` (update mode), announce: "Defaulting to pro — go-to-market has deferred sections. Run lite? (y/n)"
4. Otherwise → default to `lite`, announce: "Defaulting to lite — beachhead, watering holes, one channel, first-10 plan, one-liner (~10 min). Run pro for the full bullseye, messaging, and channel experiments? (y/n)"

## Step 2: Read context

**1. User-specified files** (`from`, `using`, or natural mention)
**2. `docs/intake/`** — if it exists and no files were specified
**3. Product docs:** `docs/product/product-model.md` (promise, users, positioning if present), `docs/product/assumptions.md` (existing distribution rows)
**4. Money:** `docs/product/business-model.md` — CAC ceiling (LTV ÷ 3), required trials/month, ARPU. These constrain which channels are allowed.
**5. Evidence:** latest `docs/specs/*-critique.md` (landscape, where users talk), `docs/research/*-synthesis.md` (where interviewees found tools, their words for the pain)
**6. Post-launch:** `docs/specs/*-launch.md` Results (which channels were tried, numbers), `docs/product/journeys/*-telemetry.md`
**7. Existing plan:** `docs/product/go-to-market.md` → update mode

**Research (§7):** search for where the beachhead gathers — named subreddits, Slack/Discord communities, newsletters, podcasts, forums, marketplaces/app stores, events, and the queries they'd type — plus how the closest competitors acquire users. Record member counts and self-promotion rules where visible. If search is unavailable, say so and produce a research checklist.

## Step 3: Show context summary

```
product:gtm — go-to-market for "[Product Name]"

Promise: [one line]
Primary users (from model): [line]

Money constraints:
  CAC ceiling: [$ from business-model, or "no business model — channels unconstrained ⚠"]
  Needed: [T trials/month, or "unknown"]

Evidence:
  Critique landscape: [found/not found]
  Interview language & discovery paths: [found/not found]
  Previous launch: [date, channels tried, result — or "none"]
Web research: [available | unavailable — research checklist will be produced]

Will ask about: [beachhead, watering holes, channel, first 10, messaging (+ bullseye, time budget, experiments for pro)]

Correct anything?
```
Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/23-go-to-market.md`. Follow the lite or pro set. One question at a time.

**Always ask, in every tier:**
1. "Of everyone who could use this, who has the problem worst *and* can you reach this month? Role, situation, trigger event."
2. "Name the places these exact people gather — specific communities, newsletters, subreddits, events, marketplaces."
3. "Who are the first 30 people or accounts you'd contact? Names, or the exact list/search you'd pull them from."

**Present research, then propose.** Show the watering holes you found (labeled) before asking the founder to pick. Propose the inner-ring channel yourself with reasoning; the founder confirms or overrides.

**Reject non-channels:** "social media", "SEO", "content", "word of mouth", "go viral" → "Which platform, which community, which keywords, what post? Name it."

**Post-launch case:** start from the launch Results — for each channel tried: reach, signups, activation. Diagnose *before* proposing: wrong audience, wrong message, wrong channel, or product didn't activate. If activation was the failure, say so and route to `product:interview synthesize` — more distribution won't fix a leaky product.

**Check CAC fit** for every inner-ring channel against business-model.md. Paid ads above the ceiling are rejected, not noted.

## Step 5: Produce the artifact

Write `docs/product/go-to-market.md` using `templates/go-to-market.md`.

Frontmatter: `type: go-to-market`, `product`, `tier`, `status`, `created`, `updated`, `skill: product:gtm`, `related:` (business-model, critique, launch if present).

- **Lite:** Beachhead ICP, Watering Holes, Inner-Ring Channels (one), First 10 Customers, Messaging (one-liner + headline only), Distribution Assumptions Added. Mark Channel Bullseye, full Messaging, Time Budget, Channel Experiments `[deferred]`.
- **Pro:** all sections.

The outreach script in First 10 Customers asks for advice or offers something specific (concierge setup, founding-member price) and follows each platform's self-promotion rules. No mass DM templates.

## Step 6: Update related artifacts

Append distribution rows to `docs/product/assumptions.md` (canonical table, `docs/conventions.md` §5): next free A-ID, Type `distribution`, Source `gtm`, Verdict `pending`. Always add: "[beachhead] can be reached via [inner-ring channel] at ≤ [CAC/effort]" and "[first-10 outreach] converts ≥ [N] of 30 to a call/trial". Rate risk yourself; confirm disagreements with the founder.

If the file uses the legacy list format, show the migration diff and ask before converting.

## Step 7: Summarize

```
Go-to-market → docs/product/go-to-market.md

Beachhead: [role in situation, trigger]
Watering holes: [N] named ([top 3])
Inner ring: [channel 1] [, channel 2] — CAC fit: [ok | unknown | over ceiling]
First 10: [source of first 30 prospects] · [N] contacts/week
One-liner: "[…]"
[pro] Distribution time: [N] h/week of [total]

Assumptions added: [A-IDs] ([N] high-risk)

Recommended next step:
  product:experiment — smoke test [A-ID: channel reach] ([threshold] in [days])
  Start the first-10 outreach this week — it's evidence, not marketing.
  [pre-launch]: product:launch will read this file for channels and assets
  [post-launch, activation failed]: product:interview synthesize — fix activation before more traffic
```

## Fallback questions (if recipe unavailable)
1. "Who has this problem worst and can be reached this month? Be specific."
2. "Where do those people gather — name specific communities, newsletters, search queries?"
3. "Which one channel will you test first, and what would success look like in two weeks?"
4. "Who are the first 30 people you'll contact, and what will you say?"
5. "Describe the product in one sentence using the words your users use for the pain."

## Pivot interrupt
If the interview shows the beachhead can't be reached ("I don't know where they are", "they don't hang out anywhere online", "only enterprise procurement buys this"):
1. Stop the interview
2. Write what exists with `status: draft`; record the unreachable segment under Beachhead ICP
3. Add a high-risk distribution row: "[segment] is reachable by a solo founder" (Source `gtm`)
4. Say: "Pivot signal: [segment] isn't reachable by you right now. Options: a narrower segment you already have access to (re-run product:gtm), a different buyer (product:viability), or re-examine the idea (product:critique)."

## Artifact naming
Living document — updated in place. On re-run, enter update mode: show the current beachhead, inner ring, and experiment results; ask what changed; append a change note:
```yaml
changes:
  - date: YYYY-MM-DD
    note: "r/freelance smoke test: 2/40 trials — dropped; inner ring now cold email to agency owners"
```
Channels that were tested and failed stay listed with their result — never delete evidence.

## Rules

- The beachhead is a specific, reachable segment with a trigger event. "SMBs", "creators", "developers" are rejected.
- A channel is only a channel when it is named concretely (platform + community/keyword/list). Generic channels are rejected.
- "Build it and they will come" and "it'll spread by word of mouth" are rejected as plans.
- The first-10 plan names people or exact places and a weekly contact quota.
- Inner-ring channels must fit the CAC ceiling when `business-model.md` exists.
- Outreach respects platform self-promotion rules. Never propose spam, fake accounts, or astroturfing.
- Watering holes follow the research protocol: labeled, never invented.
- Post-launch: diagnose (audience, message, channel, activation) before prescribing more distribution.
- Surface the heuristic once an MVP exists: at least half of founder hours go to distribution.
