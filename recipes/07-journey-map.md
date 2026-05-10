---
id: 07-journey-map
phase: definition
tier-lite: true
tier-pro: true
produces: docs/product/journeys/[name].md
skill: product:journey
---

# Recipe: Journey Map

## When to use

Use this before designing any screens for a user flow. Screens without a journey are just panels — they don't add up to a coherent experience. The journey is the skeleton; screens are the flesh.

Run once per primary journey. Most products have 3–5 primary journeys. Start with the golden path (the most important thing a new user needs to accomplish successfully).

## Inputs

- Product model with core objects and states
- A specific journey name (passed as argument to `product:journey`)

## Lite version (5 questions)

1. **What is the user trying to accomplish?** One sentence in the user's terms.
2. **What triggers this journey?** The specific moment that sends them into it.
3. **Walk me through the steps.** Just the happy path — what does the user do, step by step?
4. **What can go wrong?** Top 2 failure states.
5. **How does the user know it's done?** What do they see or receive that confirms success?

Produce: Happy path steps + 2 failure states + completion state.

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **What must already exist before this journey is possible?** (Preconditions)
7. **What decisions does the user have to make along the way?** For each: what are the options, and what's the recommended default?
8. **What does the user do next after completing this journey?** (Follow-up actions — these often reveal gaps)

Produce: Full journey with all steps, all failure states, all decisions, preconditions, and follow-up actions.

## Output structure

`docs/product/journeys/[kebab-case-name].md` — use `templates/journey-map.md`.

## Exit condition

A developer can read this journey map and know exactly what screens need to exist and in what order. They shouldn't need to invent any transitions or intermediate states.

## AI review prompt

1. Does every step have both a user action AND a system response? A journey with only user actions is incomplete.
2. Are the failure states specific? "Something goes wrong" is not a failure state. "User submits a connection config but the credentials are invalid" is.
3. Are the required decisions fully specified? Each decision should have: options, recommended default, and consequences of each option.
4. Does the completion state make the user feel confident they succeeded?
5. Do the follow-up actions reveal any missing journeys that need to be mapped?

## Checklist

- [ ] User goal is one sentence in the user's terms (not system terms)
- [ ] Every step has a user action and a system response
- [ ] At least 2 failure states documented with recovery paths
- [ ] Required decisions have explicit options and recommended defaults
- [ ] Completion state is unambiguous — user knows they succeeded
- [ ] Follow-up actions are listed
