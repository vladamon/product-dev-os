---
id: 10-screen-spec
phase: design
tier-lite: true
tier-pro: true
produces: docs/screens/[screen-name].md
skill: product:spec
---

# Recipe: Screen Specification

## When to use

Use this before building any screen — always. This is the text-based replacement for Figma in this workflow. A screen spec answers: what is this screen for, what does it show, what can the user do, and what are all the states it can be in.

The screen spec does NOT replace visual design judgment. It defines what must exist and when. The implementer decides exactly how it looks.

## Inputs

- Product model (for terminology and object states)
- Relevant journey map (so the screen has context in a flow)
- Relevant shaped pitch (so the screen has context in a feature)

## Lite version (5 questions)

1. **What is this screen for?** One sentence — the screen's job.
2. **What is the primary user question?** The single most important thing a user needs to know or do on this screen.
3. **What does the layout look like?** Describe the structure: header, main content, side panel if any.
4. **What are the main actions?** List in priority order.
5. **What states does this screen need to handle?** At minimum: loading, empty, and main state.

Produce: Purpose + primary question + layout + main actions + core states.

## Pro version (10 questions)

Ask lite questions 1–5, then:

6. **What are the entry points?** How does a user get to this screen?
7. **What data is required?** List every field that needs to be fetched or displayed.
8. **What are the error and edge-case states?** Beyond loading/empty — what domain-specific states exist?
9. **What components will this use?** Reference the design system.
10. **What are the acceptance criteria?** Specific, testable conditions for "done."

Produce: Full screen spec with all sections.

## Output structure

`docs/screens/[kebab-case-name].md` — use `templates/screen-spec.md`.

Name format: `pipeline-detail-overview.md`, `connections-list.md`, `pipeline-builder-wizard.md`

## Enterprise screen state checklist

Every screen must specify these states before it can be considered complete:

| State | Required for |
|-------|-------------|
| Loading | All screens that fetch data |
| Empty | All list screens + detail screens on first use |
| Populated (happy path) | All screens |
| Error (fetch failure) | All screens that fetch data |
| Permission denied | Any screen with access control |
| Degraded / warning | Domain-specific (pipelines, operations) |
| Failed / critical | Domain-specific (pipelines, incidents) |
| Out of sync | Domain-specific (deployed vs. draft state) |

Missing states are the most common cause of poor enterprise UX. "Loading" is not a nice-to-have.

## Exit condition

A developer can build this screen without inventing any UX decisions. They know exactly what to show in every state, what actions are available, what data to fetch, and what "done" looks like.

## AI review prompt

1. Is the primary user question specific enough to make layout decisions with?
2. Are all realistic states covered? What happens when the data is loading, missing, or broken?
3. Are the acceptance criteria specific enough to pass/fail, or are they vague ("looks good", "works correctly")?
4. Does the copy section use glossary terms, or does it introduce new terminology?
5. Are there any actions on this screen that are destructive? If so, is there a confirmation pattern specified?

## Checklist

- [ ] Primary user question is one sentence and answerable
- [ ] Loading state is specified
- [ ] Empty state is specified (with explanation and CTA)
- [ ] Error state is specified (with message and recovery path)
- [ ] All domain-specific states are covered
- [ ] Destructive actions have confirmation pattern specified
- [ ] Acceptance criteria are verifiable
- [ ] Terminology matches the glossary
