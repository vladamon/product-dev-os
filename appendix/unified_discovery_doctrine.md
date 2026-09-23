# Unified Doctrine for AI-Assisted Small-Business Discovery Interviewer
## Version 1.0 — Operational Methodology Specification

---

## Executive Overview & Methodological Posture

This document specifies the operational doctrine for an autonomous, AI-assisted business-discovery interviewing harness. Designed specifically for a solo founder investigating small and owner-led businesses (SMBs), this methodology transforms qualitative interviewing from unstructured conversational exploration into a rigorous, evidence-auditable discovery engine.

The doctrine synthesizes 13 foundational texts across customer discovery, Jobs To Be Done (JTBD), qualitative interviewing, experimentation, early B2B sales, story mapping, and Lean Startup methodology [1-798]. It establishes an opinionated operational specification independent of any specific LLM implementation, agent framework, or prompt architecture.

### Key Methodological Mandates
1. **Behavioral Primacy**: Historical actions, financial expenditures, and structural workarounds are the only valid proof of commercial demand. Opinions, compliments, and future predictions are zero-value data [665-666, 674-675].
2. **Epistemic Isolation**: Raw verbatim evidence, observed facts, inferred opportunities, and solution hypotheses must remain strictly isolated in memory and database layers [528-529, 705-706].
3. **Causal Reasoning**: Discovery must expose the underlying mechanism (**Circumstance → Struggling Moment → Push/Pull → Workaround → Desired Progress**) rather than surface complaints or software feature requests [3-4, 100-103, 114].
4. **Adversarial Self-Correction**: The harness must actively generate disconfirming probes to attack its own emerging patterns, preventing confirmation bias and LLM-induced completion hallucinations [305, 489-490].

---

## Part I: Canonical Doctrine Rules

The doctrine comprises 30 operational rules divided into three distinct categories:
- **Category 1: Source-Derived Rules** (Grounded directly in established literature)
- **Category 2: Cross-Source Synthesis Rules** (Formulated by combining complementary frameworks)
- **Category 3: Custom SMB-Discovery Rules** (Addressing methodological gaps specific to solo-founder AI discovery)

---

### Category 1: Source-Derived Rules

#### DOC-RULE-01: Non-Leading Question Discipline
* **Stable ID:** `DOC-RULE-01`
* **Name:** Non-Leading Question Discipline
* **Functional Category:** Interview Opening and Rapport / Interviewing Mechanics
* **Rule:** Every question emitted by the interviewer must be strictly open, neutral, and free of embedded assumptions, emotional adjectives, or solution concepts.
* **Rationale:** Leading questions trigger social desirability bias and politeness, causing interviewees to confirm the founder's hypotheses regardless of operational reality [670-671, 336-337].
* **Trigger Conditions:** Active dialogue state in any discovery mode prior to explicit solution testing.
* **Desired Interviewer Behavior:** Formulate open-ended prompts starting with "How", "What", "Walk me through", or "Tell me about".
* **Example:** "Walk me through what happened the last time a material price changed after you submitted a quote."
* **Anti-Pattern:** "Was it really frustrating when the supplier changed the price on you?"
* **Evidence Generated:** Uncontaminated participant reporting of reality.
* **Evidence Strength:** Level 3 (Episodic Fact).
* **Exceptions or Boundaries:** Direct closed confirmation may be used solely to verify a specific factual parameter (e.g., "Did that happen on Tuesday?").
* **Sources:** *The Mom Test* [670-671], *Talking to Humans* [336-337], *Interviewing Users* [268-270], *Deploy Empathy* [219-220].
* **Confidence:** High.

#### DOC-RULE-02: Strict Separation of Problem Discovery from Pitching
* **Stable ID:** `DOC-RULE-02`
* **Name:** Strict Separation of Problem Discovery from Pitching
* **Functional Category:** Research Preparation / Conversational Mode Control
* **Rule:** The interviewer must never reveal, suggest, or test a solution concept while in `PROBLEM_DISCOVERY` mode.
* **Rationale:** Revealing a solution immediately shifts the participant from candid historical reporting to evaluation, politeness, or sales defense, destroying the evidentiary purity of the session [672-673, 219-220, 350-352, 770-771].
* **Trigger Conditions:** Participant asks "What are you building?" or mentions a problem that perfectly aligns with the founder's solution hypothesis.
* **Desired Interviewer Behavior:** Deflect product questions cleanly with minimal explanation and immediately return the spotlight to the participant's current reality.
* **Example:** "I'm currently researching how trade businesses handle field logistics before designing anything. Can you tell me more about how you handle site reassignments today?"
* **Anti-Pattern:** "We're actually building an AI agent that automatically reassigns workers—would that help you?"
* **Evidence Generated:** Clean, unprompted problem severity and workflow data.
* **Evidence Strength:** Level 3 / Level 4.
* **Exceptions or Boundaries:** Mode switch permitted only after problem discovery is complete AND explicit permission is granted under `DOC-RULE-27`.
* **Sources:** *The Mom Test* [672-673], *Deploy Empathy* [219-220], *Talking to Humans* [350-352], *Founding Sales* [770-775].
* **Confidence:** High.

#### DOC-RULE-03: Zero-Value Rating for Compliments and Opinions
* **Stable ID:** `DOC-RULE-03`
* **Name:** Zero-Value Rating for Compliments and Opinions
* **Functional Category:** Evidence Quality / Data Filtering
* **Rule:** Praise, abstract opinions, hypothetical predictions, and ungrounded enthusiasm must be assigned zero evidentiary weight (`Level 0`) in the validation engine.
* **Rationale:** Politeness is free. Assigning validation weight to enthusiasm creates false positives that lead founders to build unneeded software [674-675, 408-410, 483-485].
* **Trigger Conditions:** Participant emits praise ("Great idea!", "That sounds amazing", "I would definitely buy that").
* **Desired Interviewer Behavior:** Pivot immediately away from praise to investigate past behavioral proxies or concrete commitments.
* **Example:** "Thanks. Have you actively looked for a tool to solve this in the past six months?"
* **Anti-Pattern:** Recording "Customer loved the concept" as validation of demand.
* **Evidence Generated:** Null signal; triggers probe for Level 2+ evidence.
* **Evidence Strength:** Level 0 (Zero Weight).
* **Exceptions or Boundaries:** Spontaneous praise accompanied by an immediate resource commitment (e.g., "Take my credit card right now") transitions to Level 5.
* **Sources:** *The Mom Test* [674-676], *Testing Business Ideas* [408-410], *Lean Customer Development* [483-485], *Founding Sales* [760-761].
* **Confidence:** High.

#### DOC-RULE-04: Feature Request Upward Abstraction
* **Stable ID:** `DOC-RULE-04`
* **Name:** Feature Request Upward Abstraction
* **Functional Category:** Opportunity Extraction / Demand Analysis
* **Rule:** Every customer feature request must be treated as a solution hypothesis and abstracted upward to uncover the underlying operational friction or desired progress.
* **Rationale:** Customers understand their immediate frustrations but rarely understand optimal software architecture or system design. Building raw feature requests produces bloated, fragmented software [684, 476-477, 639-640].
* **Trigger Conditions:** Participant says "You need to add X", "I want a button that does Y", or "Can it export to Z?".
* **Desired Interviewer Behavior:** Ask what outcome or task the requested feature enables in their current workflow.
* **Example:** "If you had that Excel export button, what specific task would you perform with the file afterwards?"
* **Anti-Pattern:** Logging "User needs Excel export feature" directly into the product backlog.
* **Evidence Generated:** Underlying desired outcome and workflow context.
* **Evidence Strength:** Level 2 (Workflow Fact).
* **Exceptions or Boundaries:** None. Every feature request must be abstracted before product modeling.
* **Sources:** *The Mom Test* [684], *Lean Customer Development* [476-477], *JTBD Playbook* [639-640].
* **Confidence:** High.

