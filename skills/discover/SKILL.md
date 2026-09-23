---
name: discover
description: Use this skill when the user invokes `/product:discover`, has a new product idea with no prior artifacts, wants to validate an idea (their own or one someone handed them), or asks "is there a real problem here?"
---
# product:discover — New Product Entry Point

Use this skill when the user invokes `/product:discover`, starts work on a new product idea, or wants to structure an idea before judging it.

## Purpose

Turn an idea into something that can be judged: a one-sentence idea brief, a canonical assumption map with the riskiest assumption named, and an honest read of how much real evidence exists. Produces `docs/product/product-model.md` (seed) and `docs/product/assumptions.md`.

This skill **structures** the idea. It does not research competitors or deliver a verdict — that is `product:critique`, which should normally run next.

Read recipes `recipes/01-idea-brief.md`, `recipes/02-assumption-map.md`, and `recipes/03-discovery.md` for the authoritative process. The assumption map format is defined in `docs/conventions.md` §5.

## Contract
Requires: nothing (entry point; reads docs/intake/, an ideation file, or a cold critique file if present)
Produces: docs/product/product-model.md (seed version), docs/product/assumptions.md
Updates: nothing (creates new; if files exist, shows the conflict and asks to overwrite or merge)

## Step 1: Tier resolution
1. User specified `lite` or `pro` in invocation → use it, no questions asked
2. `docs/product/` exists with product docs → default to `lite`, announce: "Defaulting to lite — scoping a new area in an existing product. Run pro? (y/n)"
3. The founder says they have already talked to potential users → default to `pro`, announce: "Defaulting to pro — you have conversations to review as evidence. Run lite? (y/n)"
4. Otherwise → default to `lite`, announce: "Defaulting to lite (~10 min). Pro adds a full review of customer conversations you've already had. Competitor research and a verdict come from product:critique afterwards. Run pro? (y/n)"

## Step 2: Read context

1. **User-specified files** (`from`, `using`, or natural mention)
2. **`docs/intake/`** — read all files if the folder exists and no files were specified
3. **Ideation file** — `docs/ideas/*-ideation.md` in the cwd or parent, if present: the pick, founder constraints, first 5 conversations
4. **Cold critique** — `docs/specs/*-critique.md` with `mode: cold`, if present: restated idea, alternatives found, critic-surfaced assumptions, verdict
5. **Field synthesis** — a `type: field-synthesis` file passed via `using` (from `product:field`): the target opportunity is the problem; its jobs and customer-voice wording seed the brief; its Bridge rows seed the assumption map with `Source: field` and their Evidence cells (levels and session IDs kept); its evidence level is the synthesis's best status (`client-validated` / `market-validated`), never higher

Extract: problem description, target user, alternatives/workarounds, assumptions already named, any evidence (conversations, spend, sign-ups).

## Step 3: Show context summary (only if context was found)

```
product:discover — reading context...

Found in [source]:
  Problem described: "[extracted problem]"
  Target user mentioned: "[extracted user]"
  Alternatives mentioned: [list]
  Assumptions mentioned: [list]
  Evidence mentioned: [conversations / spend / none]

I'll skip questions I can answer from context and confirm with you.
Anything to correct?
```

If no context found: skip this step and go directly to the interview.

## Step 4: Conduct the interview

Ask one question at a time. For pre-populated answers, show the extract and ask: "I found this in [source]: '[answer]'. Right, or should we refine it?"

**4a. Idea brief** — `recipes/01-idea-brief.md`, lite or pro set.

**4b. Assumption map** — `recipes/02-assumption-map.md`.
- Coverage: the map must contain at least one `desirability`, one `viability`, and one `distribution` assumption. If the founder names none for a type, propose one and ask.
- **Independent risk rating.** After the founder rates each assumption, state your own rating with a one-line reason. Where you disagree, show it and let the founder decide:
  ```
  Risk ratings — where I disagree:
    A2 "Consultants will pay $30/mo"   you: medium   me: high — no evidence of spend on this problem yet
    A4 "Reachable via LinkedIn groups"  you: low      me: high — distribution is untested and groups ban promotion
  Keep yours, take mine, or adjust?
  ```
  The founder's final choice goes in the Risk column. List unresolved disagreements in the summary.

