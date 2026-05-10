---
id: 05-positioning
phase: definition
tier-lite: false
tier-pro: true
produces: docs/product/product-model.md (positioning section)
skill: product:model
---

# Recipe: Positioning Brief

## When to use

Use this when you need to define what the product is and what it is not — before designing screens or building anything. Without this, features accumulate without a gravitational center. Every new idea seems relevant. The product expands until it collapses.

Positioning prevents product sprawl.

**Lite tier:** Skip this recipe. For lite projects, a one-sentence product promise is enough.

## Inputs

- Idea brief (recipe 01)
- Assumption map (recipe 02)
- Discovery findings if available (recipe 03)

## Interview Questions

1. **What category does this product belong to in the user's mind?** Not what you call it — what they'd call it when describing it to a colleague. ("It's like a dashboard for our pipelines." "It's a Kafka-to-ClickHouse config tool." "It's a control plane.")
2. **Who specifically is it for?** One sentence. Role + context. Not a company type.
3. **What is the main pain it solves?** One sentence. The situation, not the missing feature.
4. **What outcome does it create?** What's different for the user after using it successfully?
5. **What would the user use instead if this didn't exist?** Be honest — even if the answer is "they'd use a spreadsheet" or "they'd do it manually."
6. **Why this instead of that?** The real differentiation — not marketing copy.
7. **What will this product deliberately NOT do?** Be specific. Non-goals prevent scope creep.

## Output structure

Add a "Positioning" section to `docs/product/product-model.md`:

```markdown
## Positioning

**Category:** [How users would describe it to a colleague]
**Primary user:** [Specific role + context]
**Main pain:** [The situation being solved]
**Main promise:** [The outcome created]
**Main alternative:** [What they'd use instead]
**Differentiation:** [Why this instead]

## Non-Goals

- This product will not [specific thing].
- This product will not try to [specific thing].
```

## Exit condition

You can fill in the non-goals section with at least 3 specific things this product will not do. If you can't name what you won't do, you don't know what you will do.

## AI review prompt

1. Is the category something users would actually say, or product-team jargon?
2. Is the differentiation real and specific, or generic ("better UX", "easier to use")?
3. Are the non-goals specific enough to actually prevent scope creep in practice?
4. Is the primary user description specific enough to make design decisions with?

## Checklist

- [ ] Category is a phrase users would use, not internal terminology
- [ ] Primary user is specific (role + context, not demographic)
- [ ] Non-goals include at least 3 specific things
- [ ] Differentiation is specific and verifiable, not generic