#### DOC-RULE-05: Solution-Independent Job Framing
* **Stable ID:** `DOC-RULE-05`
* **Name:** Solution-Independent Job Framing
* **Functional Category:** Jobs To Be Done / Opportunity Modeling
* **Rule:** Core customer jobs and opportunities must be formulated entirely without reference to specific software, vendors, tools, or technical mechanisms.
* **Rationale:** Expressing jobs in terms of current technology binds the product vision to legacy implementations and conceals wider, highly valuable solution spaces [3-5, 23-24, 587-589].
* **Trigger Conditions:** Formulating an opportunity or job statement during interview synthesis.
* **Desired Interviewer Behavior:** Frame the job using a functional verb, an object of action, and contextual qualifiers.
* **Example:** "Obtain reliable material pricing for upcoming project bids" (NOT "Automate PDF quote extraction").
* **Anti-Pattern:** Defining the customer job as "Manage worker schedules using a mobile app."
* **Evidence Generated:** Stable, category-independent JTBD statement.
* **Evidence Strength:** N/A (Analytical Representation).
* **Exceptions or Boundaries:** None.
* **Sources:** *Competing Against Luck* [3-5, 23-24], *JTBD Playbook* [587-589, 595-596].
* **Confidence:** High.

#### DOC-RULE-06: Revealed Economic Willingness over Stated Intent
* **Stable ID:** `DOC-RULE-06`
* **Name:** Revealed Economic Willingness over Stated Intent
* **Functional Category:** Switching and Buying Behavior / Commercial Signal Analysis
* **Rule:** Pricing and commercial viability must be evaluated exclusively against current resource expenditures (labor hours, software subscriptions, contractor fees, error costs) or explicit commitments, never stated willingness to pay.
* **Rationale:** Hypothetical pricing questions ("Would you pay €100/mo?") cost the interviewee nothing to answer affirmatively and carry near-zero predictive validity [685-686, 193-194, 220-221, 380-382].
* **Trigger Conditions:** Assessing commercial viability or investigating price sensitivity.
* **Desired Interviewer Behavior:** Investigate what the business currently spends in time, software, labor, or lost revenue to deal with the problem.
* **Example:** "How many hours per week does your estimator spend chasing supplier quotes, and what tools do you pay for to assist them?"
* **Anti-Pattern:** Asking "Would you pay €200 per month for an automated pricing tool?"
* **Evidence Generated:** Baseline economic cost of the status quo (`Level 3/4`).
* **Evidence Strength:** Level 4 (Historical Economic Behavior).
* **Exceptions or Boundaries:** Pre-sales, paid pilots, or binding deposits transition to Level 5.
* **Sources:** *The Mom Test* [685-686], *Deploy Empathy* [193-194, 220-221], *Testing Business Ideas* [380-382].
* **Confidence:** High.

#### DOC-RULE-07: Anti-AI Assumption Discipline
* **Stable ID:** `DOC-RULE-07`
* **Name:** Anti-AI Assumption Discipline
* **Functional Category:** Downstream Product Specification / Opportunity Evaluation
* **Rule:** The interviewer must never assume that an operational problem requires artificial intelligence, machine learning, or autonomous agents.
* **Rationale:** Prematurely framing solutions around AI leads to over-engineered, fragile systems when process improvements, simple scripts, UI redesigns, or conventional SaaS would solve the problem more reliably [32, 66, 405-406].
* **Trigger Conditions:** Synthesizing solution candidates for a validated opportunity.
* **Desired Interviewer Behavior:** Evaluate non-software, conventional SaaS, and process automation solutions before considering AI/agentic solutions.
* **Example:** "The bottleneck occurs because site managers don't know the quote deadline. A simple automated SMS reminder solves this without AI."
* **Anti-Pattern:** Proposing an "AI agentic communication system" for a simple notification failure.
* **Evidence Generated:** Parsimonious solution hierarchy.
* **Evidence Strength:** N/A (Design Constraint).
* **Exceptions or Boundaries:** AI solutions are valid candidates when the core friction involves unstructured data parsing, complex reasoning under ambiguity, or natural language synthesis.
* **Sources:** *Competing Against Luck* [32], *The Lean Startup* [66], *Testing Business Ideas* [405-406].
* **Confidence:** High.

#### DOC-RULE-08: Premature Solution Lock Defense
* **Stable ID:** `DOC-RULE-08`
* **Name:** Premature Solution Lock Defense
* **Functional Category:** Experiment Selection / Opportunity Decomposition
* **Rule:** The interviewer must maintain at least three distinct solution concepts for any validated target opportunity before initiating assumption testing.
* **Rationale:** Developing a single solution concept causes cognitive attachment and confirmation bias, driving founders to defend their idea rather than test the market [552-553, 566-567].
* **Trigger Conditions:** Transitioning from a validated target opportunity to solution ideation.
* **Desired Interviewer Behavior:** Generate diverse solution approaches (e.g., process change, simple UI, automated workflow, human-in-the-loop service).
* **Example:** "For the target opportunity 'Compare supplier quotes quickly', we will evaluate: (1) a standardized quote upload portal, (2) a PDF comparison parser, and (3) a concierge quote-matching service."
* **Anti-Pattern:** Immediately building the founder's favorite solution idea after discovering a problem.
* **Evidence Generated:** Solution Set Object.
* **Evidence Strength:** N/A (Workflow Rule).
* **Exceptions or Boundaries:** None.
* **Sources:** *Continuous Discovery Habits* [552-553, 566-567].
* **Confidence:** High.

#### DOC-RULE-09: Cross-Interview Pattern Saturation Requirement
* **Stable ID:** `DOC-RULE-09`
* **Name:** Cross-Interview Pattern Saturation Requirement
* **Functional Category:** Synthesis Across Interviews / Opportunity Validation
* **Rule:** No operational problem shall be classified as a validated market opportunity until identical structural patterns are observed across multiple independent interviews within a defined segment.
* **Rationale:** Single interviews represent anecdotes influenced by unique firmographic quirks or idiosyncratic manager habits [485-487, 706-707].
* **Trigger Conditions:** Elevating an opportunity candidate to a validated market opportunity.
* **Desired Interviewer Behavior:** Cross-reference story instances across participants to verify structural recurrence.
* **Example:** "Structural pattern confirmed: 5 out of 7 trade business owners independently manage daily site reassignments via unorganized WhatsApp groups."
* **Anti-Pattern:** Declaring a major product opportunity because one enthusiastic business owner described a dramatic problem.
* **Evidence Generated:** Cross-Interview Pattern Matrix.
* **Evidence Strength:** Level 4 (Replicated Behavioral Evidence).
* **Exceptions or Boundaries:** Extremely high-impact regulatory or financial catastrophes verified by primary artifacts may warrant investigation on fewer instances.
* **Sources:** *Lean Customer Development* [485-487], *The Mom Test* [706-707].
* **Confidence:** High.

#### DOC-RULE-10: Commercial Significance Filter
* **Stable ID:** `DOC-RULE-10`
* **Name:** Commercial Significance Filter
* **Functional Category:** Switching and Buying Behavior / Opportunity Qualification
* **Rule:** Operational pain must be validated for frequency, economic cost, and switching pressure before being classified as a commercial opportunity.
* **Rationale:** Small businesses tolerate dozens of minor annoyances daily. High verbal frustration without economic consequence or switching intent does not create buying behavior [100-101, 145-146, 190-191, 751-752].
* **Trigger Conditions:** Evaluating whether a discovered friction constitutes a viable product opportunity.
* **Desired Interviewer Behavior:** Calculate the cumulative labor, financial loss, or strategic risk created by the friction.
* **Example:** "Although managers complain bitterly about filing receipts, it costs only 10 minutes per month and creates no financial error. Unqualified."
* **Anti-Pattern:** Treating intense emotional complaining as proof of commercial demand.
* **Evidence Generated:** Commercial Severity Matrix (Frequency × Cost × Risk).
* **Evidence Strength:** Level 3/4.
* **Exceptions or Boundaries:** Low-frequency events with existential regulatory or financial risk (e.g., annual audit failure) qualify despite low frequency.
* **Sources:** *Demand-Side Sales 101* [100-101, 145-146], *Deploy Empathy* [190-191], *Founding Sales* [751-752].
* **Confidence:** High.

---

### Category 2: Cross-Source Synthesis Rules

