---
name: triage
description: Use this skill when the user invokes `/product:triage`, has several projects or ideas competing for attention, feels scattered, or asks which project to focus on this week or which to kill.
---
# product:triage — Portfolio Triage

Use this skill when the user invokes `/product:triage` or asks to rank, prioritize, or choose between multiple projects in their portfolio.

## Purpose

Choose what to work on this week across a portfolio of projects — not what to build inside one product. This is the layer above the per-product lifecycle. Produces `docs/triage/YYYY-MM-DD-triage.md` in the directory where invoked.

Read recipe `recipes/18-triage.md` for the authoritative process.

## Contract
Requires: a directory containing multiple project subdirectories (e.g. `~/code/`), OR explicit project paths passed at invocation
Produces: docs/triage/YYYY-MM-DD-triage.md (in the cwd where invoked, NOT in each project)
Updates: nothing (new date-prefixed file per run)

## Step 0: Verify prerequisites (gate)

1. Determine the scan root — first match wins:
   - User passed paths (`product:triage ~/code/foo ~/code/bar`) → use exactly those
   - The cwd has ≥2 project subdirectories → scan the cwd (the normal case: run from `~/code/`)
   - The cwd is itself a project (has `.git/` or a manifest) and has <2 project subdirectories → scan the cwd's parent, and say so: "You're inside [project]; scanning its parent [dir] instead."

2. A subdirectory is a project if it contains `.git/`, `package.json`, `Cargo.toml`, `pyproject.toml`, `go.mod`, `docs/product/`, or similar. Also include ideas captured in `docs/ideas/*-ideation.md` at the scan root as "idea (no repo)" entries.

3. If fewer than 2 projects are found:
   ```
   ✗ Cannot run product:triage usefully.

   Found [N] project(s) in [scan root]. Triage needs at least 2 to compare.

   Either:
     - cd to the directory that contains your project repos, or
     - pass paths explicitly: product:triage ~/code/projA ~/code/projB
   ```
   Then STOP.

**Gate override:** `--skip-gate` proceeds with one project; write `gate_override: true` in the triage frontmatter and `Gate skipped — fewer than 2 projects` under Notes / signals.

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Portfolio has 5+ projects → default to `pro`, announce: "Defaulting to pro — 5+ projects warrants tighter scoring. Run lite? (y/n)"
3. Otherwise → ask: "Run **lite** (4 questions per project, ~10 min total) or **pro** (6 dimensions + kill review, ~20 min)?"

## Step 2: Read context per project

Gather signals before asking the founder:
- `README.md` first paragraph
- Last commit date: `git -C [dir] log -1 --format=%cd`
- Commits in the last 30 days: `git -C [dir] rev-list --count --since='30 days ago' HEAD`
- `TODO.md` / `BACKLOG.md` if present

If the project has Product OS docs, also note:
- Stage per the `product:next` companion map (no need to invoke it)
- `docs/product/business-model.md` verdict and target MRR → pre-fill **Money potential** (show it; founder confirms)
- Latest critique verdict, experiment verdicts, pmf decision — a `Kill` or `Park` verdict is a kill-candidate signal
- Pitches without retros (in-flight features); plan progress (ticked / total)
- Latest check-in: missed-commitment streak and energy trend

Previous triage files in `docs/triage/` at the scan root: note last week's focus and whether it moved.

## Step 3: Show portfolio snapshot

```
product:triage — scanning [scan root]

Found [N] projects:
  [name]    last commit [date]    [stage / verdicts / signals]
  [name]    last commit [date]    [stage / verdicts / signals]

Last triage: [date] — focus was [project]; since then [N] commits there
Will ask about each: [4 or 6] dimensions + next milestone.
Time budget: ~[N] min total.

Proceed?
```

Wait for confirmation.

## Step 4: Conduct the interview, one project at a time

Ask the lite or pro set from `recipes/18-triage.md`. Keep a running score table.

**Forcing functions — regardless of tier:**
- Last commit >60 days ago and no concrete next milestone in one sentence → ask: "Should this be killed?"
- A critique, experiment, or pmf verdict already says Kill/Park, yet the founder scores it high → name the contradiction: "Your own [artifact] said [verdict] on [date]. What changed?"
- Two projects within 1 point for the focus slot → "If you could only touch ONE this week, which?"
- Last triage's focus had near-zero commits since → ask why before re-choosing it.
- Reject "depends" and "both equally important" — triage requires a decision.

## Step 5: Synthesize

Propose:
- **Focus** — exactly one project for this week
- **Secondary** — at most one, only touched if focus is blocked
- **Do not touch** — everything else, explicitly listed
- **Kill candidates** — dormant + no milestone, or a Kill/Park verdict on file

```
Proposed triage:

Focus:       [project] — [why]
Secondary:   [project] — [why]
Don't touch: [list]
Kill:        [list, or "none — but be honest"]

Accept, or want to revise?
```

## Step 6: Produce the artifact

Write `docs/triage/[today]-triage.md` in the cwd (create the directory if missing), using the structure in `recipes/18-triage.md`.

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
  Inside it: product:next — to see where it is in its own journey.
  End of week: product:checkin inside the focus project.
  Re-run product:triage weekly, or whenever you feel scattered.
```

## Fallback questions (if recipe unavailable)
For each project:
1. "What is this project and what's the next concrete milestone?"
2. "Money potential — 1 to 5?"
3. "Energy to next milestone — 1 (months) to 5 (sessions)?"
4. "What's blocking progress right now?"

Then force: "If you could only touch ONE this week, which?"

## Artifact naming
Point-in-time. A new date-prefixed file per run, in the cwd only.

## Rules

- A focus project is mandatory. "Whichever feels right" is not a triage outcome.
- Do-not-touch must be explicit. Leaving a project off the list silently leaves it on the table mentally.
- Kill candidates must be reviewed when any project is dormant 60+ days with no clear milestone, or carries a Kill/Park verdict. Push hard.
- Triage outputs decay fast. Treat any triage file older than 10 days as stale.
- Never write into the individual project directories — triage artifacts live in the cwd.
