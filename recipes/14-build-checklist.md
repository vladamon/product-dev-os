---
id: 14-build-checklist
phase: delivery
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-build.md
skill: product:build
---

# Recipe: Build Checklist

## When to use

Use this after shaping a feature and writing screen specs, before writing code. It verifies that the feature is genuinely ready to build — not just "there's a rough idea, let's start."

## The Checklist

### Product readiness
- [ ] Shaped pitch exists with explicit done criteria and no-gos
- [ ] Every screen in scope has a screen spec
- [ ] Every screen spec has loading, empty, and error states defined
- [ ] Domain-specific states (degraded, failed, out-of-sync, etc.) are specced
- [ ] All copy uses glossary terms
- [ ] Destructive actions have confirmation patterns specified

### Domain model readiness
- [ ] Core objects for this feature exist in the product model
- [ ] Object states are mapped — no raw backend states in UI
- [ ] Object relationships are reflected in the data layer plan

### Architecture readiness (pro only)
- [ ] Domain module structure is planned
- [ ] New API endpoints and data transformations are identified
- [ ] Existing components to reuse are identified
- [ ] New components to build are identified

### Instrumentation
- [ ] Key user actions are planned for tracking
- [ ] Failure events are planned for tracking
- [ ] Success/completion events are planned for tracking

## Lite version

Run: product readiness checklist only. Skip architecture and instrumentation sections.

## Pro version

Run all sections including architecture and instrumentation.

## Output structure

`docs/specs/YYYY-MM-DD-[feature]-build.md` — use `templates/build-checklist.md`.

## Exit condition

All product readiness items are checked. The feature can be handed to an implementation agent or started immediately without requiring clarification on scope, states, or terminology.

## AI review prompt

1. Are there any screen specs that don't have error states defined?
2. Is there any copy in the specs that uses terms not in the glossary?
3. Are there any done criteria from the pitch that don't map to screen specs?
4. Is there any ambiguity about what "done" means that would cause a disagreement during review?

## Checklist

- [ ] All product readiness items checked
- [ ] At least one instrumentation event per user journey covered
- [ ] Done criteria from the pitch are reflected in acceptance criteria in screen specs
