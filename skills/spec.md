# product:spec — Screen Specification

Use this skill when the user invokes `/product:spec [screen name]` or asks to specify, define, or document a screen before building it.

## Purpose

Produce a complete specification for a single screen — the text-based replacement for Figma. Produces `docs/screens/[screen-name].md`.

Read recipes `recipes/10-screen-spec.md` and `recipes/11-interaction-rules.md` for the authoritative process.

## Contract
Requires: docs/specs/YYYY-MM-DD-[slug]-pitch.md (recommended), docs/product/journeys/ (recommended)
Produces: docs/screens/[kebab-case-name].md
Updates: docs/screens/[kebab-case-name].md (in update mode if screen already exists; screen specs are living documents)

## Step 1: Extract screen name

The screen name is passed as an argument: `product:spec "pipeline detail overview"`

If no argument: ask "Which screen are you speccing?"

Derive a kebab-case filename: `pipeline-detail-overview.md`

## Step 2: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/product-model.md` exists → default to `pro`, announce: "Defaulting to pro — product model found. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (purpose + question + layout + core states, ~5 min) or **pro** (full spec with all states, copy rules, acceptance criteria, ~15 min)?"

## Step 3: Check for existing spec

If `docs/screens/[screen-name].md` already exists:
- Read it
- Enter **update mode**: "A spec for this screen exists from [date]. I'll ask only about what's missing or deferred."
- Ask only about sections marked `[deferred]` or visibly incomplete

## Step 4: Read context

**1. User-specified files** (from `--from`, `--using`, or natural mention)
**2. Related journey:** `docs/product/journeys/` — find the journey this screen is part of
**3. Related pitch:** `docs/specs/` — find the pitched feature this screen belongs to
**4. Existing screens:** `docs/screens/` — read 2–3 nearby screens for terminology and pattern consistency
**5. Component library:** look for `src/components/`, `components/ui/` — list available component names
**6. Screen inventory from pitch:** If a related pitch was found, scan it for screen names implied by the "What's Included" section and done criteria. Build a list of screens this feature requires.

## Step 5: Show context summary

```
product:spec — speccing "[Screen Name]"

Context found:
  Journey: [related journey or "none found"]
  Pitch: [related pitch or "none found"]
  Nearby screens for consistency reference: [list]
  Components available: [list of component directories]

Screen inventory for this feature (from pitch):
  ✓ [screen-name].md — already specced
  → [screen-name].md — speccing now
  ○ [screen-name].md — not yet specced
  [or "Pitch not found — cannot determine remaining screens"]

Will ask about: [what's needed for the spec]

Correct anything?
```

The screen inventory gives a complete picture of how much spec work remains for the feature.

## Step 6: Conduct the interview

Read `recipes/10-screen-spec.md` for the exact question set.

**Key question (always ask):** "What is the primary user question this screen answers?"
This single question forces clarity about the screen's job. If the user can't answer it in one sentence, the screen's purpose is unclear and needs to be defined before speccing it.

**States (always ask, always pro):**

After covering the basic screen structure, always ask about ALL states — even in lite mode:

"What does this screen look like when:
- Data is loading?
- There's no data yet (first use / empty)?
- Something has gone wrong (error loading data)?
- [domain-specific state]?"

Missing states are the most common cause of incomplete screen specs.

## Step 7: Produce the artifact

Write `docs/screens/[kebab-case-name].md` using `templates/screen-spec.md`.

For lite: fill in Purpose, Primary User Question, Layout, Primary Action, and core states (loading, empty, main).
For pro: fill in all sections.

## Step 8: Consistency check

After writing, check the spec against:
1. **Glossary:** Does the copy use the correct terms from `docs/product/glossary.md`?
2. **Interaction rules:** If `docs/product/interaction-rules.md` exists, are all relevant rules reflected?
3. **Nearby screens:** Are patterns consistent with `docs/screens/` files read in Step 4?

Flag any inconsistencies:
```
⚠ Terminology: This spec uses "destination" — glossary specifies "Sink" as the primary term.
  Update? (y / keep "destination" / defer)
```

## Step 9: Summarize

```
Screen spec complete → docs/screens/[slug].md

Screen: [Screen Name]
Primary question: "[user question]"
States covered: [list]
Acceptance criteria: [N criteria]

Recommended next step:
  product:spec "[next screen in the journey]"
  
  Or when all screens for the feature are specced:
  product:build — to verify build readiness
```

## Artifact naming
Screen specs are living documents — always updated in place using update mode (Step 3). Never create a new file for the same screen name. To record that a screen was redesigned, add a change note in the frontmatter before updating:
```yaml
changes:
  - date: YYYY-MM-DD
    note: "Redesigned for [feature] — previous version archived in git history"
```

## Fallback questions (if recipe unavailable)
1. "What is the primary user question this screen answers? One sentence."
2. "What brings the user to this screen? Name 2–3 entry points."
3. "What data or content does this screen need to display?"
4. "What does this screen look like when: data is loading / there's no data yet / something went wrong?"
5. "What's the primary action a user takes on this screen? What happens next?"

## Pivot interrupt
If at any point the user signals the screen's purpose is unclear or the design needs rethinking:
1. Stop the interview immediately
2. Record what was learned as a partial artifact: `docs/screens/[name]-partial.md` with `status: abandoned`
3. Say: "Spec paused. Recommended: clarify the screen's purpose with product:journey first, then re-run product:spec."

## Rules

- The primary user question must be answerable in one sentence. Push back on vague answers.
- Loading, empty, and error states are NEVER optional. Always ask about them.
- Never use terminology that contradicts the glossary. Always check.
- Acceptance criteria must be verifiable (yes/no tests). Reject vague criteria.
