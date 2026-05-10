---
id: 15-usability-testing
phase: delivery
tier-lite: false
tier-pro: true
produces: [no artifact — manual process]
skill: manual (not skill-driven)
---

# Recipe: Usability Testing

## When to use

Use this after building a feature and before declaring it done. The goal is to find confusion before it reaches all users.

**This recipe is manual — there is no `product:*` skill for it.** You need a real person and a working product. You cannot test usability with an AI.

## How to run a lightweight usability test

### Setup
1. Find 2–3 people who match your target user profile. Internal team members can work if genuine users aren't available — but note their proximity to the product.
2. Prepare 2–3 task scenarios. These are goals, not instructions.

### Task scenarios

Good task scenarios describe a goal, not a path:
- ✓ "You need to connect to a new Kafka cluster. Do that."
- ✓ "Find out if this pipeline is healthy and how many events it's processing per second."
- ✗ "Click the 'Connections' link in the sidebar, then click 'New Connection'."

### The session
1. Give the user the task scenario.
2. Ask them to think aloud as they work.
3. Do not explain, help, or react to confusion.
4. Write down: where they hesitate, what they click first, what they say.

### After the session
Ask:
- "What did you expect to happen when you [did X]?"
- "Was there anything confusing or unexpected?"
- "What would you have called that [feature/button/section]?"

## What to do with findings

Classify each finding:
- **Blocker:** User could not complete the task
- **Friction:** User completed the task but with significant confusion
- **Confusion:** User was uncertain but succeeded
- **Suggestion:** User had an idea for improvement

Fix blockers before shipping. Fix friction if time allows. Log confusion and suggestions for the next iteration.

## Minimum test

If you can only do one thing: give one person a task and watch them try to do it without explaining anything. Even one session reveals problems you can't see yourself.

## Checklist

- [ ] At least 2 task scenarios prepared (goal-framing, not instruction-framing)
- [ ] At least 1 person observed using the feature
- [ ] Blockers fixed before shipping
- [ ] Findings logged for next iteration