#### DOC-RULE-11: Forensic Chronological Event Reconstruction
* **Stable ID:** `DOC-RULE-11`
* **Name:** Forensic Chronological Event Reconstruction
* **Functional Category:** Selecting Concrete Recent Events / Story Reconstruction
* **Rule:** The interviewer must anchors all process discovery in a specific, recent, time-bound historical episode and reconstruct it step-by-step from trigger to completion.
* **Rationale:** Abstract questions ("How do you usually...?") elicit idealized policy descriptions that omit workarounds, delays, mistakes, and informal handoffs. Concrete episodic memories reveal actual reality [127-128, 184-185, 253-255, 514-517, 667-668].
* **Trigger Conditions:** Participant makes a generic claim ("We usually...", "Normally...", "In our company...").
* **Desired Interviewer Behavior:** Interrupt generalities gently and ask for the specific last occurrence.
* **Example:** "Can you think of the last project quote you prepared last week? What was the very first thing you did when the request arrived?"
* **Anti-Pattern:** Accepting "We usually email the supplier and get a quote back" as a complete workflow description.
* **Evidence Generated:** Timestamped Episodic Narrative.
* **Evidence Strength:** Level 3 (Episodic Behavioral Fact).
* **Exceptions or Boundaries:** When the participant has never performed the activity, redirect to recruiting a participant who has.
* **Sources:** *Demand-Side Sales 101* [127-128], *Deploy Empathy* [184-185], *Interviewing Users* [253-255], *Continuous Discovery Habits* [514-517], *The Mom Test* [667-668].
* **Confidence:** High.

#### DOC-RULE-12: End-to-End Workflow & Handoff Extraction
* **Stable ID:** `DOC-RULE-12`
* **Name:** End-to-End Workflow & Handoff Extraction
* **Functional Category:** Workflow Reconstruction / People, Handoffs and Dependencies
* **Rule:** Every operational process must be mapped as a complete sequence capturing triggers, actors, inputs, tools, decisions, outputs, handoffs, and waiting delays.
* **Rationale:** Operational inefficiencies and automation opportunities concentrate at handoffs between actors, systems, and media shifts (e.g., paper to digital) [185-186, 257-258, 310, 650-653].
* **Trigger Conditions:** Participant describes a multi-step activity.
* **Desired Interviewer Behavior:** Systematically probe transitions: "What happened after you finished entering those numbers? Who received it, and how?"
* **Example:** "After you saved the Excel sheet, how did the site manager know it was ready? Did they receive a notification or call?"
* **Anti-Pattern:** Capturing individual software tasks while omitting how data moves between people and tools.
* **Evidence Generated:** Structured Workflow Instance Graph.
* **Evidence Strength:** Level 3 (Observed/Reconstructed Workflow).
* **Exceptions or Boundaries:** None.
* **Sources:** *Interviewing Users* [257-258, 310], *Deploy Empathy* [185-186], *JTBD Playbook* [650-653], *User Story Mapping* [447-449].
* **Confidence:** High.

#### DOC-RULE-13: System Boundary and Exception Excavation
* **Stable ID:** `DOC-RULE-13`
* **Name:** System Boundary and Exception Excavation
* **Functional Category:** Exceptions and Failure Cases
* **Rule:** For every reconstructed standard workflow, the interviewer must explicitly hunt for exceptions, urgent bypasses, failure modes, and recovery steps.
* **Rationale:** Standard processes describe happy paths. Edge cases, exceptions, and urgent overrides often account for 50%+ of actual operational labor and risk [270-271, 310, 443-444, 606].
* **Trigger Conditions:** Completion of a happy-path workflow reconstruction.
* **Desired Interviewer Behavior:** Probe for breakdown points: "What happens when a supplier doesn't reply before the deadline? Walk me through the last time that occurred."
* **Example:** "Tell me about a project where the client changed the specification midway through. How did the standard quoting process break down?"
* **Anti-Pattern:** Designing software based entirely on the idealized standard workflow.
* **Evidence Generated:** Exception and Failure Mode Register.
* **Evidence Strength:** Level 3 (Episodic Fact).
* **Exceptions or Boundaries:** None.
* **Sources:** *Interviewing Users* [270-271], *JTBD Playbook* [310, 606], *User Story Mapping* [443-444].
* **Confidence:** High.

#### DOC-RULE-14: Physical and Digital Artifact Inspection
* **Stable ID:** `DOC-RULE-14`
* **Name:** Physical and Digital Artifact Inspection
* **Functional Category:** Tools, Data and Artifacts
* **Rule:** Whenever possible, the interviewer must observe, inspect, or reconstruct the actual artifacts (spreadsheets, forms, whiteboards, folders, WhatsApp logs) used in the workflow.
* **Rationale:** Participants routinely forget manual steps, workaround columns, or shadow databases that become instantly visible upon inspecting physical/digital artifacts [223-224, 287-289, 338-339].
* **Trigger Conditions:** Participant mentions a document, spreadsheet, folder, board, or messaging group.
* **Desired Interviewer Behavior:** Request a screenshare or detailed verbal walk-through of the artifact's exact fields, columns, and notes.
* **Example:** "Could you open that estimating spreadsheet and walk me through what each color-coded column represents?"
* **Anti-Pattern:** Relying on verbal claims that "everything is in the system" without inspecting the underlying files.
* **Evidence Generated:** Artifact Registry (Schema, Fields, Sources, Users).
* **Evidence Strength:** Level 4 (Directly Observed Artifact).
* **Exceptions or Boundaries:** Confidentiality constraints; where screenshare is impossible, perform field-by-field verbal reconstruction.
* **Sources:** *Deploy Empathy* [223-224], *Interviewing Users* [287-289], *Talking to Humans* [338-339].
* **Confidence:** High.

#### DOC-RULE-15: Compensating Workaround Investigation
* **Stable ID:** `DOC-RULE-15`
* **Name:** Compensating Workaround Investigation
* **Functional Category:** Current Solutions and Workarounds
* **Rule:** Every identified workaround (shadow spreadsheets, manual copy-pasting, custom messaging groups, extra hired help) must be investigated as primary evidence of an unmet outcome.
* **Rationale:** Improvised workarounds prove that the underlying job matters enough that the business is actively expending energy to solve it [37-38, 196-198, 629-631, 679-680].
* **Trigger Conditions:** Identification of an informal or ad hoc workflow step.
* **Desired Interviewer Behavior:** Investigate why the workaround was created, what it costs to maintain, and what fails if it is omitted.
* **Example:** "Who built this shared tracking sheet? How many hours a week are spent keeping it updated?"
* **Anti-Pattern:** Dismissing manual workarounds as "unprofessional" or "stupid" rather than recognizing them as high-value demand signals.
* **Evidence Generated:** Workaround Cost and Purpose Profile.
* **Evidence Strength:** Level 4 (Active Behavioral Workaround).
* **Exceptions or Boundaries:** Ugly workarounds for rare, low-impact tasks do not justify software creation.
* **Sources:** *Competing Against Luck* [37-38], *Deploy Empathy* [196-198], *JTBD Playbook* [629-631], *The Mom Test* [679-680].
* **Confidence:** High.

#### DOC-RULE-16: Organizational Topology and Stakeholder Mapping
* **Stable ID:** `DOC-RULE-16`
* **Name:** Organizational Topology and Stakeholder Mapping
* **Functional Category:** People, Handoffs and Dependencies / Switching and Buying Behavior
* **Rule:** Every commercial conversation must explicitly map and separate the User, Champion, Influencer, Approver, Payer, and Potential Blocker.
* **Rationale:** In SMBs, software adoption fails when the interviewer speaks only to the user (e.g., estimator) without understanding the payer's (owner) economic criteria or the blocker's (accountant) compliance requirements [211-213, 324-325, 758-759].
* **Trigger Conditions:** Discovery of any tool, process change, or purchase.
* **Desired Interviewer Behavior:** Ask who else touches the process, who pays for software, and who can veto changes.
* **Example:** "When you decide to adopt a new software tool, does the Geschäftsführer approve the budget, or does IT need to review it first?"
* **Anti-Pattern:** Assuming the person interviewed has the authority to buy or adopt software.
* **Evidence Generated:** Stakeholder Decision Matrix.
* **Evidence Strength:** Level 3 (Organizational Fact).
* **Exceptions or Boundaries:** Sole-proprietorships where one owner occupies all roles.
* **Sources:** *Deploy Empathy* [211-213], *Talking to Humans* [324-325], *Founding Sales* [758-759].
* **Confidence:** High.

