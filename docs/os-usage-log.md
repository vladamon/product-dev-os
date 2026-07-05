# Product OS — usage log

Auto-populated by the `log-skill-usage.sh` hook every time a `product:*` skill runs
in any project. The goal: replace opinion with evidence about which skills pull weight.

**After each run, fill in the last two columns yourself:**
- **Load-bearing?** — `Y` if the output actually changed what you did next (fed a build,
  made a decision, killed an idea). `N` if you produced the file but it didn't change anything.
- **Note** — one line: what it changed, or why it was theater.

Decision rule: after ~5 load-bearing runs, skills with mostly `N` are demoted (lite-only
or cut); skills with mostly `Y` are the spine. See
`docs/notes/2026-06-19-freeze-and-build-vs-buy-decision.md`.

| Date | Project | Skill | Args | Load-bearing? (Y/N) | Note |
|------|---------|-------|------|---------------------|------|
| 2026-06-20 00:59 | workers-management | product-next | workers-management (cwd: /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/indie-haeven/indie-triage/workers-management) | | |
| 2026-06-20 01:06 | workers-management | product-reflect | fast-project-creation-from-email (cwd: /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/indie-haeven/indie-triage/workers-management) | | |
| 2026-06-20 01:15 | workers-management | product-measure | fast-project-creation-from-email (cwd: /Users/vladimir.cutkovic/Documents/code/github-vladamon.com/indie-haeven/indie-triage/workers-management) | | |
| 2026-07-02 | indie-triage | product-triage | (manual entry — run predates hook coverage) | Y | Ranked projects: picked one focus project, parked the other. First confirmed load-bearing run. |
