---
id: 29-field-discovery
phase: understand
tier-lite: true
tier-pro: true
produces: docs/research/field/<engagement>/engagement.md (living); …/card.md; …/live/YYYY-MM-DD-<P#>-live.md; …/sessions/YYYY-MM-DD-<S##>-<P#>.md; …/YYYY-MM-DD-synthesis.md
skill: product:field
---

# Recipe: Field Discovery — finding the opportunity inside someone's business

## When to use

You are talking to a client, or to several small businesses in a segment, and you **don't yet know what to build**. The goal is to find out — from what they actually do — whether there is a problem worth a product, a service, or a paid pilot.

Use `product:interview` instead when you already have an idea and an assumption map and need to test specific assumptions. Field discovery comes *before* an idea; its output can seed one (`product:discover using <synthesis>`).

Every mode enforces `recipes/30-discovery-doctrine.md`. Rule IDs below refer to it.

## Inputs

- The founder: who they are talking to, what they can build, what they refuse to build.
- Raw material after each conversation: notes, transcript, recording export, photos/screenshots of artifacts — in `docs/intake/interviews/<engagement>/` (one file per session; images alongside).
- For synthesis: ≥1 session debrief.

## The loop

```
prep ──► [rehearse] ──► conversation (founder) ◄── [live copilot]
  ▲                              │
  │                              ▼
  │                          debrief  (one per session — same day)
  │                              │
  └──── directive ◄──────── synthesize (every 3–5 sessions, or when a pattern forms)
                                 │
                                 ▼
             TEST_ASSUMPTION → product:discover / product:experiment
```

## Engagement scope

| Scope | Meaning | Best reachable status |
|---|---|---|
| `client` | one business; several people inside it (owner, office, field) | `client-validated` → pilot or custom work for that client |
| `segment` | several independent businesses with the same operating conditions | `market-validated` → product |

A client engagement that shows a strong opportunity is **one data point for a market**. To claim a product opportunity, open a segment engagement and find the same structure in ≥3 businesses.

## Coverage map (not a script — CONCEPT-11)

The guide is a map of nodes to cover across the engagement, not a list to read in order. Each session covers what the conversation opens; the map shows what is still dark.

| Node | Covers | Opening probe | Rules |
|---|---|---|---|
| C1 Business & role | size, crews/offices, revenue model, who does what, this person's role | "Tell me about the business and what a normal week looks like for you." | 16, 21 |
| C2 Recent episode | one specific, recent, complete instance of the work in focus; then typicality | "Think of the last [job/quote/order] you handled. When did it come in?" … "Was that a normal one?" | 11 |
| C3 Workflow & handoffs | steps, actors, tools, waits, handoffs | "What happened next? Who got it, and how did they know?" | 12, 22 |
| C4 Artifacts | sheets, forms, boards, chat groups, paper | "Could you show me the sheet you use for that?" | 14 |
| C5 Exceptions & failures | breakdowns, urgent bypasses, recovery | "Tell me about the last time that went wrong." | 13 |
| C6 Workarounds & spend | shadow tools, extra people, paid tools, hours | "Who built that? How long does keeping it up take each week?" | 15, 06 |
| C7 Frequency, cost, risk, switching pressure | how often, hours, money, errors, consequences, whether they have tried or wanted to change | "How many times last month? What did the worst one cost? Have you tried to change how it's done?" | 10 |
| C8 People & buying | user, champion, approver, payer, blocker | "When you last took on a new tool, who decided and who paid?" | 16 |
| C9 Switching history | past switches or refusals; the four forces | "What did you use before? What finally made you change?" | 17 |
| C10 Key-person dependency | memory, judgment, evening labor of one person | "What happens if you're away for a week?" | 23 |
| C11 Commitment | the next step they'll give time, data, or access for | "Could you send me the last three [files] so I can see the real thing?" | 28 |

Priority per node: `must` (every participant), `should`, `if-opened`.

## Mode: prep

