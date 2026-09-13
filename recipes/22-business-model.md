---
id: 22-business-model
phase: money-reach
tier-lite: true
tier-pro: true
produces: docs/product/business-model.md
skill: product:viability
---

# Recipe: Business Model & Money Math

## When to use

Use this after discovery (or an audit) and before committing to build — and again whenever real prices, churn, or conversion data arrive. The question is not "could this make money in theory" but "how many customers, at what price, acquired at what cost, does the founder's goal require — and is that plausible?"

Most indie products that fail on viability didn't have a bad idea. They had a price too low for their channel, a market too small for their goal, or (for AI products) a per-user cost that ate the margin. All three are visible on one page before a line of code.

## Inputs

- Product promise and primary users (`docs/product/product-model.md`)
- Assumption map (`docs/product/assumptions.md`) or audit
- Optional: critique landscape (alternatives' prices), interview synthesis (spend on workarounds), go-to-market (channels)

## The formulas

Show each with inputs substituted. Label every input `[sourced]`, `[estimate]`, or `[founder-stated]`.

**Ramen math**
```
Paying customers needed    = target MRR ÷ ARPU
New customers per month    = paying customers × monthly churn        (just to hold steady)
Trials/leads per month     = new customers per month ÷ trial→paid conversion
```

**Unit economics (pro)**
```
Gross margin %   = (ARPU − variable cost per customer) ÷ ARPU
                   variable cost = infra + AI/API per active user + payment fees + per-seat tools
LTV              = ARPU × gross margin % ÷ monthly churn
CAC (per channel)= channel spend (money + founder hours × hourly value) ÷ customers acquired
LTV : CAC        target ≥ 3 : 1
Payback months   = CAC ÷ (ARPU × gross margin %)          target ≤ 12, indie ≤ 6
Break-even       = monthly fixed costs ÷ (ARPU × gross margin %)
```

**Bottom-up market (pro)**
```
Reachable customers = count of target accounts you can name a source for   [sourced]
Revenue ceiling     = reachable customers × realistic capture % × ARPU × 12
```

### Worked mini-example

Goal: replace a $5,000/mo salary. Product: proposal tool for freelance consultants.
- ARPU $29/mo `[founder-stated]`, anchored to PandaDoc Essentials `[sourced: pricing page]`
- Paying customers needed = 5,000 ÷ 29 = **173**
- Monthly churn 5% `[estimate: typical SMB SaaS range]` → 173 × 0.05 = **9 new customers/month** to hold
- Trial→paid 4% `[estimate]` → 9 ÷ 0.04 = **225 trials/month**
- Variable cost: infra $0.40 + AI $2.10 (≈70 generations × $0.03) + fees $1.14 = $3.64 → margin 87%
- LTV = 29 × 0.87 ÷ 0.05 = **$505** → CAC ceiling at 3:1 ≈ **$168**
- Verdict: **Math works only if** the founder can drive ~225 trials/month without paid ads (cold outreach + communities), because $168 CAC rules out most paid channels for this segment.

## Lite version (5 questions)

1. **What does this need to earn per month, by when?** Side income / ramen-profitable / replace salary / venture-scale. How many hours a week can you give it?
2. **Who pays, and from which budget?** User, manager, company card, procurement?
3. **What is the revenue model?** Subscription, usage-based, one-time/lifetime, marketplace take rate, or services-first then productize?
4. **What price, per what unit — anchored to what?** Name the alternative they pay for today and its price.
5. **What churn and trial→paid conversion are you assuming, and why?** Then run ramen math and ask: "Is [T] trials/month reachable with your hours?"

Produce: Goal & Constraints, Revenue Model, Pricing Hypothesis, Ramen Math, Red Flags, Verdict.

## Pro version (add 5 questions)

6. **How many target customers can you actually reach?** Count them from named sources (directories, LinkedIn searches, community sizes, registries). No top-down TAM.
7. **What does one active customer cost you per month?** Infra, AI/API at realistic usage, payment fees, per-seat tools. Then fixed monthly costs at 0 / 100 / 1,000 customers.
8. **Which channels, at what cost per customer?** Include founder hours at an hourly value.
9. **What is your runway?** Months you can work on this before it must pay; months to target at a plausible growth rate.
10. **Which funding path fits?** Bootstrap, pre-sales, services revenue, grants, angels, VC — and does the revenue ceiling match VC-scale ambition? *(Not legal/tax advice.)*

Produce: all sections including Market, Unit Economics, Cost & Runway, Funding Path.

## Red flags to check (every tier)

- Low-price B2C (< ~$10/mo) that depends on paid acquisition
- Bottom-up revenue ceiling below the founder's income target
- Per-user AI/infra cost > ~30% of price, or unknown for an AI product
- The plan needs trial→paid > ~10% or churn < ~2% to work
- Buyer ≠ user with no plan to reach the buyer
- Founder hours can't produce the required leads/month

## Output structure

`docs/product/business-model.md` — use `templates/business-model.md`. Lite marks Market, Unit Economics, Cost & Runway, Funding Path as `[deferred]`.

Viability assumptions go into `docs/product/assumptions.md` (canonical table, Source `viability`): price accepted, willingness to pay, churn, conversion, CAC per channel.

## Exit condition

You can state in one sentence: "To earn $X/mo I need N customers at $P, which means M new per month at C% churn, acquired at under $Y each — and that is [plausible because… / only plausible if… / not plausible]." The verdict is one of: **Math works** · **Math works only if [assumption]** · **Math doesn't work** (+ the lever).

## AI review prompt

1. Does every number carry a `[sourced]`, `[estimate]`, or `[founder-stated]` label? Are any "sourced" claims actually guesses?
2. Is the price anchored to value and alternatives, or to cost and gut feel?
3. Is the market bottom-up with real sources, or top-down TAM wearing a disguise?
4. For AI products: is per-user model cost present and realistic at heavy usage?
5. Is the verdict supported by the arithmetic, or softened because the founder is invested?
6. Did the weakest input (usually conversion or churn) become a high-risk assumption row?

## Checklist

- [ ] Income goal, date, and weekly hours stated
- [ ] Payer and budget named
- [ ] Price anchored to at least one named alternative with its price
- [ ] Ramen math shown with formulas and substituted inputs
- [ ] Every number labeled
- [ ] Red flags checked explicitly (none found is stated, not omitted)
- [ ] Verdict is one of the three, with the lever if not "works"
- [ ] Viability assumptions added to assumptions.md with A-IDs
- [ ] (pro) Bottom-up market count with sources; unit economics; cost at 0/100/1,000; funding path with disclaimer
