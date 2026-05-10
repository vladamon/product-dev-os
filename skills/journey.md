# product:journey — Journey Mapping

Use this skill when the user invokes `/product:journey [journey name]` or asks to map a specific user flow.

## Purpose

Map a specific named user journey from trigger to completion. Produces `docs/product/journeys/[name].md`.

Read recipe `recipes/07-journey-map.md` for the authoritative process.

## Step 1: Extract journey name

The journey name is passed as an argument: `product:journey "create pipeline"`

If no argument: ask "Which user journey are you mapping? Describe it in 3–5 words."

Derive a kebab-case filename: `create-pipeline.md`

## Step 2: Determine tier

If no tier specified:
- `docs/product/product-model.md` exists → suggest `pro`
- Otherwise: ask "Run **lite** (happy path + 2 failure states, ~5 min) or **pro** (full journey with all states, decisions, edge cases, ~15 min)?"

## Step 3: Check for existing journeys

Read all files in `docs/product/journeys/`. If a similar journey already exists, flag it:
"A journey called '[existing name]' already exists. Is this a new journey or an update to that one?"

## Step 4: Read context

**1. User-specified files** (from `--from`, `--using`, or natural mention)
**2. Product model:** `docs/product/product-model.md` — read to understand objects and states
**3. Existing journeys:** `docs/product/journeys/` — check for dependencies or overlaps

## Step 5: Show context summary

```
product:journey — mapping "[Journey Name]"

Product model found: [yes/no]
  Primary object: [the object this journey centers on, if detectable]
  Object states: [relevant states from the model]

Existing journeys: [list]

Will ask about: [steps, states, decisions]

Correct anything?
```

## Step 6: Conduct the interview

Read `recipes/07-journey-map.md` for the exact question set.

**Critical follow-up for every step:** After the user describes the happy path, ask:
"For step [N] — what can go wrong here? What does the user see and how do they recover?"

This is the most commonly skipped part of journey mapping. Do not let the user stop at the happy path.

## Step 7: Produce the artifact

Write `docs/product/journeys/[kebab-case-name].md` using `templates/journey-map.md`.

For lite: fill in User Goal, Trigger, Steps (happy path), top 2 Failure States, Completion State.
For pro: fill in all sections including all failure states, required decisions with options and defaults, preconditions, and follow-up actions.

## Step 8: Follow-up actions → new journeys

After listing follow-up actions, flag any that imply an unmapped journey:
"You mentioned users often [follow-up action]. That sounds like it might need its own journey map. Want to map it now or defer?"

## Step 9: Summarize

```
Journey map complete → docs/product/journeys/[name].md

Journey: [Name]
Steps: [N]
Failure states: [N]
Unmapped follow-up journeys: [list if any]

Recommended next step:
  product:journey "[next journey]" — to map the next primary flow
  
  Or when primary journeys are mapped:
  product:shape "[feature idea]" — to scope a feature that improves a journey
```

## Rules

- Every step must have both a user action and a system response. Push back if the user only describes user actions.
- Failure states are not optional in pro mode. Ask about every step.
- Required decisions must include options and recommended defaults — not just "the user chooses."
- The completion state must be specific enough that the user unambiguously knows they succeeded.