#### DOC-RULE-17: Four Forces Switching Diagnostic
* **Stable ID:** `DOC-RULE-17`
* **Name:** Four Forces Switching Diagnostic
* **Functional Category:** Switching and Buying Behavior
* **Rule:** Whenever investigating a past or prospective tool/process switch, the interviewer must independently reconstruct all four forces: Push, Pull, Anxiety, and Habit.
* **Rationale:** Strong dissatisfaction (Push) and attractive features (Pull) fail to produce purchases if Habit (status quo comfort) or Anxiety (fear of implementation failure) dominate [103-116, 209-210].
* **Trigger Conditions:** Participant describes replacing a tool, considering a change, or resisting a new system.
* **Desired Interviewer Behavior:** Probe forces pulling backward: "What made you hesitate before switching away from Excel? What were you worried might break?"
* **Example:** "Even though the new app was faster, what made your field team want to stick with WhatsApp?"
* **Anti-Pattern:** Measuring only pain and feature interest while ignoring switching anxiety and habit inertia.
* **Evidence Generated:** Four Forces Switching Profile.
* **Evidence Strength:** Level 4 (Switching Mechanics).
* **Exceptions or Boundaries:** None.
* **Sources:** *Demand-Side Sales 101* [103-116], *Deploy Empathy* [209-210].
* **Confidence:** High.

#### DOC-RULE-18: Strict Epistemic Provenance Preservation
* **Stable ID:** `DOC-RULE-18`
* **Name:** Strict Epistemic Provenance Preservation
* **Functional Category:** Evidence Quality / Synthesis Across Interviews
* **Rule:** The system must maintain an unbroken chain of evidence linking every high-level opportunity or solution requirement back to raw transcript quotes and timestamped observations.
* **Rationale:** AI models naturally compress evidence into cohesive summaries, silently converting tentative inferences into "discovered facts" and losing contact with source reality [528-529, 571-573, 705-706, 733-734].
* **Trigger Conditions:** Any automated synthesis, opportunity tree generation, or report creation.
* **Desired Interviewer Behavior:** Tag every synthesized node with explicit citation links to raw transcript spans (`EvidenceSpan -> Fact -> Opportunity -> Hypothesis`).
* **Example:** `OPP-14 ("Supplier quote consolidation delay")` linked directly to `Transcript_03 [14:22]`.
* **Anti-Pattern:** Generating a "Top 5 Customer Insights" document without direct evidence citations.
* **Evidence Generated:** Provenance-Indexed Knowledge Graph.
* **Evidence Strength:** N/A (System Property).
* **Exceptions or Boundaries:** None.
* **Sources:** *Continuous Discovery Habits* [528-529, 571-573], *The Mom Test* [705-706, 733-734].
* **Confidence:** High.

#### DOC-RULE-19: Active Uncertainty and Gap Tracking
* **Stable ID:** `DOC-RULE-19`
* **Name:** Active Uncertainty and Gap Tracking
* **Functional Category:** Assumptions and Unknowns / Research Preparation
* **Rule:** The discovery engine must explicitly log missing workflow links, unresolved pronouns, ambiguous quantities, and untested assumptions as `Unknowns`.
* **Rationale:** Identifying what is NOT yet known is more critical for research design than summarizing what is known [256, 312, 366-368].
* **Trigger Conditions:** Post-interview debrief or real-time dialogue state update.
* **Desired Interviewer Behavior:** Maintain an explicit `UnknownsStack` and prioritize subsequent probes to resolve high-risk unknowns.
* **Example:** "Unknown logged: We do not know who approves supplier price overrides above €5,000."
* **Anti-Pattern:** Assuming a workflow step is understood when the participant used an ambiguous phrase ("then it gets sorted").
* **Evidence Generated:** Active Unknowns Ledger.
* **Evidence Strength:** N/A (Meta-Evidence).
* **Exceptions or Boundaries:** None.
* **Sources:** *Interviewing Users* [256, 312], *Testing Business Ideas* [366-368].
* **Confidence:** High.

#### DOC-RULE-20: Dynamic Next-Action Control Loop
* **Stable ID:** `DOC-RULE-20`
* **Name:** Dynamic Next-Action Control Loop
* **Functional Category:** Synthesis Across Interviews / Experiment Selection
* **Rule:** Every interview or synthesis pass must terminate in an explicit decision regarding the next research or experimental action based on current evidence state.
* **Rationale:** Qualitative discovery is a sequence of strategic decisions (interview more, narrow segment, test prototype, stop), not an archive of transcripts [348-350, 403-405, 577-578].
* **Trigger Conditions:** Conclusion of an interview session or cross-interview synthesis pass.
* **Desired Interviewer Behavior:** Evaluate evidence coverage and output a definitive directive: `CONTINUE_INTERVIEWING`, `DECOMPOSE_OPPORTUNITY`, `TEST_ASSUMPTION`, or `PIVOT`.
* **Example:** "Decision: Stop open discovery on general scheduling. Initiate 3 targeted interviews specifically on tender price sourcing."
* **Anti-Pattern:** Summarizing an interview without specifying what strategic action or question comes next.
* **Evidence Generated:** Strategic Research Decision Record.
* **Evidence Strength:** N/A (Control Action).
* **Exceptions or Boundaries:** None.
* **Sources:** *Talking to Humans* [348-350], *Testing Business Ideas* [403-405], *Continuous Discovery Habits* [577-578].
* **Confidence:** High.

---

### Category 3: Custom SMB-Discovery Rules (Addressing Methodology Gaps)

#### DOC-RULE-21: Strategic Fit & Capability Filtering
* **Stable ID:** `DOC-RULE-21`
* **Name:** Strategic Fit & Capability Filtering
* **Functional Category:** Research Preparation / Opportunity Extraction
* **Rule:** The interviewing harness must be seeded with a `FounderContext` scope (solo founder skills, technology boundaries, business model preferences) to steer probing depth toward actionable opportunities.
* **Rationale:** An LLM without strategic context treats all observed inefficiencies equally, wasting interview time probing problems the solo founder cannot or will not build solutions for (e.g., heavy hardware, complex legal compliance) [239-241].
* **Trigger Conditions:** Identifying a new candidate problem or branching during an interview.
* **Desired Interviewer Behavior:** Prioritize follow-up probes on frictions that align with the founder's technical capabilities (e.g., software/automation) while noting out-of-scope frictions without deep excavation.
* **Example:** "Participant mentions physical truck maintenance and quote PDF copy-pasting. Harness prioritizes PDF copy-pasting thread."
* **Anti-Pattern:** Spending 30 minutes excavating heavy machinery repair workflows when the founder builds web SaaS.
* **Evidence Generated:** Context-Filtered Opportunity Leads.
* **Evidence Strength:** N/A (Steering Filter).
* **Exceptions or Boundaries:** Must not be used to seek confirmation for a specific solution, only to filter broad operational domain boundaries.
* **Sources:** Synthesis derived from *Deploy Empathy* [239-241] and SMB Solo-Founder Gap Analysis.
* **Confidence:** High.

#### DOC-RULE-22: Non-Normalized Process Discovery
* **Stable ID:** `DOC-RULE-22`
* **Name:** Non-Normalized Process Discovery
* **Functional Category:** Business and Role Context / Workflow Reconstruction
* **Rule:** The interviewer must actively investigate informal, unwritten, and non-standardized workflows, ignoring formal job descriptions or official company policies.
* **Rationale:** SMB operations run almost entirely on informal habits, verbal agreements, and improvised routines. Relying on "official policy" yields zero operational insight.
* **Trigger Conditions:** Participant states "Our policy is X" or "Officially we do Y".
* **Desired Interviewer Behavior:** Ask how the work was actually performed in the most recent real instance regardless of policy.
* **Example:** "Officially all quotes are approved by management. Walk me through the last quote you sent—did you wait for formal written approval before sending?"
* **Anti-Pattern:** Accepting employee job descriptions or company handbooks as representations of reality.
* **Evidence Generated:** Actual Operational Process Model (vs. Declared Process).
* **Evidence Strength:** Level 3 (Operational Reality).
* **Exceptions or Boundaries:** Highly regulated compliance steps where policy violations carry legal penalties.
* **Sources:** Synthesis derived from *Interviewing Users* [301] and SMB Solo-Founder Gap Analysis.
* **Confidence:** High.

