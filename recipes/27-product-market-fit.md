---
id: 27-product-market-fit
phase: learn
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-pmf.md
skill: product:pmf
---

# Recipe: Product-Market Fit Review

## When to use

Use this when the product is live with real users and the question is no longer "did this feature work?" (`product:reflect`) but "is this product working, and should I keep going?"

Solo founders rarely die from one bad decision. They die from never deciding — drifting for a year on "some people like it." This review forces a verdict from evidence and a decision from a fixed set, with a date when the decision gets re-examined.

Run it 4–8 weeks after a launch, then at the next-review date it sets.

## Inputs

- `docs/specs/*-launch.md` with recorded Results — or founder confirmation of live users
- `docs/product/journeys/*-telemetry.md` — activation, retention, events
- `docs/product/business-model.md` — pricing, churn, income target
- `docs/product/go-to-market.md` — the intended ICP
- `docs/research/*-synthesis.md`, `docs/specs/*-retro.md`, prior `*-pmf.md` files

## Definitions

- **Active user** — performed the core value action (not "logged in") within the problem's natural frequency window. A weekly problem: last 14 days. A monthly problem: last 45 days.
- **Flattening retention** — a cohort's retained share stops declining and holds above zero. A curve that keeps sliding toward zero is not fit, however high it starts.
- **Vanity metrics** — signups, pageviews, followers, upvotes, waitlist size, praise. Recorded, never used as fit evidence.

## Sean Ellis survey

Send to users who experienced the core value, used the product at least twice, and were active in the last 2 weeks:

1. How would you feel if you could no longer use [product]? — *Very disappointed* / *Somewhat disappointed* / *Not disappointed (it isn't really that useful)* / *N/A — I no longer use it*
2. What type of person do you think would most benefit from [product]?
3. What is the main benefit you receive from [product]?
4. How can we improve [product] for you?

Interpretation: ≥40% *very disappointed* is the widely used benchmark. Below ~30 responses, treat the result as directional. Below 40% overall, segment the "very disappointed" group (question 2 + their usage) — that segment is where fit is closest.

## Verdicts

| Verdict | Evidence pattern (OS heuristics — adjust to the product) |
|---|---|
| **Too early** | Fewer than 10 active users, or cohorts too young to show a curve (<4 weeks) |
| **No fit** | No cohort flattens; no segment shows pull; survey far below 40% |
| **Signal in [segment]** | One segment's cohort flattens or clears 40%; overall does not |
| **Approaching** | Overall retention flattens but low; or survey 25–39%; acquisition still founder-driven |
| **Strong** | Retention flattens at a level the business model can live on, ≥40% very disappointed (≥30 responses), some organic or referral acquisition |

## Decisions

| Decision | When |
|---|---|
| **Persevere-narrow** | Pull exists in a segment — double down on it; narrow the ICP. With *Too early*, this means "get to N active users in the ICP by [date]", not "build more" |
| **Iterate core** | Users arrive and try it, but the core value isn't landing — name what changes |
| **Pivot** | Typed: customer segment · problem · solution · channel · revenue model · platform |
| **Kill** | No pull after an honest attempt — with a shutdown plan |

## Lite version (5 questions)

1. **How many active users do you have, by the definition above?** What's the problem's natural frequency?
2. **Take your earliest cohorts: what share were still active at week 1, 4, and 8?** Does the curve flatten?
3. **What signal of pull exists** — users complain when it breaks, ask for more, pay without negotiating, refer others?
4. **If you were starting today, knowing what you know, would you start this?**
5. **Decision: persevere-narrow, iterate core, pivot, or kill?**

Produce: evidence inventory + retention + verdict + decision + next review.

## Pro version (lite + 5)

6. **Survey:** has the Sean Ellis survey been run? Results and response count — or generate it now and schedule it.
7. **Segments:** which segment retains best and says "very disappointed" most? Is it the ICP in `go-to-market.md`?
8. **Revenue quality:** paying conversion, revenue churn, discounts, and how many payers are friends or network.
9. **Acquisition:** what share of new active users came organically or by referral vs founder outreach?
10. **If pivot or kill:** which pivot type, or what does shutdown require?

## Output structure

```markdown
---
type: pmf-review
product: [Product Name]
tier: [lite|pro]
status: complete
verdict: [too-early | no-fit | signal-in-segment | approaching | strong]
decision: [persevere-narrow | iterate-core | pivot | kill]
next_review: YYYY-MM-DD
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:pmf
related:
  launch: docs/specs/YYYY-MM-DD-[slug]-launch.md
  business_model: docs/product/business-model.md
  go_to_market: docs/product/go-to-market.md
  previous_review: docs/specs/YYYY-MM-DD-pmf.md
---

# Product-Market Fit Review — [YYYY-MM-DD]

## Evidence inventory
| Signal | Value | Source |
|---|---|---|
| Active users ([definition]) | [N] | [telemetry / manual count] |
| Paying customers | [N] | [billing] |
| Revenue churn (monthly) | [%] | [billing] |
| Organic/referral share of new actives | [%] | [analytics / asking] |
| Qualitative pull | [quotes with source file] | [synthesis / support] |

## Retention
| Cohort | Size | Wk 1 | Wk 4 | Wk 8 | Flattening? |
|---|---|---|---|---|---|
| [YYYY-MM-DD week] | [N] | [%] | [%] | [%] | [yes/no/too young] |

Natural frequency of the problem: [weekly / monthly / ...]

## Survey (pro)
[Responses N · very disappointed %] — or [not run; scheduled for YYYY-MM-DD]

## Segments (pro)
| Segment | Actives | Retention wk 4 | Very disappointed | Matches ICP? |
|---|---|---|---|---|

## Vanity metrics excluded
[Signups, views, followers, praise — listed with values, not used]

## Sunk-cost answer
[Founder's answer to "would you start this today?" — verbatim]

## Verdict
**[Too early / No fit / Signal in <segment> / Approaching / Strong]**
[Reviewer's assessment with evidence. Founder disagreement, if any: ...]

## Decision
**[Persevere-narrow / Iterate core / Pivot (type) / Kill]**
[Rationale — what specifically changes next]

## Shutdown plan (kill only)
- Sunset date and user notice (≥30 days where users rely on it)
- Data export for users; deletion after sunset
- Stop billing; refunds for prepaid periods
- Vendor, domain, and infrastructure shutdown with dates
- Post-mortem → `product:reflect`-style lessons
> Not legal/tax advice — verify contractual, refund, and data-protection obligations with a qualified professional in your jurisdiction.

## Next review
Date: YYYY-MM-DD
Flip thresholds: if [metric] ≥ [X] by then → [decision]; if ≤ [Y] → [decision]
```

## Exit condition

The review is complete when the verdict cites numbers or sourced quotes, the decision is one of the four, and the next review has a date and flip thresholds. "Keep going and see" is not a decision.

## AI review prompt

1. Is any vanity metric doing the work of fit evidence?
2. Does the verdict match the retention curve, or the founder's hopes?
3. Is "Signal in [segment]" a real segment with numbers, or a rescue narrative?
4. Is sunk cost driving a persevere decision? Compare the sunk-cost answer to the decision.
5. If kill: does the shutdown plan protect users' data and money?
6. Are flip thresholds specific enough that the next review can't be argued away?

## Checklist

- [ ] Active user defined by the core value action and natural frequency
- [ ] At least one cohort retention row — or verdict is Too early
- [ ] Vanity metrics listed and excluded
- [ ] Sunk-cost question asked and answered verbatim
- [ ] Verdict from the fixed set, backed by numbers
- [ ] Decision from the fixed set; pivot typed; kill has a shutdown plan
- [ ] Next review date and flip thresholds set
