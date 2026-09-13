---
name: critique
description: Use this skill when the user invokes `/product:critique` or asks whether an idea is any good — "is my idea viable", "critique / tear apart / stress-test / red-team this idea", "my friend has an idea", "should I build this", "is there a market for this", "who are the competitors", "what would kill this". Works on a bare idea description or on existing discovery artifacts.
---
# product:critique — Idea Red Team

Use this skill when the user invokes `/product:critique` or wants an honest, adversarial assessment of a product idea — their own or one someone handed them.

## Purpose

Play the co-founder who tells the truth. Restate the idea as a falsifiable claim, research the landscape, attack it through fixed lenses, run a pre-mortem, and end with a verdict — **Pursue / Sharpen / Park / Kill** — plus the single riskiest assumption, the cheapest test for it, and a dated kill criterion. Produces `docs/specs/YYYY-MM-DD-[idea-slug]-critique.md`.

This skill exists because the rest of the OS structures the founder's beliefs; it does not challenge them. Critique is the challenge.

Read recipe `recipes/20-idea-critique.md` for the authoritative process. Follow `docs/conventions.md` §7 (research protocol) and §8 (honesty protocol) — both are load-bearing here.

## Contract
Requires: nothing (entry point). **Warm mode** if `docs/product/assumptions.md` exists (also reads `docs/product/product-model.md` seed); **cold mode** if invoked with idea text and no artifacts.
Produces: docs/specs/YYYY-MM-DD-[idea-slug]-critique.md
Updates: docs/product/assumptions.md (warm mode only) — appends critic-surfaced rows with `Source: critique`; changes existing `Risk` values only after per-row founder confirmation.

## Step 1: Mode and tier resolution

**Mode:**
1. `docs/product/assumptions.md` exists → **warm**.
2. No assumptions file, idea text passed (`product:critique "an app that…"`) or files passed via `using` → **cold**.
3. Neither → ask: "Describe the idea in a few sentences: what it does, who it's for, and what they do today without it." Then **cold**.

**Tier:**
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. Warm mode → default to `pro`, announce: "Defaulting to pro — discovery artifacts found, full red team with research and risk re-rating (~30–40 min). Run lite? (y/n)"
3. Cold mode → default to `lite`, announce: "Defaulting to lite — core lenses, light research, pre-mortem, verdict (~15 min). Run pro for full landscape research and steelman? (y/n)"

## Step 2: Read context

**1. User-specified files** (from `--from`, `--using`, or natural mention) — briefs, pitch decks, notes, chat transcripts
**2. `docs/intake/`** — if it exists and no files were specified
**3. Warm mode:** `docs/product/assumptions.md` (full), `docs/product/product-model.md` (Product Promise, Primary Users), `docs/research/*-synthesis.md` (existing evidence), prior `docs/specs/*-critique.md` for this idea (note the previous verdict — do not repeat it without new reasons)
**4. Check research tools:** determine whether WebSearch/WebFetch are available in this session. State it in the summary.

## Step 3: Show context summary

```
product:critique — red-teaming "[idea in ≤10 words]"

Mode: [warm — assumptions.md with N rows (N high-risk) | cold — idea text only]
Tier: [lite | pro]
Read: [files]
Prior critique: [date + verdict | none]
Research: [web search available — will cite sources | NO web access — findings will be a research checklist, not facts]

Will do: restate → research → [7 | 11] lenses → pre-mortem → [steelman → risk re-rating →] verdict

Correct anything before I start attacking it?
```

Wait for confirmation.

## Step 4: Conduct the critique

Read `recipes/20-idea-critique.md`. Follow the lite or pro sequence. Ask one question at a time; do research between questions, not instead of them.

**4a. Restate (always, first).** Write the idea as one falsifiable sentence:
`[specific user] in [situation] struggles with [problem]; today they [workaround]; [product] does [core thing].`
Ask: "Is this the idea? If any slot is vague, that is already finding #1." Do not attack until confirmed. If the user cannot fill the user or workaround slot, record it as a `serious` Problem-reality or User-specificity finding and continue.

**4b. Research (§7).** Before scoring any lens, search for: direct competitors, substitutes (spreadsheets, agencies, freelancers, doing nothing), prior failed attempts and post-mortems, pricing of alternatives, places the target users discuss the problem, demand signals. Label every claim `[sourced: url, accessed YYYY-MM-DD]`, `[estimate: method]`, or `[founder-stated]`. Never invent a competitor, number, quote, or URL. No web access → produce the research checklist (queries + what each would decide) and score lenses on founder-stated information, marked as such.

**4c. Lenses.** Score each `fatal` / `serious` / `fixable` / `fine` with one line of reasoning and the evidence label. Lite: Problem reality, User specificity, Why now, Why you, Alternatives & switching cost, Willingness to pay, Distribution. Pro adds: Build scope vs capacity, Platform/commoditization risk, Trust/legal/data, Unit economics sanity.

Always ask the founder these (they cannot be researched):
- "Name three real people who have this problem. What did each do about it last time?"
- "How will the first 100 users hear about this — concretely, which place or person?"
- "Why are you the one to build this?"

**4d. Pre-mortem (always).** "It's 12 months from now and this failed. Give me the three most likely reasons." Record the founder's answer, then add the critic's own three. Where they differ, the critic's list is what goes in the verdict reasoning.

