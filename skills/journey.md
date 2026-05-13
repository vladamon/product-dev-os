# product:journey — Journey Mapping

Use this skill when the user invokes `/product:journey [journey name]` or asks to map a specific user flow.

## Purpose

Map a specific named user journey from trigger to completion. Produces `docs/product/journeys/[name].md`.

Read recipe `recipes/07-journey-map.md` for the authoritative process.

## Contract
Requires: docs/product/product-model.md (recommended)
Produces: docs/product/journeys/[kebab-case-name].md
Updates: docs/product/journeys/[kebab-case-name].md (in update mode if journey already exists)

## Step 1: Extract journey name

The journey name is passed as an argument: `product:journey "create pipeline"`

If no argument: ask "Which user journey are you mapping? Describe it in 3–5 words."

Derive a kebab-case filename: `create-pipeline.md`

## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (happy path + 2 failure states, ~5 min) or **pro** (full journey with all states, decisions, edge cases, ~15 min)?"

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

## Fallback questions (if recipe unavailable)
1. "What is the user trying to accomplish? One sentence — their goal."
2. "What triggers this journey? What just happened that makes them need this now?"
3. "Walk me through the happy path step by step. For each step: what does the user do, and what does the system do?"
4. "For each step: what can go wrong? What does the user see and how do they recover?"
5. "How does the user know the journey succeeded? What is the completion signal?"

## Pivot interrupt
If the user signals the journey's framing is wrong ("this isn't how users actually do it", "we're mapping the wrong flow"):
1. Stop the interview immediately
2. Record what was captured as a partial artifact: `docs/product/journeys/[name]-partial.md` with `status: abandoned`
3. Say: "Journey paused. Recommended: clarify which journeys matter most with product:model (information architecture section), then re-run product:journey with the corrected framing."

## Rules

- Every step must have both a user action and a system response. Push back if the user only describes user actions.
- Failure states are not optional in pro mode. Ask about every step.
- Required decisions must include options and recommended defaults — not just "the user chooses."
- The completion state must be specific enough that the user unambiguously knows they succeeded.
