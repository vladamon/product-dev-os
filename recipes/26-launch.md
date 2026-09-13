---
id: 26-launch
phase: launch
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[launch-slug]-launch.md
skill: product:launch
---

# Recipe: Launch

## When to use

Use this when something is built and you're about to put it in front of real users — a private beta, a public beta, or a public launch. Launches are plural: each one gets its own file, its own threshold, and its own recorded result.

Two jobs, in this order:
1. **Readiness** — nothing that loses users' data, money, or trust goes out. Everything else is allowed to be rough.
2. **Reach** — the right people hear about it, in a planned sequence, with a success threshold set *before* launch so the result can't be reinterpreted afterward.

The failure modes this prevents: launching into silence ("build it and they will come"), launching with no way to see whether anyone activated, and delaying for polish that no first user would notice.

## Inputs

- At least one `docs/specs/*-build.md` (required) and its pitch's done criteria
- `docs/product/go-to-market.md` — ICP, watering holes, one-liner (recommended)
- `docs/product/journeys/*-telemetry.md` — activation event (recommended)
- `docs/product/business-model.md`, `docs/product/architecture.md` — pricing, payment and monitoring vendors (optional)
- Prior `docs/specs/*-launch.md` files — what previous launches taught

## Blocker vs nice

Every readiness item is classified:
- **Blocker** — if it fails, a user loses data, is charged wrongly, can't get help, or has their trust breached. Blockers stop the launch.
- **Nice** — makes the launch better. Never stops it.

A founder may move an item from blocker to nice only by writing the reason next to it.

## Lite version (5 questions)

1. **What are you launching, to whom?** Private beta / public beta / public launch — and one sentence on who should show up.
2. **Walk the core journey in production as a brand-new user.** Sign up → first value. Where did it break or stall?
3. **What would count as a hit within 14 days?** Signups, activated users, paying users — numbers, set now.
4. **Where do your first users already gather, and which one channel goes first?**
5. **What date, and what will you do in the 7 days after?**

Produce: blockers-only readiness + one channel + threshold + date + follow-up.

## Pro version (lite + 5)

6. **Go through the full readiness checklist.** For each item not verifiable from the repo: done, not done, or not applicable — and blocker or nice?
7. **Which channels, in what order, with which asset each?** Check each platform's current self-promotion rules before committing.
8. **What happens T-14 through T+7?** Dated tasks, not categories.
9. **Launch-day runbook:** who watches monitoring, who answers comments, what gets hotfixed same-day, what waits?
10. **How will first users' feedback reach you, and what do you do with it?**

Produce: full launch file.

## Record questions (after launch)

1. What were the raw numbers for each threshold metric?
2. Which channel produced activated users, not just visits?
3. Any false-positive signal (traffic spike without activation, friends signing up)?
4. Verdict: hit / partial / miss?
5. What does this change about the next launch, the ICP, or the product?

## Output structure

```markdown
---
type: launch
product: [Product Name]
launch: [Launch name]
launch_type: [private-beta | public-beta | public-launch]
tier: [lite|pro]
status: [planned | launched | complete]
verdict: [pending | hit | partial | miss]
launch_date: YYYY-MM-DD
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:launch
related:
  build: docs/specs/YYYY-MM-DD-[slug]-build.md
  go_to_market: docs/product/go-to-market.md
  telemetry: docs/product/journeys/[slug]-telemetry.md
---

# Launch: [Launch Name]

## Launch type
[Private beta / public beta / public launch] — [who this is for, one sentence]

## Readiness

### Blockers
- [ ] **Product** — core journey works end-to-end in production (verified by: [who, when])
- [ ] **Product** — empty and error states on the core journey don't dead-end
- [ ] **Measurement** — activation event defined and verified firing in production
- [ ] **Payments** — live mode tested with a real card; refund path works; receipts sent
- [ ] **Trust** — privacy policy and terms published; data deletion path exists
- [ ] **Ops** — error monitoring on; backups exist and a restore was tested
- [ ] **Ops** — support channel live with a stated response time
- [ ] **Security** — no secrets in the repo; rate limiting on auth and public forms; admin routes protected

### Nice
- [ ] First-run onboarding that gets to value in under [N] minutes
- [ ] Uptime check and status page
- [ ] Pricing page; social preview images; short demo (video / GIF / screenshots)
- [ ] Cookie consent where required; sales tax / VAT approach decided (merchant of record vs self-managed)

> Payments, trust, legal, and tax items: Not legal/tax advice — verify with a qualified professional in your jurisdiction.

[Reclassified items: "[item] → nice — reason: [...]"]

## Threshold (set before launch)
| Metric | Threshold (14 days) | Primary? |
|---|---|---|
| [Activated users] | [N] | yes |
| [Signups] | [N] | no |
| [Paying users] | [N] | no |

## Channels & assets
| Order | Channel | Audience fit (from go-to-market) | Asset needed | Platform rules checked |
|---|---|---|---|---|
| 1 | [named channel] | [why] | [asset] | [sourced: url, accessed YYYY-MM-DD] |

## Timeline
- T-14 … T-8: [dated tasks]
- T-7 … T-1: [dated tasks]
- T0 (YYYY-MM-DD): [launch-day tasks]
- T+1 … T+7: [follow-up tasks]

## Runbook (launch day)
- Monitoring: [who, what dashboard]
- Comments/replies: [who, which channels, how often]
- Hotfix same-day: [classes of bugs]
- Postponed: [everything else]

## Follow-up loop
- Reply to every comment and signup within [N] hours
- Offer onboarding calls to the first [N] users
- Founder drops call notes and feedback into `docs/intake/interviews/` → `product:interview synthesize`

## Results
[Filled by record mode — raw numbers per threshold metric, per-channel breakdown]

## Verdict
[Filled by record mode — hit / partial / miss, false positives, what this changes]
```

## Exit condition

Planning is done when every blocker is either checked or has a dated owner, the threshold is written, and the first channel has a date. Recording is done when the verdict is filled with numbers — "it went well" is not a verdict.

## AI review prompt

1. Is anything classified "nice" that would actually lose a user's data, money, or trust?
2. Is any "blocker" really polish that no first user would notice?
3. Can activation actually be observed on launch day, or is the threshold unmeasurable?
4. Are channels named concretely and matched to where the ICP gathers — or generic ("social media")?
5. Does the channel plan respect each platform's self-promotion rules, sourced rather than assumed?
6. Is the threshold ambitious enough to mean something and specific enough to produce a binary verdict?

## Checklist

- [ ] Launch type stated
- [ ] Every readiness item classified blocker or nice; reclassifications have reasons
- [ ] Activation is observable (telemetry or an explicit manual method)
- [ ] Threshold set before launch, with one primary metric
- [ ] At least one channel named concretely, with date and asset
- [ ] Platform rules sourced for each channel
- [ ] Follow-up loop defined
- [ ] After launch: Results and Verdict filled via record mode
