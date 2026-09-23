---
name: interview
description: Use this skill when the user invokes `/product:interview prep` or `/product:interview synthesize`, or asks to "prepare customer interviews", "write an interview script", "who should I talk to and what do I ask", "I talked to users — make sense of the notes", "synthesize these interviews / support tickets / churn emails", or "I'm drowning in feature requests". Turns customer conversations and other qualitative input into evidence on the assumption map.
---
# product:interview — Customer Evidence

Use this skill when the user needs to run customer conversations (`prep`) or turn notes, transcripts, and other qualitative input into evidence (`synthesize`).

## Purpose

No idea or assumption map yet — you want to find the problem inside a client's or a segment's operations? Use `product:field` instead; this skill tests assumptions you already have.

The rest of the OS assumes customer conversations happened. This skill makes them happen and makes them count.

- **`prep`** builds an interview kit for specific assumptions: who qualifies, where to find them, an outreach message that asks for advice (never pitches), a Mom Test script tagged to assumption IDs, and — decided up front — what would change your mind. Produces `docs/research/YYYY-MM-DD-[slug]-interview-kit.md`.
- **`synthesize`** reads notes, transcripts, support tickets, feature requests, reviews, or churn emails; separates evidence (past behavior, spend, commitments) from noise (compliments, hypotheticals, requests); clusters patterns; and maps them to assumptions. Produces `docs/research/YYYY-MM-DD-[slug]-synthesis.md` and updates `docs/product/assumptions.md`.

Read `recipes/21-customer-interviews.md` for the authoritative process and `recipes/03-discovery.md` for question types. Follow `docs/conventions.md` §5 (assumption map) and §8 (honesty protocol).

## Contract
Requires: `prep` — docs/product/assumptions.md. `synthesize` — ≥1 source file in docs/intake/interviews/ or passed via `using` (warning below 3).
Produces: `prep` — docs/research/YYYY-MM-DD-[slug]-interview-kit.md. `synthesize` — docs/research/YYYY-MM-DD-[slug]-synthesis.md
Updates: `synthesize` only — docs/product/assumptions.md (`Evidence` column, `## Discovery Evidence` section, new rows with `Source: interview`; proposed risk changes applied only on confirmation). Never sets `Verdict`.

## Step 0: Verify prerequisites (gate)

**Mode check.** If invoked without `prep` or `synthesize`: files exist in `docs/intake/interviews/` → ask "Synthesize the N files in docs/intake/interviews/?"; otherwise → default to `prep`.

**prep — assumption map exists:**
```
✗ Cannot run product:interview prep yet.

Missing requirements:
  - docs/product/assumptions.md is missing

Run this first:
  product:discover        (new idea — ~10 min)
  product:critique "…"    (cold critique also names what to learn)

Why this matters:
  An interview without assumptions to test becomes a friendly chat.
  The kit ties every question to something that could be false.
```
Then STOP.

**synthesize — sources exist:**
```
✗ Cannot run product:interview synthesize yet.

Missing requirements:
  - no files in docs/intake/interviews/ and none passed via `using`

Run this first:
  product:interview prep     — then hold the conversations
  Drop notes/transcripts into docs/intake/interviews/ (one file per conversation)

Why this matters:
  Synthesis needs raw material. Memory of "they seemed interested" is not evidence.
```
Then STOP.

**Warnings (never stop):**
- `⚠ Only N source(s) — patterns need ≥2 sources; with <3 this synthesis will report signals, not patterns.`
- `⚠ docs/product/assumptions.md missing — synthesis will be written, but no assumption rows can be updated. Run product:discover afterwards.`

**Gate override.** `--skip-gate` proceeds; write `gate_override: true` in the artifact frontmatter and `Gate skipped — [check]` in its Notes section.

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `prep` → default to `lite`, announce: "Defaulting to lite — learning goals, script, and outreach message (~10 min). Run pro for screening criteria, recruiting plan, and bias guards? (y/n)"
3. `synthesize` with ≥5 sources → default to `pro`, announce: "Defaulting to pro — N sources, per-conversation table and bias check worth it. Run lite? (y/n)"
4. `synthesize` with <5 sources → default to `lite`, announce: "Defaulting to lite — patterns and assumption mapping. Run pro? (y/n)"

