---
name: launch
description: Use this skill when the user invokes `/product:launch` or asks "am I ready to launch?", wants a launch checklist, a private/public beta plan, a Product Hunt / Show HN / Reddit launch plan, or wants to record how a launch went (`product:launch record <slug>`).
---
# product:launch — Launch Readiness & Launch Plan

Use this skill when the user invokes `/product:launch` or asks whether something is ready to put in front of real users and how people will find out about it.

## Purpose

Before real users arrive, answer two questions: is it safe to ship (nothing that loses users' data, money, or trust), and how do the right people hear about it. Produces a point-in-time launch file with a blocker/nice readiness checklist, a success threshold set before launch, a channel sequence, a T-14 → T+7 timeline, a launch-day runbook, and a follow-up loop. After launch, `record` mode fills Results and Verdict.

Read recipe `recipes/26-launch.md` for the authoritative process.

## Contract
Requires: something built — at least one docs/specs/*-build.md, OR docs/product/audit.md (an existing product being launched or relaunched). Recommended: docs/product/go-to-market.md, docs/product/journeys/product-telemetry.md
Produces: docs/specs/YYYY-MM-DD-[launch-slug]-launch.md
Updates: that launch file's Results and Verdict sections plus frontmatter `status`/`verdict` (record mode only)

## Step 0: Verify prerequisites (gate)

**Check 1 — something was built:**

If `docs/specs/` contains no `*-build.md` AND `docs/product/audit.md` does not exist:
```
✗ Cannot run product:launch yet.

Missing requirements:
  - docs/specs/*-build.md — nothing has been through build readiness
  - docs/product/audit.md — no audit of an existing product either

Run this first:
  product:build "[feature]"   (built through the OS)
  product:audit lite          (built outside the OS)

Why this matters:
  A launch checklist for an unbuilt product is a to-do list for a fantasy.
  Build readiness is where screen states, done criteria, and scope get locked.
```
Then STOP.

**Check 2 — go-to-market exists (warning):**

If `docs/product/go-to-market.md` is missing:
```
⚠ No docs/product/go-to-market.md.

Channels will be generic guesses instead of the places your ICP actually gathers.
Launching into silence is the most common indie launch failure.

Recommended: product:gtm lite (~10 min) first.
Proceed with generic channels? (y/n)
```

**Check 3 — activation is observable (warning):**

If no `docs/product/journeys/*-telemetry.md` exists:
```
⚠ No telemetry plan found.

Without an activation event you cannot judge this launch. The readiness
checklist will carry "activation observable" as a blocker until resolved.

Recommended: product:measure product
```

**Check 4 — previous launch unrecorded (warning):**

If a `*-launch.md` has `verdict: pending` and its `launch_date` has passed:
```
⚠ [date]-[slug]-launch.md launched on [date] but was never recorded.

Record it first: product:launch record [slug]
Or plan a new launch anyway? (record / new)
```

**Gate override.** `--skip-gate` proceeds past Check 1. Write `gate_override: true` into the launch file's frontmatter and add under Readiness: `Gate skipped — no build file; readiness rests on unverified scope`.

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Invocation or context says private beta / invite-only / waitlist → default to `lite`, announce: "Defaulting to lite — private beta: blockers only, one channel. Run pro? (y/n)"
3. Invocation or context says public launch / Product Hunt / Show HN → default to `pro`, announce: "Defaulting to pro — public launch warrants the full checklist and sequence. Run lite? (y/n)"
4. Otherwise → ask: "Run **lite** (blockers + one channel + threshold, ~10 min) or **pro** (full readiness, multi-channel sequence, timeline, runbook, ~30 min)?"

## Step 2: Read context

**1. User-specified files** (`from`, `using`, or natural mention)
**2. `docs/intake/`** — if it exists and no files were specified
**3. Build files + pitches:** done criteria, no-gos; `*-plan.md` unticked tasks = scope not yet built
**4. `docs/product/go-to-market.md`:** beachhead ICP, watering holes, one-liner, messaging, time budget
**5. Telemetry:** `docs/product/journeys/*-telemetry.md` — activation event and baseline
**6. `docs/product/business-model.md`:** pricing and payment model (decides whether payment items apply)
**7. `docs/product/architecture.md`:** chosen vendors for auth, billing, monitoring, backups
**8. Prior launches:** `docs/specs/*-launch.md` — thresholds, what worked, verdicts
**9. Codebase signals:** dependency manifests for error-monitoring, analytics, and payment SDKs; routes for privacy, terms, pricing pages. Check for secret key *names* committed to the repo — never read or print secret values.

**Research (conventions §7):** for each candidate channel, search the platform's current self-promotion and launch rules. Label findings `[sourced: url, accessed YYYY-MM-DD]`. If search is unavailable, say so and add "check [platform] rules" as a T-14 task instead of asserting rules.

## Step 3: Show context summary

```
product:launch — planning "[Launch Name]" ([launch type])

Built:
  [build files] — [N] done criteria; plan: [N/M tasks ticked or "no plan"]

Go-to-market: [found — ICP: "..." | missing]
Activation event: [event from telemetry | none — will be a blocker]
Pricing/payments: [model from business-model.md | none — payment items N/A?]

Readiness signals from repo:
  ✓ [e.g. error monitoring SDK present] — verify in production
  ○ [e.g. no /privacy route found]

Prior launches: [N — last verdict: ... | none]
Research: [web search available | unavailable — rules become T-14 tasks]

Will ask about: [readiness gaps, threshold, channels, timeline, runbook]

Correct anything?
```

Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/26-launch.md`. Follow the lite or pro set. Items verified from the repo are pre-marked and shown for confirmation — ask only about what can't be read.

**Always ask (every tier):**
1. "Walk the core journey in production as a brand-new user — sign up to first value. Where did it break or stall?" If they haven't done it, the walk-through becomes a T-7 blocker task.
2. "What numbers within 14 days would count as a hit? Pick one primary metric. Set them now."
3. "Where do your first users already gather, and which one channel goes first?"
4. "If something breaks on launch day, what gets hotfixed same-day and what waits?"

**Classify every readiness item** blocker (loses users' data, money, or trust) or nice. When the founder wants to downgrade a data/money/trust item, ask for the reason and write it next to the item. When the founder wants to delay launch for a nice item, say so plainly: "That's polish. It doesn't block."

**Threshold before launch:** reject "let's see how it goes." A launch without a threshold cannot get a verdict.

## Step 5: Produce the artifact

Write `docs/specs/[today's date]-[launch-slug]-launch.md` using the Output structure in `recipes/26-launch.md`. Slug from the launch name: "public beta" → `public-beta`.

Initial frontmatter: `status: planned`, `verdict: pending`, `launch_date:` set.

For lite: Launch type, Blockers, Threshold, one channel, T0 + T+1…T+7, Follow-up loop. Mark Nice, Timeline T-14…T-1, and Runbook `[deferred]`.
For pro: all sections.

Payments, trust, legal, and tax items carry: `Not legal/tax advice — verify with a qualified professional in your jurisdiction.`

## Step 6: Update related artifacts

None. Launch writes no shared living docs. If the interview exposed a stale ICP or a missing activation event, name the skill that owns the fix in the summary.

## Step 7: Summarize

```
Launch plan → docs/specs/[date]-[slug]-launch.md

Launch: [name] ([type]) on [date]
Blockers open: [N] — [list]
Threshold (primary): [metric ≥ N within 14 days]
Channels: [ordered list]

Recommended next step:
  [If blockers open]: fix [top blocker] — re-run product:launch to re-check
  [If no telemetry]:  product:measure product
  [If ready]:         execute T-14 tasks; launch on [date]

  After launch day + 14 days:
    product:launch record [slug]
```

## Mode: record

Invoked as `product:launch record [slug]`. Open the matching `*-launch.md`. If none matches, list launch files with `verdict: pending` and ask which.

Interview (one at a time):
1. "Raw numbers for each threshold metric?"
2. "Which channel produced activated users — not just visits?"
3. "Any false-positive signal — a traffic spike without activation, friends and followers signing up?"
4. "Primary metric met? Verdict: hit (primary and most thresholds met) / partial (some met, or primary met only through false positives) / miss (primary not met)."
5. "What does this change — next launch, ICP, messaging, or the product?"

Fill only the Results and Verdict sections. Set frontmatter `status: complete`, `verdict: <value>`, `updated: <today>`. Do not edit the plan sections.

Summarize:
```
Launch recorded → docs/specs/[date]-[slug]-launch.md
Verdict: [HIT | PARTIAL | MISS] — [primary metric: actual vs threshold]
Best channel: [channel]

Recommended next step:
  [If no telemetry]: product:measure product
  [Hit/partial]:     keep users coming; after 4–8 weeks of usage → product:pmf
  [Miss]:            product:gtm pro — channels or ICP were wrong
  Feedback collected? Drop notes into docs/intake/interviews/ → product:interview synthesize
```

## Fallback questions (if recipe unavailable)
1. "Private beta, public beta, or public launch — and for whom?"
2. "Have you walked the core journey in production as a new user? Where did it break?"
3. "What could lose a user's data, money, or trust right now?"
4. "What numbers within 14 days count as a hit?"
5. "Which one channel first, on what date, and what do you do in the week after?"

## Pivot interrupt
If the production walk-through or readiness review reveals the core journey does not deliver value, or the founder signals the audience is wrong ("nobody in these channels actually has this problem"):
1. Stop the interview immediately
2. Record what was learned as `docs/specs/[date]-[slug]-launch-partial.md` with `status: abandoned`
3. Note the signal in frontmatter: `pivot_signal: "[what changed]"`
4. Say: "Launch paused. Signal: [what changed]. Recommended: [broken core journey → product:shape "[fix]" then product:plan] / [wrong audience → product:gtm pro]."

## Artifact naming
Point-in-time artifact — never rewritten except Results, Verdict, and frontmatter `status`/`verdict`/`updated` by record mode. Each launch (private beta, public beta, public launch) gets its own date-prefixed file. `product:next` lists launches with pending verdicts.

## Rules

- Only blockers block. A blocker loses users' data, money, or trust; everything else ships rough.
- The threshold is set before launch and never edited afterward.
- No launch without a way to observe activation — telemetry, or an explicit manual method written into the runbook.
- Channels are named concretely. "Social media" is not a channel; "r/[subreddit], following its self-promotion rules" is.
- Respect every platform's self-promotion rules; source them, don't assume them.
- Never read or print secret values while checking readiness.
- Skills never write to `docs/intake/`. The founder drops feedback there.
- Recording is mandatory. A launch without a recorded verdict teaches nothing.
