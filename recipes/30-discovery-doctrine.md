---
id: 30-discovery-doctrine
phase: understand
tier-lite: true
tier-pro: true
produces: nothing directly — the rulebook every product:field mode enforces
skill: product:field
---

# Recipe: Discovery Doctrine — the rulebook

## When to use

Read by every `product:field` mode. This is the operational form of the Unified Discovery Doctrine v1.0 (source: `appendix/unified_discovery_doctrine.md`, synthesized from 13 books — `appendix/canonical_discovery_harness_synthesis.md`). Rule IDs are kept **verbatim** (`DOC-RULE-01` … `DOC-RULE-30`, `AP-01` … `AP-09`, `GAP-1` … `GAP-6`) so every artifact can cite the rule it applied or broke.

The source doctrine specifies an autonomous AI interviewer. In this OS **the founder runs the conversation; Claude runs everything around it.** Every rule therefore has an *enforcement point* — the mode where it is checked — and a *lint check* that makes it testable. A rule without an enforcement point is not implemented.

`product:interview` uses the same evidence ladder (§3) for assumption-driven interviews.

## Inputs

None. Other recipes and skills read this one.

## 1. The four mandates

1. **Behavioral primacy.** Past actions, spend, and workarounds prove demand. Opinions, compliments, and predictions prove nothing.
2. **Epistemic isolation.** Raw quote, observed fact, inferred opportunity, and solution hypothesis are separate records with separate IDs. None is ever rewritten into another.
3. **Causal reasoning.** Every story is reduced to **Circumstance → Struggling moment → Push / Pull → Workaround → Desired progress** — not to complaints or feature requests.
4. **Adversarial self-correction.** Every pattern that looks strong is attacked before it is believed.

## 2. Modes of conversation

| State | Meaning | Allowed | Forbidden |
|---|---|---|---|
| `PROBLEM_DISCOVERY` | default for every session | open questions about past, present, workflow, spend | naming, describing, or testing any solution; price questions |
| `SOLUTION_TEST` | after DOC-RULE-27 permission | showing a concept, sketch, prototype | counting reactions as problem evidence |
| `SALES_DISCOVERY` | after DOC-RULE-27 permission, qualified account | concrete price as a commitment threshold (deposit, paid pilot, pre-order), pilot scope | hypothetical pricing ("would you pay…") |

The switch out of `PROBLEM_DISCOVERY` freezes all evidence gathered so far as `PRE` (DOC-RULE-26). Everything after is `POST`: kept, levelled, excluded from problem validation; post-pitch praise and intent pass the commitment filter (DOC-RULE-28). A session never switches back.

## 3. Evidence ladder

Every extracted evidence item gets exactly one level.

| Level | Class | Examples | Weight | Counts toward |
|---|---|---|---|---|
| **L0** | Opinion, praise | "Great idea", "sounds useful", ungrounded enthusiasm | 0.0 | nothing |
| **L1** | Hypothetical, future intent, wishlist | "I would pay €100", "we might switch", "you should add X" | 0.1 | hypotheses only |
| **L2** | Generalized current claim | "We usually…", self-reported frequency, official policy | 0.3 | ranking only; must be re-anchored to L3 |
| **L3** | Episodic fact | a specific recent event, sequence with named actors, a concrete failure | 0.7 | desirability |
| **L4** | Revealed behavior | inspected artifact, active workaround, current spend (money or paid labor), a switch that happened | 0.9 | desirability, feasibility, viability |
| **L5** | Commitment | money (deposit, pre-order, paid pilot), real data files handed over, decision-maker calendar time, signed pilot | 1.0 | viability, traction |

**Risk-dimension minimums for "high confidence"**

| Risk | Required |
|---|---|
| Desirability | L3 stories **and** L4 workarounds |
| Feasibility | L4 artifact inspection **and** a technical spike result |
| Viability | L4 existing spend **and** L5 commitment |

**Weights rank, counts decide.** The weight sum per opportunity (L2+ only, one contribution per participant per item class) is shown for ordering. Status promotions (§6) use participant counts and levels, never the sum alone. A sum of LLM-assigned numbers is not evidence.

