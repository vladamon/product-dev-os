---
name: viability
description: Use this skill when the user invokes `/product:viability` or asks whether a product can make money — "how should I price this", "can this replace my salary", "will anyone pay", "is the market big enough", "what are the unit economics", "should I raise money or bootstrap".
---
# product:viability — Business Model & Money Math

Use this skill when the user invokes `/product:viability` or asks whether the product can pay: pricing, revenue model, market size, unit economics, runway, or funding path.

## Purpose

Do the money math before the build. Turn a founder's income goal into the number of paying customers, the price, the churn, and the acquisition cost that would have to be true — then say plainly whether that is plausible. Produces `docs/product/business-model.md` (living) and adds viability assumptions to `docs/product/assumptions.md`.

Read recipe `recipes/22-business-model.md` for the authoritative process. Follow `docs/conventions.md` §7 (research), §8 (honesty), §9 (advice boundaries).

## Contract
Requires: docs/product/assumptions.md OR docs/product/audit.md (at least one); docs/product/product-model.md with Product Promise + Primary Users non-deferred (discover seed suffices)
Produces: docs/product/business-model.md
Updates: docs/product/business-model.md (update mode if it exists), docs/product/assumptions.md (adds rows with Source `viability`)

## Step 0: Verify prerequisites (gate)

Money math on an undefined user and promise is arithmetic on fiction.

**Check 1 — an entry-point document exists:**

If both `docs/product/assumptions.md` and `docs/product/audit.md` are missing:
```
✗ Cannot run product:viability yet.

Missing requirements:
  - docs/product/assumptions.md  (from product:discover)  — or —
  - docs/product/audit.md        (from product:audit)

Run this first:
  product:discover   (new product)
  product:audit      (existing product)

Why this matters:
  Pricing and market size depend on who the user is and what problem costs them.
  Without discovery or an audit, every number here is invented.
```
Then STOP.

**Check 2 — product promise and primary users are defined:**

If `docs/product/product-model.md` is missing, or its Product Promise or Primary Users section is empty or `[deferred]`:
```
✗ Cannot run product:viability yet.

Missing requirements:
  - docs/product/product-model.md — [Product Promise | Primary Users | file] missing or deferred

Run this first:
  product:discover lite

Why this matters:
  "Who pays" and "for what outcome" anchor the price. Without them the price anchors to cost.
```
Then STOP.

**Gate override.** `--skip-gate` proceeds past a refusal. Write `gate_override: true` into the frontmatter of `business-model.md` and add to its Red Flags section: `Gate skipped — [which check failed]`.

## Step 1: Tier resolution
1. User specified `lite` or `pro` → use it, no questions asked
2. `docs/product/audit.md` exists (existing product with real revenue/cost data) → default to `pro`, announce: "Defaulting to pro — existing product; real numbers make the full model worth it. Run lite? (y/n)"
3. `docs/product/business-model.md` exists with `[deferred]` sections → default to `pro` (update mode), announce: "Defaulting to pro — business model has deferred sections. Run lite? (y/n)"
4. Otherwise → default to `lite`, announce: "Defaulting to lite — goal, revenue model, price, ramen math, verdict (~10 min). Run pro for market size, unit economics, runway, and funding path? (y/n)"

## Step 2: Read context

**1. User-specified files** (`from`, `using`, or natural mention) — spreadsheets, pricing research, revenue exports
**2. `docs/intake/`** — if it exists and no files were specified
**3. Product docs:** `docs/product/product-model.md` (promise, users, positioning if present), `docs/product/assumptions.md`, `docs/product/audit.md`
**4. Evidence:** latest `docs/specs/*-critique.md` (alternatives, pricing found), `docs/research/*-synthesis.md` (money spent on workarounds), `docs/product/go-to-market.md` (channels → CAC)
**5. Existing model:** `docs/product/business-model.md` → update mode: ask only about deferred or stale sections; record a change note

**Research (§7):** before the pricing questions, search for the pricing pages of the 3–5 closest alternatives and any public data on the target segment's size. If search is unavailable, say so in the summary and write a research checklist into the artifact instead of numbers.

## Step 3: Show context summary