#### DOC-RULE-23: Owner-Operator & Key-Person Dependency Mapping
* **Stable ID:** `DOC-RULE-23`
* **Name:** Owner-Operator & Key-Person Dependency Mapping
* **Functional Category:** People, Handoffs and Dependencies / Business Context
* **Rule:** The interviewer must explicitly map whether an operational workflow depends on the personal memory, unwritten judgment, or evening labor of the owner or a key individual.
* **Rationale:** SMBs frequently survive on unsustainable owner heroics (e.g., owner spending Sundays fixing quotes). These heroics represent acute automation opportunities but severe adoption bottlenecks.
* **Trigger Conditions:** Process step relies on "knowing by heart", "asking Stefan", or "checking after hours".
* **Desired Interviewer Behavior:** Probe the personal labor and memory burden placed on the key person.
* **Example:** "What happens to job site assignments if you take a week off or fall ill?"
* **Anti-Pattern:** Treating an owner-dependent manual review step as a standard institutionalized process.
* **Evidence Generated:** Key-Person Dependency Risk Profile.
* **Evidence Strength:** Level 3 (Structural Vulnerability).
* **Exceptions or Boundaries:** None.
* **Sources:** Synthesis derived from *Deploy Empathy* [211-213] and SMB Solo-Founder Gap Analysis.
* **Confidence:** High.

#### DOC-RULE-24: Pragmatic Non-Respondent Sampling
* **Stable ID:** `DOC-RULE-24`
* **Name:** Pragmatic Non-Respondent Sampling
* **Functional Category:** Interviewee Selection and Recruiting
* **Rule:** The harness must track recruiting outreach response rates and treat extreme non-response or difficulty in obtaining discovery calls as a diagnostic signal regarding problem salience or market reachability.
* **Rationale:** In SMB markets, if busy owners refuse even brief conversations about a supposed problem, the problem may lack sufficient salience, or the outreach framing is wrong [467-469, 328-330].
* **Trigger Conditions:** Outreach campaign analysis.
* **Desired Interviewer Behavior:** Log non-response rates by segment and trigger diagnostic adjustments to problem framing or segment selection.
* **Example:** "Outreach to 40 electrical contractors yields 0 responses. Flag potential salience or channel mismatch."
* **Anti-Pattern:** Ignored outreach treated as purely a sales volume failure without re-evaluating problem salience.
* **Evidence Generated:** Recruiting Friction Diagnostic.
* **Evidence Strength:** Level 1 (Market Salience Signal).
* **Exceptions or Boundaries:** High-seasonality industries (e.g., agricultural harvesters during harvest) where non-response is purely timing-driven.
* **Sources:** *Lean Customer Development* [467-469], *Talking to Humans* [328-330].
* **Confidence:** Medium.

#### DOC-RULE-25: Asymmetric Technical Feasibility Verification
* **Stable ID:** `DOC-RULE-25`
* **Name:** Asymmetric Technical Feasibility Verification
* **Functional Category:** Experiment Selection / Assumptions and Unknowns
* **Rule:** When the riskiest assumption of a discovered opportunity is technical feasibility (e.g., parsing messy non-standard supplier PDFs), the harness must halt customer interviewing and mandate a technical spike/experiment.
* **Rationale:** Continuing to interview customers about a problem whose technical solution may be impossible or economically unviable is waste [397-398, 382].
* **Trigger Conditions:** High-desirability opportunity where core technical mechanism remains untested (`Feasibility Risk = Critical`).
* **Desired Interviewer Behavior:** Output directive: `HALT_INTERVIEWS_FOR_TECHNICAL_SPIKE`.
* **Example:** "Stop interviewing contractors about PDF quote extraction. Run 50 real sample PDFs through the LLM parser to verify accuracy threshold."
* **Anti-Pattern:** Conducting 20 more customer interviews while assuming the underlying AI/software capability will "figure itself out."
* **Evidence Generated:** Technical Feasibility Spike Result.
* **Evidence Strength:** Level 4 (Experimental Technical Proof).
* **Exceptions or Boundaries:** Where technical feasibility is trivial and commercial desirability is the sole risk.
* **Sources:** *Testing Business Ideas* [397-398, 382].
* **Confidence:** High.

#### DOC-RULE-26: Pre-Pitch Mode Lock & Snapshot Isolation
* **Stable ID:** `DOC-RULE-26`
* **Name:** Pre-Pitch Mode Lock & Snapshot Isolation
* **Functional Category:** Evidence Quality / Research Preparation
* **Rule:** All evidence gathered prior to solution exposure must be locked into an immutable `PRE_PITCH` snapshot. Any statements made after solution exposure must be tagged `POST_PITCH` and excluded from core problem validation.
* **Rationale:** Revealing a pitch contaminates all subsequent participant answers. Isolating pre-pitch evidence preserves research integrity [774-775, 794].
* **Trigger Conditions:** System state transition from `PROBLEM_DISCOVERY` to `SOLUTION_TEST` or `SALES_DISCOVERY`.
* **Desired Interviewer Behavior:** Automatically freeze pre-pitch memory state and apply `POST_PITCH` metadata flags to all subsequent dialogue turns.
* **Example:** "Pre-pitch snapshot frozen: 3 instances of 4-hour quote delays recorded. All future participant statements tagged POST_PITCH."
* **Anti-Pattern:** Blending post-pitch participant agreement ("Yeah, your app sounds great") into pre-pitch problem validation metrics.
* **Evidence Generated:** Immutable Pre-Pitch Evidence Snapshot.
* **Evidence Strength:** System Architecture Constraint.
* **Exceptions or Boundaries:** None.
* **Sources:** *Founding Sales* [774-775, 794].
* **Confidence:** High.

#### DOC-RULE-27: Explicit Mode-Switch Permission Protocol
* **Stable ID:** `DOC-RULE-27`
* **Name:** Explicit Mode-Switch Permission Protocol
* **Functional Category:** Transition from Research to Pilot or Sales
* **Rule:** The interviewer shall never transition from research mode to sales/solution mode without capturing verified problem evidence AND obtaining explicit, opt-in permission from the participant.
* **Rationale:** Stealth pitches masquerading as research destroy trust, offend SMB operators, and corrupt data quality [773, 793-794].
* **Trigger Conditions:** Problem discovery complete + strong commercial urgency observed + founder desires commercial transition.
* **Desired Interviewer Behavior:** Ask explicit, low-pressure permission to share a solution concept.
* **Example:** "You've been incredibly helpful in explaining your quoting process. Based on what you described, I'm working on a tool that might address that delay. Would you be open to spending five minutes looking at it, or should we wrap up here?"
* **Anti-Pattern:** Seamlessly sliding into a sales pitch without warning the participant.
* **Evidence Generated:** Explicit Mode-Switch Consent.
* **Evidence Strength:** Level 3 (Participant Commitment).
* **Exceptions or Boundaries:** Participant explicitly demands to see the solution ("Show me what you have right now").
* **Sources:** *Founding Sales* [773, 793-794].
* **Confidence:** High.

#### DOC-RULE-28: Post-Solution Contamination Filter
* **Stable ID:** `DOC-RULE-28`
* **Name:** Post-Solution Contamination Filter
* **Functional Category:** Evidence Quality / Interpretation Rules
* **Rule:** Once a solution has been pitched, any positive participant feedback ("That's great", "I'd use that") must be downgraded to Level 0/1 unless accompanied by an immediate Level 5 commitment (time, data, money).
* **Rationale:** Post-pitch enthusiasm is predominantly driven by politeness and social easing. Only hard commitments carry validation weight post-pitch [774, 792].
* **Trigger Conditions:** Dialogue turn occurring in `POST_PITCH` state.
* **Desired Interviewer Behavior:** Filter post-pitch statements through a strict commitment test before updating opportunity confidence.
* **Example:** "Participant said 'Your app looks amazing' post-pitch. Filtered to Level 0. Requested access to actual quote files -> Level 4 Commitment."
* **Anti-Pattern:** Logging post-pitch verbal praise as proof of commercial traction.
* **Evidence Generated:** Post-Pitch Commitment Filter Result.
* **Evidence Strength:** Level 0 (Praise) vs Level 4/5 (Commitment).
* **Exceptions or Boundaries:** None.
* **Sources:** *Founding Sales* [774, 792].
* **Confidence:** High.

#### DOC-RULE-29: Continuous Direct Founder Exposure Filter
* **Stable ID:** `DOC-RULE-29`
* **Name:** Continuous Direct Founder Exposure Filter
* **Functional Category:** Synthesis Across Interviews / Downstream Product Specification
* **Rule:** The AI discovery harness must never function as a black-box aggregator that hides raw customer dialogue from the founder; it must flag high-salience, anomalous, or contradictory raw audio/transcript passages for direct founder review.
* **Rationale:** Fully autonomous synthesis deprives the solo founder of developing tacit domain intuition, vocabulary, and customer empathy required for effective B2B selling [353-355, 358].
* **Trigger Conditions:** Discovery of major workflow exceptions, strong emotional reactions, or contradictory evidence.
* **Desired Interviewer Behavior:** Flag specific transcript audio timestamps for mandatory founder listening.
* **Example:** "Flagged for Founder Review: Audio [14:15-16:30] where owner explains why they fired their last software vendor."
* **Anti-Pattern:** Delivering a clean 1-page summary to the founder while hiding all raw customer voice interactions.
* **Evidence Generated:** Founder Review Excerpt Queue.
* **Evidence Strength:** N/A (Human-in-the-Loop Constraint).
* **Exceptions or Boundaries:** None.
* **Sources:** *Talking to Humans* [353-355, 358].
* **Confidence:** High.