### Lite (5 questions)

1. **Scope** — one client (name, who you'll talk to) or a segment (which operating conditions define it — behavior, not firmographics: "trade businesses that price every job from supplier quotes", not "construction SMBs 10–50 staff")?
2. **Founder Context (DOC-RULE-21)** — what can you build and run alone; what you won't build (hardware, regulated advice, heavy integrations…); business model you want (product / service / pilot); hours per week.
3. **Research objectives** — at most 3 things you need to learn, as questions to *yourself*, not to them. Each becomes 1–3 problem hypotheses `[actor] + [problem] + [context]` — no solutions.
4. **Change-my-mind signals** — per objective: what past behavior would you have to hear to drop it?
5. **Language and format** — interview language; in person / call / chat / voice notes; typical time available (SMB owners: often 10–20 minutes → plan micro-sessions).

### Pro (additional)

6. **Recruiting (GAP-6, DOC-RULE-24)** — channels (phone, WhatsApp, email, trade association, supplier/accountant referral, existing network) with a count per channel and a date. Who does **not** qualify (friends, people who already know your idea, tech enthusiasts without the pain — "tech curiosity" disqualifier).
7. **Screening** — 2–3 behavioral questions confirming someone has done the work recently.
8. **Stakeholders to reach** — in a client: which roles beyond the owner (office, field, bookkeeper). In a segment: user and payer.
9. **Adversarial targets** — where do you expect the pattern *not* to hold? Plan one interview there early.

### Outputs of prep

- `engagement.md` (living) — created or updated.
- `card.md` — the one-page interview card, regenerated each prep. In the interview language.

**Outreach message (pro, GAP-6).** Peer-learning framing: asks to learn how they handle [area], never names a product, ≤60 words for chat channels, ≤80 for email. One variant per channel. Phone: a two-sentence opener plus the ask. Always offers a short slot (10–15 min) and a low-effort format ("voice notes are fine").

## Mode: rehearse

Claude plays a participant built from the engagement's segment and Founder Context. The founder interviews; Claude answers in character.

**Persona behavior (realistic, not hostile):**
- Talks in generalities first ("we usually…"); gives a real episode only when asked for the last specific time.
- Offers compliments and feature ideas unprompted; asks "so what are you building?" at least once.
- Has one real workaround, one key-person dependency, one exception that eats hours, one payer who isn't them — revealed only to good probes.
- Uses trade vocabulary; gets vague ("it gets sorted") until asked who and how.
- Answers pricing hypotheticals with polite yeses (L1) to see if the founder counts them.

**Modes:** default = stay in character until the founder types `end`, then the lint report. `coach` = after each founder question, one bracketed line: rule hit, or `ok`.

**Lint report:** every founder question tagged ok / leading (DOC-RULE-01) / pitch (02, AP-03) / hypothetical (AP-02, 06) / praise-seeking (AP-01) / jargon (AP-05) / closed-opinion. Follow-up ratio (AP-04). Coverage nodes reached. The 3 weakest questions rewritten. What the persona was hiding and whether it was found.

Rehearse writes no file.

## Mode: live (copilot during the conversation)

The founder types or pastes what the participant says (short fragments are fine). Claude answers in **≤3 lines**:

```
▸ [signal] → [MANEUVER]
Ask: "[next probe, in the participant's own words and the interview language]"
Coverage: C2 ✓ C3 ◐ C5 ○ C6 ○ · [time note if given]
```

**Signals it watches** — generalizer (AP-02 → `ABSTRACT_TO_SPECIFIC`), hypothetical/intent (AP-02), praise (AP-01 → `DEFLECT_PRAISE`), feature request (DOC-RULE-04), emotion word (probe for the episode — not proof), artifact mentioned (DOC-RULE-14), workaround (DOC-RULE-15), vague pronoun or quantity (DOC-RULE-19), policy statement (DOC-RULE-22), named key person / after hours (DOC-RULE-23), switch mentioned (DOC-RULE-17 — ask the missing force), tech curiosity without an episode (ask for the last time the pain happened), "what are you building?" (DOC-RULE-02 deflection).

**Founder commands:** `time 12/20` (elapsed/total → false close at 60–70%), `pitch` (checks DOC-RULE-27: problem evidence on C2, C3, C6 **and** commercial urgency on C7 for this participant; if met, gives the permission line and marks the switch — everything after is `POST`), `demand` (participant asked to see it — the DOC-RULE-27 exception; marks the switch without the permission line), `stuck` (best next coverage node), `end`.

Each turn is appended to `live/YYYY-MM-DD-<P#>-live.md`: participant fragment, signal, suggested probe. The log is raw input for the debrief, not a debrief.

## Mode: debrief (one session, same day)

**Before extraction, ask (lite: 1–3; pro: all 5):** *(question 4 is how a seen-but-not-transcribed artifact reaches L4)*
1. Did you show, describe, or hint at any solution? At what point? (DOC-RULE-26 boundary)
2. Did they give or promise anything — files, access, an intro, time, money?
3. What surprised you?
4. (pro) What did you see that isn't in the notes — screen, paper, whiteboard?
5. (pro) Where did you feel yourself leading or selling?

**Extraction (every section filled, or `not covered → U#`):**

1. **Evidence ledger** — `S03.E01`… verbatim quote, location (`file:line` or `[mm:ss]`), level L0–L5, phase PRE/POST, tags. Paraphrased notes are allowed only when the raw file is a paraphrase — mark them `[paraphrase]`; they cap at L3.
2. **Non-evidence** — L0/L1 items counted, with one example each.
3. **Observations** — `S03.O01` factual restatement citing E IDs.
4. **Inferences** — `S03.I01` marked `INFERRED`, citing what they rest on, each with a verification probe.
5. **Episodes → causal chain** — circumstance → struggling moment → push / pull → workaround → desired progress; typical or unusual (participant's words). Blank links → Unknowns.
6. **Workflow instance** — step table (trigger, actor, input, tool, decision, output, handoff to, wait), each row citing E IDs. A row without citation is `INFERRED` (AP-06).
7. **Exceptions & failures** — what broke, consequence, recovery, how often.
8. **Artifact registry** — artifact, owner, fields/columns, source of data, consumers, said-vs-visible discrepancies, `[read-from-image]` flags.
9. **Workarounds** — why built, cost to maintain, what fails without it.
10. **Commercial severity** — frequency × cost (hours, money) × risk × switching pressure, with numbers only from quotes; else `unknown`. Existential regulatory/financial risk → mark the DOC-RULE-10 exception.
11. **Stakeholders** — user / champion / influencer / approver / payer / blocker (one person may hold several; sole trader → say so).
12. **Four forces** — only if a switch came up; all four or Unknowns.
13. **Key-person dependency** — who, what depends on them, what happens when they're away.
14. **Feature requests → upward** — request as said → outcome behind it → known or Unknown.
15. **Post-pitch** (if any) — each POST item through the commitment filter (DOC-RULE-28).
16. **Interviewer lint** — only if the founder's own questions are in the source: questions by type, follow-up ratio, violations by rule ID, two rewrites.
17. **Unknowns raised** — appended to the engagement ledger.
17b. **Novelty count** — new opportunities, workaround types, exception types, stakeholders this session added (saturation input, recipe 30 §6). Tag the participant `tech-curiosity` if they showed interest in technology without an episode of the pain.
18. **Founder review queue** — raw passages to re-read or re-listen (DOC-RULE-29), with reason.
19. **Resume card** — where the story stopped, open threads, top Unknowns for this person; three probes for a 5-minute follow-up (GAP-1).
20. **Provenance audit** — quotes checked verbatim against the raw file: N checked, N mismatched (fixed or flagged).
21. **Next action** — one directive (§7 of recipe 30) with count and date.

## Mode: synthesize (across sessions)

### Lite

1. **Evidence base** — sessions, participants, businesses; level distribution; POST items excluded.
2. **Pattern matrix** — rows: candidate opportunities (customer voice). Columns: participants. Cells: best level + observation IDs (`S03.O02`, which cite E IDs). POST and `tech-curiosity` items excluded. Status per recipe 30 §6, showing the threshold met or missed. Saturation per branch.
3. **Commercial significance** — frequency × cost × risk per candidate.
4. **Founder-fit filter** — in scope / out of scope (logged, not excavated) per DOC-RULE-21.
5. **Adversarial pass** — for each candidate at ≥3 participants: disconfirming hypothesis, counterexamples already in the data, who to talk to next.
6. **Directive** — one, with count and date. Lite cannot emit `TEST_ASSUMPTION` (no solution set); a validated target → "run `product:field synthesize pro`".

### Pro (additional)

7. **Opportunity tree** — desired outcome (the business's, in their terms) → opportunities → sub-opportunities, with lint results (customer voice, sibling parity, vertical chains, multi-parent, solution words).
8. **Jobs** — hierarchy: higher goal → focal job → sub-jobs (job map steps where evidence exists: define, locate, prepare, confirm, execute, monitor, modify, conclude); each `verb + object + context`; desired outcomes `direction + metric + object` ("minimize the time to compare supplier prices for a bid"); functional / social / emotional dimensions where evidence exists.
9. **Target opportunity** — chosen on evidence density; reversible; one-week cycle defined.
10. **Solution set** — only if the target is `client-validated` or `market-validated`: ≥3 concepts on the parsimony ladder, each with D/F/V assumptions and solo friction.
11. **Riskiest assumption** — if feasibility is critical → `HALT_FOR_TECHNICAL_SPIKE`.
11b. **Bounded pilot** (client scope, `client-validated` target) — recipe 30 §8b.
12. **Bridge to the OS** — proposed assumption rows (`Source: field`) for the target opportunity, each tagged with the §3 risk-dimension minimum it meets or misses; written into `docs/product/assumptions.md` only if the founder confirms and a project exists (or chooses to start one with `product:discover using <synthesis>`).

**Both tiers:** provenance audit, founder review queue, lint report.

## Output structure

### Engagement — `docs/research/field/<engagement>/engagement.md` (living)

```markdown
---
type: field-engagement
product: none          # field work precedes a product; set when one exists
tier: lite | pro
engagement: [slug]
scope: client | segment
segment: "[operating conditions]"
language: [en | de | …]
status: active | paused | closed
directive: CONTINUE_INTERVIEWING | DECOMPOSE_OPPORTUNITY | TEST_ASSUMPTION | HALT_FOR_TECHNICAL_SPIKE | PIVOT
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:field
---

# Field Engagement: [Name]

## Founder Context (DOC-RULE-21)
- Can build and run alone: …
- Will not build: …
- Business model wanted: product | service | pilot | open
- Capacity: [h/week]

## Scope
[client name + roles to reach | segment behavioral predicates]
Does not qualify: …

## Research objectives
| ID | Objective (a question to myself) | Problem hypotheses [actor + problem + context] | Change-my-mind signal |
|---|---|---|---|
| R1 | | | |

## Coverage map
| Node | Priority | P1 | P2 | P3 | … |
|---|---|---|---|---|---|
| C1 Business & role | must | ✓ | ◐ | ○ | |

## Participants
| ID | Business | Role | Stakeholder roles | Sessions | Pitch exposed? | Status |
|---|---|---|---|---|---|---|
| P1 | B1 | | | S01, S02 | no | |

## Recruiting log (DOC-RULE-24)
| Date | Channel | Segment | Sent | Replied | Booked | Note |
|---|---|---|---|---|---|---|
Response rate: [n/N by channel] — Diagnosis: [none | salience? | channel? | seasonality]

## Outreach (pro)
### [Channel]
> …

## Unknowns ledger (DOC-RULE-19)
| ID | Unknown | Raised in | Risk | Status | Resolved by |
|---|---|---|---|---|---|

## Founder review queue (DOC-RULE-29)
| Source | Passage | Why | Reviewed? |
|---|---|---|---|

## Decision log (DOC-RULE-20)
| Date | From | Directive | Next step (count + date) |
|---|---|---|---|

## Notes
```

### Interview card — `docs/research/field/<engagement>/card.md`

One page, printable, in the interview language. Regenerated by each prep; not a record.

```markdown
# [Engagement] — interview card

**Objectives:** R1 … · R2 …
**Posture:** their world makes sense · no advice · no expertise · their words, not yours · validate and wait

## Open (≤2 min)
"[who you are, researching how … handle …, not selling anything, ~N minutes]"
"[C1 opener]"

## Coverage (follow the story, not the order)
- [ ] C2 "[opener]"   - [ ] C3 "[opener]"   …

## When you hear…            → say
- "usually / normally"        → "The last time — walk me through it."
- "I would / we'd probably"   → "What did you do the last time it came up?"
- praise                      → "Thanks. When did you last look for a fix?"
- a feature request           → "What would you do with that right after?"
- "nightmare / hate"          → "Tell me about the last time that happened."
- a file, sheet, chat group   → "Could you show me?"
- "it gets sorted / they"     → "Who, exactly — and how?"
- "officially we…"            → "On the last one — what actually happened?"
- "ask [name] / evenings"     → "What happens if [name] is away a week?"
- "what are you building?"    → "[deflection line]"

## Anchors
- Scene: "Where were you when it came in? What time? Who was there?"
- Typical?: "Was that a normal one, or unusual?"
- Tacit rules: "How would you explain this to someone starting Monday?"

## At 60–70% of the time
"Is there anything important about [area] I haven't asked?"

## Close
- Commitment ask: "[C11 ask]"
- Referral: "Who else deals with this that I should talk to?"
- Mode switch (only if problem evidence is in AND they opt in): "[permission line]"

## Never
Would you use / pay / like · describing your idea · "great!" · jargon they didn't use
```

### Session debrief — `docs/research/field/<engagement>/sessions/YYYY-MM-DD-<S##>-<P#>.md` (point-in-time)

```markdown
---
type: field-session
product: none
tier: lite | pro
engagement: [slug]
session: S03
participant: P2
business: B1
part: 1
date: YYYY-MM-DD
sources: [docs/intake/interviews/<engagement>/…]
pitch_exposed: false | true
mode_switch_at: "[location in source | none]"
evidence_counts: {L0: 0, L1: 0, L2: 0, L3: 0, L4: 0, L5: 0}
next_action: CONTINUE_INTERVIEWING
status: complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:field
---

# Session S03 — P2 ([role], B1)

## Snapshot
[3 sentences: what this person actually does, where it breaks, what it costs]

## Evidence ledger
| ID | Quote (verbatim) | Where | Level | Phase | Tags |
|---|---|---|---|---|---|

## Non-evidence
L0: n (e.g. "…") · L1: n (e.g. "…")

## Observations
| ID | Observation | Cites |
|---|---|---|

## Inferences (INFERRED — verify)
| ID | Inference | Rests on | Verification probe |
|---|---|---|---|

## Episodes → causal chain
| Episode | Circumstance | Struggling moment | Push | Pull | Workaround | Desired progress |
|---|---|---|---|---|---|---|

## Workflow instance
| # | Trigger | Actor | Input | Tool | Decision | Output | Handoff to | Wait | Cites |
|---|---|---|---|---|---|---|---|---|---|

## Exceptions & failures
## Artifact registry
## Workarounds
## Commercial severity
| Friction | Frequency | Cost (h / €) | Risk | Switching pressure | Cites |
|---|---|---|---|---|---|
## Stakeholders
## Four forces
## Key-person dependency
## Feature requests → upward
## Post-pitch (commitment filter)
## Interviewer lint
## Unknowns raised
## Founder review queue
## Resume card
## Novelty count
## Provenance audit
Quotes checked: n · mismatches: n ([fixed | flagged])

## Next action
**[DIRECTIVE]** — [step with count and date]

## Notes
```

### Synthesis — `docs/research/field/<engagement>/YYYY-MM-DD-synthesis.md` (point-in-time)

```markdown
---
type: field-synthesis
product: none
engagement: [slug]
scope: client | segment
tier: lite | pro
sessions: [S01, S02, …]
participants: n
businesses: n
decision: CONTINUE_INTERVIEWING | DECOMPOSE_OPPORTUNITY | TEST_ASSUMPTION | HALT_FOR_TECHNICAL_SPIKE | PIVOT
target_opportunity: "[OPP-n — text | none]"
status: complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:field
related:
  engagement: docs/research/field/<engagement>/engagement.md
---

# Synthesis: [Engagement] — [date]

## Headline
[2–3 sentences, including what the evidence contradicts]

## Evidence base
Sessions n · participants n · businesses n · L0 n · L1 n · L2 n · L3 n · L4 n · L5 n · POST excluded n

## Pattern matrix
| OPP | Opportunity (customer voice) | P1 | P2 | P3 | … | Weight Σ | Status |
|---|---|---|---|---|---|---|---|

## Commercial significance
| OPP | Frequency | Cost | Risk | Switching pressure | Exception? | Verdict |
|---|---|---|---|---|---|

## Founder-fit filter
| OPP | In scope? | Why | Solo friction (build / maintain) |
|---|---|---|---|

## Adversarial pass
| OPP | Disconfirming hypothesis | Counterexamples in data | Next interview target |
|---|---|---|---|

## Opportunity tree (pro)
[indented tree with OPP IDs and cites] — Lint: [results]

## Jobs & outcomes (pro)
## Target opportunity (pro)
## Solution set (pro — validated target only)
| # | Rung | Concept | D / F / V assumptions | Solo friction | Value |
|---|---|---|---|---|---|
## Bounded pilot (pro, client scope)
## Riskiest assumption (pro)
## Bridge to the OS (pro)
| Proposed ID | Assumption | Type | Risk | Evidence | Dimension minimum (met / missing) | Added? |
|---|---|---|---|---|---|---|

## Provenance audit
Nodes n · cited n · INFERRED n · quotes re-verified n · mismatches n

## Founder review queue
## Lint report
[violations by rule ID, or "none"]

## Decision
**[DIRECTIVE]** — [step with count and date] — route: [product:… invocation]

## Notes
```

## Exit condition

**prep:** you could walk into the conversation today with the card, and the change-my-mind signals are written.
**debrief:** every quote is verbatim and levelled, every workflow step cites or is `INFERRED`, and the session ends in one directive.
**synthesize:** each opportunity has a status earned under recipe 30 §6, the strongest one has been attacked, and there is one directive with a date.

## AI review prompt

1. Did any card, script, or outreach line name a solution or ask about the future or price?
2. Did the debrief add any step, number, name, or tool the raw source doesn't contain?
3. Is any POST item, L0, or L1 item counted as support?
4. Is any opportunity phrased in software terms, or promoted beyond its evidence?
5. Is there a solution set for an unvalidated opportunity, or an AI concept without the rungs below it?
6. Does the founder have raw passages to review, or only summaries?

## Checklist

- [ ] prep: Founder Context, ≤3 objectives with problem hypotheses, change-my-mind signals, card in interview language
- [ ] prep (pro): outreach per channel, recruiting log, screening, adversarial target
- [ ] debrief: verbatim ledger with levels and phase; causal chain; workflow with cites; Unknowns; resume card; one directive
- [ ] synthesize: pattern matrix with statuses from §6; severity; fit filter; adversarial pass; provenance audit; review queue; one directive
- [ ] Nothing written into `docs/intake/`; nothing into `assumptions.md` without confirmation
