---
id: 00-audit
phase: discovery
tier-lite: true
tier-pro: true
produces: docs/product/audit.md
skill: product:audit
---

# Recipe: Product Audit

## When to use

Use this recipe when you have an existing product, codebase, or MVP that needs to be understood before it can be improved. This is the entry point for the revamp track — it replaces `product:discover` when the product already exists.

Use it when:
- A product feels incoherent and you can't articulate why
- You're inheriting a codebase someone else built
- You're starting a major revamp and need to understand current state before designing future state
- The gap between what the product is and what it should be is unclear

## Inputs

- The codebase (read file tree, routes, components, type definitions)
- Any existing docs (`docs/product/`, `docs/specs/`, `docs/screens/`)
- Optional: user-specified context files (`docs/intake/`, passed via `--from`/`--using`)

No formal inputs required — the skill extracts what it can from what exists.

## Lite version (3–5 questions)

Ask these questions one at a time:

1. **What is this product?** One sentence — what it does and who it's for.
2. **What are the top 3 things that are broken, inconsistent, or confusing?**
3. **What must not change?** What's working or what users depend on.
4. **What is the goal of this revamp?** What does success look like?
5. **Who are the primary users and how technical are they?** (Skip if clearly inferable.)

Produce: Screen inventory (from codebase reading) + top 5 problems.

## Pro version (8–12 questions)

Ask lite questions 1–5, then continue:

6. **Walk me through the main user journey.** From arrival to primary goal accomplished.
7. **What does the current terminology look like?** Concepts with multiple names, or confusing names?
8. **What states can the main entity be in?** Does the UI represent those states clearly?
9. **What are the most common user complaints or support requests?**
10. **How does the current information architecture feel?** Can users find what they need?
11. **What technical debt or frontend architectural decisions are making the product harder to improve?**
12. **Are there any screens or features that should be removed entirely?**

Produce: Full audit report including object model, state language audit, terminology gaps, IA gaps, and prioritized problem list.

## Output structure

Use `templates/audit-report.md`. All sections required for pro; screen inventory + prioritized problem list minimum for lite.

## Exit condition

The audit is done when you can answer: "What are the 5 most important problems to solve and in what order?" If you cannot answer that, the audit is incomplete.

## AI review prompt

After producing the artifact, review it against:
1. Is the prioritized problem list actually prioritized, or is it just a list?
2. Is every inconsistency specific enough to act on, or is it vague?
3. Does the extracted object model reflect what's actually in the codebase?
4. Is the "what must not change" section honest, or does it just say "everything is fine"?
5. Does the recommended next step follow logically from the findings?

## Checklist

- [ ] Screen inventory covers all pages/views in the product
- [ ] Object model matches what was actually found in the codebase
- [ ] Inconsistencies are specific (not "navigation is confusing" — but "the term 'destination' is used in 3 different ways across 4 screens")
- [ ] Prioritized problem list has no more than 7 items
- [ ] Recommended next step is specified