```
product:viability — money math for "[Product Name]"

Promise: [one line from product-model]
Who pays: [primary user / buyer if known, else "unknown — will ask"]

Evidence found:
  Alternatives' prices: [list with sources, or "none found"]
  Spend on workarounds: [from synthesis, or "no interview evidence"]
  Channels / CAC inputs: [from go-to-market, or "none"]
  Web research: [available | unavailable — research checklist will be produced]

Existing business-model.md: [none | from [date], deferred: [sections]]

Will ask about: [goal, revenue model, price, churn, conversion (+ market, costs, CAC, funding for pro)]

Correct anything?
```
Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/22-business-model.md`. Follow the lite or pro set. One question at a time.

**Always ask, in every tier:**
1. "What does this need to earn per month, by when, for it to be worth your time? Side income, ramen-profitable, replace your salary, or venture-scale?"
2. "Who pays — the user, their boss, their company? From which budget?"
3. "What will you charge, and what is that anchored to? Name the alternative they pay for today and its price."

**Run the ramen math live, showing the formula**, and read the result back: "At $[price]/mo you need [N] paying customers. With [churn]% monthly churn that's [M] new customers every month just to hold. At [conv]% trial→paid that's [T] trials a month. Does that look reachable with your hours?"

**Label every number as you record it** — `[sourced: url, accessed date]`, `[estimate: method]`, or `[founder-stated]`. A founder-stated churn or conversion rate with no basis is flagged as an assumption row, not accepted as fact.

**Push back on:**
- Price set from cost or "what feels fair" → "What does the problem cost them today? What do they pay for the alternative?"
- Top-down TAM ("1% of a $10B market") → "How many of these customers can you actually reach? Count them bottom-up."
- AI products with no per-user model cost → "What does one active user cost you in model/API calls per month at realistic usage?"

## Step 5: Produce the artifact

Write `docs/product/business-model.md` using `templates/business-model.md`.

Frontmatter: `type: business-model`, `product`, `tier`, `status`, `created`, `updated`, `skill: product:viability`, `related:` (assumptions, critique, go-to-market if present).

- **Lite:** Goal & Constraints, Revenue Model, Pricing Hypothesis, Ramen Math, Red Flags, Verdict, Viability Assumptions Added. Mark Market, Unit Economics, Cost & Runway, Funding Path `[deferred]`.
- **Pro:** all sections. Funding Path carries the line: `Not legal/tax advice — verify with a qualified professional in your jurisdiction.`

**Verdict — exactly one, mandatory:**
- **Math works** — targets reachable on stated assumptions; name the assumption most worth testing anyway
- **Math works only if [named assumption]** — e.g. "only if trial→paid ≥ 8%"
- **Math doesn't work** — plus **the lever** that would change it: price, segment, revenue model, or scope of goal

## Step 6: Update related artifacts

Append viability rows to `docs/product/assumptions.md` using the canonical table (`docs/conventions.md` §5): next free A-ID, Type `viability` (or `distribution` for CAC rows), Source `viability`, Evidence as labeled, Verdict `pending`. Always add rows for: price point accepted, willingness to pay, churn rate, and (pro) CAC per chosen channel. Rate risk yourself; if the founder disagrees, record the agreed value after confirming.

If the file uses the legacy list format, show the migration diff and ask before converting.

## Step 7: Summarize

```
Business model → docs/product/business-model.md

Goal: [$X/mo by date] — [side | ramen | salary | venture]
Price: $[P]/[unit] — anchored to [alternative @ $Y]
Customers needed: [N] paying · [M] new/month at [churn]% churn
[pro] LTV:CAC [ratio] · payback [months] · break-even [N] customers

Verdict: [MATH WORKS | MATH WORKS ONLY IF … | MATH DOESN'T WORK]
Lever: [if not "works"]

Assumptions added: [A-IDs] ([N] high-risk)

Recommended next step:
  [only if / doesn't work]: product:experiment — pre-sale test on [A-ID: willingness to pay at $P]
                            or re-run product:viability with a different segment/price
  [works, no go-to-market.md]: product:gtm — the CAC and conversion above need a real channel
  [works, gtm exists]: product:model
```

## Fallback questions (if recipe unavailable)
1. "How much does this need to earn per month, and by when?"
2. "Who pays, from which budget, and what do they pay for the alternative today?"
3. "What price, per what unit? Then: how many paying customers does that mean for your target?"
4. "What monthly churn and trial-to-paid conversion are you assuming — and based on what?"
5. "What does one active customer cost you per month (infra, AI/API, payment fees, tools)?"

## Pivot interrupt
If the math reveals the goal is unreachable with this user or model ("there are only 200 of these companies", "they'd never pay that"):
1. Stop the interview
2. Write what exists with `status: draft` and the Verdict `Math doesn't work` plus the discovered constraint
3. Add the constraint as an assumption row (Risk `high`, Source `viability`)
4. Say: "Pivot signal: [constraint]. Options: different segment (re-run product:discover), different revenue model (re-run product:viability), or smaller goal. product:critique can stress-test the reframe."

## Artifact naming
Living document — updated in place. On re-run, enter update mode: show current Verdict and key numbers, ask what changed (real prices, real churn, new segment), and append a change note to frontmatter:
```yaml
changes:
  - date: YYYY-MM-DD
    note: "Price raised $19→$39 after pre-sale; verdict now Math works"
```
Never silently overwrite a number that came from real data with an estimate.

## Rules

- Every number carries a label: `[sourced]`, `[estimate]`, or `[founder-stated]`. No unlabeled numbers.
- Show every formula with the inputs substituted. No bare results.
- Market size is bottom-up only — reachable customers counted from sources. Top-down TAM is never used as justification.
- Price comes from value and alternatives, never from cost-plus.
- AI/LLM products must show per-user model/API cost per month. Missing = red flag.
- Verdict is mandatory and one of the three. "Needs more data" is not a verdict — name the test instead.
- Do not soften the verdict because the founder has already built something (§8).
- Funding, tax, and legal content are checklists with the §9 disclaimer, never advice.
- Never invent competitor prices or market counts. If search is unavailable, write the research checklist.