#### DOC-RULE-30: Adversarial Pattern Attack Protocol
* **Stable ID:** `DOC-RULE-30`
* **Name:** Adversarial Pattern Attack Protocol
* **Functional Category:** Synthesis Across Interviews / Opportunity Decomposition
* **Rule:** Whenever the synthesis engine establishes a high-confidence opportunity pattern, it must immediately execute an adversarial research pass designed specifically to discover counterexamples or disconfirming conditions.
* **Rationale:** LLMs suffer from strong coherence bias, naturally grouping data into pleasing patterns while smoothing away disconfirming evidence [305, 489-490].
* **Trigger Conditions:** Opportunity confidence reaches "High" across 3+ interviews.
* **Desired Interviewer Behavior:** Formulate disconfirming hypotheses and select subsequent interview targets or questions to test where the pattern breaks down.
* **Example:** "Pattern: 'All contractors suffer from PDF price extraction delay'. Adversarial Pass: Target contractors who use standardized supplier APIs or dedicated procurement admins to find where the pattern fails."
* **Anti-Pattern:** Continuously interviewing identical target subjects to confirm an already-supported hypothesis.
* **Evidence Generated:** Disconfirmation Boundary Profile.
* **Evidence Strength:** Level 4 (Adversarial Validation).
* **Exceptions or Boundaries:** None.
* **Sources:** *Lean Customer Development* [489-490], *Interviewing Users* [305].
* **Confidence:** High.

---

## Part II: Interview Anti-Patterns Taxonomy

This section details the primary failure modes that corrupt discovery interviewing, providing diagnostic symptoms, root causes, detection logic, and automated correction maneuvers.

```
                  ┌─────────────────────────────────────────┐
                  │      INTERVIEW ANTI-PATTERN TAXONOMY    │
                  └────────────────────┬────────────────────┘
                                       │
      ┌────────────────────────────────┼────────────────────────────────┐
      ▼                                │                                ▼
┌───────────┐                          ▼                          ┌───────────┐
│EPISTEMIC  │                  ┌───────────────┐                  │COMMERCIAL │
│CORRUPTION │                  │CONVERSATIONAL │                  │MISALIGNMENT│
└─────┬─────┘                  │  DERAILMENT   │                  └─────┬─────┘
      │                        └───────┬───────┘                        │
      ├─ Leading Pitching              ├─ Questionnaire Mode            ├─ Solution Lock
      ├─ Compliment Harvesting         ├─ Abstract Generalization       ├─ Pain Overvaluation
      └─ Fluff Acceptance              └─ Vocabulary Contamination      └─ Artificial AI Need
```

### 1. Epistemic Corruption Anti-Patterns

#### AP-01: Compliment Harvesting
* **Symptoms:** Interviewer records statements like "User loved the idea", "Customer thinks it's a game-changer", or "Positive feedback received".
* **Root Cause:** Founder ego seeking validation rather than truth; interviewer asking for feedback on concept [674-675].
* **Detection Signal:** Dialogue contains phrases like "What do you think of...", "Do you like...", or "Isn't that cool?".
* **Correction Maneuver:** `DEFLECT_PRAISE` -> Re-anchor immediately in past behavior: "Thanks. When was the last time you actively searched for a solution to this?"

#### AP-02: Fluff & Hypothetical Acceptance
* **Symptoms:** Evidence database filled with "Users usually do X", "Customers would buy Y", or "We normally spend Z".
* **Root Cause:** Accepting generalized claims or future predictions as factual validation [665-667].
* **Detection Signal:** Participant text contains verb tenses `would`, `could`, `should`, `will`, or generalizers `usually`, `typically`, `normally`.
* **Correction Maneuver:** `ABSTRACT_TO_SPECIFIC` -> Request concrete episodic instance: "Can you walk me through the specific last time that happened?"

#### AP-03: Premature Pitching & Contamination
* **Symptoms:** Participant shifts from describing their workflow to asking questions about the product, offering feature suggestions, or defending their status quo [672-673, 770-771].
* **Root Cause:** Interviewer introduced product concepts, slides, or solution ideas before securing problem evidence.
* **Detection Signal:** Interviewer dialogue contains solution descriptions or feature lists while state is `PROBLEM_DISCOVERY`.
* **Correction Maneuver:** `ISOLATE_PRE_PITCH` -> Freeze pre-pitch evidence, tag subsequent dialogue `POST_PITCH`, and return to problem context.

---

### 2. Conversational Derailment Anti-Patterns

#### AP-04: Questionnaire Execution Mode
* **Symptoms:** Rapid-fire Q&A rhythm; short participant answers; interviewer jumping sequentially through script lines without probing [214-215, 303-304].
* **Root Cause:** Treating the interview guide as a rigid linear script rather than a coverage map.
* **Detection Signal:** High guide completion rate (>80%) combined with low follow-up rate (<1.2 follow-ups per top-level question).
* **Correction Maneuver:** `VALIDATE_AND_PAUSE` -> Force a neutral acknowledgment ("That makes sense") followed by 3 seconds of deliberate silence to invite spontaneous elaboration [173-175, 278-280].

#### AP-05: Vocabulary & Expertise Contamination
* **Symptoms:** Participant adopts consultant jargon ("digital transformation", "agentic workflow") or sounds defensive [263-264, 280-281].
* **Root Cause:** Interviewer displaying expertise, using corporate/technical jargon, or correcting participant terminology.
* **Detection Signal:** Interviewer introduces technical or management terms not previously used by the participant.
* **Correction Maneuver:** `RUBBER_DUCK_POSTURE` -> Revert to ordinary native language, adopt participant's exact vocabulary, and ask simple clarifying questions [180-181, 263-264].

#### AP-06: Completion Hallucination
* **Symptoms:** Synthesized workflow maps contain detailed sub-steps that were never mentioned by the participant or observed in artifacts [304-305].
* **Root Cause:** LLM internal completion bias filling in "what usually happens" in a process.
* **Detection Signal:** Discrepancy between verbatim transcript entities and synthesized workflow node attributes.
* **Correction Maneuver:** `STRICT_PROVENANCE_CHECK` -> Flag any un-cited workflow node as `INFERRED_HYPOTHESIS` and generate an explicit verification probe for the next turn.

---

### 3. Commercial Misalignment Anti-Patterns

#### AP-07: Pain Overvaluation & Complaint Misinterpretation
* **Symptoms:** High-priority opportunity logged for an issue that causes minor annoyance but zero economic loss, time waste, or switching intent [145-146, 717-719].
* **Root Cause:** Mistaking emotional vocabulary ("I hate doing X", "X is a nightmare") for commercial demand.
* **Detection Signal:** Emotional intensity rated High while frequency × labor cost × financial risk is Low.
* **Correction Maneuver:** `COMMERCIAL_SEVERITY_PROBE` -> Investigate economic consequences: "How many hours per month does that take, and what happens financially if it goes wrong?"

#### AP-08: Confusing Existing Software with the Underlying Job
* **Symptoms:** Opportunity framed as "Better Excel for construction" or "Alternative to WhatsApp".
* **Root Cause:** Defining the market by incumbent vendor categories rather than customer progress [23-24, 587-589].
* **Detection Signal:** Job or opportunity statement contains a product name or software category.
* **Correction Maneuver:** `STRIP_SOLUTION_FRAME` -> Abstract upward: "What progress is the user trying to make when they open that software?"

#### AP-09: Unbounded AI Solipsism
* **Symptoms:** Proposing complex autonomous AI agents for straightforward process inefficiencies or simple data display needs [32, 405-406].
* **Root Cause:** Founder/AI bias toward using cutting-edge technology regardless of necessity.
* **Detection Signal:** Solution specification mandates AI/LLM components without evaluating non-AI alternatives.
* **Correction Maneuver:** `PARSIMONY_EVALUATION` -> Force evaluation of minimal non-AI interventions (SMS, simple UI, spreadsheet template) before permitting AI architecture.

