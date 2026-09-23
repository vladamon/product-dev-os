---
name: field
description: Use this skill when the user invokes `/product:field` (prep, rehearse, live, debrief, synthesize) or says things like "I'm meeting a client / a business owner — help me interview them properly", "find out if there's a product opportunity in their business", "I talked to a client, here are my notes", "practice an interview with me", "help me during the call", or "what did these SMB conversations actually show?". Structured field discovery with small businesses before any idea exists, enforcing the 30-rule discovery doctrine.
---
# product:field — Field Discovery

Use this skill when the founder talks to a client or to small businesses to find out whether their operations hide a problem worth a product, a service, or a paid pilot. There is no idea yet. This skill finds one, or shows there isn't one.

## Purpose

The founder runs the conversation. This skill runs everything around it, under the rulebook in `recipes/30-discovery-doctrine.md`:

- **`prep`** — engagement setup: Founder Context, scope, ≤3 research objectives with problem hypotheses, a coverage map (not a script), change-my-mind signals, a one-page interview card in the interview language; pro adds outreach per channel and a recruiting log.
- **`rehearse`** — Claude plays a realistic business owner; the founder practices; a lint report scores every question by rule ID. Writes nothing.
- **`live`** — copilot during the conversation: the founder pastes what the participant says; Claude names the signal, the maneuver, and the next probe in ≤3 lines, and tracks coverage and the pitch boundary.
- **`debrief`** — one session, same day: verbatim evidence ledger with levels L0–L5 and PRE/POST phase, causal chain, workflow with citations, exceptions, artifacts, workarounds, severity, stakeholders, Unknowns, resume card, one directive.
- **`synthesize`** — across sessions: pattern matrix with earned statuses, commercial significance, founder-fit filter, adversarial pass; pro adds opportunity tree, jobs, target opportunity, solution set, and a bridge into `assumptions.md`.

Read `recipes/29-field-discovery.md` for the process and output structures, and `recipes/30-discovery-doctrine.md` for the rules, evidence ladder, status thresholds, and directives. Follow `docs/conventions.md` §5 (assumption map) and §8 (honesty protocol).

## Contract
Requires: `prep` — nothing (entry point). `rehearse` / `live` — engagement.md (warning if missing). `debrief` — engagement.md + ≥1 raw source for the session. `synthesize` — engagement.md + ≥1 session debrief (warning below 3).
Produces: `prep` — docs/research/field/<engagement>/engagement.md (living) + card.md. `live` — …/live/YYYY-MM-DD-<P#>-live.md. `debrief` — …/sessions/YYYY-MM-DD-<S##>-<P#>.md. `synthesize` — …/YYYY-MM-DD-synthesis.md. `rehearse` — nothing.
Updates: `debrief` and `synthesize` — engagement.md (coverage, participants, Unknowns, review queue, decision log, `directive`). `synthesize` pro — docs/product/assumptions.md, only on confirmation and only when a project exists (`Source: field`, `Verdict: pending`). Never sets `Verdict`.

## Step 0: Verify prerequisites (gate)

**debrief — engagement and source exist:**
```
✗ Cannot run product:field debrief yet.

Missing requirements:
  - [docs/research/field/<engagement>/engagement.md is missing | no raw notes, transcript, or recording export for this session]

Run this first:
  product:field prep          (sets scope, Founder Context, coverage map)
  Drop the raw notes into docs/intake/interviews/<engagement>/ (one file per session)

Why this matters:
  A debrief without the raw source can't verify a single quote.
  Memory of "it went well" is L0.
```
Then STOP.

**synthesize — debriefs exist:**
```
✗ Cannot run product:field synthesize yet.

Missing requirements:
  - no session debriefs in docs/research/field/<engagement>/sessions/

Run this first:
  product:field debrief       (once per conversation, same day)

Why this matters:
  Synthesis cites session evidence IDs. Without debriefs there is nothing to cite,
  and the synthesis would be invented.
```
Then STOP.

