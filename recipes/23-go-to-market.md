---
id: 23-go-to-market
phase: money-reach
tier-lite: true
tier-pro: true
produces: docs/product/go-to-market.md
skill: product:gtm
---

# Recipe: Go-to-Market & First Customers

## When to use

Use this before building — distribution is an assumption like any other, and for solo builders it is the one most often left untested. Use it again after a launch that produced no traction, and whenever the beachhead changes.

Most indie products don't die because the product was bad. They die because nobody heard of them, and the founder kept polishing instead of selling. This recipe forces the plan to be concrete enough to start on Monday: a named segment, named places, named people, a named first channel, and a threshold that says whether it worked.

Draws on: *Traction* (Weinberg & Mares) bullseye framework; "do things that don't scale" (founder-led first customers); positioning from recipe 05.

## Inputs

- Product promise and primary users (`docs/product/product-model.md`)
- Optional: `docs/product/business-model.md` (CAC ceiling, trials/month needed), critique landscape, interview synthesis (users' words, how they find tools), launch Results (post-launch)

## Traction channels (for the bullseye)

Communities & forums · Content & SEO · Cold outreach (email/LinkedIn) · Partnerships & integrations · Marketplaces & app stores (Shopify, Chrome, Slack, Zapier, Figma…) · Product-led / viral loops (invites, shared artifacts, "made with") · Paid ads · Audience / build-in-public · Launch sites & directories · Direct sales · Engineering-as-marketing (free tools, calculators) · Events & meetups · Newsletters & podcast sponsorships · Affiliates & referrals

## Lite version (5 questions)

1. **Who has this problem worst and can you reach this month?** Role, situation, trigger event, where the budget sits. Who is explicitly *not* the beachhead?
2. **Where do these exact people gather?** Named communities, subreddits, Slack/Discord groups, newsletters, events, marketplaces, and the search queries they type. (Research first; present findings labeled.)
3. **Which single channel will you test first — and why that one?** It must be concrete and fit the CAC ceiling if one exists.
4. **Who are your first 30 prospects, and what will you say?** Names, or the exact list/search they come from. Weekly contact quota.
5. **Describe the product in one sentence using your users' words for the pain.**

Produce: Beachhead ICP, Watering Holes, one Inner-Ring Channel, First 10 Customers, one-liner + headline.

## Pro version (add 5 questions)

6. **Bullseye:** brainstorm one idea per traction channel (outer ring) → which 3–5 are plausible for this beachhead (middle ring) → which 1–2 do you test now (inner ring)? For each middle-ring channel: cost, time to signal, CAC fit.
7. **Messaging:** pain-led headline, three proof points, top three objections with answers, and the "instead of [alternative]" line.
8. **What's your offer for the first 10?** Concierge onboarding, founding-member price, done-for-you setup, direct line to the founder.
9. **How many hours a week go to distribution** vs building? (Heuristic once an MVP exists: at least half.)
10. **For each inner-ring channel: what result, in how many days, means it works?** These become smoke tests for `product:experiment`.

Produce: all sections including Channel Bullseye, full Messaging, Time Budget, Channel Experiments.

## Post-launch diagnosis ("launched and nobody came")

Before proposing anything new, read the launch Results and classify the failure per channel:

| Symptom | Diagnosis | Fix route |
|---|---|---|
| Few people saw it | Wrong channel or too little reach | New inner-ring channel |
| Many saw, few clicked | Wrong message or wrong audience | Messaging / beachhead |
| Many signed up, few activated | Product/onboarding, not distribution | `product:interview synthesize`, `product:shape` |
| Activated, didn't pay | Pricing / value | `product:viability` |

More traffic on a product that doesn't activate is waste.

## Output structure

`docs/product/go-to-market.md` — use `templates/go-to-market.md`. Lite marks Channel Bullseye, full Messaging, Time Budget, Channel Experiments as `[deferred]`.

Distribution assumptions go into `docs/product/assumptions.md` (canonical table, Type `distribution`, Source `gtm`).

## Exit condition

You could start on Monday morning: you know exactly which segment, which community or list, which 30 people, what message, and what number in how many days tells you whether the channel works.

## AI review prompt

1. Is the beachhead narrow enough that you could name 20 real members of it? Or is it a category?
2. Are the watering holes real, named, and labeled — or invented/generic ("LinkedIn", "Twitter")?
3. Does the inner-ring channel fit the CAC ceiling and the founder's hours?
4. Does the first-10 plan name people or exact sources, with an outreach message that respects platform rules?
5. Is the one-liner in the user's words, or product-team jargon?
6. Post-launch: was the failure diagnosed before more distribution was prescribed?

## Checklist

- [ ] Beachhead names role, situation, trigger, and exclusions
- [ ] At least 3 watering holes named concretely, each labeled per research protocol
- [ ] Inner-ring channel(s) concrete and CAC-checked (or "no business model" noted)
- [ ] First-10 plan: source of 30 prospects, outreach script, offer, weekly quota
- [ ] One-liner in the user's words
- [ ] Distribution assumptions added to assumptions.md with A-IDs
- [ ] (pro) Bullseye outer/middle/inner rings; objections answered; time budget; experiment thresholds with time boxes
