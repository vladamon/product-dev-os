---
type: architecture
product: PRODUCT_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:stack
related:
  product-model: docs/product/product-model.md
  audit: docs/product/audit.md
  business-model: docs/product/business-model.md
---

# Architecture — PRODUCT_NAME

## Constraints

**Founder ships fast in:** [languages / frameworks]
**Monthly spend ceiling before revenue:** [amount]
**Realistic active users in 12 months:** [number]
**Platforms:** [web / mobile / desktop / offline]
**Compliance / data residency:** [none / specifics]
**AI / LLM needs:** [none / what, with per-user cost assumption]

## Capabilities

| Capability | Build / Buy | Vendor or approach | Why |
|------------|-------------|--------------------|-----|
| Auth | | | |
| Billing & tax | | | |
| Email | | | |
| File storage | | | |
| Background jobs | | | |
| Search | | | |
| Analytics | | | |
| Error monitoring & logs | | | |
| Admin / back-office | | | |
| AI provider | | | |

## Architecture Shape

[Monolith / other — one sentence. Framework, database, starter kit if any. Justify anything beyond one app + one database.]

## Innovation Tokens

[Max 2. Technologies new to the founder.]

| Technology | Product requirement that justifies it |
|------------|---------------------------------------|
| | |

## Data Model Sketch

| Core object | Storage | Key relationships | Lifecycle state field |
|-------------|---------|-------------------|-----------------------|
| | | | |

## Hosting & Deploy

**Deployment profile:** [row name from docs/playbooks.md → "Stack profiles" deployment rubric]
**Host / CI:** [where it runs, how a change reaches production]
**arche-ui fit:** [full / docs 00–15 only / not applicable]

## Cost at Scale

| Vendor | 0 users | 100 users | 1,000 users | Label |
|--------|---------|-----------|-------------|-------|
| | | | | [sourced: url, accessed YYYY-MM-DD] / [estimate: method] |
| **Total / month** | | | | |

## Security & Privacy Baseline

Not legal/compliance advice — verify with a qualified professional in your jurisdiction.

- **Secrets:** [where they live; never in the repo]
- **Auth hardening:** [rate limits, session expiry, admin protection]
- **Backups:** [frequency; last tested restore date]
- **Keys:** [least-privilege scoping]
- **Personal data stored:** [inventory]
- **Deletion path:** [how a user's data is removed on request]

## Not Now

[At least 3 specific things deliberately postponed, with the trigger that would bring each back.]

- [Thing] — revisit when [trigger]

## Decisions Log

| Date | Decision | Replaces | Reason |
|------|----------|----------|--------|
| YYYY-MM-DD | Initial architecture | — | product:stack |

---
*Updated YYYY-MM-DD via product:stack*