## Step 2: Read context

**1. User-specified files** (`from`, `using`, or natural mention)
**2. `docs/intake/interviews/`** — all files (synthesize). Read-only: never move, rename, or annotate them.
**3. `docs/product/assumptions.md`** — full map; note high-risk rows with `Verdict` blank/pending
**4. `docs/product/product-model.md`** — Primary Users (screening criteria)
**5. Latest `docs/specs/*-critique.md`** — riskiest assumption and cheapest test
**6. Prior `docs/research/*-interview-kit.md`** — synthesize reads the kit's pre-decided "change my mind" signals
**7. Prior `docs/research/*-synthesis.md`** — avoid double-counting sources already synthesized

## Step 3: Show context summary

```
product:interview [prep | synthesize] — [slug]

Assumptions: [N rows, N high-risk untested]
  Targeting: [A3 — text] [A5 — text]     (prep)
Primary user (from model): [text | not defined — screening will be rough]
Latest critique: [verdict + riskiest assumption | none]

Sources (synthesize): [N files — N interviews, N tickets, N other]
  Already synthesized in [file]: [N — will be skipped]
Kit found (synthesize): [file | none — no pre-decided signals; bias risk higher]

Correct anything?
```

Wait for confirmation.

## Mode: prep

Follow `recipes/21-customer-interviews.md` → Prep.

1. **Pick targets.** If assumption IDs were passed, use them. Otherwise list untested high-risk rows and ask: "Which 1–3 assumptions should these conversations inform? Pick the ones you'd be most upset to learn are false."
2. **Always ask:** "Who specifically qualifies for a conversation — and who looks similar but doesn't?" and "Where will you find 5 of them this week — named channels or people?"
3. **Change-my-mind signals (always).** For each target assumption: "What would you have to hear — about past behavior, not opinions — to believe this is false?" Record before any conversation happens.
4. **Write the script** from recipe 03 question types, each question tagged `[A#]`. Order: situation → consequence → workaround & spend → priority → commitment ask.
5. **Write the outreach message.** Asks for 20 minutes of advice about how they handle [situation]. Never names the product, never describes the solution, never asks "would you use".
6. **Pro:** screening questions, recruiting plan with counts per channel, bias guards (no friends/family/colleagues unless they are genuinely target users; mix of recent and non-recent sufferers), note-taking template.
7. **Set a target:** 5 conversations per segment by a date.

Write the kit using the Prep output structure in the recipe. Frontmatter `type: interview-kit`, `assumptions: [A3, A5]`, `target_count`, `due`.

## Mode: synthesize

Follow `recipes/21-customer-interviews.md` → Synthesize.

1. **Classify each source:** interview · support ticket · feature request · review · churn/cancellation · sales call · other.
2. **Extract per source** — evidence only: past behaviors (what they did, when), pains with frequency or cost, current workarounds, money or time already spent, trigger events, commitments given (time, reputation, money). Quote briefly with the source filename.
3. **Flag non-evidence** in a separate list per source: compliments ("love it"), hypotheticals ("I would…", "I'd pay…"), feature requests, generic agreement. Count them; do not use them.
4. **Restate feature requests as jobs.** "Add Slack export" → "needs to show progress to a manager who lives in Slack". Requests are not requirements.
5. **Cluster patterns** — a pattern requires ≥2 independent sources. One-off findings go to Signals.
6. **Map to assumptions.** For every pattern: which IDs it supports or contradicts, and how strongly (commitments > spend > past behavior > stated pain).
7. **Check the kit's change-my-mind signals** (if a kit exists): did any fire? Say so plainly.
8. **Pro — bias check:** recruiting skew (friends, one company, self-selected fans, existing users only), leading questions visible in transcripts, interviewer pitched the product.
9. **Propose, don't apply,** risk changes:
   ```
   A3 — "Freelancers track time in spreadsheets"
     Current risk: high
     Evidence: 4/5 described spreadsheet workflows in the last month; 2 pay for Toggl but export to sheets
     Proposed: medium   Apply? (y / keep high)
   ```
