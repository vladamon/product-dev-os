---
name: checkin
description: Use this skill when the user invokes `/product:checkin`, asks for a weekly review, or says they feel stuck, lost momentum, aren't making progress, keep switching projects or chasing new ideas, are burning out, or want someone to hold them accountable to what they committed to.
---
# product:checkin — Weekly Founder Check-in

Use this skill when the user invokes `/product:checkin` or wants a weekly accountability review of their project.

## Purpose

Be the accountability partner a solo founder doesn't have. In ten minutes a week: check last week's commitments against evidence, track one number, detect avoidance and burnout patterns, check kill criteria, and set at most 3 verifiable commitments for next week. Produces `docs/checkins/YYYY-MM-DD-checkin.md`.

Read recipe `recipes/28-weekly-checkin.md` for the authoritative process.

## Contract
Requires: nothing (runs any time; reads previous check-ins, triage, plan progress, telemetry, business model, and git history when present)
Produces: docs/checkins/YYYY-MM-DD-checkin.md (in the cwd — normally the focus project)
Updates: nothing (new date-prefixed file per run)

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. ≥3 previous check-ins in `docs/checkins/` → default to `pro`, announce: "Defaulting to pro — [N] previous check-ins, enough history for pattern detection. Run lite? (y/n)"
3. Otherwise → default to `lite`, announce: "Defaulting to lite — pattern detection needs 3+ previous check-ins. Run pro? (y/n)"

## Step 2: Read context

Gather everything before asking anything. Skip any source that doesn't exist, silently.

**1. Previous check-ins:** `docs/checkins/*-checkin.md`. The newest holds last week's commitments. Read frontmatter metrics from the last 4 for patterns.
**2. Triage:** newest `docs/triage/*-triage.md` in the cwd, else `../docs/triage/`. Note the focus project. Flag if this project is not the focus or is on do-not-touch. Flag a triage older than 10 days as stale.
**3. Build progress:** newest `docs/specs/*-plan.md`. Count `- [x]` vs `- [ ]`, compare with the count recorded in the last check-in, and compare days since the plan was created with the pitch's appetite.
**4. One number:**
   - Post-launch: Primary Metric (Current column) in `docs/product/journeys/*-telemetry.md`, else the target metric in `docs/product/business-model.md`.
   - Pre-launch: conversations logged in `docs/research/*-synthesis.md`, signups or results in open `docs/specs/*-experiment.md`.
**5. Kill criteria:** frontmatter `kill_criterion` + `kill_date` in `docs/specs/*-critique.md`; `*-experiment.md` with `verdict: pending` past `conclude_by`; `next_review` and flip thresholds in the newest `docs/specs/*-pmf.md`; kill criteria written in the latest triage.
**6. MVP exists?** Yes if any `docs/specs/*-launch.md` exists or the newest plan is fully checked. Otherwise ask once. This drives the user-facing commitment rule.
**7. Git:** `git log --since='7 days ago' --oneline` — commit count and subjects. Skip if not a git repo.
**8. New-idea itch:** sibling project directories in `..` whose first commit is within the last 14 days, or a `docs/ideas/*-ideation.md` in `..` dated within 14 days.

## Step 3: Show context summary

```
product:checkin — week of [date] in [project]

Last check-in: [date] ([N] days ago) / none — first check-in
Last week's commitments:
  1. [commitment]
  2. [commitment]

Evidence found:
  Commits (7 days): [N] — [top 3 subjects]
  Plan progress:    [slug] [x]/[total] tasks ([+N] since last check-in) · day [N] of [appetite]
  One number:       [metric] = [value] (last: [value]) / not defined yet
  Triage:           focus = [project] ([date]) [⚠ this project is not the focus] [⚠ stale]
  Kill criteria due: [list] / none
  New projects/ideas in last 14 days: [list] / none

Will ask about: commitments, what moved, one number, energy[, time split, patterns]

Correct anything?
```

If the last check-in is under 5 days old, add: `⚠ Last check-in was [N] days ago. Check-ins are weekly — run anyway? (y/n)`

Wait for confirmation.

## Step 4: Conduct the interview

Read `recipes/28-weekly-checkin.md`. One question at a time. Pre-fill answers from the evidence and ask the founder to confirm; don't make them retype what git already shows.

**Always ask (both tiers):**
1. For each commitment from last week: "Done, partial, or not done? What's the evidence?" If not done: "What got in the way — one line."
2. "What actually moved this week — shipped, users talked to, signups, revenue?"
3. "What's the one number now?" If it isn't defined, define it now. Pre-launch: user conversations held or experiment signups. Post-launch: activated users or MRR.
4. "Energy this week, 1 to 5 — and one line on why."
5. "What are your commitments for next week? Maximum 3."