**Warnings (never stop):**
- `⚠ Only N session(s) — nothing can pass "signal" with one participant; "pattern" needs 2; "market-validated" needs 3 businesses.`
- `⚠ Scope is client — this can reach client-validated, never market-validated.`
- `⚠ rehearse/live without an engagement — using a generic SMB persona / coverage map. Run prep first for a sharper card.`
- `⚠ Raw source is a paraphrase, not a transcript — evidence from it caps at L3 (artifacts you confirm you saw: L4).`
- `⚠ Engagement has no Founder Context — probing can't be steered and the synthesis fit filter will be marked unavailable. Run product:field prep.`

**Gate override.** `--skip-gate` proceeds; write `gate_override: true` in the artifact frontmatter and `Gate skipped — [check]` in its `## Notes` section.

## Step 1: Mode and tier resolution

**Mode (resolve first).** No mode given: no `docs/research/field/` → `prep`. An engagement exists and `docs/intake/interviews/<engagement>/` has raw files newer than the last debrief → ask "Debrief [file]?". Else ≥3 debriefs newer than the last synthesis → ask "Synthesize?". Else → `prep` (update mode). Several engagements → ask which.

**Tier — first match wins:**
1. User specified `lite` or `pro` → use it, no questions asked
2. `rehearse`, `live` → no tier
3. `prep` on a new engagement → `lite`, announce: "Defaulting to lite — scope, Founder Context, objectives, card (~10 min). Run pro for outreach per channel, recruiting log, and screening? (y/n)"
4. `debrief` → `lite` (3 reflective questions; extraction is always complete), announce and offer pro (all 5 — adds unrecorded artifacts and self-check on leading)
5. `synthesize` with ≥5 sessions or any opportunity at `pattern` across ≥3 participants → `pro`, announce: "Defaulting to pro — enough evidence for an opportunity tree and solution set. Run lite? (y/n)"
6. `synthesize` otherwise → `lite`, announce and offer pro

## Step 2: Read context

1. **User-specified files** (`from`, `using`, or natural mention)
2. **`docs/intake/interviews/<engagement>/`** — raw notes, transcripts, exports, images. Read-only: never move, rename, or annotate.
3. **`docs/research/field/<engagement>/engagement.md`** — Founder Context, scope, objectives, coverage, participants, Unknowns, decision log
4. **Session debriefs** — for synthesize, and for debrief when the participant has earlier parts (resume card)
5. **`live/` logs** for the session being debriefed
6. **Prior syntheses** — do not double-count sessions already consumed; carry the previous decision forward
7. **`docs/product/assumptions.md`** if the cwd is a product project (bridge only)

## Step 3: Show context summary

```
product:field [mode] — [engagement] ([client | segment])

Founder Context: [one line | missing]
Objectives: R1 … · R2 …
Participants: [n] across [n] businesses · sessions debriefed: [n]
Coverage gaps (must): [C5 exceptions — 0/3 participants, …]
Open Unknowns: [n, top 3]
Last directive: [DIRECTIVE, date | none]

[debrief]    Source: [file(s)] — [transcript | notes | paraphrase] · images: [n] · live log: [yes/no]
[synthesize] Sessions to consume: [S01–S05] · already synthesized: [n — skipped]

Correct anything?
```

Wait for confirmation. Skip the wait in `live` — speed matters there; show a two-line summary instead.

## Step 4: Conduct the interview

### Mode: prep
Follow recipe 29 → Mode: prep. **Always ask:** scope (behavioral predicates, not firmographics), Founder Context, objectives (questions to *yourself*), change-my-mind signals, interview language and format. Pro adds recruiting, screening, stakeholders to reach, adversarial targets.
- Turn every objective into problem hypotheses `[actor] + [problem] + [context]`. Reject any that contain a solution; restate and show the restatement.
- Build the coverage map from nodes C1–C11 with priorities; C2, C3, C5, C6, C7, C8 are `must` by default.
- Write the card in the interview language, in plain words the participant would use. Include the deflection line (DOC-RULE-02) and the permission line (DOC-RULE-27).
- Update mode: never erase participants, Unknowns, recruiting rows, or the decision log. Regenerate the card.