**4c. Evidence check — always, both tiers:**
1. "Have you talked to anyone who has this problem? Tell me what they did the last time it happened — not what they said they would do."
2. "Is anyone paying today — money, hours, a hire, a hacked-together tool — to deal with this?"

Classify the evidence level: **none** (no conversations), **opinion** (people said it's a good idea / would use it), **behavioral** (past behavior, workarounds, spend observed). Compliments and hypotheticals are recorded as opinion, never as evidence.

**4d. Pro only** — `recipes/03-discovery.md`: review each conversation already held against the exit conditions (real pain, repeated behavior, current workaround, clear user, trigger moment). If there are none, do not skip — help the founder decide what to learn and route to `product:interview prep`.

## Step 5: Produce the artifacts

**`docs/product/product-model.md`** — seed version using `templates/product-model.md`. Fill in Product Promise, Primary Users, and partial Core Objects (objects mentioned so far). Mark all other sections `[deferred]` — they are filled by `product:model`.

**`docs/product/assumptions.md`** — exactly the canonical shape in `docs/conventions.md` §5:
- Riskiest Assumptions: top 3 by ID, each with why it kills the idea if false
- Assumption Map table: `ID | Assumption | Type | Risk | Source | Evidence | Test | Verdict` — Source `discover`, Evidence from 4c (or `none yet`), Test = the proposed method, Verdict `pending`
- Discovery Evidence: the evidence level from 4c and any conversations reviewed in 4d

If either file exists: show what would change and ask overwrite / merge. If `assumptions.md` is in the legacy list format, offer to migrate it to the table (show the diff first).

## Step 6: Summarize

```
Discovery complete.

Produced:
  docs/product/product-model.md — seed version
  docs/product/assumptions.md — [N] assumptions, [N] high-risk

Idea in one sentence: [brief]
Riskiest assumption: A[n] — [text]
Evidence level: [none | opinion | behavioral]
Risk disagreements left open: [list, or "none"]

Recommended next step:
  product:critique — red-team the idea: competitor research, pre-mortem, verdict
                     (skip only if a critique already exists for this idea)

  Then, depending on the verdict and evidence:
    evidence none/opinion        → product:interview prep "[A-IDs]"
    riskiest is cheap to test    → product:experiment
    money or reach rows are high → product:viability / product:gtm
```

## Fallback questions (if recipe unavailable)
1. "What problem does this product solve? Describe what users do today without it."
2. "Who specifically has the problem? Describe one real person, not a demographic."
3. "What is the trigger moment — what just happened that makes them need this now?"
4. "What must be true for this to work — including that people pay and that you can reach them?"
5. "Who have you talked to, and what did they actually do last time this happened?"

## Pivot interrupt
If the founder signals the idea has fundamentally changed ("actually the real problem is...", "wrong user", "I need to rethink this"):
1. Stop the interview immediately
2. Record what was learned as `docs/product/[date]-discovery-partial.md` with `status: abandoned` and `pivot_signal: "[what changed]"` in frontmatter
3. Say: "Pivot noted. New signal: [what changed]. Restart product:discover with this framing."

## Rules

- Never read from the codebase (this is for blank-slate products; existing products use `product:audit`).
- Pre-populate from context documents but always confirm with the founder.
- The riskiest assumption must be named explicitly by ID — not buried in a list.
- If the founder cannot describe a specific target user, push back before continuing.
- Opinions ("people would love it", "my friends want it") are recorded as opinion, never as evidence.
- The map covers desirability, viability, and distribution at minimum.
- Show every risk-rating disagreement; never silently rate for the founder and never silently defer to them.
- Do not claim to have analyzed competitors — route to `product:critique`.