10. **New assumptions** surfaced by patterns → propose rows with `Source: interview`, next unused ID.

## Step 5: Produce the artifact

Write to `docs/research/[today]-[slug]-interview-kit.md` (prep) or `docs/research/[today]-[slug]-synthesis.md` (synthesize) using the recipe's output structures. Slug: the targeted assumption or theme, kebab-case, 3–5 words (e.g. `freelancer-time-tracking`, `q3-churn-emails`).

## Step 6: Update related artifacts (synthesize only)

In `docs/product/assumptions.md`:
- `Evidence` column of each affected row: short summary + link, e.g. `4/5 interviews: pays VA $400/mo → docs/research/2026-09-20-proposal-pain-synthesis.md`. Append to existing evidence, never erase it.
- Apply confirmed risk changes only.
- Append confirmed new rows (`Source: interview`, `Verdict: pending`).
- Append to `## Discovery Evidence`: one conversations-table row per source (Date · Person/Source · Key insight · Assumption affected) and the pattern list, linking the synthesis file.
- Never write `Verdict`. If evidence looks decisive, say: "This looks strong enough to test directly — run `product:experiment` for [ID]."
- Legacy list format → show the table migration diff and ask first.

## Step 7: Summarize

```
[Interview kit | Synthesis] complete → docs/research/[date]-[slug]-[interview-kit | synthesis].md

[prep]
Assumptions targeted: [IDs]
Talk to: [N] people matching "[qualifier]" by [date]
Find them: [channels]
Change-my-mind signals recorded: [N]

[synthesize]
Sources: [N] ([N] interviews, [N] tickets, …) — evidence items: [N], non-evidence filtered: [N]
Patterns (≥2 sources): [N]   Signals (1 source): [N]
Supports: [IDs]   Contradicts: [IDs]
Change-my-mind signals fired: [list | none]
assumptions.md: [N] evidence updates, [N] risk changes applied, [N] rows added

Recommended next step:
  [prep]                       Hold the [N] conversations, drop notes into docs/intake/interviews/,
                               then: product:interview synthesize
  [core assumption contradicted] product:critique   — re-run; the premise changed
  [high-risk rows still untested] product:experiment — test "[riskiest remaining]"
  [feature-request synthesis]  product:shape "[top job]"
```

## Fallback questions (if recipe unavailable)
1. "Which assumption would hurt most to learn is false?"
2. "Tell me about the last time [situation] happened. What did you do?"
3. "What have you already tried or paid for to deal with it?"
4. "What would you have to hear to believe you're wrong?"
5. (synthesize) "Across these notes, what did at least two people actually do — not say they'd do?"

## Pivot interrupt
If synthesis contradicts the core problem or the primary user ("nobody has this problem", "the real pain is something else"):
1. Finish extraction — the evidence is still valuable — but stop proposing risk downgrades.
2. Write the synthesis with `status: complete` and `pivot_signal: "[what the evidence says instead]"` in frontmatter.
3. Add a proposed row for the new framing (`Source: interview`, `Risk: high`).
4. Say: "The evidence points away from the current framing: [signal]. Recommended: `product:critique` on the new framing, or `product:discover` if the user changed."

## Artifact naming
Both artifacts are point-in-time — never overwritten. A new round of conversations produces a new kit and a new synthesis. Synthesis records the source filenames it consumed so later runs skip them.

## Rules

- Never ask "would you use / pay for / like this" — not in the script, not in the outreach message.
- The outreach message never pitches or describes the solution.
- Change-my-mind signals are written before the conversations, not after.
- A conversation containing only opinions counts as zero evidence. Say so.
- A pattern needs ≥2 independent sources.
- Every evidence claim cites its source file.
- Interviews never set `Verdict`. Risk changes need founder confirmation.
- Never write to `docs/intake/`.
- Name recruiting bias when you see it; five friends who "love it" is one data point at best.
