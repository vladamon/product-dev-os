---
id: 02-assumption-map
phase: discovery
tier-lite: true
tier-pro: true
produces: docs/product/assumptions.md
skill: product:discover
---

# Recipe: Assumption Map

## When to use

Use this after the idea brief, before doing any design work. The goal is to identify what could kill the idea before you invest in it.

Most product failures are not execution failures — they are assumption failures. The team built the right thing for the wrong assumptions. This recipe forces you to name the assumptions before they become invisible.

## Inputs

- Completed idea brief (or seed product model)
- The user's knowledge of the market and users

## Lite version (3 questions)

1. **List 3–5 things that must be true for this idea to work.** These are your assumptions.
2. **Which assumption would kill the idea if it turned out to be false?** That's your riskiest assumption.
3. **How could you test the riskiest assumption with minimal effort?**

## Pro version (full)

For each assumption identified, classify it:

| Type | Question it answers |
|------|---------------------|
| Desirability | Do people want this? |
| Viability | Can this become sustainable? |
| Feasibility | Can I build it? |
| Usability | Can users understand it? |
| Distribution | Can I reach users? |
| Trust | Will users believe it's safe/reliable? |

For each assumption:
- What type is it?
- What is the risk level (high/medium/low)?
- How could you test it?
- What evidence already exists?

## Output structure

`docs/product/assumptions.md` — a table of assumptions with type, risk, and test method.

```markdown
# Assumptions — [Product Name]

| Assumption | Type | Risk | Evidence | Test method |
|------------|------|------|----------|-------------|
| | | | | |

## Riskiest Assumptions

[Top 3 assumptions that would kill the idea if false]

## Next Steps

[How to test the riskiest assumptions before building]
```

## Exit condition

You have identified the top 3–5 assumptions that could kill the idea, and for each you know either: (a) how you would test it, or (b) why you're proceeding despite the risk.

## AI review prompt

Review the assumption map against:
1. Are these actual assumptions (things that might be false) or facts?
2. Is the riskiest assumption actually the most dangerous one, or is something more fundamental being ignored?
3. Are the test methods realistic — could they actually be done?
4. Is the distribution assumption covered? Many products solve real problems but can't reach users.

## Checklist

- [ ] At least 5 assumptions identified
- [ ] Each assumption is classified by type
- [ ] Top 3 riskiest assumptions are explicitly named
- [ ] Each risky assumption has a test method or a stated reason for proceeding
- [ ] Distribution is covered as an assumption
