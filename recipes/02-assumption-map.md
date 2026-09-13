---
id: 02-assumption-map
phase: understand
tier-lite: true
tier-pro: true
produces: docs/product/assumptions.md
skill: product:discover
---

# Recipe: Assumption Map

## When to use

Use this after the idea brief, before any design work. The goal is to identify what could kill the idea before you invest in it.

Most product failures are not execution failures — they are assumption failures. The team built the right thing for the wrong assumptions. This recipe forces you to name the assumptions before they become invisible.

The map is shared: `product:critique`, `product:interview`, `product:viability`, `product:gtm`, and `product:experiment` all add to it, and `product:shape` refuses to run while high-risk rows are untested. Its exact format is defined in `docs/conventions.md` §5.

## Inputs

- Completed idea brief (or seed product model)
- The founder's knowledge of the market and users
- Optional: a critique or ideation file

## Lite version (4 questions)

1. **List 3–5 things that must be true for this idea to work.** Include at least one about people paying and one about reaching them.
2. **For each: high, medium, or low risk?** High = you have no evidence and it would kill the idea if false.
3. **Which assumption would kill the idea if it turned out to be false?** That's your riskiest assumption.
4. **How could you test the riskiest assumption with minimal effort?**

After question 2, the AI gives its own risk rating for each assumption with a one-line reason and shows where it disagrees. The founder decides; the disagreement is noted.

## Pro version (full)

Aim for 6–10 assumptions. For each, classify:

| Type | Question it answers |
|------|---------------------|
| Desirability | Do people want this badly enough to change behavior? |
| Viability | Will someone pay enough, often enough, for this to sustain itself? |
| Feasibility | Can I build it with my skills, time, and budget? |
| Usability | Can users understand and adopt it? |
| Distribution | Can I reach the users at a cost the business can afford? |
| Trust | Will users believe it's safe/reliable enough to hand over data or money? |

For each assumption:
- What type is it?
- What is the risk level (high/medium/low)? — then the AI's independent rating
- What evidence already exists? (past behavior, spend, conversations — not opinions)
- How could you test it?

## Output structure

`docs/product/assumptions.md` — canonical shape from `docs/conventions.md` §5:

```markdown
---
type: assumptions
product: [Product Name]
tier: [lite|pro]
status: [draft|complete]
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:discover
---

# Assumptions — [Product Name]

## Riskiest Assumptions

1. **A[n]** — [assumption] — why it kills the idea if false: [one line]
2. **A[n]** — ...
3. **A[n]** — ...

## Assumption Map

| ID | Assumption | Type | Risk | Source | Evidence | Test | Verdict |
|----|------------|------|------|--------|----------|------|---------|
| A1 | [falsifiable statement] | desirability | high | discover | none yet | [method] | pending |

## Discovery Evidence

Evidence level: [none | opinion | behavioral]
[Conversations reviewed, appended by product:interview synthesize]
```

Write assumptions as falsifiable statements with a number or observable in them where possible: "Freelance designers spend ≥2h/week chasing invoices", not "Invoicing is painful".

## Exit condition

You have identified the top 3–5 assumptions that could kill the idea, each has a risk level the founder chose knowing the AI's view, and each high-risk row has either (a) a test method or (b) an explicit waiver reason.

## AI review prompt

Review the assumption map against:
1. Are these actual assumptions (things that might be false) or facts?
2. Is the riskiest assumption actually the most dangerous one, or is something more fundamental being ignored?
3. Did the founder rate anything low that has zero behavioral evidence? Say so.
4. Are viability (someone pays) and distribution (you can reach them) covered? Many products solve real problems but can't charge or can't reach users.
5. Are the test methods realistic for one person in days, not months?

## Checklist

- [ ] At least 5 assumptions identified (3 for lite)
- [ ] Each has a type; desirability, viability, and distribution are all present
- [ ] Every row uses the canonical table with an ID
- [ ] Top 3 riskiest assumptions are named by ID
- [ ] AI risk disagreements were shown and resolved by the founder
- [ ] Each high-risk row has a test method or a stated reason for proceeding
