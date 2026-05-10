---
id: 01-idea-brief
phase: discovery
tier-lite: true
tier-pro: true
produces: docs/product/product-model.md (seed)
skill: product:discover
---

# Recipe: Idea Brief

## When to use

Use this at the very start of a new product or major feature. You have an idea but nothing is written down yet. The goal is to make the idea concrete enough to evaluate — to move from "I have an idea" to "I can explain this in one sentence without sounding vague."

A good one-sentence explanation:
- Bad: "An AI assistant for productivity."
- Good: "A tool that helps solo consultants turn messy client conversations into structured proposals, tasks, and follow-ups."

## Inputs

- The user's mind (nothing formal required)
- Optional: any notes, briefs, or documents the user has (via `--from`/`--using` or `docs/intake/`)

## Lite version (5 questions)

Ask one at a time:

1. **What is the product idea?** Describe it — what it does and who it's for.
2. **Who specifically has the problem?** Not "teams" or "developers" — a specific person in a specific situation.
3. **What painful situation exists today?** What happens when this person tries to do what your product will help them do?
4. **How do they solve it today?** What tools, manual processes, or workarounds do they use?
5. **What would change for them if your product worked perfectly?**

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **When does the user feel this pain?** What is the specific trigger moment?
7. **What alternatives exist?** Name specific products, not categories.
8. **What is intentionally out of scope?** What will this product never try to do?

## Output structure

Seed version of `docs/product/product-model.md` using the template. Fill in: Product Promise, Primary Users, and a partial Core Objects section (objects that came up in the conversation, even if incomplete).

## Exit condition

You can explain the idea in one sentence that is specific enough that a stranger could tell you whether they have the problem described.

## AI review prompt

Review the idea brief against:
1. Is the target user specific enough? "Small business owners" is not specific. "Freelance consultants who send proposals via email" is.
2. Is the problem described in terms of a situation, not a missing feature?
3. Is the current workaround mentioned? If not, the problem may not be real enough.
4. Is the scope boundary clear? What will this NOT do?

## Checklist

- [ ] Product idea is one sentence, specific, and jargon-free
- [ ] Target user is a specific person, not a category
- [ ] Problem is described as a situation, not a missing feature
- [ ] Current workaround is identified
- [ ] At least one scope boundary is defined
