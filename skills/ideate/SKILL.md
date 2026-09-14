---
name: ideate
description: Use this skill when the user invokes `/product:ideate`, or says they want to start a business or side project but have no idea what to build, have a pile of vague ideas and can't pick one, asks "what should I build?" or "help me find a startup idea", or wants to choose an idea before any project exists.
---
# product:ideate — Idea Sourcing

Use this skill when the user invokes `/product:ideate` or wants to find or choose a product idea before any project exists.

## Purpose

Start from the founder, not the market. Inventory what the founder can uniquely reach and sustain, source candidates, cut them with kill filters, score the survivors, and pick **exactly one** idea plus a runner-up — with the first 5 people to talk to. Produces `docs/ideas/YYYY-MM-DD-ideation.md` in the current working directory.

Read recipe `recipes/19-idea-sourcing.md` for the authoritative process.

## Contract
Requires: nothing (entry point; runs in the cwd with no project; reads docs/intake/ if present)
Produces: docs/ideas/YYYY-MM-DD-ideation.md (in the cwd where invoked, NOT in any project directory)
Updates: nothing (new date-prefixed file per run)

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Founder already has ≥3 ideas (passed at invocation, found in `docs/intake/`, or unpicked in a prior `docs/ideas/` file) → default to `lite`, announce: "Defaulting to lite — you already have [N] ideas to score. Run pro for a full founder inventory and idea generation? (y/n)"
3. Fewer than 3 ideas → default to `pro`, announce: "Defaulting to pro — fewer than 3 ideas, so we'll source them from your founder inventory. Run lite? (y/n)"

If the idea count is unknown, ask once: "Do you already have 3 or more ideas you want to compare?"

## Step 2: Read context

**1. User-specified ideas or files** (inline list, `from`, `using`, or natural mention)
**2. `docs/intake/`** in the cwd — notes, pain journals, lists of ideas
**3. Prior ideation runs:** `docs/ideas/*-ideation.md` — previous picks and ideas already cut. Do not re-score a cut idea unless the founder states what changed.
**4. Portfolio signal:** latest `docs/triage/*-triage.md` in the cwd; count subdirectories that look like projects (`.git/`, `package.json`, `pyproject.toml`, …) and how many had a commit in the last 30 days.
**5. Research capability:** whether web search is available (conventions §7).

## Step 3: Show context summary