---

## Part III: Evidence Hierarchy Specification

The discovery engine classifies all extracted evidence into six discrete, ordinal strength levels. Validation confidence is calculated exclusively from Level 2+ evidence.

```
┌────────────────────────────────────────────────────────────────────────┐
│ LEVEL 5: TRANSACTION & COMMITMENT                                      │
│ Pre-sales, binding deposits, shared data/APIs, staff time allocated    │
├────────────────────────────────────────────────────────────────────────┤
│ LEVEL 4: REVEALED BEHAVIOR & WORKAROUNDS                               │
│ Observed artifacts, shadow sheets, active switching, current spend     │
├────────────────────────────────────────────────────────────────────────┤
│ LEVEL 3: EPISODIC & WORKFLOW FACTS                                     │
│ Specific historical incidents, timestamped sequences, named actors     │
├────────────────────────────────────────────────────────────────────────┤
│ LEVEL 2: GENERALIZED CURRENT CLAIMS                                    │
│ "We usually do X", self-reported frequencies, policy descriptions      │
├────────────────────────────────────────────────────────────────────────┤
│ LEVEL 1: HYPOTHETICALS & FUTURE INTENT                                 │
│ "I would use X", "We might buy Y", feature wishlist responses          │
├────────────────────────────────────────────────────────────────────────┤
│ LEVEL 0: OPINIONS, PRAISE & COMPLIMENTS                                │
│ "Great idea!", "Sounds very useful", ungrounded enthusiasm              │
└────────────────────────────────────────────────────────────────────────┘
```

### Detailed Level Specifications

| Level | Classification | Description & Examples | Decision Impact / Weight |
| :--- | :--- | :--- | :--- |
| **Level 0** | **Opinions & Praise** | Politeness, praise, abstract opinions, ungrounded enthusiasm ("Great concept!", "That's smart") [674-675]. | **Zero Weight (0.0)**. Completely excluded from validation calculations. |
| **Level 1** | **Hypotheticals & Intent** | Predictions of future behavior, hypothetical purchase claims, feature wishlist requests ("I would pay €100 for that") [665-666, 685-686]. | **Negligible Weight (0.1)**. Generates hypotheses for testing; provides zero proof of demand. |
| **Level 2** | **Generalized Claims** | Self-reported typical behaviors, corporate policies, abstract frequency claims ("We usually send 5 quotes a week") [667-668]. | **Low Weight (0.3)**. Requires re-anchoring in specific episodic instances (`Level 3`). |
| **Level 3** | **Episodic Facts** | Reconstructed specific historical events, timestamped process steps, named actors, concrete failure instances [127-128, 514-517]. | **Moderate-High Weight (0.7)**. Strong qualitative proof of operational reality and friction. |
| **Level 4** | **Revealed Behavior** | Directly observed artifacts, active manual workarounds, shadow spreadsheets, current software spend, active tool switching [193-194, 629-631]. | **High Weight (0.9)**. Definitive proof of problem importance and active effort to solve. |
| **Level 5** | **Commitments** | Surrender of non-refundable scarce resources: money (deposits/pre-sales), internal data access, decision-maker calendar time, signed pilot agreements [687-689, 764-768]. | **Maximum Weight (1.0)**. Objective proof of commercial traction and demand. |

### Dimension-Specific Evidence Mapping

Evidence strength must be evaluated relative to the specific dimension of risk being tested:

```
┌───────────────────┬────────────────────────────────────────────────────────────┐
│ Risk Dimension    │ Required Evidence Types for High Confidence                │
├───────────────────┼────────────────────────────────────────────────────────────┤
│ Desirability Risk │ Level 3 Episodic Stories + Level 4 Active Workarounds      │
│ Feasibility Risk  │ Level 4 Direct Artifact Inspection + Technical Spike Proof │
│ Viability Risk    │ Level 4 Existing Financial Spend + Level 5 Pre-Sale/Deposit│
└───────────────────┴────────────────────────────────────────────────────────────┘
```

---

## Part IV: Opportunity Interpretation Rules

These rules govern the transformation of raw interview evidence into structured, validated opportunity trees without solution contamination.

```
RAW TRANSCRIPT / OBSERVED ARTIFACT
  │
  ▼
[DOC-RULE-18] -> FACTUAL OBSERVATION LAYER (What demonstrably occurred)
  │
  ▼
[DOC-RULE-05] -> SOLUTION-INDEPENDENT OPPORTUNITY (Unmet outcome / friction)
  │
  ▼
[DOC-RULE-10] -> COMMERCIAL SIGNIFICANCE FILTER (Frequency × Cost × Risk)
  │
  ▼
[DOC-RULE-09] -> CROSS-INTERVIEW PATTERN MATRIX (Multi-participant saturation)
  │
  ▼
VALIDATED TARGET OPPORTUNITY (Ready for Solution Ideation & Assumption Mapping)
```

### 1. The Factual Observation Layer Rule
* **Rule:** An explicit `FactualObservation` entity must sit between raw transcript quotes and synthesized `Opportunity` nodes.
* **Mechanism:** 
  1. `RawQuote`: "I opened three Excel files because I wasn't sure which had current prices."
  2. `FactualObservation`: "User searched multiple local workbooks to find active material pricing."
  3. `Opportunity`: "I need to know which material price is current without searching multiple files."
* **Violation:** Jumping directly from "opened three Excel files" to "Customer needs an enterprise cloud database".

### 2. Opportunity vs. Solution Separation Rule
* **Rule:** No `Opportunity` node in an Opportunity Solution Tree (OST) may contain software terms, database names, UI components, or technical mechanisms.
* **Validation Test:** Apply the *Customer Voice Test*: Could an SMB operator naturally express this statement during a bad day at work without knowing your software exists?
  - ✅ "I don't know if the supplier received my request."
  - ❌ "Need automated webhook confirmation for supplier RFQs."

### 3. Sibling Node Parity & Abstraction Alignment Rule
* **Rule:** All sibling nodes under a parent opportunity must operate at equivalent levels of operational abstraction.
* **Validation Test:** 
  - ✅ **Valid Siblings:** "Extracting tender items takes too long" AND "Obtaining supplier prices takes too long".
  - ❌ **Invalid Siblings:** "Preparing bids takes too long" AND "Copying PDF cells is tedious" (Mixing macro-activity with micro-task).

### 4. Reversible Target Opportunity Selection Rule
* **Rule:** Target opportunity selection for deep exploration must be treated as a reversible decision.
* **Mechanism:** Select a target opportunity branch based on current evidence density, execute a 1-week exploration cycle (3 targeted interviews or concierge test), and return to sibling branches if evidence invalidates the initial selection [548-550].

---

## Part V: Open Methodology Gaps & Custom Doctrine Requirements

While the 13 core sources provide exhaustive coverage of qualitative interviewing, JTBD, and general experimentation, six critical operational gaps remain when applied specifically to an autonomous AI agent interviewing small-business operators.

These gaps define the custom doctrine that must be developed in subsequent implementation stages.

```
┌───────────────────────────────────────────────────────────────────────────────┐
│                      SMB AI-DISCOVERY METHODOLOGY GAPS                        │
├───────────────────────────────────────────────────────────────────────────────┤
│ GAP-1: Voice Dialogue State Machine for Asynchronous SMB Interviews           │
│ GAP-2: Real-Time Multimodal Artifact Verification Protocol                     │
│ GAP-3: Asymmetric Solo-Founder Resource & Capability Constraint Model         │
│ GAP-4: Automated LLM Self-Correction & Anti-Hallucination Guardrails          │
│ GAP-5: Hybrid Service/Software Transition Pipeline (Concierge -> SaaS)         │
│ GAP-6: Cold Outreach & Recruiting State Machine for Passive SMB Owners        │
└───────────────────────────────────────────────────────────────────────────────┘
```

### Gap Details & Requirements Specification

#### GAP-1: Voice Dialogue State Machine for Asynchronous SMB Interviews
* **Description:** SMB owners rarely sit for 45-minute structured video interviews. They talk while driving between job sites, inspecting work, or taking quick 10-minute breaks.
* **Unresolved Issue:** How to adapt qualitative story extraction (Portigal/Torres) to low-latency, multi-session, intermittent voice interactions without losing narrative context or feeling like a robotic survey.
* **Required Custom Doctrine:** Asynchronous conversational state machine supporting micro-sessions (3-7 minutes), persistent memory across calls, and context-restoration prompts.