### Mode: rehearse
Follow recipe 29 → Mode: rehearse. Build the persona from the segment; state only role and business type to the founder, keep the hidden facts hidden. Stay in character. On `end`, write the lint report in chat. Offer: "Save weakest questions to the card? (y/n)". Only then write, and only to `card.md`.

### Mode: live
Follow recipe 29 → Mode: live. Every reply ≤3 lines, in the interview language. Never suggest a question that breaks a rule. On `pitch`: check that problem evidence covers C2, C3, and C6 **and** C7 shows commercial urgency (frequency × cost, or switching pressure) for this participant. If not, say which is missing and advise against switching. On `demand` (the participant asked to see it): mark the switch — the DOC-RULE-27 exception. If yes, give the permission line and mark `POST` from here. Append each turn to the live log.

### Mode: debrief
Follow recipe 29 → Mode: debrief. Ask the reflective questions first (the pitch boundary question is always asked). Then extract all 21 sections. Rules while extracting:
- Quote verbatim. After extraction, re-open the raw file and check every quote character-for-character. Record the audit.
- Assign levels with recipe 30 §3. Every item before the recorded switch is `PRE`; every item after is `POST`.
- Never fill a workflow step, number, name, or tool that isn't in the source. A gap becomes an Unknown with a probe.
- Images: read them; tag fields `[read-from-image]`, add `[uncertain]` where unclear.
- Assign a participant ID (`P#`) and business ID (`B#`) — reuse existing ones from the roster.

### Mode: synthesize
Follow recipe 29 → Mode: synthesize. Build the pattern matrix only from session evidence IDs. Assign statuses strictly by recipe 30 §6 and show the threshold each one met or missed. **Give your own assessment first** (§8 honesty protocol), including the strongest disconfirming reading of the data, before asking the founder what they think. Run the adversarial pass on every candidate at ≥3 participants. Cite observation IDs in the matrix, never raw quotes; exclude POST and `tech-curiosity` items. Lite never emits `TEST_ASSUMPTION` — with a validated target it says "run `product:field synthesize pro`" (DOC-RULE-08 needs the solution set first). Pro: build the tree and run its lint; write a solution set only for a validated target; tag each bridge row with the risk-dimension minimum it meets or misses; client scope writes the bounded pilot; if feasibility is the critical risk, the directive is `HALT_FOR_TECHNICAL_SPIKE`.

## Step 5: Produce the artifact

Paths and structures: recipe 29 → Output structure.
- Engagement slug: client name or segment, kebab-case, 2–4 words (`mueller-elektro`, `trade-quote-pricing`).
- Session file: `sessions/YYYY-MM-DD-S##-P#.md`, next unused `S##` across the engagement. A follow-up micro-session with the same participant is a new `S##` with `part: 2` and cites the earlier session.
- Synthesis: `YYYY-MM-DD-synthesis.md`; same-day collision → `-2`.
- Every session and synthesis ends with one directive from recipe 30 §7, with a count and a date.

## Step 6: Update related artifacts

**debrief** → `engagement.md`: coverage cells for this participant; participant row (sessions, pitch exposed); append Unknowns (next `U#`) and mark any resolved by this session; append review-queue items; append a decision-log row; set frontmatter `directive` and `updated`.

**synthesize** → `engagement.md`: decision-log row; `directive`; mark Unknowns resolved by synthesis.

**synthesize pro — bridge** (only if the founder confirms):
- cwd has `docs/product/assumptions.md` → propose rows for the target opportunity's riskiest assumptions: `Source: field`, `Evidence: <n>/<n> businesses at L3+, <L4 summary> → <synthesis path>`, `Verdict: pending`. Show them and ask before appending. Never write `Verdict`.
- no project → recommend `product:discover using docs/research/field/<engagement>/<date>-synthesis.md` in a new project directory. Discover seeds the map from it.