**Level assignment rules**
- A quote containing `would / could / should / will / might` about the participant's own future behavior is L1, whatever else it says.
- A quote containing `usually / normally / typically / always / every time` without a specific instance is L2.
- An emotional word ("nightmare", "hate") does not raise a level. It marks where to probe for an episode.
- Praise followed at once by a scarce-resource commitment is L5 (DOC-RULE-03 exception). Praise alone stays L0 even if repeated.
- `POST` items keep their level but are **excluded from problem validation** (DOC-RULE-26). Positive feedback, praise, or intent given after a pitch is L0/L1 unless paired with a commitment (L4 artifact shown / L5 data handed over, money, time, signed pilot) (DOC-RULE-28).
- **Paraphrased notes cap at L3** — the founder's memory of a quote is not the quote. Exception: an artifact the founder confirms they saw (debrief question 4) is L4. *(OS addition, not in the doctrine.)*

## 4. The 30 rules — with enforcement points

`prep` = kit and card · `live` = live copilot · `rehearse` = practice · `debrief` = per-session extraction · `synth` = cross-session synthesis.

### Category 1 — source-derived

| ID | Rule | Trigger → move (founder's words) | Enforced in | Lint check |
|---|---|---|---|---|
| **DOC-RULE-01** Non-leading questions | Every question is open, neutral, free of assumptions, emotional adjectives, and solutions. Closed questions only to confirm a fact ("Was that Tuesday?"). | Start with *How / What / Walk me through / Tell me about*. "Walk me through the last time a price changed after you sent a quote." — not "Was it frustrating when…?" | prep (script), live, rehearse, debrief (lint) | question contains an adjective of feeling, a yes/no about opinion, or a solution noun → flag |
| **DOC-RULE-02** No pitching in discovery | Never reveal, suggest, or test a solution in `PROBLEM_DISCOVERY`. | Participant asks "What are you building?" → "I'm researching how [businesses] handle [area] before designing anything. How did you handle [it] last time?" | prep (deflection line on card), live, rehearse, debrief | founder utterance names a product/feature before a recorded mode switch → AP-03 |
| **DOC-RULE-03** Compliments are zero | Praise, opinions, predictions, enthusiasm → L0. | "Thanks. Have you looked for something to fix this in the last six months?" | live, debrief, synth | any L0 item cited as support for an opportunity → error |
| **DOC-RULE-04** Abstract feature requests upward | Every feature request is a solution hypothesis; recover the outcome behind it. | "If you had that export, what would you do with the file right after?" | live, debrief, synth | a request appears in synthesis without an upward restatement → error |
| **DOC-RULE-05** Solution-independent jobs | Jobs and opportunities never name software, vendors, tools, or mechanisms. Syntax: verb + object + context. | "Get reliable material prices for upcoming bids" — not "Automate PDF quote extraction". | synth | job/opportunity text contains a product name, software category, or technical term → AP-08 |
| **DOC-RULE-06** Revealed spend over stated willingness | Viability is judged on what is spent now (hours, subscriptions, contractors, error cost) or committed — never on stated willingness to pay. | "How many hours a week does your estimator spend chasing quotes? What do you pay for today to help?" | prep (script bans price hypotheticals), live, debrief | any "would you pay" in script or transcript → flag; viability claim without L4/L5 → error |
| **DOC-RULE-07** No assumed AI | Never assume a problem needs AI, ML, or agents. Consider process, simple script, UI, conventional SaaS first. | — | synth (solution set) | AI option present without the parsimony ladder filled below it → AP-09 |
| **DOC-RULE-08** No premature solution lock | ≥3 distinct solution concepts per target opportunity before testing anything. | Process change · concierge service · conventional software · (AI only if justified). | synth | fewer than 3 concepts, or 3 variants of one concept → error |
| **DOC-RULE-09** Saturation before validation | No problem becomes an opportunity until the same structure recurs across independent interviews in the segment. | — | synth | status promotion that violates §6 thresholds → error |
| **DOC-RULE-10** Commercial significance | Pain is qualified by frequency × cost × risk and switching pressure, not by emotion. Exception: rare events with existential regulatory or financial risk (a failed audit) qualify despite low frequency. | "How many hours a month does that take? What happens financially when it goes wrong?" | live, debrief, synth | opportunity ranked high with severity or switching-pressure cells `unknown` or low (and no existential-risk exception) → AP-07 |

### Category 2 — cross-source synthesis

| ID | Rule | Trigger → move | Enforced in | Lint check |
|---|---|---|---|---|
| **DOC-RULE-11** Forensic event reconstruction | Anchor every process in one specific, recent episode, trigger to completion. | Generalizer heard ("we usually…") → "Think of the last one, last week. What was the very first thing you did when it came in?" If they never did it → note, recruit someone who has. | prep (coverage node), live, rehearse, debrief | workflow built from L2 claims only → flag, add Unknown |
| **DOC-RULE-12** Workflow & handoffs | Map trigger, actor, input, tool, decision, output, handoff, wait for each step. | "After you saved the sheet, how did the site manager know it was ready?" | live, debrief | workflow step missing actor or handoff target → Unknown |
| **DOC-RULE-13** Exceptions & failures | After every happy path, hunt exceptions, bypasses, failures, recovery. | "Tell me about the last time the supplier didn't answer before the deadline." | prep (coverage node), live, debrief | workflow with zero exceptions recorded → Unknown `exceptions not explored` |
| **DOC-RULE-14** Artifact inspection | Look at the actual sheet, form, board, chat group. | "Could you share your screen and walk me through what each column means?" If confidential → field-by-field verbal walk-through. | prep (ask to bring it), live, debrief | artifact mentioned but not in registry → Unknown |
| **DOC-RULE-15** Workarounds are demand | Every workaround is primary evidence: why built, cost to maintain, what breaks without it. Exception: an ugly workaround for a rare, low-impact task does not justify software. | "Who built this sheet? How many hours a week keeping it updated? What happens if nobody does?" | live, debrief, synth | workaround in ledger without cost/purpose profile → Unknown |
| **DOC-RULE-16** Stakeholder topology | Separate user, champion, influencer, approver, payer, blocker. | "When you take on a new tool, who approves the spend? Who could say no?" | prep (coverage node), live, debrief, synth | opportunity with no known payer → Unknown `payer` |
| **DOC-RULE-17** Four forces | For any past or possible switch, reconstruct push, pull, anxiety, habit — all four. | "What made you hesitate before moving off Excel? What were you worried would break?" | live, debrief | switch discussed but any force blank → Unknown |
| **DOC-RULE-18** Provenance chain | Every synthesized node links back to verbatim spans: `E → O → OPP → A`. | — | debrief, synth | node without citation → marked `INFERRED`; quote not found verbatim in raw source → error |
| **DOC-RULE-19** Unknowns ledger | Log missing links, unresolved pronouns ("it", "they", "the system"), vague quantities, untested assumptions. | "When you say 'it gets sorted', who sorts it, and how?" | live, debrief, synth | vague phrase in ledger quote with no Unknown raised → flag |
| **DOC-RULE-20** Next-action control | Every session and synthesis ends in exactly one directive (§7). | — | debrief, synth | session without `next_action`, synthesis without `decision`, or engagement without `directive` → error |

### Category 3 — custom SMB rules

| ID | Rule | Trigger → move | Enforced in | Lint check |
|---|---|---|---|---|
| **DOC-RULE-21** Founder-fit steering | Seed every engagement with Founder Context (skills, stack, will-not-build, business model, capacity). Probe deeper where it fits; note — don't excavate — what doesn't. Never use it to seek confirmation of a solution. **Timing (resolves §10.2):** from session 1, only *will-not-build* areas are noted rather than excavated; ranking in-scope opportunities by fit happens in synthesis, once C1–C7 are covered for ≥3 participants. | Truck maintenance and PDF copy-paste both mentioned → follow the PDF thread, log the truck one as out-of-scope. | prep (always asked), live, synth (fit filter) | engagement without Founder Context → warning in rehearse/live/debrief; fit filter in synthesis marked `unavailable` |
| **DOC-RULE-22** Actual over official process | Ignore policy and job descriptions; ask how the last real instance went. Exception: regulated compliance steps where a violation carries legal penalties — record the policy as a constraint. | "Officially management approves quotes. On the last one you sent — did you wait for written approval?" | live, debrief | step sourced from a policy statement → level L2, Unknown |
| **DOC-RULE-23** Key-person dependency | Map where work depends on one person's memory, judgment, or evening labor. | "What happens to site assignments if you're off sick for a week?" | prep (coverage node), live, debrief | "ask [name]" / "after hours" / "I just know" in quotes with no dependency entry → flag |
| **DOC-RULE-24** Non-response is a signal | Track outreach response by segment and channel; extreme non-response is a salience or channel signal (L1). Seasonality excepted. | 40 sent, 0 replies → reframe the problem or the segment before sending more. | prep (recruiting log), synth | response rate <10% after ≥20 contacts in one segment with no diagnosis → flag *(threshold: OS addition)* |
| **DOC-RULE-25** Feasibility spike halts interviews | When the riskiest assumption is technical, stop interviewing and run a spike. | "Stop interviewing about PDF extraction. Run 50 real supplier PDFs through the parser first." | synth | feasibility risk critical + directive ≠ `HALT_FOR_TECHNICAL_SPIKE` → error |
| **DOC-RULE-26** Pre-pitch snapshot | At the mode switch, freeze all earlier evidence as `PRE`; tag everything after `POST`. | — | live, debrief | any POST item counted in problem validation → error |
| **DOC-RULE-27** Permission to switch | Switch out of discovery only when problem evidence is captured **and** the participant opts in. | "Based on what you described, I'm working on something that might help with that delay. Want to spend five minutes on it, or should we wrap up here?" Exception: participant demands to see it. | prep (script on card), live, rehearse | mode switch with neither a permission line nor a participant demand ("show me what you have") in transcript/notes → flag |
| **DOC-RULE-28** Post-pitch filter | After a pitch, positive feedback is L0/L1 unless paired with a commitment (L4 artifact shown, L5 data handed over / money / time / signed pilot). Post-pitch facts keep their level but stay out of problem validation (DOC-RULE-26). | "Your app looks amazing" → L0. "Here are last month's quote files" → L5. | debrief | post-pitch praise/intent above L1 without a commitment → error; any POST item counted in problem validation → error |
| **DOC-RULE-29** Founder hears the raw voice | Never a black box. Flag high-salience, anomalous, or contradictory raw passages for the founder to re-read or re-listen. | "Re-listen: [14:15–16:30] — why they fired their last software vendor." | debrief, synth | synthesis with no Founder Review Queue section → error |
| **DOC-RULE-30** Adversarial pass | When a pattern reaches `pattern` status across ≥3 participants, generate disconfirming hypotheses and pick who to interview next to find where it breaks. | "Pattern: contractors lose hours to PDF price extraction. Attack: find contractors with supplier portals or a procurement admin." | synth | pattern at ≥3 participants (segment: from ≥2 businesses) with no adversarial entry → error |

## 5. Anti-pattern taxonomy

| ID | Name | Detection signal | Correction maneuver (say this) |
|---|---|---|---|
| **AP-01** | Compliment harvesting | founder asks "what do you think of…", "do you like…", "isn't that cool?"; notes say "they loved it" | `DEFLECT_PRAISE` — "Thanks. When did you last actively look for a fix for this?" |
| **AP-02** | Fluff & hypothetical acceptance | participant uses *would/could/will* or *usually/typically/normally* and the founder moves on | `ABSTRACT_TO_SPECIFIC` — "Can you walk me through the last time that happened?" |
| **AP-03** | Premature pitching | founder describes a solution while in `PROBLEM_DISCOVERY`; participant starts suggesting features or defending the status quo | `ISOLATE_PRE_PITCH` — freeze PRE, tag POST, return to their context |
| **AP-04** | Questionnaire mode | guide >80% covered with <1.2 follow-ups per top-level question; short answers | `VALIDATE_AND_PAUSE` — "That makes sense." then stay silent ~3 seconds |
| **AP-05** | Vocabulary contamination | founder introduces terms the participant never used ("workflow automation", "agentic", "digital transformation"); participant starts using them | `RUBBER_DUCK_POSTURE` — use their exact words; ask simple clarifying questions; no expertise display |
| **AP-06** | Completion hallucination | synthesized workflow contains steps no quote or artifact supports | `STRICT_PROVENANCE_CHECK` — mark node `INFERRED`, generate a verification probe for the next session |
| **AP-07** | Pain overvaluation | emotional intensity high, frequency × cost × risk low | `COMMERCIAL_SEVERITY_PROBE` — "How many hours a month, and what happens financially if it goes wrong?" |
| **AP-08** | Software ≠ job | opportunity phrased as "better Excel for…" or "WhatsApp alternative" | `STRIP_SOLUTION_FRAME` — "What are they trying to get done when they open it?" |
| **AP-09** | Unbounded AI | solution requires an LLM/agent with no non-AI option evaluated | `PARSIMONY_EVALUATION` — fill the ladder: process → concierge → script/SaaS → AI |

**Tech-curiosity disqualifier** (synthesis §21): a participant interested in the technology ("we should do something with AI") without a recent episode of the pain is tagged `tech-curiosity` in debrief; their items don't count toward patterns.

**Conversational craft — always on the card** (from the synthesis, §1.2): rubber-duck posture (no advice, no self-disclosure, no expertise display) · validate-and-wait · false close at 60–70% of the time ("Is there anything important I haven't asked about?") · teaching prompt for tacit knowledge ("How would you explain this to someone starting Monday?") · scene anchoring (where were you, what time, what device, who was there) · typicality check ("Was that a normal one, or unusual?") · let the story finish while it still carries new information.

## 6. Opportunity interpretation

**Chain:** raw quote (`E`) → factual observation (`O`) → solution-independent opportunity (`OPP`) → commercial significance → cross-interview pattern → validated target opportunity.

1. **Observation layer.** An observation restates what demonstrably happened, citing `E` IDs. No adjectives of judgment, no "needs".
   - E: "I opened three Excel files because I wasn't sure which had current prices."
   - O: "Searched several local workbooks to find the current material price."
   - OPP: "I don't know which price is current without searching several files."
2. **Customer voice test.** Could the operator say this sentence on a bad day at work without knowing your product exists? "I don't know if the supplier got my request" ✓ · "Need webhook confirmation for supplier RFQs" ✗.
3. **Sibling parity.** Siblings under one parent sit at the same altitude. "Extracting tender items takes too long" + "Getting supplier prices takes too long" ✓ · "Preparing bids takes too long" + "Copying PDF cells is tedious" ✗.
4. **Tree lint.** No vertical chains (parent with a single child that restates it), no node with two parents, no solution inside an opportunity node.
5. **Patterns cite observations.** The pattern matrix cites `O` IDs (which cite `E` IDs) — never raw quotes straight into an opportunity.
6. **Typicality.** An episode the participant calls unusual counts for existence, not for frequency.
7. **Reversible target selection.** Pick the target branch on evidence density; run one ~1-week cycle (3 targeted interviews or one concierge test); return to siblings if it fails.

**Status ladder (DOC-RULE-09, DOC-RULE-30)** — for each opportunity:

| Status | Requires |
|---|---|
| `signal` | ≥1 L3+ item from one participant |
| `pattern` | same structure at L3+ from ≥2 participants (segment scope: ≥2 different businesses) |
| `client-validated` | client scope: ≥2 people in the client business at L3+, ≥1 L4 item, commercial severity and switching pressure filled, payer known |
| `market-validated` | segment scope: ≥3 independent businesses at L3+, ≥1 L4 in at least two of them, commercial severity and switching pressure filled, adversarial pass run and the pattern survived (or its boundary is stated) |

Exception (DOC-RULE-09): a regulatory or financial catastrophe proven by a primary artifact may be investigated from fewer instances — mark `exception: catastrophic-risk` and say which artifact.

A client-validated opportunity supports a **bounded pilot** for that client (§8b). It never supports a claim about a market.

**Validated ≠ viable.** Statuses cover desirability. Before `TEST_ASSUMPTION`, each bridge row is tagged with the §3 risk-dimension minimum it meets or misses (`desirability: met` · `viability: missing L5` …). A missed minimum *is* the assumption to test.

**Saturation.** Every debrief counts what is new: new opportunities, workaround types, exception types, stakeholders. Saturation for a branch = two consecutive sessions in the segment adding nothing new to it. `CONTINUE_INTERVIEWING` holds until then or until a pattern needs attacking.

## 7. Next-action directives (DOC-RULE-20, DOC-RULE-25)

Exactly one per session debrief and per synthesis:

| Directive | When | OS route |
|---|---|---|
| `CONTINUE_INTERVIEWING` | coverage gaps or Unknowns block any pattern; saturation not reached | `product:field prep` (refresh coverage map) → more sessions |
| `DECOMPOSE_OPPORTUNITY` | a broad pattern exists; siblings unclear; narrow the segment or the branch | `product:field prep` with the narrowed target |
| `TEST_ASSUMPTION` | target opportunity validated **and** a ≥3-concept solution set exists (DOC-RULE-08) — so only a pro synthesis can emit it; riskiest assumption is desirability or viability. Client scope: the test is the bounded pilot | seed/append `assumptions.md` → `product:experiment` (concierge or pre-sale by default) |
| `HALT_FOR_TECHNICAL_SPIKE` (doctrine: `HALT_INTERVIEWS_FOR_TECHNICAL_SPIKE`) | riskiest assumption is feasibility and it is critical | spike first; `product:stack` / `product:experiment` (wizard-of-oz) |
| `PIVOT` | evidence contradicts the segment or the opportunity; salience absent (DOC-RULE-24) | new engagement, or `product:triage` |

Each directive names the concrete next step with a count and a date: "3 interviews with contractors who use supplier portals by 2026-10-02".

## 8. Solution set (only for a validated target opportunity)

≥3 concepts spanning the **parsimony ladder**, cheapest first:

1. **No software** — a process change, a checklist, a template, a role change.
2. **Concierge / manual service** — the founder delivers the outcome by hand (GAP-5: day 1 service, automated later).
3. **Conventional software** — a script, a simple app, an integration, an existing tool configured.
4. **AI / agent** — allowed only when the friction involves unstructured data, reasoning under ambiguity, or natural-language synthesis. State which, citing evidence.

Each concept gets desirability / feasibility / viability assumptions and a solo build + maintenance friction estimate (GAP-3). Rank by value created vs. solo friction.

## 8b. Bounded pilot (client scope, synthesis §22)

Written only for a `client-validated` target after a permitted mode switch: commercial hypothesis · operational success criteria (numbers from their severity data) · what the client contributes (data, staff time, money — price as a commitment threshold) · duration and exit · what the founder delivers by hand vs. software (GAP-5). Runs through `product:experiment` (concierge or pre-sale).

## 9. Gaps from the doctrine — how this OS closes them

| Gap | Closed by |
|---|---|
| **GAP-1** async micro-sessions | Sessions have `part: N`. Every debrief writes a **Resume card** (open threads, Unknowns for this participant, where the story stopped) for a 3–7 minute follow-up. |
| **GAP-2** artifact verification | Photos, screenshots, and exports go in `docs/intake/interviews/`. Debrief reads images; every field read from an image carries `[read-from-image]` and, if unclear, `[uncertain]` plus a confirmation probe. Discrepancies between what was said and what the artifact shows are recorded (said-vs-visible). |
| **GAP-3** solo-founder constraints | Founder Context in the engagement; fit filter and solo-friction ranking in synthesis. |
| **GAP-4** LLM guardrails | Provenance audit in debrief and synthesis: every quote verified verbatim against the raw file; uncited nodes marked `INFERRED`; lint report with rule IDs. Claude never adds a workflow step, number, or name the sources don't contain. |
| **GAP-5** concierge → SaaS | Concierge is a mandatory rung of the solution set; `TEST_ASSUMPTION` defaults to `product:experiment` concierge. |
| **GAP-6** SMB recruiting | Prep writes outreach variants per channel (phone, WhatsApp, email, trade association, referral) using peer-learning framing, plus the recruiting log with response-rate diagnostics. |

## 10. Resolved tensions (from the synthesis, §1.3)

1. **Tangents vs. focus.** Follow a tangent while it yields new workarounds, handoffs, or constraints; return to the objective when it stops yielding.
2. **Open scope vs. founder fit.** Broad operational discovery first; lock the Founder Context filter only once the problem space is mapped.
3. **Price questions.** Forbidden in `PROBLEM_DISCOVERY`. A concrete price appears only as a commitment threshold in `SALES_DISCOVERY` or an experiment.
4. **Depth vs. prevalence.** Interviews validate causal mechanisms and existence. They do not measure market size — that needs data, surveys, or conversion experiments. Never write "X% of the market".

## Output structure

None — this recipe is referenced by rule ID from `product:field` artifacts.

## Exit condition

Every `product:field` artifact can show, for each rule it touched, where it was applied, and a lint report that lists every violation by ID.

## AI review prompt

1. Does any artifact cite an L0/L1 item, or a POST item without a commitment, as support?
2. Is every opportunity, job, and workflow step traceable to an `E` ID — and is each quote verbatim in its raw source?
3. Does any job or opportunity contain a software term, vendor, or mechanism?
4. Was any opportunity promoted past `signal` without meeting §6?
5. Does every session and synthesis end with exactly one directive from §7?
6. Does a solution set exist before validation, or with fewer than 3 concepts, or AI without the ladder beneath it?

## Checklist

- [ ] Every evidence item has one level L0–L5 and a phase PRE/POST
- [ ] Every synthesized node cites IDs; uncited → `INFERRED`
- [ ] No solution vocabulary in jobs or opportunities
- [ ] Status promotions follow §6
- [ ] One §7 directive with count and date
- [ ] Lint report lists rule IDs, not vague advice
