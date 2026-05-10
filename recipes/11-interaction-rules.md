---
id: 11-interaction-rules
phase: design
tier-lite: false
tier-pro: true
produces: docs/product/interaction-rules.md
skill: product:spec
---

# Recipe: Interaction Rules

## When to use

Use this when you have multiple screens built and notice that similar actions behave differently across the product. Interaction rules create consistency — the same concept behaves the same way everywhere.

Define these rules once. Reference them in screen specs. Update them when you find a new pattern.

**Lite tier:** Skip this recipe. For lite projects, document rules inline in screen specs.

## Inputs

- Multiple completed screen specs
- Observed inconsistencies during development

## The Rule Inventory

Define explicit rules for each of these interaction types:

### Create
How does the user create a new [object]? (Modal? New page? Inline? Sheet?)
What happens after creation? (Stay on page? Navigate to detail? Show confirmation?)

### Edit
How does the user enter edit mode? (Click-to-edit? Edit button? Dedicated edit page?)
Are edits saved automatically or explicitly?
What happens to unsaved changes if the user navigates away?

### Save
What does "save" mean in this product? (Auto-save? Explicit save? Draft vs. published?)
How does the user know their changes are saved?

### Validate
When does validation run? (On submit? On blur? On change?)
How are validation errors shown? (Inline? Summary? Toast?)
Can the user submit with warnings (non-blocking issues)?

### Deploy
What's the difference between "save" and "deploy"?
What confirmation does the user see before deploying?
What does the user see during deployment?
What does the user see after deployment succeeds or fails?

### Delete / Destructive Actions
How is a delete action presented? (Never as a primary button)
What confirmation is required?
Is deletion reversible? If not, how is that communicated?

### Navigation Away With Unsaved Changes
What happens if the user navigates away from a screen with unsaved changes?
Is there a confirmation dialog, auto-save, or silent discard?

## Output structure

`docs/product/interaction-rules.md`:

```markdown
---
type: interaction-rules
product: [Product Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:spec
---

# Interaction Rules — [Product Name]

## Create
[Rule + rationale]

## Edit
[Rule + rationale]

## Save
[Rule + rationale]

## Validate
[Rule + rationale]

## Deploy
[Rule + rationale]

## Delete
[Rule + rationale]

## Navigation with unsaved changes
[Rule + rationale]
```

## Exit condition

The same concept behaves identically on every screen that uses it. You can answer "how does the user save their changes?" with a single answer that applies everywhere.

## AI review prompt

1. Are there any rules missing for interactions that exist in the product?
2. Are any rules contradicted by existing screen specs?
3. Is the delete/destructive action rule specific about what requires confirmation vs. what doesn't?
4. Are these rules opinionated enough to actually prevent inconsistency?

## Checklist

- [ ] Create pattern is defined
- [ ] Edit pattern is defined
- [ ] Save behavior is defined (including auto-save vs explicit)
- [ ] Delete/destructive actions have explicit rules
- [ ] Navigation-away-with-unsaved-changes behavior is defined
- [ ] Each rule has a rationale, not just a description