**rehearse / live / prep** → none beyond their own files.

## Step 7: Summarize

```
[Mode] complete → [path]

[prep]        Scope: [client | segment] · Objectives: [n] · Coverage nodes: [n must]
              Card: [path] (language: [xx]) · Outreach variants: [n | lite: none]
[debrief]     Evidence: L3+ [n] · L4 [n] · L5 [n] · non-evidence [n] · POST [n]
              Workflow steps: [n] ([n] INFERRED) · Unknowns +[n] · Review queue +[n]
              Provenance: [n] quotes verified, [n] mismatches
[synthesize]  Opportunities: [n signal] · [n pattern] · [n client-validated] · [n market-validated]
              Survived adversarial pass: [OPP ids | none tested]
              Target: [OPP-n | none]

Directive: [DIRECTIVE] — [step with count and date]

Recommended next step:
  CONTINUE_INTERVIEWING     → hold the conversations; product:field debrief after each
  DECOMPOSE_OPPORTUNITY     → product:field prep (narrowed to [branch])
  TEST_ASSUMPTION (segment) → product:discover using <synthesis> (new project) → product:experiment [concierge | pre-sale]
  TEST_ASSUMPTION (client)  → product:experiment [concierge | pre-sale] as the bounded pilot
                               or, in an existing project: product:experiment for [A#]
  HALT_FOR_TECHNICAL_SPIKE  → run the spike on real artifacts ([what, how many]); product:stack if the build path is unclear
  PIVOT                     → product:field prep (new segment/objective) or product:triage
```

## Fallback questions (if recipe unavailable)
1. "Who are you talking to, and what can you actually build and run alone?"
2. "Tell me about the last time [the work] happened — from the moment it came in."
3. "What have they already built, bought, or hired to cope — and what does it cost them?"
4. "Who pays, who decides, and who could block a change?"
5. (synthesize) "Which problem did at least three businesses show you in what they did, not what they said?"

## Pivot interrupt
If the evidence contradicts the scope or every objective (the pain isn't there, it's cheap, or nobody in the segment answers outreach):
1. Finish extraction — the evidence stays valuable.
2. Set the directive to `PIVOT` and say what the evidence points to instead, citing IDs.
3. Record salience signals from the recruiting log (DOC-RULE-24) with the numbers.
4. Say: "The evidence points away from [objective]: [signal]. Recommended: `product:field prep` with [new objective/segment], or `product:triage` if this engagement should close."

## Artifact naming
`engagement.md` is living — updated in place, never erased. `card.md` is regenerated by each prep. Session debriefs, live logs, and syntheses are point-in-time — never rewritten. A synthesis records the sessions it consumed so later runs skip them.

## Rules

- The founder runs the conversation. Claude never contacts participants.
- In `PROBLEM_DISCOVERY` nothing Claude writes names, describes, or hints at a solution: not the card, not the outreach, not live probes.
- No "would you use / pay / like" anywhere. Price appears only as a commitment threshold after a permitted mode switch.
- Every quote is verbatim and verified against the raw source. Every node cites IDs or is marked `INFERRED`.
- Never add a step, number, name, or tool the sources don't contain.
- L0, L1, and non-commitment POST items never count as support.
- Statuses follow recipe 30 §6 exactly. Client scope never yields `market-validated`.
- Jobs and opportunities contain no software, vendor, or mechanism words.
- No solution set before validation; ≥3 concepts on the parsimony ladder; AI only with stated justification. No `TEST_ASSUMPTION` without the solution set.
- Post-pitch facts keep their level but never count toward problem validation; post-pitch praise and intent are L0/L1 unless paired with a commitment.
- Every debrief and synthesis ends in one directive with a count and a date.
- The founder always gets raw passages to review, never only summaries.
- Never write to `docs/intake/`. Never write `Verdict`. `assumptions.md` changes need confirmation.