```
product:ideate — sourcing ideas in [cwd]

Ideas already on the table: [N] — [list, or "none"]
Previous ideation runs:     [date — picked "[idea]"] / none
Active projects nearby:     [N] — [names, or "none"]
Web research:               available / unavailable — market signals become a research checklist

[If ≥2 active projects:]
⚠ You already have [N] active projects. If the real problem is choosing between them,
  run product:triage instead. Continue ideation anyway? (y/n)

Will ask about: [founder constraints (lite) | full founder inventory + sourcing (pro)],
then kill filters and scoring.

Correct anything?
```

Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/19-idea-sourcing.md`. Follow the lite or pro set. One question at a time.

**Constraints first — always ask, both tiers.** Constraints cut more ideas than any score:
1. "How many hours a week can you sustain on this for the next 12 months — alongside what?"
2. "What's your runway, and what monthly income would make this worth it — by when?"
3. "What will you refuse to do? (e.g. B2C, sales calls, hardware, regulated industries, being on camera)"

**Pro — founder inventory, then sourcing.** Ask the inventory questions from the recipe, then walk the sourcing lenses and collect candidates.

**AI-proposed candidates.** Add at most 5. Label each `[AI-proposed]` and anchor it to a specific inventory item (`from: 6 years running payroll at a dental clinic`). No generic trend ideas. Founder ideas are always included.

**Kill filters — apply to every candidate.** Show pass/fail with a one-line reason. A single fail removes the candidate regardless of how exciting it is. The founder may contest a fail only with evidence, not enthusiasm.
1. Can name 20 specific reachable target users without paid ads
2. The problem already costs those users time or money today
3. A first version fits in ≤6 weeks of the founder's real hours (hours/week × 6)
4. The founder would still work on it after 12 months of slow growth

"AI wrapper for X" candidates must state a concrete distribution answer to pass filter 1.

**Score survivors 1–5** on the six recipe dimensions. Market-signal claims follow conventions §7: search, then label `[sourced: …]`, `[estimate: …]`, or `[founder-stated]`. Never invent competitors or numbers. The total is a sort key, not the decision.

**Force the pick.** If the top two totals are within 2 points: "If you could only talk to users about ONE of these next week, which?" Reject "both" and "depends".

**First 5 conversations.** For the pick: 5 named people or exact places (a named ex-colleague, a specific subreddit thread, a named Slack community). "People on LinkedIn" is not an answer.

**Zero survivors.** Do not lower the filters. Record why each failed, and recommend a 2-week pain journal (write down every time you or people around you pay, wait, or work around something), then re-run `product:ideate`.

## Step 5: Produce the artifact

Create `docs/ideas/` in the cwd if missing. Write `docs/ideas/[today's date]-ideation.md` using the output structure in `recipes/19-idea-sourcing.md`.

- Lite: Founder constraints, Candidates, Kill filters, Scores, Pick, Runner-up, First 5 conversations, Next step. Mark Founder inventory and Sourcing lenses `[deferred]`.
- Pro: all sections.

## Step 6: Summarize

```
Ideation complete → docs/ideas/[date]-ideation.md

Candidates:  [N] considered, [N] passed kill filters
Pick:        [idea] — [one-line why]
Runner-up:   [idea]
First 5:     [names / exact places]

Recommended next step:
  1. This week: message the first 5. Ask about the last time they faced [problem] —
     not about your idea.
  2. Create a project directory for "[idea]", open it, and run:
       product:discover using [absolute path to ideation file]
  3. Then: product:critique — attack the idea before building anything.
```

Zero-survivor variant:

```
Ideation complete → docs/ideas/[date]-ideation.md

Candidates: [N] considered, 0 passed kill filters
Most common failure: [filter] — [pattern]

Recommended next step:
  Keep a pain journal for 2 weeks (docs/intake/pain-journal.md), then re-run:
    product:ideate
```

## Fallback questions (if recipe unavailable)
1. "How many hours a week can you sustain for 12 months, and what income target makes this worth it?"
2. "What problems have you or your clients personally paid money or lost hours to solve?"
3. "Which communities or industries do you have insider access to?"
4. "For each idea: can you name 20 people who have this problem and reach them without ads?"
5. "If you could only talk to users about one idea next week, which one?"

## Pivot interrupt
If the founder reveals mid-interview that they already have a committed idea or project ("actually I already know what I want to build"):
1. Stop the interview immediately
2. Record what was captured as `docs/ideas/[date]-ideation-partial.md` with `status: abandoned` and `pivot_signal: "[what changed]"`
3. Say: "Ideation paused — you already have a direction. Run product:discover in that project. If you're torn between several existing projects, run product:triage instead."

## Artifact naming
Point-in-time artifact — never overwritten. A re-run creates a new date-prefixed file; if one already exists for today, append `-2`. Previous picks stay on record so drift between runs is visible.

## Rules

- Exactly one pick and at most one runner-up. "Keep all three open" is not an outcome.
- Constraints before ideas. An idea that doesn't fit the founder's hours, runway, or refusals is dead on arrival.
- A failed kill filter removes the candidate. Scores never rescue it.
- AI-proposed ideas are labeled and anchored to the founder's inventory. Never generic.
- Never lower the filters to manufacture a pick.
- Every market claim is labeled per conventions §7. No invented competitors, numbers, or URLs.
- Don't praise ideas (conventions §8). Report what passed, what failed, and why.
- Never write into project directories. Ideation artifacts live in the cwd.