**4e. Steelman (pro).** The strongest honest case for pursuing it, in 3–5 sentences. Not encouragement — the best argument a skeptic would still accept.

**4f. Risk re-rating (warm, pro).** For every existing assumption row, rate risk independently. Show only disagreements:
```
A2 — "Agencies will switch from spreadsheets"
  Founder: medium   Critic: high
  Why: 3 funded competitors offer this free [sourced: …]; switching cost is migration, not price.
  Change to high? (y / keep medium)
```
Apply only confirmed changes. Record every disagreement — accepted or not — in the critique file.

**4g. Verdict (always).** Exactly one of **Pursue** (name the test) · **Sharpen** (state the reframe) · **Park** (state what would change it) · **Kill** (state the fatal flaw). Then: the single riskiest assumption, the cheapest test for it (method from `recipes/03b-experiment.md` or `product:interview`), and a kill criterion with a date: "If [observable] by [date], stop."

Push back on: "let's see how it goes", "everything is fixable", "I'll figure out distribution later". Those are not answers.

## Step 5: Produce the artifact

Write `docs/specs/[today]-[idea-slug]-critique.md` using the Output structure in `recipes/20-idea-critique.md`.

Frontmatter: `type: idea-critique`, `mode: warm|cold`, `tier`, `verdict: pursue|sharpen|park|kill`, `status: complete`, `created`, `updated`, `skill: product:critique`, `related:` (assumptions, product-model, prior critique) where they exist. `research: web|checklist-only`. `kill_criterion: "[observable]"` and `kill_date: YYYY-MM-DD` — machine-readable copies of the verdict's kill criterion, read by `product:next` and `product:checkin`.

Derive `idea-slug` from the product name if one exists, otherwise from the restated core thing (kebab-case, 3–5 words).

## Step 6: Update related artifacts (warm mode only)

Append to `docs/product/assumptions.md` `## Assumption Map` table:
- One row per new assumption surfaced by lenses rated `fatal` or `serious` that is not already in the map. Use the next unused ID (never reuse or renumber). `Source: critique`, `Evidence:` the lens finding with a link to the critique file, `Test:` suggested method, `Verdict: pending`.
- Apply confirmed risk changes from 4f.
- If the verdict names a riskiest assumption different from the file's `## Riskiest Assumptions` #1, ask: "Promote [ID] to riskiest #1?" — apply only on yes.
- If the file uses the legacy list format (conventions §5), show the table migration diff and ask before writing.

Cold mode: write nothing outside the critique file.

## Step 7: Summarize

```
Critique complete → docs/specs/[date]-[slug]-critique.md

Verdict: [PURSUE | SHARPEN | PARK | KILL]
[One sentence: the reason that decided it]

Fatal: [N]   Serious: [N]   Fixable: [N]
Riskiest assumption: [text]
Cheapest test: [method, ≤ N days]
Kill criterion: [observable] by [date]
[Warm: assumptions.md — N rows added, N risk ratings changed]
[Research: N sourced claims | checklist only — run the N queries before trusting this]

Recommended next step:
  [Pursue, no evidence yet]  product:interview prep [ID]   — talk to 5 target users first
  [Pursue, evidence exists]  product:experiment            — test "[riskiest assumption]"
  [Sharpen]                  product:discover              — re-run with the reframe: "[reframe]"
  [Park / Kill]              product:triage  or  product:ideate
  [Cold mode, any verdict but Kill]
                             product:discover using docs/specs/[date]-[slug]-critique.md
```

## Fallback questions (if recipe unavailable)
1. "Who exactly has this problem, and what did they do about it the last time it happened?"
2. "What do they use today instead — including spreadsheets, hiring someone, or doing nothing?"
3. "How will the first 100 users hear about this, concretely?"
4. "Who pays, how much, and out of which budget?"
5. "It's a year from now and this failed. Why?"

## Pivot interrupt
If during the critique the founder reframes the idea ("actually the real user is…", "forget that, the product is really…"):
1. Stop scoring lenses.
2. Record what was assessed as a partial artifact: `docs/specs/[date]-[slug]-critique-partial.md` with `status: abandoned` and `pivot_signal: "[what changed]"` in frontmatter. Keep research findings — they usually still apply.
3. Say: "Reframe noted: [new framing]. The old framing scored [N fatal / N serious] before we stopped. Restart with `product:critique \"[new framing]\"` — or `product:discover` first if the user or problem changed."

## Artifact naming
Point-in-time artifact — never overwritten. A re-critique of the same idea creates a new date-prefixed file and names the prior verdict in `related.prior_critique`. `product:next` shows the newest as current.

## Rules

- Never open with praise. The first substantive output after the restatement is research or a lens score.
- Name at least 3 weaknesses rated `serious` or `fatal`. If fewer genuinely exist, say so explicitly with reasons for each lens rated `fine` — do not pad, do not soften.
- Every factual claim is labeled (§7). An unlabeled number is a bug.
- "No competitors found" is interrogated ("is there no market, or did they fail?"), never celebrated.
- The verdict is mandatory and from the fixed set. "It depends" is not a verdict.
- The kill criterion has an observable and a date.
- Enthusiasm, hours already invested, and "people I asked loved it" do not move a score. Name sunk cost when you see it.
- Never change a founder's risk rating without per-row confirmation; always record the disagreement.
- If the idea came from someone else, critique the idea, not the person — and say what the handed-over framing is missing that only the originator can answer.
