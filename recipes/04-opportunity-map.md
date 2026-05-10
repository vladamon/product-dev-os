---
id: 04-opportunity-map
phase: definition
tier-lite: false
tier-pro: true
produces: docs/product/product-model.md (opportunity section)
skill: product:model
---

# Recipe: Opportunity Map

## When to use

Use this after discovery, when you need to organize what you learned into product opportunities before deciding what to build. This is the bridge between "we know users have problems" and "we know which problems to solve first."

Based on Teresa Torres' Opportunity Solution Tree: start from an outcome you want to achieve, map user opportunities (problems/desires), then connect possible solutions. This prevents jumping directly from discovery to feature lists.

**Lite tier:** Skip this recipe. For lite projects, go directly from idea brief to product model.

## Inputs

- Discovery findings (recipe 03) or existing knowledge of user problems
- A desired product outcome (what behavioral change do you want users to make?)

## The Structure

```
Desired Outcome
  ├── Opportunity 1 (user problem/desire)
  │    ├── Solution A
  │    ├── Solution B
  │    └── Experiment to test
  ├── Opportunity 2
  │    ├── Solution C
  │    └── Experiment
  └── Opportunity 3
       ├── Solution D
       └── Experiment
```

## Interview Questions

1. **What is the one behavioral outcome you want users to achieve?** (Not a business metric — a user behavior. "Users successfully deploy their first pipeline within 30 minutes of signing up.")
2. **What are the top 3 user problems or desires that prevent that outcome?**
3. **For each problem: what solutions could address it?** Generate 2–3, don't commit to one yet.
4. **For each solution: what's the smallest experiment that would tell you if it works?**
5. **Which opportunity has the highest impact and lowest uncertainty?** That's where to start.

## Output structure

Add an "Opportunities" section to `docs/product/product-model.md`:

```markdown
## Opportunities

**Desired outcome:** [The user behavioral outcome]

| Opportunity | Evidence | Solutions considered | Chosen approach |
|-------------|----------|---------------------|-----------------|
| | | | |
```

## Exit condition

You are not just collecting feature ideas. You understand which user opportunities each potential feature serves, and you've chosen a starting opportunity based on evidence and impact.

## AI review prompt

1. Is the desired outcome a user behavior, not a business metric?
2. Are these genuine user opportunities, or just feature ideas dressed up as opportunities?
3. Is the chosen starting opportunity the highest-impact one, or the most comfortable one?

## Checklist

- [ ] Desired outcome is a specific user behavior
- [ ] At least 3 opportunities identified
- [ ] Each opportunity has at least 2 solutions considered
- [ ] One opportunity is chosen as the starting point with a rationale
