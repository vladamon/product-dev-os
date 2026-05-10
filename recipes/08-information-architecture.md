---
id: 08-information-architecture
phase: definition
tier-lite: false
tier-pro: true
produces: docs/product/information-architecture.md
skill: product:model
---

# Recipe: Information Architecture

## When to use

Use this after the product model is defined, when you need to organize the product's navigation and screen hierarchy. The IA answers: where does every object, action, and screen live?

Without an IA, products become collections of screens that the user navigates by guessing. With an IA, every new screen has a home before it's built.

**Lite tier:** Skip this recipe. For lite projects, a simple list of screens in the product model is enough.

## Inputs

- Product model (core objects and product areas)
- List of known or planned screens

## Interview Questions

1. **What are the top-level navigation areas?** (Usually 3–6 areas. Each should map to a product area from the product model.)
2. **For each area: what objects live there?** And what are the main screens within each area?
3. **Where does the user go to create a new [primary object]?** This is often the most important navigation decision.
4. **Where does the user go when something breaks or needs attention?** Operations/monitoring should have a clear home.
5. **Is there anything that doesn't fit cleanly in the IA?** Orphaned features often signal a product model problem.

## Output structure

`docs/product/information-architecture.md`:

```markdown
---
type: information-architecture
product: [Product Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:model
---

# Information Architecture — [Product Name]

## Navigation Structure

[Top-level areas and their contents]

[Area 1]
  ├── [Screen 1]
  ├── [Screen 2]
  └── [Object Detail]
       ├── [Tab 1]
       ├── [Tab 2]
       └── [Tab 3]

[Area 2]
  ...

## Screen Inventory

[Every screen with its type and parent area]

| Screen | Type | Area | Status |
|--------|------|------|--------|
| | overview / list / detail / builder / inspector / settings / confirm | | planned / exists / remove |

## Navigation Decisions

[Key navigation choices and why they were made]

- [Decision]: [Rationale]
```

## Exit condition

Every planned screen has a home in the IA. Every existing screen either has a home or is marked for removal. If you can't place a feature in the IA, the feature is underdefined.

## AI review prompt

1. Does every major object from the product model appear in the IA?
2. Is there a clear path from the landing page to the most important user action?
3. Are there any screens that appear in two places? (Usually indicates a model problem.)
4. Is the operations/monitoring area distinct from the configuration area? Mixing them creates confusion.
5. Are there any "junk drawer" areas — places where unrelated things accumulate?

## Checklist

- [ ] Every product area from the product model maps to a navigation area
- [ ] Every known screen is placed in exactly one location
- [ ] Creation flow for the primary object is explicitly located
- [ ] Operations/monitoring has a dedicated area
- [ ] No screen appears in two places
- [ ] Orphaned features are either placed or marked for removal
