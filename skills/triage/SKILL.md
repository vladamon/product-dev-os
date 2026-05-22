---
name: product:triage
description: Use this skill when the user invokes `/product:triage` or asks to rank, prioritize, or choose between multiple projects in their portfolio.
---
# product:triage — Portfolio Triage

Use this skill when the user invokes `/product:triage` or asks to rank, prioritize, or choose between multiple projects in their portfolio.

## Purpose

Choose what to work on this week across a portfolio of projects — not what to build inside one product. This is the layer above the per-product lifecycle. Produces `docs/triage/YYYY-MM-DD-triage.md` in the directory where invoked.

Read recipe `recipes/18-triage.md` for the authoritative process.

## Contract
Requires: a directory containing multiple project subdirectories (e.g., `~/code/`), OR explicit project paths passed at invocation
Produces: docs/triage/YYYY-MM-DD-triage.md (in the cwd where invoked, NOT in each project)
Updates: nothing (new date-prefixed file per run)

## Step 0: Verify prerequisites (gate)

1. Determine the scan root:
   - If user passed paths (e.g., `product:triage ~/code/foo ~/code/bar`) → use those
   - Otherwise → use the current working directory's parent as the scan root: `..` from cwd

2. List subdirectories that look like projects (contain a `.git/`, `package.json`, `Cargo.toml`, `pyproject.toml`, or similar).

3. If fewer than 2 projects are found:
   ```
   ✗ Cannot run product:triage usefully.

   Found [N] project(s) in [scan root]. Triage needs at least 2 projects to compare.

   Either:
     - cd to a parent directory containing multiple project repos, or
     - Pass paths explicitly: product:triage ~/code/projA ~/code/projB ~/code/projC
   ```
   Then STOP.

If checks pass, proceed.

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Portfolio has 5+ projects → default to `pro`, announce: "Defaulting to pro — 5+ projects warrants tighter scoring. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (4 questions per project, ~10 min total) or **pro** (6 dimensions + kill review, ~20 min)?"

## Step 2: Read context per project

For each project found, gather quick signals before asking the user:

- `README.md` first paragraph (project description)
- Last commit date: `git log -1 --format=%cd` (run from project dir)
- Number of commits in last 30 days
- Presence of `docs/specs/*-retro.md` (a "killable" signal if retros say "kill" or simplify)
- Open issues/TODOs in `TODO.md` or `BACKLOG.md` if present

If a project has its own `docs/product/` (Product OS tracked), also note:
- Whether a pitch exists without a retro (in-flight feature)
- Phase per `product:next` heuristic (no need to invoke it)

## Step 3: Show portfolio snapshot

```
product:triage — scanning [scan root]

Found [N] projects:
  [name]    last commit [date]    [phase / signals]
  [name]    last commit [date]    [phase / signals]
  ...

Will ask about each: [4 or 6] dimensions + next milestone.
Time budget: ~[N] min total.

Proceed?
```

Wait for confirmation.

## Step 4: Conduct the interview, one project at a time

For each project, ask the lite or pro question set from `recipes/18-triage.md`. Capture scores as a running table.

**Forcing functions — apply these regardless of tier:**

- If a project's last commit was >60 days ago and the user can't name a concrete next milestone in one sentence: ask explicitly "Should this be killed?"
- If two projects score within 1 point of each other for the focus slot: ask "If you could only touch ONE this week, which?" — force the choice.
- Reject "depends" or "both equally important" — triage requires a decision.

## Step 5: Synthesize

After scoring all projects, propose:
- **Focus** — exactly one project for this week
- **Secondary** — at most one, only touched if focus is blocked
- **Do not touch** — everything else, explicitly listed
- **Kill candidates** — any that triggered the >60-day + no-milestone signal

Show the proposal to the user before writing:
```
Proposed triage:

Focus:       [project] — [why]
Secondary:   [project] — [why]
Don't touch: [list]
Kill:        [list, or "none — but be honest"]

Accept, or want to revise?
```

## Step 6: Produce the artifact

Write `docs/triage/[today's date]-triage.md` in the cwd (create the `docs/triage/` directory if missing).

Use the structure from `recipes/18-triage.md`.

## Step 7: Summarize

```
Triage complete → docs/triage/[date]-triage.md

Focus this week: [project]
Next action:     [specific task]
Time budget:     [hours/days]

Do not touch: [N] project(s)
Kill candidates: [N]

Recommended next step:
  Tomorrow morning: open [focus project] and start [specific action].

  Inside the focus project:
    product:next — to see where that project is in its own lifecycle.

  Re-run product:triage weekly, or whenever you feel scattered.
```

## Fallback questions (if recipe unavailable)
For each project:
1. "What is this project and what's the next concrete milestone?"
2. "Money potential — 1 to 5?"
3. "Energy to next milestone — 1 (months) to 5 (sessions)?"
4. "What's blocking progress right now?"

Then force: "If you could only touch ONE this week, which?"

## Rules

- A focus project is mandatory. "I'll work on whichever feels right" is not a triage outcome.
- Do-not-touch must be explicit. Leaving a project off the list silently leaves it on the table mentally.
- Kill candidates must be reviewed if any project has been dormant 60+ days with no clear milestone. Push hard.
- Triage outputs decay fast. Treat any triage file older than 10 days as stale.
- Never write into the individual project directories — triage artifacts live in the cwd where invoked.
