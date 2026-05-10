---
id: 13-technical-architecture
phase: delivery
tier-lite: false
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-build.md (architecture section)
skill: product:build
---

# Recipe: Technical Architecture

## When to use

Use this when planning the frontend architecture for a new feature. The architecture should reflect the product model — if the product model says "PipelineDraft" is a central object, the code should have a strong PipelineDraft concept too.

Architecture that diverges from the product model creates a maintenance tax: every change requires translating between what the product means and what the code calls it.

**Lite tier:** Skip this recipe. For lite projects, follow existing codebase patterns without planning.

## Principles

1. **Domain model first, screens second, components third.** Never start with components.
2. **The code structure should match the product structure.** `features/pipeline-builder/` not `components/forms/pipeline/`.
3. **Domain logic belongs in domain modules, not in components.**
4. **Screens are thin.** They compose domain modules and components — they don't contain business logic.

## Structure pattern for feature work

```
domain/
  [object]/
    types.ts          ← TypeScript types for this domain object
    service.ts        ← API calls and data transformation
    store.ts          ← state management (if needed)
    validation.ts     ← validation logic

features/
  [feature-name]/
    index.tsx         ← entry point / route component
    [ScreenName].tsx  ← one file per screen
    components/       ← feature-local components only
      [ComponentName].tsx

components/
  ui/                 ← primitives (Button, Input, etc.)
  layout/             ← layout primitives (PageLayout, DetailLayout, etc.)
  domain/             ← domain-specific reusable components (StatusBadge, MetricCard, etc.)
```

## Interview Questions

1. **What domain objects does this feature introduce or modify?** Where do they currently live in the codebase?
2. **What new API endpoints will this feature call?** What data transformation is needed between API response and UI state?
3. **Does this feature require new global state, or is all state local to the feature?**
4. **What existing components can be reused?** What new components need to be created?
5. **Are there any circular dependency risks?** (Feature A importing from Feature B importing from Feature A)

## Output structure

Architecture section in `docs/specs/YYYY-MM-DD-[feature]-build.md`:

```markdown
## Architecture

**New files:**
- `domain/[object]/types.ts` — [what it contains]
- `features/[feature]/[Screen].tsx` — [what it does]

**Modified files:**
- `[existing file]` — [what changes]

**New components:**
- `[ComponentName]` — [what it does, props]

**Data flow:**
[Description of how data flows from API to UI state to components]
```

## Checklist

- [ ] Domain objects from the product model have corresponding code structures
- [ ] Feature folder structure follows existing codebase patterns
- [ ] No business logic in components — only in domain modules
- [ ] New API surface is documented
- [ ] No circular dependencies introduced
