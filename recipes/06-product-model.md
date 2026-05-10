---
id: 06-product-model
phase: definition
tier-lite: true
tier-pro: true
produces: docs/product/product-model.md (core sections), docs/product/glossary.md
skill: product:model
---

# Recipe: Product Model

## When to use

Use this to formalize the product's internal world: the core objects, their relationships, their lifecycle states, and the terminology that names them. This is the most important definition work you can do. If the model is wrong, every screen built on top of it will be wrong in a consistent, structural way.

The product model is the backbone. Wizard, canvas, AI builder — all creation modes should update the same canonical model. Screens should reflect it. The glossary should enforce it.

Use it:
- After discovery or audit (first time)
- When the product grows a new major object
- When terminology is drifting and needs to be locked down
- When building a new team member onboarding

## Inputs

- Idea brief or audit report
- Any existing type definitions from the codebase (extract domain object candidates)
- User roles known from discovery

## Lite version (4 questions)

1. **What are the main things this product creates, manages, or tracks?** List them — these are your core objects.
2. **For the most important object, what states can it be in?** (e.g., Draft, Running, Failed, Stopped)
3. **How are the objects related?** Which ones belong to which? Which reference others?
4. **What is the most confusing or ambiguous term in the product today?** Define it clearly.

Produce: Core Objects table + States for primary object + 1 glossary entry per object.

## Pro version (8 questions)

Ask lite questions 1–4, then:

5. **For each supporting object, what states can it be in?**
6. **Who owns which objects?** (UI, backend, API — which system is the authority for each?)
7. **What is the information architecture?** What are the main navigation areas and what objects live in each?
8. **Are there any objects that don't have a clear name yet?** Let's name them.

Produce: Full product model + complete glossary + information architecture.

## Output structure

Two files:

**`docs/product/product-model.md`** — use `templates/product-model.md`. Fill in all sections.

**`docs/product/glossary.md`:**

```markdown
---
type: glossary
product: [Product Name]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:model
---

# Glossary — [Product Name]

[One entry per core concept. Primary user-facing term first, then technical equivalents if relevant.]

## [Term]

**Definition:** [What it means in this product specifically]
**Use in UI:** [How it appears to users]
**Do not use:** [Alternative terms to avoid]
**Technical equivalent:** [Backend/API term if different]

---

[Repeat for each term]
```

## Exit condition

You can draw the product's object model on a whiteboard and explain what state each object is in right now for a specific example. If you can't do that, the model is incomplete.

## AI review prompt

1. Are these real domain objects, or are some of them UI elements disguised as objects (e.g., "wizard step" is not a domain object)?
2. Are the lifecycle states complete? Is there a state the object can be in that isn't listed?
3. Does the information architecture reflect the object model? Every major object should live in exactly one place in the IA.
4. Are there terms in the glossary that still have multiple names? Each concept should have exactly one primary term.
5. Is there any object whose ownership is unclear — could be UI or backend?

## Checklist

- [ ] All core objects identified and named
- [ ] Every primary object has complete lifecycle states
- [ ] Object relationships are explicit (not implied)
- [ ] Every object has a glossary entry with primary term and alternatives to avoid
- [ ] Information architecture covers all major objects
- [ ] No object is "owned" by two systems simultaneously
