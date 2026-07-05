---
type: build-checklist
product: PRODUCT_NAME
feature: FEATURE_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:build
related:
  pitch: docs/specs/YYYY-MM-DD-FEATURE-pitch.md
---

# Build Checklist: FEATURE_NAME

## Execution Brief

Self-contained handoff for the implementing agent. Scope below is inlined from
the pitch, glossary, and screen specs — do not re-derive scope from other documents.

**Problem:** [one sentence, from pitch]
**Appetite:** [max time budget, from pitch — descope rather than overrun]

**In scope:** [from pitch's What's Included]

**Out of scope (no-gos — reject any work here):**
- [no-go, verbatim from pitch]

**Done criteria (each must pass a yes/no test):**
- [ ] [criterion, verbatim from pitch]

**Screens to build** (full specs in `docs/screens/`):

| Screen | Spec file | States required |
|--------|-----------|-----------------|
| | | loading, empty, error, [domain-specific] |

**Terminology (use these exact terms in all user-facing copy):**

| Term | Definition |
|------|------------|
| | |

## Domain Model

- [ ] Core objects for this feature exist in the codebase (types, interfaces, or models defined)
- [ ] Object states are mapped to UI status values — no raw backend states exposed
- [ ] Object relationships are reflected in the data layer

## Screen Coverage

- [ ] All screens in scope have a spec in `docs/screens/`
- [ ] Loading state is specced and will be implemented for every screen
- [ ] Empty state is specced and will be implemented for every screen
- [ ] Error state is specced and will be implemented for every screen
- [ ] Domain-specific states (degraded, failed, out-of-sync, etc.) are specced

## Copy and Terminology

- [ ] All user-facing copy uses glossary terms from `docs/product/glossary.md`
- [ ] No raw backend identifiers or internal jargon in user-facing strings
- [ ] Error messages explain what happened and what to do next

## Architecture

**Proposed structure:**

```
[Describe folder/file structure for this feature]
```

- [ ] Feature structure follows existing codebase patterns
- [ ] Domain logic is separated from UI components
- [ ] No circular dependencies introduced

## Instrumentation

[Events to track for this feature]

| Event | When it fires | Properties |
|-------|--------------|------------|
| | | |

- [ ] Key user actions are tracked
- [ ] Failure events are tracked
- [ ] Completion/success events are tracked

---
*Updated YYYY-MM-DD via product:build*
