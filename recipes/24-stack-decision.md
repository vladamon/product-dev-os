---
id: 24-stack-decision
phase: architect
tier-lite: true
tier-pro: true
produces: docs/product/architecture.md
skill: product:stack
---

# Recipe: Stack Decision

## When to use

Use this when starting a new codebase, restarting one, or when a solo project feels heavier to operate than to build. The goal is an architecture a single person can ship, run, and afford — and a written record of what was deliberately left out.

Solo builders rarely fail from choosing the "wrong" framework. They fail from choosing an unfamiliar one, building commodity infrastructure (auth, billing, queues) instead of the product, and running a platform sized for a company they don't have.

For the structure of a single feature inside an existing codebase, use `recipes/13-technical-architecture.md` (via `product:build`). This recipe is the project-level decision that one builds on.

## Inputs

- Product model: core objects, lifecycle states, roles (or audit report for an existing codebase)
- Business model if it exists: price point and per-user cost assumptions
- Codebase signals: manifests, lockfiles, hosting and CI config
- `docs/playbooks.md` → "Stack profiles": deployment rubric and arche-ui profile-fit check

## Principles

1. **Use what you know.** Shipping speed in a familiar stack beats theoretical fit of a new one.
2. **Managed by default.** Build only what differentiates the product.
3. **Boring shape.** One monolith, one database, one deploy target.
4. **Innovation tokens.** At most 2 technologies new to the founder, each justified by a product requirement.
5. **Cost before scale.** Know the monthly bill at 0, 100, and 1,000 active users before committing.
6. **Write down what you're not doing.** An explicit Not Now list stops re-litigating it every week.

## Capability defaults

| Capability | Default | Build only if |
|---|---|---|
| Auth & sessions | managed auth provider or framework-native auth library | regulated identity flows the vendor can't support |
| Billing & subscriptions | payment provider's hosted checkout + customer portal | usage model the provider can't express |
| Sales tax / VAT | merchant of record, or provider tax add-on | never at MVP |
| Transactional email | managed email API | never |
| File storage | object storage bucket | never |
| Background jobs | framework job library on the same database, or managed queue | throughput a DB-backed queue can't handle |
| Search | database full-text search | relevance is the core product |
| Product analytics | managed analytics | never |
| Error monitoring & logs | managed error tracking + host logs | never |
| Admin / back-office | framework admin generator or direct DB console | customer-facing admin is the product |
| AI / LLM | hosted model API behind one internal interface | data may not leave the premises |

## Lite version (5 questions)

1. **Which languages and frameworks have you shipped real things in during the last two years?**
2. **What is the monthly spend ceiling before revenue?**
3. **Realistically, how many active users in 12 months?**
4. **Here are the capability defaults — which do you intend to build yourself, and what product requirement forces each?**
5. **Where will it run, and how does a change reach production?** (Match a row of the deployment rubric.)

Produce: Constraints + Capabilities + Architecture Shape + Hosting & Deploy + Not Now.

## Pro version (10 questions)

Ask lite questions 1–5, then:

6. **Which choices are new to you?** List each with the requirement that justifies it. (Innovation tokens — max 2.)
7. **For each core object: where is it stored, what does it reference, and which column holds its lifecycle state?**
8. **Any platform needs beyond web?** (mobile, desktop, offline, browser extension) and **any data residency or compliance constraints?**
9. **What does each managed service cost at 0, 100, and 1,000 active users?** (Research pricing pages; label per conventions §7.)
10. **Security & privacy baseline:** Where do secrets live? When was a backup last restored? Which personal data is stored, and how is it deleted on request?

Produce: all sections of `templates/architecture.md`.

## Output structure

`docs/product/architecture.md` — use `templates/architecture.md`. Living document; changes append to the Decisions log.

## Exit condition

The founder can say, in one breath, what the product is built with, where it runs, what it costs per month at 1,000 users, and three things they are deliberately not building — and every "build" has a product reason next to it.

## AI review prompt

1. Is any capability being built that a managed service handles well? What is the stated product reason, and is it real?
2. Are more than 2 technologies new to the founder? Which one is résumé-driven?
3. Does the data model sketch cover every core object and lifecycle state in the product model?
4. Is the cost table sourced, and does cost at 1,000 users fit the business model's price?
5. Is anything in the architecture (queues, services, regions, orchestration) sized for a scale the 12-month plan doesn't reach?
6. Is the Not Now list specific enough to reject a future "should we add X" in one sentence?

## Checklist

- [ ] Default stack matches what the founder has shipped with, or the exception is justified
- [ ] Every capability has a build/buy decision; every "build" has a product reason
- [ ] Innovation tokens ≤ 2, each named with its requirement
- [ ] Hosting matches a deployment rubric row in `docs/playbooks.md`; arche-ui fit recorded for Next.js frontends
- [ ] (pro) Every core object and lifecycle state maps to storage
- [ ] (pro) Cost at 0 / 100 / 1,000 users, every figure labeled
- [ ] (pro) Security & privacy baseline filled, with the §9 disclaimer
- [ ] Not Now list has at least 3 specific items