**Pro adds:**
6. "Roughly how many hours this week on building, on distribution/sales/user contact, and on admin/learning?"
7. Present the pattern findings (below) and ask: "Is this pattern real? What's behind it?"
8. For each kill criterion due: "The criterion was [X] by [date]. Did it trip?"

**Commitment quality check — enforce before accepting:**
- Each commitment is verifiable. "Send the outreach script to 15 people from the gtm list" passes; "work on marketing" does not. Ask for a rewrite.
- More than 3 → "Pick the 3 that matter. The rest go to a someday list."
- MVP exists and none touches users or distribution → "At least one commitment must put you in front of users. Which one?"

**Pattern detection (pro).** Compute from the frontmatter of the last 4 check-ins plus this one. Name each pattern bluntly, with its count (conventions §8):

| Pattern | Trigger | Say |
|---|---|---|
| Building instead of selling | MVP exists AND `user_contacts: 0` for ≥3 consecutive check-ins | "Zero user contact for [N] weeks since the MVP existed. That's avoidance, not a backlog." |
| Polishing without users | No launch file, plan fully checked ≥2 check-ins ago, commits continue | "The plan is done and you're still committing. What are you polishing instead of launching?" |
| New-idea itch | New sibling project or ideation file in 14 days while the plan is incomplete | "A new project appeared while [focus] is unfinished. That's the shiny-object pattern." |
| Appetite overrun | Days since plan created > pitch appetite, plan incomplete | "Day [N] of a [appetite] appetite. Scope should have been cut [N] days ago." |
| Repeat miss | The same or a near-identical commitment not done in ≥2 check-ins | "[Commitment] has been missed [N] times. Make it smaller or drop it." |
| Low energy | `energy ≤ 2` this check-in and the previous one | "Energy has been [N] and [N]. That's a signal, not a character flaw." |

A week counts as **missed** when fewer than half of its commitments were done.

**Escalations — state them, don't suggest softly:**
- **3 consecutive missed weeks** → `product:triage` (this may be the wrong project), or halve the size of next week's commitments.
- **Energy ≤2 for 2+ weeks** → reduce scope or take a deliberate break. Never recommend pushing harder.
- **Kill criterion tripped** → `product:pmf` if the product is live with users, otherwise `product:triage`.

## Step 5: Produce the artifact

Create `docs/checkins/` if missing. Write `docs/checkins/[today's date]-checkin.md` using the output structure in `recipes/28-weekly-checkin.md`. Always fill the frontmatter metrics — they are next week's pattern input.

- Lite: Last commitments, What moved, One number, Energy, Next commitments, Escalation. Mark Time split, Patterns, and Kill criteria `[deferred]`.
- Pro: all sections.

## Step 6: Summarize

```
Check-in complete → docs/checkins/[date]-checkin.md

Last week:  [done]/[total] commitments done ([N] missed weeks in a row)
One number: [metric] [value] ([↑/↓/→] vs [last value])
Energy:     [N]/5
Patterns:   [names] / none

Next week:
  1. [commitment]
  2. [commitment]
  3. [commitment]

[If escalation:]
⚠ [Escalation statement]

Recommended next step:
  [Escalation route, e.g. product:triage — 3 missed weeks in a row on this project]
  [Otherwise:]
  Start with commitment 1 on [next working day].
  Next check-in: product:checkin on [date + 7 days]
  [If no plan or pitch is active:] product:next — to see where [project] is in its lifecycle
```

## Fallback questions (if recipe unavailable)
1. "What did you commit to last week, and what got done — with evidence?"
2. "What actually moved: shipped, users contacted, signups, revenue?"
3. "What's the one number that tells you whether this project is working, and what is it now?"
4. "Energy 1–5 this week?"
5. "What are your top 3 verifiable commitments for next week?"

## Pivot interrupt
If the founder says they want to quit, switch projects, or no longer believe in the product ("I think I'm done with this", "I want to start something else"):
1. Don't talk them out of it and don't cheerlead. Finish the commitments review and energy question so the record is honest.
2. Record the signal in the Escalation section: `founder signal: "[quote]"`.
3. Route: live with users → `product:pmf` (make the decision on evidence); pre-launch or multiple projects → `product:triage`; no project worth keeping → `product:ideate`.

## Artifact naming
Point-in-time artifact — never overwritten. One check-in per week; if a file already exists for today, append `-2`. History is the point: patterns are computed across files.

## Rules

- Commitments are specific and verifiable. Maximum 3.
- Once an MVP exists, at least one commitment touches users or distribution.
- Missed commitments are recorded honestly, with a running count. No shaming, no excuses written for the founder.
- Evidence beats recollection: pre-fill from git, plan checkboxes, and telemetry, then confirm.
- Patterns are named bluntly with counts. Escalations are stated as the recommendation, not offered as an option among many.
- Low energy never gets "push harder". It gets less scope or a break.
- Always write the frontmatter metrics, even in lite. Without them, next week's pattern detection has no input.
- Never write into other projects' directories.