#### GAP-2: Real-Time Multimodal Artifact Verification Protocol
* **Description:** Literature emphasizes "show me, don't tell me" [223-224, 287-289], but lacks operational protocols for an AI interpreting messy, handwritten physical artifacts (site logs, paper delivery slips, stained whiteboards).
* **Unresolved Issue:** How an AI agent should prompt, capture, parse, and cross-examine physical documents in real time without interrupting conversational rapport.
* **Required Custom Doctrine:** Multimodal artifact ingestion protocol specifying camera prompting, vision parsing confidence thresholds, and discrepancy resolution probes.

#### GAP-3: Asymmetric Solo-Founder Resource & Capability Constraint Model
* **Description:** Literature assumes either product trios (PM + Design + Eng) [578] or funded startups with software teams. A solo founder has finite engineering hours and zero sales team.
* **Unresolved Issue:** How to automatically weigh discovered opportunities against the solo founder's specific technical stack, time availability, and delivery capacity.
* **Required Custom Doctrine:** Solo-Founder Feasibility Filter that ranks opportunities by *Value Created vs. Solo Build/Maintenance Friction*.

#### GAP-4: Automated LLM Self-Correction & Anti-Hallucination Guardrails
* **Description:** Existing literature assumes human researchers who naturally maintain common sense. LLMs aggressively hallucinate process completeness, synthesize fake consensus, and yield to participant steering.
* **Unresolved Issue:** Formalizing programmatic verification gates that prevent the LLM from declaring "validated demand" based on plausible-sounding but ungrounded narrative generations.
* **Required Custom Doctrine:** Real-time epistemic linter running in parallel with dialogue generation to catch and neutralize hallucinations before turn emission.

#### GAP-5: Hybrid Service/Software Transition Pipeline (Concierge -> SaaS)
* **Description:** Small businesses often refuse software but gladly pay for outcomes. The literature covers concierge tests generally [391-393] but lacks the exact operational mechanics for transitioning a manual service into a software product.
* **Unresolved Issue:** How to structure early discovery to validate a tech-enabled service that can be delivered manually by the founder on Day 1 and progressively automated into SaaS on Day 100.
* **Required Custom Doctrine:** Concierge-to-SaaS Progressive Automation Pipeline specification.

#### GAP-6: Cold Outreach & Recruiting State Machine for Passive SMB Owners
* **Description:** Existing sources focus on interviewing users once they are in the room. Getting busy, non-tech-savvy trade business owners to accept a discovery call is a major bottleneck [467-469].
* **Unresolved Issue:** A systematic, non-salesy outreach and scheduling protocol tailored to trade business channels (WhatsApp, phone, trade association forums).
* **Required Custom Doctrine:** Peer-Learning Recruitment Protocol for SMB operators.

---

## Part VI: Canonical Concept Inventory Index

For rapid reference, the 30 retained doctrine rules are indexed below by Stable ID, Functional Category, and Source Grounding.

| ID | Rule Name | Functional Category | Primary Sources | Confidence |
| :--- | :--- | :--- | :--- | :--- |
| `DOC-RULE-01` | Non-Leading Question Discipline | Interview Opening & Rapport | Mom Test [670], Talking to Humans [336] | High |
| `DOC-RULE-02` | Separation of Problem Discovery from Pitching | Research Preparation | Mom Test [672], Founding Sales [770] | High |
| `DOC-RULE-03` | Zero-Value Rating for Compliments & Opinions | Evidence Quality | Mom Test [674], Testing Business Ideas [408] | High |
| `DOC-RULE-04` | Feature Request Upward Abstraction | Opportunity Extraction | Mom Test [684], Lean Customer Dev [476] | High |
| `DOC-RULE-05` | Solution-Independent Job Framing | Jobs To Be Done | Competing Against Luck [3], JTBD Playbook [587] | High |
| `DOC-RULE-06` | Revealed Economic Willingness over Stated Intent | Switching & Buying Behavior | Mom Test [685], Deploy Empathy [193] | High |
| `DOC-RULE-07` | Anti-AI Assumption Discipline | Downstream Product Spec | Competing Against Luck [32], Lean Startup [66] | High |
| `DOC-RULE-08` | Premature Solution Lock Defense | Experiment Selection | Continuous Discovery Habits [552] | High |
| `DOC-RULE-09` | Cross-Interview Pattern Saturation Requirement | Synthesis Across Interviews | Lean Customer Dev [485], Mom Test [706] | High |
| `DOC-RULE-10` | Commercial Significance Filter | Switching & Buying Behavior | Demand-Side Sales [100], Founding Sales [751] | High |
| `DOC-RULE-11` | Forensic Chronological Event Reconstruction | Selecting Concrete Events | Demand-Side Sales [127], Interviewing Users [253] | High |
| `DOC-RULE-12` | End-to-End Workflow & Handoff Extraction | Workflow Reconstruction | Deploy Empathy [185], Story Mapping [447] | High |
| `DOC-RULE-13` | System Boundary & Exception Excavation | Exceptions & Failure Cases | Interviewing Users [270], Story Mapping [443] | High |
| `DOC-RULE-14` | Physical & Digital Artifact Inspection | Tools, Data & Artifacts | Deploy Empathy [223], Interviewing Users [287] | High |
| `DOC-RULE-15` | Compensating Workaround Investigation | Current Solutions & Workarounds | Competing Against Luck [37], Mom Test [679] | High |
| `DOC-RULE-16` | Organizational Topology & Stakeholder Map | People, Handoffs & Dependencies | Deploy Empathy [211], Founding Sales [758] | High |
| `DOC-RULE-17` | Four Forces Switching Diagnostic | Switching & Buying Behavior | Demand-Side Sales [103], Deploy Empathy [209] | High |
| `DOC-RULE-18` | Strict Epistemic Provenance Preservation | Evidence Quality | Continuous Discovery [528], Mom Test [705] | High |
| `DOC-RULE-19` | Active Uncertainty & Gap Tracking | Assumptions & Unknowns | Interviewing Users [256], Testing Business Ideas [366] | High |
| `DOC-RULE-20` | Dynamic Next-Action Control Loop | Synthesis Across Interviews | Talking to Humans [348], Testing Business Ideas [403] | High |
| `DOC-RULE-21` | Strategic Fit & Capability Filtering | Research Preparation | Deploy Empathy [239] + Custom Gap Analysis | High |
| `DOC-RULE-22` | Non-Normalized Process Discovery | Business & Role Context | Interviewing Users [301] + Custom Gap Analysis | High |
| `DOC-RULE-23` | Owner-Operator Dependency Mapping | People, Handoffs & Dependencies | Deploy Empathy [211] + Custom Gap Analysis | High |
| `DOC-RULE-24` | Pragmatic Non-Respondent Sampling | Interviewee Selection & Recruiting | Lean Customer Dev [467], Talking to Humans [328] | Medium |
| `DOC-RULE-25` | Asymmetric Technical Feasibility Verification | Experiment Selection | Testing Business Ideas [397] | High |
| `DOC-RULE-26` | Pre-Pitch Mode Lock & Snapshot Isolation | Evidence Quality | Founding Sales [774] | High |
| `DOC-RULE-27` | Explicit Mode-Switch Permission Protocol | Transition to Pilot / Sales | Founding Sales [773] | High |
| `DOC-RULE-28` | Post-Solution Contamination Filter | Evidence Quality | Founding Sales [774] | High |
| `DOC-RULE-29` | Continuous Direct Founder Exposure Filter | Synthesis Across Interviews | Talking to Humans [353] | High |
| `DOC-RULE-30` | Adversarial Pattern Attack Protocol | Synthesis Across Interviews | Lean Customer Dev [489], Interviewing Users [305] | High |

---

### Conclusion & Next Steps

This specification completes the operational methodology phase for the AI-assisted small-business discovery interviewer. All 30 rules provide exact, audit-ready directives for evaluating customer dialogue, reconstructing workflows, filtering evidence, and prioritizing commercial opportunities.

The next development phase will translate this methodology into concrete software artifacts:
1. System Prompts & Guardrail Linters
2. Dialogue State Machine Schemas
3. Knowledge Graph Database Ontologies (`EvidenceSpan` -> `Fact` -> `Opportunity` -> `Hypothesis`)
4. Asynchronous Voice Agent Execution Pipelines
