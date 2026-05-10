---
id: 12-ui-system
phase: design
tier-lite: false
tier-pro: true
produces: docs/design/ui-system.md
skill: manual (not skill-driven)
---

# Recipe: UI System

## When to use

Use this when building components that will be reused across multiple screens. This is a reference for defining your product's visual grammar — not a comprehensive design system, but the minimum opinionated set of rules and components that makes the product feel like one product.

**This recipe is manual — there is no `product:*` skill for it.** Use it as a reading reference when defining your design system or project-specific design skill.

## What a UI system is NOT

A UI system does not create coherence. A UI system only makes incoherence reusable. Build it after the product model and screen specs are stable — not before.

Wrong order: Components → screens → coherence (never happens)
Right order: Product model → journeys → screen specs → patterns → components

## Foundations to define

Define these before touching components:

- **Typography scale** — heading sizes, body sizes, label sizes, mono sizes
- **Spacing scale** — base unit (4px or 8px) and multipliers
- **Color roles** — background, surface, border, text, interactive, status colors
- **Status colors** — healthy, degraded, failed, deploying, stopped, draft, unknown
- **Border radius** — one or two values used consistently
- **Density** — compact vs. comfortable; when each applies

## Component priority

Build components in this order (stop when you have enough):

**Tier 1 (build first — appear on every screen):**
- StatusBadge
- EmptyState
- ErrorState
- PageHeader / EntityHeader
- MetricCard

**Tier 2 (build when first screen needs them):**
- ValidationPanel
- ConfigDiff / ConfigPreview
- Timeline
- ResourceSelector
- IncidentRow

**Tier 3 (build only when needed):**
- All other components

## Layout primitives

- AppShell — app frame, navigation, sidebar
- PageLayout — standard page with header + content
- DetailLayout — header + status strip + tabs
- BuilderLayout — left nav + center canvas + right inspector
- SplitPaneLayout — two resizable panes

## Output structure

`docs/design/ui-system.md` — document your decisions as you build them. Do not plan the full system upfront.

## Checklist

- [ ] Status colors defined for all pipeline/entity states
- [ ] Spacing scale is consistent (not ad-hoc pixel values)
- [ ] EmptyState component exists with: icon, explanation, CTA
- [ ] StatusBadge covers all states in the product model
- [ ] No inline styles for colors that have design tokens
