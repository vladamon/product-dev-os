---
type: screen-spec
product: PRODUCT_NAME
screen: SCREEN_NAME
tier: TIER
status: draft
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:spec
related:
  journey: docs/product/journeys/JOURNEY_NAME.md
  pitch: docs/specs/YYYY-MM-DD-FEATURE-pitch.md
---

# Screen: SCREEN_NAME

## Purpose

[What this screen is for — one sentence]

## Primary User Question

[The single most important thing a user needs to know or do on this screen]

## Secondary Questions

[Other things the user might need to know or do here]

- [Secondary question 1]
- [Secondary question 2]

## Entry Points

[How the user gets to this screen]

- [Entry point 1]
- [Entry point 2]

## Primary Action

[The one most important action available on this screen]

## Secondary Actions

[Other available actions, in priority order]

1. [Action 1]
2. [Action 2]

## Layout

[Describe the screen structure — header, main content areas, panels, tabs]

**Header:** [What's in the header]
**Main content:** [What occupies the primary area]
**Side panel / tabs:** [If applicable]
**Footer / action bar:** [If applicable]

## Data Required

[All data fields that must be loaded or displayed]

| Field | Source | Notes |
|-------|--------|-------|
| | | |

## States

[Every state this screen must handle]

- **Loading:** [What the user sees while data loads]
- **Empty:** [What the user sees when there's no data yet]
- **Populated (healthy):** [The main happy-path state]
- **Error:** [If data fails to load]
- **Permission denied:** [If user lacks access — if applicable]
- **[Additional states]:** [Any domain-specific states: degraded, failed, out-of-sync, etc.]

## Components Used

[Reusable components from the design system]

- [Component 1]
- [Component 2]

## Copy Rules

[Terminology and label rules specific to this screen]

- Use "[term]" not "[alternative]"
- [Copy rule 2]

## Acceptance Criteria

[What must be true for this screen to be considered done]

- [ ] [Criterion 1]
- [ ] [Criterion 2]

---
*Updated YYYY-MM-DD via product:spec*
