# Canonical Cross-Source Methodology Synthesis for AI-Assisted Business Discovery Harness

This document synthesizes the underlying methodology across 13 core texts on customer discovery, qualitative interviewing, Jobs To Be Done (JTBD), experimentation, early B2B sales, story mapping, and Lean Startup principles [1-798]. It establishes the canonical operational framework for an AI-assisted business-discovery interviewing harness targeted at solo founders discovering operational problems in small and owner-led businesses (SMBs).

---

## Section 1: Concept Extraction & Deduplication

### 1.1 Canonical Concept Repository

#### CONCEPT-01: Past Behavior over Future Intention (Behavioral Primacy)
* **Canonical Name:** Past Behavior over Future Intention
* **Definition:** The fundamental epistemic rule that historical actions, choices, and resource expenditures carry high evidentiary value, whereas predictions, promises, or hypothetical claims about future behavior carry near-zero validation weight [665-666, 333-335, 376-378, 472-473, 514-515, 562-563, 665-666, 735].
* **Purpose:** Prevents confirmation bias, aspirational self-reporting, and social desirability bias from corrupting discovery data [665-666, 514-515].
* **Supporting Sources:** *The Mom Test* [665-666], *Interviewing Users* [253-255], *Talking to Humans* [333-335], *Testing Business Ideas* [376-378], *Lean Customer Development* [472-473], *Continuous Discovery Habits* [514-515], *Competing Against Luck* [35-37].
* **Agreement & Nuances:** Universal agreement across all sources. Alvarez [472-473] and Fitzpatrick [665-666] frame this as an absolute evidence filter; Torres [514-515] operationalizes it as a story-triggering prompt; Bland & Osterwalder [376-378] formalize it as a tier on the Evidence Strength Ladder.
* **Confidence:** High (Universal consensus) [665-666].
* **Relevance to Harness:** Primary filter in the evidence-scoring engine. The AI interviewer must automatically detect future-tense declarations ("I would use...", "We will buy...") and trigger immediate redirection to past instances [666, 473].

#### CONCEPT-02: Specific Instances over Generic Claims (Anti-Fluff Discipline)
* **Canonical Name:** Specific Instances over Generic Claims
* **Definition:** The requirement to ground all research claims in concrete, time-bound, episodic memories rather than generalized self-descriptions, policies, or abstract summaries ("usually", "normally", "typically") [667-668, 183-185, 253-255, 335-336, 514-515, 607-608].
* **Purpose:** Eliminates "fluff" and retrospective rationalization, forcing the interviewee to reconstruct actual reality including exceptions, mistakes, and workarounds [667-668, 184, 254].
* **Supporting Sources:** *The Mom Test* [667-668], *Deploy Empathy* [183-185], *Interviewing Users* [253-255], *Talking to Humans* [335-336], *Continuous Discovery Habits* [514-515], *JTBD Playbook* [607-608].
* **Agreement & Nuances:** Universal agreement. Portigal [253-255] emphasizes asking for specific examples *before* asking for generalizations; Hansen [183-185] highlights how generalized descriptions hide manual workarounds and informal handoffs.
* **Confidence:** High (Universal consensus) [667-668].
* **Relevance to Harness:** Controls dialogue state transitions. When the interviewee uses generalizers ("we usually"), the AI must trigger an `ABSTRACT_TO_SPECIFIC` follow-up probe [185, 252].

#### CONCEPT-03: Workflow & Process Reconstruction
* **Canonical Name:** Sequential Workflow & Process Reconstruction
* **Definition:** Chronological, step-by-step forensic extraction of how a business activity is performed from trigger event to final outcome, capturing actors, tools, inputs, outputs, handoffs, and delays [677-678, 182-186, 257-258, 310, 447-449, 650-653].
* **Purpose:** Uncovers invisible labor, unstated dependencies, structural friction, and automation boundaries that interviewees fail to report as explicit complaints [188-189, 257, 301-302, 447].
* **Supporting Sources:** *The Mom Test* [677-678], *Deploy Empathy* [182-186], *Interviewing Users* [257-258, 310], *User Story Mapping* [447-449], *JTBD Playbook* [650-653], *Founding Sales* [762-763].
* **Agreement & Nuances:** High agreement. Portigal [257-258, 310] and Kalbach [650-653] supply explicit schema attributes (triggers, tools, handoffs, waits); Patton [447-449] extends this downstream to product backbone mapping. Hansen [182-183] emphasizes starting from the general process before pursuing pain.
* **Confidence:** High (Universal consensus) [677-678].
* **Relevance to Harness:** Forms the core data collection engine during operational discovery. Fills the `WorkflowInstance` schema [310, 659].

#### CONCEPT-04: Existing Workarounds as Pain Evidence
* **Canonical Name:** Existing Workarounds as Pain Evidence
* **Definition:** Treating ad hoc, improvised, or compensating behaviors—such as shadow spreadsheets, manual copy-pasting, custom WhatsApp groups, or extra hired labor—as primary evidence of an active, high-priority problem [679-680, 37-38, 196-198, 391-393, 464-466, 629-631, 754-755].
* **Purpose:** Differentiates low-value, passive complaints from active problems that customers are already expending scarce capital or effort to solve [679-680, 37, 465-466].
* **Supporting Sources:** *The Mom Test* [679-680], *Competing Against Luck* [37-38], *Deploy Empathy* [196-198], *Testing Business Ideas* [391-393], *Lean Customer Development* [464-466], *JTBD Playbook* [629-631], *Founding Sales* [754-755].
* **Agreement & Nuances:** High agreement. Christensen [37-38] notes workarounds prove the job exists even without a clean solution; Alvarez [464-466] uses workarounds to recruit "earlyvangelists"; Kalbach [629-631] warns that a workaround proves an unmet outcome but does not automatically prove SaaS purchase intent.
* **Confidence:** High (Universal consensus) [679-680].
* **Relevance to Harness:** Acts as a key heuristic in opportunity scoring and qualification. Workaround presence elevates problem severity confidence [631, 755].

#### CONCEPT-05: Non-Leading Question Discipline
* **Canonical Name:** Non-Leading Question Discipline
* **Definition:** Formulating open, neutral questions that omit the founder's hypotheses, desired answers, emotional adjectives, or solution concepts [670-671, 336-337, 670].
* **Purpose:** Prevents participant contamination, social agreement bias, and false positive validation [670, 337].
* **Supporting Sources:** *The Mom Test* [670-671], *Talking to Humans* [336-337], *Deploy Empathy* [219-220], *Interviewing Users* [268-270], *Continuous Discovery Habits* [512-514].
* **Agreement & Nuances:** Universal consensus across all discovery literature [670-671].
* **Confidence:** High [670].
* **Relevance to Harness:** A hard constraint on the AI prompt generator. Every generated question must undergo pre-emission screening for embedded assumptions or solution language [337, 671].

#### CONCEPT-06: Separation of Problem Discovery from Pitching
* **Canonical Name:** Separation of Problem Discovery from Pitching
* **Definition:** Maintaining a strict boundary between investigating customer reality and presenting or validating a solution concept [672-673, 180-181, 219-220, 280-281, 350-352, 672-673, 770-775].
* **Purpose:** Preserves the epistemic purity of discovery data; revealing a solution shifts the interviewee from candid reporting to evaluation, politeness, or sales defense [672, 280, 351, 771].
* **Supporting Sources:** *The Mom Test* [672-673], *Deploy Empathy* [180-181, 219-220], *Interviewing Users* [280-281], *Talking to Humans* [350-352], *Continuous Discovery Habits* [525-527], *Founding Sales* [770-775].
* **Agreement & Nuances:** High agreement. Fitzpatrick [672] forbids pitching during discovery; Kazanjy [770-775] provides an explicit transition protocol for moving from research mode to sales mode once discovery evidence is secured.
* **Confidence:** High [672].
* **Relevance to Harness:** Governs the conversational state machine (`PROBLEM_DISCOVERY` vs `SOLUTION_TEST` vs `SALES_DISCOVERY`) [740-741, 793-795].

#### CONCEPT-07: Compliments and Opinions as Bad Data
* **Canonical Name:** Compliments and Opinions as Bad Data
* **Definition:** Filtering out praise ("great idea", "sounds useful"), abstract opinions, and ungrounded feature requests as zero-value validation signals [674-676, 408-410, 483-485, 712].
* **Purpose:** Protects founders from false positives driven by customer politeness or low-commitment enthusiasm [674, 483, 712].
* **Supporting Sources:** *The Mom Test* [674-676], *Testing Business Ideas* [408-410], *Lean Customer Development* [483-485], *Founding Sales* [760-761].
* **Agreement & Nuances:** Universal agreement. Fitzpatrick [675-676] recommends deflecting praise back to past reality; Alvarez [484-485] classifies compliments as level `E0` (zero weight).
* **Confidence:** High [674].
* **Relevance to Harness:** Assigns zero weight to praise in the evidence engine and triggers conversational redirection prompts (`DEFLECT_PRAISE`) [676, 712].

#### CONCEPT-08: Fact and Observation vs. Interpretation Separation
* **Canonical Name:** Fact and Observation vs. Interpretation Separation
* **Definition:** Structurally isolating raw verbatim statements, timestamped recordings, and physical/digital observations from analyst or AI inferences, hypotheses, and conclusions [705-706, 298-299, 340-342, 527-529, 631-633, 733-734].
* **Purpose:** Prevents language models and researchers from silently turning tentative inferences into "discovered facts" or losing contact with original source evidence [528, 632, 734].
* **Supporting Sources:** *The Mom Test* [705-706], *Interviewing Users* [298-299], *Talking to Humans* [340-342], *Continuous Discovery Habits* [527-529], *JTBD Playbook* [631-633], *Testing Business Ideas* [415-416].
* **Agreement & Nuances:** Universal agreement. Torres [527-529] introduces an explicit `Factual Observation` layer between transcript and opportunity; Kalbach [631-633] requires raw quotes to remain attached to normalized job statements.
* **Confidence:** High [705].
* **Relevance to Harness:** Foundational data architecture requirement. The database schema must enforce distinct entities for `EvidenceSpan`, `Observation`, `Opportunity`, and `Inference` [529, 659, 733].

#### CONCEPT-09: Commitment and Advancement Signals
* **Canonical Name:** Commitment and Advancement Signals
* **Definition:** Evaluating customer interest exclusively through the surrender of scarce, non-refundable resources: time, confidential data, internal political capital/reputation, access to decision-makers, or money [687-692, 376-378, 380-382, 502-504, 764-768, 792-793].
* **Purpose:** Establishes objective commercial intent and separates politeness from genuine purchasing/adoption momentum [687, 769, 792].
* **Supporting Sources:** *The Mom Test* [687-692], *Testing Business Ideas* [376-378, 380-382], *Lean Customer Development* [502-504], *Founding Sales* [764-768, 792-793].
* **Agreement & Nuances:** Universal consensus. Kazanjy [764-768] and Fitzpatrick [687-689] align on advancement metrics (e.g., calendar invites with decision-makers, sharing internal files). Bland & Osterwalder [380-382] formalize this as financial commitment progression.
* **Confidence:** High [687].
* **Relevance to Harness:** Primary metric for opportunity progression and qualification scoring [769, 792].

#### CONCEPT-10: Research Questions vs. Participant Questions
* **Canonical Name:** Research Questions vs. Participant Questions Separation
* **Definition:** Maintaining a strict separation between high-level learning objectives (what the researcher needs to know) and conversational prompts (what is actually asked) [247-248, 317-320, 512-514, 700-701].
* **Purpose:** Prevents interviews from turning into rigid questionnaires or firing abstract business questions directly at participants [248, 513].
* **Supporting Sources:** *Interviewing Users* [247-248], *Talking to Humans* [317-320], *Continuous Discovery Habits* [512-514], *The Mom Test* [700-701].
* **Agreement & Nuances:** Universal agreement. Portigal [247] defines a three-tier hierarchy: Business Question -> Research Objective -> Participant Question; Torres [512-513] shows that one rich story prompt can answer four distinct research questions.
* **Confidence:** High [247].
* **Relevance to Harness:** Controls the question generation engine. The AI maps internal `ResearchObjectives` to conversational `StoryPrompts` dynamically [249, 514].

#### CONCEPT-11: Interview Guide as Coverage Map (Dynamic Branching)
* **Canonical Name:** Interview Guide as Coverage Map
* **Definition:** Treating the interview script as an opportunistic coverage graph of topics to explore rather than a linear questionnaire to execute [168-169, 249-250, 331-333, 701-702].
* **Purpose:** Allows the conversation to follow high-value, unexpected customer threads while maintaining complete research coverage over time [169, 250].
* **Supporting Sources:** *Deploy Empathy* [168-169], *Interviewing Users* [249-250], *Talking to Humans* [331-333], *The Mom Test* [701-702].
* **Agreement & Nuances:** High agreement. Hansen [168-169] and Portigal [249-250] both advocate adaptive topic selection based on preceding answers rather than script position `n+1`.
* **Confidence:** High [249].
* **Relevance to Harness:** Graph-based dialogue manager architecture [169, 251].

---

### 1.2 Concepts Unique to Specific Methodologies

* **Four Forces of Progress (Demand-Side Sales 101 / Moesta):** The switching model balancing Push of present situation + Pull of new solution against Habit of present + Anxiety of new solution [114-116]. Unique in its explicit structural representation of forces *against* change [114].
* **False Close / Reaching for the Door (Deploy Empathy / Hansen):** Triggering an apparent wrap-up ("Is there anything important I haven't asked?") at the 60-70% mark of an interview to unlock unprompted candor while time remains [216-218]. Unique conversational move.
* **Rubber Duck Posture & Validate-and-Wait (Deploy Empathy / Hansen):** Systematically suppressing interviewer authority/ego, using neutral validating statements ("That makes sense"), and enforcing deliberate active silence to induce spontaneous elaboration [172-175, 180-181].
* **Opportunity Solution Tree (OST) (Continuous Discovery Habits / Torres):** Graph structure linking Desired Business Outcome -> Customer Opportunities (needs/pains/desires) -> Solution Ideas -> Assumption Tests [529-531, 583-584].
* **Walking Skeleton & Horizontal Release Slicing (User Story Mapping / Patton):** Slicing releases horizontally across the entire user backbone to create a complete, thinnest end-to-end user experience, rather than building isolated deep features [436-441].
* **Desirability / Feasibility / Viability Assumption Mapping (Testing Business Ideas / Bland & Osterwalder):** Categorizing business model assumptions across three explicit risk axes and plotting them on an Importance vs. Evidence matrix [363-368].
* **Six Conversational Modes & Pre/Post-Pitch Tagging (Founding Sales / Kazanjy):** Explicitly tracking sales state transitions (Research, Problem Discovery, Sales Discovery, Qualification, Pilot Discussion, Selling) and freezing pre-pitch evidence before revealing a product [740-741, 774-775].
* **Job Map & Outcome Criteria Syntax (JTBD Playbook / Kalbach):** Mapping universal execution steps (Define, Locate, Prepare, Confirm, Execute, Monitor, Modify, Conclude) and structuring outcomes as `[Direction] + [Metric] + [Object]` [599-602, 611-612].

---

### 1.3 Apparent Contradictions & Tensions

1. **Allowing Productive Tangents (Hansen/Portigal) vs. Strict Learning Goal Discipline (Constable/Ries):**
   * *Tension:* Hansen [170-171] and Portigal [249-250] encourage allowing participants to wander into unexpected tangents. Constable [317-320] and Ries [60-61] demand strict focus on reducing predefined uncertainties.
   * *Resolution:* The harness treats tangents as high-value when they reveal new operational workarounds, handoffs, or unpredicted constraints (`Relevance x Novelty x Evidence Potential`), but redirects back to the primary learning goal when information gain drops [171, 320].
2. **Customer Outcome-Driven Scope (Torres) vs. Predefined Research Context (Hansen):**
   * *Tension:* Torres [541-542] anchors discovery to a single desired business outcome. Hansen [239-241] emphasizes that actionability depends on the founder's strategic capabilities and scope boundaries.
   * *Resolution:* In solo-founder reconnaissance, broad operational discovery is used initially to map problem spaces, after which the harness locks a specific strategic context to prune irrelevant opportunities [240, 580].
3. **Asking Willingness-to-Pay (Forbidden in Discovery) vs. Early Price Testing (Founding Sales / Bland):**
   * *Tension:* Fitzpatrick [686] and Hansen [220-221] forbid asking hypothetical pricing questions during interviews. Kazanjy [778-780] and Bland & Osterwalder [380-382] insist on introducing real prices early to test commercial viability.
   * *Resolution:* Disallow direct price questions in `PROBLEM_DISCOVERY` mode. Introduce pricing only during `SALES_DISCOVERY` or `EXPERIMENT` mode, where price is presented as a concrete commitment threshold (deposit, paid pilot, or pre-order) [381, 778, 794].
4. **Qualitative Depth vs. Statistical Prevalence:**
   * *Tension:* Founders often mistake 5-10 deep qualitative interviews for statistical proof of market size.
   * *Resolution:* Qualitative interviews validate *causal mechanisms*, workflows, and friction existence [17-19, 728]. Quantitative prevalence requires external datasets, surveys, or behavioral conversion experiments [728].

---

### 1.4 Concepts Overlapping But Distinct

* **Job (Christensen/Kalbach) vs. Opportunity/Pain (Torres) vs. User Task (Patton):**
  * *Job:* Solution-independent progress someone is trying to make in a circumstance [3, 587].
  * *Opportunity:* Customer need, pain point, or desire that creates friction in making progress [522-523].
  * *User Task:* Concrete action performed by a user within a product or workflow to execute a step [426-427].
* **Problem Discovery (Fitzpatrick/Hansen) vs. Sales Discovery (Kazanjy):**
  * *Problem Discovery:* Uncovering customer reality, workflows, and friction without pitching [672, 740].
  * *Sales Discovery:* Evaluating whether a specific product/solution fits a qualified prospect's buying criteria [740-741].
* **Process Map (Patton/Portigal) vs. Job Map (Kalbach):**
  * *Process Map:* Observed, current implementation steps (e.g., "print PDF, stamp, scan") [301, 613].
  * *Job Map:* Universal, solution-independent execution steps required to achieve the goal [611-613].
* **Feature Request (Alvarez/Fitzpatrick) vs. Desired Outcome (Kalbach/Torres):**
  * *Feature Request:* Customer-suggested solution implementation ("add Excel export") [476, 684].
  * *Desired Outcome:* Measurable dimension of progress ("minimize time required to compare supplier prices") [596-599, 477].

---

## Section 2: Reorganization by Harness Function

```
 ┌─────────────────────────────────────────────────────────────────────────┐
 │                       AI DISCOVERY HARNESS ARCHITECTURE                 │
 └─────────────────────────────────────────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 1. RESEARCH PREPARATION                                                 │
 │    Assumptions [360, 455] → Hypotheses [371, 459] → Coverage Map [249]   │
 └────────────────────────────────────┬────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 2. INTERVIEWEE SELECTION & RECRUITING                                   │
 │    Behavioral Segment [461] → Problem-Aware Sampling [464] → Access [325]│
 └────────────────────────────────────┬────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 3. DIALOGUE CONTROL ENGINE (OPENING, RAPPORT & CRAFT)                   │
 │    Non-judgment [158] · Gentle Tone [164] · Rubber Duck / Silence [172]│
 └────────────────────────────────────┬────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 4. EPISODIC & WORKFLOW RECONSTRUCTION ENGINE                            │
 │    Recent Events [253] → Sequence [185] → Workflow [257] → Artifacts [287]│
 └────────────────────────────────────┬────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 5. EVIDENCE EXTRACTION & EVALUATION ENGINE                              │
 │    Fact/Inference Split [298] → Evidence Ladder [376] → Friction [188]   │
 └────────────────────────────────────┬────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 6. SWITCHING, QUALIFICATION & MODE TRANSITION                           │
 │    Four Forces [114] → Qualification [751] → Mode Switch Protocol [770]│
 └────────────────────────────────────┬────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 7. SYNTHESIS, OPPORTUNITY & EXPERIMENT ENGINE                           │
 │    OST [529] → Job Map [611] → Riskiest Assumption [368] → Test [382]  │
 └────────────────────────────────────┬────────────────────────────────────┘
                                      │
 ┌────────────────────────────────────┴────────────────────────────────────┐
 │ 8. DOWNSTREAM PRODUCT SPECIFICATION                                     │
 │    Backbone [427] → Walking Skeleton [439] → Horizontal Slices [436]   │
 └─────────────────────────────────────────────────────────────────────────┘
```

### 1. Research Preparation
* **Explicit Assumption Mapping:** Inventorying desirability, feasibility, and viability assumptions prior to research [360-363, 455-458].
* **Narrow Problem Hypotheses:** Formulating falsifiable `[Actor] + [Problem] + [Context]` propositions [371-373, 459-461].
* **Research Objectives vs. Questions:** Deriving conversational prompts from core learning objectives [247-248, 317-320, 512-514].
* **Script as Coverage Graph:** Organizing interview topics as dynamic nodes with priority scores [168-169, 249-250].

### 2. Interviewee Selection and Recruiting
* **Behavioral Segmentation:** Defining target profiles by operating conditions and behavioral predicates rather than firmographics [20-22, 461-464].
* **Problem-Aware Sampling:** Prioritizing earlyvangelists who already recognize pain and have attempted workarounds [464-467].
* **Pragmatic Access Channels:** Finding candidates through network adjacencies and industry congregating points [325-328].
* **Recruitment Friction Diagnostics:** Treating low recruiting conversion as an early signal of low problem salience or missegmentation [467-470].

### 3. Interview Opening and Rapport
* **Non-Judgmental Posture:** Building a map of the participant's world assuming their actions make sense [158-160].
* **Spotlight on Participant (Rubber Duck):** Eliminating interviewer self-disclosure, advice, and ego [160-161, 180-181].
* **Low-Evaluation Tone & Simple Language:** Using unthreatening, non-corporate vocabulary and gentle intonation [164-167, 276-278].
* **Praise Suppression:** Replacing enthusiastic agreement ("Great!", "Awesome!") with neutral acknowledgments [276-278, 675-676].

### 4. Business and Role Context
* **Organizational Topology:** Mapping company size, operational structure, revenue model, and industry constraints [158, 211, 743-744].
* **Account Fit vs. Contact Fit:** Disentangling company qualification from individual interviewee authority [743-744].
* **Strategic Discovery Context:** Setting scope boundaries based on founder capabilities while keeping discovery open-ended [239-241].

### 5. Selecting Concrete Recent Events
* **Episodic Anchoring:** Steering away from general policy toward specific recent occurrences ("Tell me about the last time...") [183-185, 253-255, 333-335, 514-515, 665-668].
* **Generalizer Interception:** Interrupting "usually", "normally", or "typically" to pull the interviewee back to the instance [185, 518-520, 667].
* **Typicality Verification:** Assessing whether a reconstructed episode represents normal operation or an extreme outlier [253-254, 302].

### 6. Story Reconstruction
* **Temporal Excavation:** Progressing sequentially through an event using temporal prompts ("What happened first? Then what?") [185-186, 257-258, 516-518, 696-697].
* **Contextual Scene Anchoring:** Reconstructing physical location, time of day, devices, and people present to unlock accurate memory [130-131, 265-266].
* **Letting Stories Finish:** Avoiding premature interruption while information gain remains positive [297-298].

### 7. Workflow Reconstruction
* **Process Step Mapping:** Capturing chronological actions, triggers, inputs, outputs, and completion criteria [182-183, 257-258, 310, 611-612].
* **Formal vs. Actual Process Differentiation:** Isolating official company policy from real informal execution [301-302].
* **Process Existence Probing:** Investigating *why* a step exists before evaluating whether it can be automated [186-187].

### 8. Pain and Friction Discovery
* **Implicit Friction Detection:** Identifying manual copying, waiting, chasing, checking, and re-entry without demanding explicit complaints [188-189, 310].
* **Emotion as Probe Trigger:** Using emotional words ("nightmare", "horrible") as triggers to locate events, not as proof of commercial pain [201-204, 265-266].
* **Obstacle vs. Job Disentanglement:** Separating execution complaints from underlying progress [637-639].

### 9. Current Solutions and Workarounds
* **Workaround Investigation:** Examining shadow tools, spreadsheets, and improvised fixes [37-38, 196-198, 629-631, 679-680].
* **Absence of Effort Analysis:** Probing why persistent pain has not generated attempted fixes [680-682].
* **Previous Failure Analysis:** Uncovering historical solution attempts and why they were abandoned [196-197, 682-683].

### 10. Frequency, Severity, and Economic Impact
* **Pain x Frequency Burden:** Multiplying single-event severity by recurring frequency [190-191, 478-480].
* **Labor Time as Expenditure:** Quantifying labor hours consumed as existing economic cost [191-193, 753-754].
* **Quantifier Probe:** Translating vague adjectives ("often", "expensive", "slow") into concrete numbers [259-260, 479-480, 693-694].

### 11. People, Handoffs, and Dependencies
* **Actor Mapping:** Identifying users, choosers, approvers, payers, and blockers [211-213, 261-262, 593-594, 758-760].
* **Handoff Analysis:** Examining information transfers between roles and departments where data loss occurs [211, 261, 310].
* **Tacit Knowledge Extraction:** Using teaching prompts ("How would you explain this to a new employee?") to reveal unwritten rules [275-276].

### 12. Tools, Data, and Artifacts
* **Artifact-Anchored Probing:** Using physical files, spreadsheets, forms, and screens as anchors for workflow inquiry [223-224, 285-289, 338-340].
* **Artifact Registry:** Tracking artifact creator, fields, sources, consumers, and transitions [288-289].
* **Said vs. Visible Process Reconciliation:** Spotting discrepancies between claimed digital workflows and physical/informal artifacts [286, 339].

### 13. Exceptions and Failure Cases
* **Exception Probing:** Asking "When is it different?" or "When do you skip that step?" to discover hidden business logic [270-271, 302].
* **Failure & Recovery Mapping:** Documenting what goes wrong, consequences, and manual recovery steps [310, 443-444].

### 14. Jobs To Be Done / Progress / Circumstances
* **Progress Framing:** Defining jobs as intended accomplishment independent of technology [2-5, 587-593].
* **Circumstance Contextualization:** Defining demand by triggering situations rather than customer demographics [6-8, 605-607].
* **Job Syntax Standardization:** Normalizing job statements into `[Verb] + [Object] + [Context]` [594-596].
* **Job Hierarchy Construction:** Mapping higher-level goals, focal jobs, and sub-jobs [617-620].
* **Functional, Social, and Emotional Dimensions:** Capturing all three aspects of desired progress [25-28, 199-201, 602-605].

### 15. Switching and Buying Behavior
* **Four Forces Balancing:** Reconstructing Push + Pull vs. Anxiety + Habit [114-116].
* **Struggling Moment Identification:** Locating the concrete episode that activated active search [100-103].
* **Buying Journey Timeline:** Forensic reconstruction across First Thought -> Passive Looking -> Active Looking -> Deciding -> Consuming [116-127, 127-130].
* **True Alternatives Identification:** Discovering non-software competitors (paper, Excel, status quo, hiring) [15-17, 134-136, 623-626].
* **"Why Now?" Trigger Analysis:** Isolating the recent environmental change that made status quo unacceptable [39-40, 137-139].

### 16. Evidence Quality
* **Evidence Ladder Scoring:** Weighting evidence from Opinion (E0) to Transaction/Commitment (E5) [376-378, 484-485, 502-504, 708-709, 792-793].
* **Commitment Tracking:** Verifying surrender of time, data, reputation, access, or money [687-692, 764-768].
* **Coreference Resolution & Ambiguity Probe:** Clarifying vague pronouns ("it", "they", "the system") [267-268].

### 17. Opportunity Extraction
* **Story-to-Opportunity Extraction:** Deriving needs, pains, and desires directly from concrete story passages [522-527].
* **Customer Framing Test:** Phrasing opportunities in native customer language, excluding solution or business metric language [524-525].
* **Feature Request Abstraction:** Translating requested solution features upward into underlying progress needs [476-478, 639-641, 684-685].

### 18. Opportunity Decomposition
* **Opportunity Space Mapping (OST):** Structuring opportunities into parent-child and sibling hierarchies [529-531].
* **Journey-Based Branching:** Structuring top-level tree branches around key journey moments [531-532].
* **Linting Malformed Trees:** Detecting vertical chains, multi-parent nodes, and embedded solutions [536-538].
* **Row-by-Row Compare & Contrast:** Prioritizing sibling opportunities at the same abstraction level [544-546].

### 19. Assumptions and Unknowns
* **Solution Assumption Decomposition:** Decomposing solutions into Desirability, Feasibility, Viability, Usability, and Ethical assumptions [363-365, 554-556].
* **Imagined User Journey / Premortem:** Mapping step-by-step usage of a hypothetical product to surface hidden assumptions [556-557].
* **Importance vs. Evidence Mapping:** Prioritizing critical assumptions with little existing evidence [366-368, 559-561].

### 20. Experiment Selection
* **Matching Test to Uncertainty:** Matching experiment type (interview, landing page, fake door, prototype, concierge, pre-sale, pilot, spike) to the specific assumption [382-384].
* **Cheapest Meaningful Signal:** Selecting for maximum uncertainty reduction per unit of time/money [384-385, 564-565].
* **Falsifiable Hypotheses:** Defining explicit metrics, success thresholds, populations, and timeframes prior to execution [371-374, 410-412].

### 21. Commercial Signals and Qualification
* **Account vs. Contact Qualification:** Evaluating company operational fit separately from individual authority [743-744].
* **Commercial Buying Signals:** Spotting implementation questions, price inquiries, data sharing, and calendar movement [764-768].
* **Champion & Authority Identification:** Locating internal advocates and economic decision-makers [758-760].
* **Tech Curiosity Disqualification:** Filtering out conversations driven by AI fascination without business pain [760-761].

### 22. Transition from Research to Pilot or Sales
* **Mode Switch Permission Protocol:** Completing pre-pitch discovery, verifying qualification thresholds, and securing explicit permission before revealing solutions [770-774, 793-795].
* **Pre/Post-Pitch Evidence Partitioning:** Tagging evidence recorded after solution exposure as `POST_PITCH` [774-775, 794].
* **Bounded Pilot Design:** Defining explicit commercial hypotheses, operational success criteria, and customer contribution for pilots [775-778].

### 23. Synthesis Across Interviews
* **Two-Stage Synthesis:** Synthesizing within-interview snapshots before performing cross-interview aggregation [567-569].
* **Adversarial Pattern Testing:** Actively seeking counterexamples to challenge emerging patterns [488-490].
* **Saturation Heuristics:** Identifying when marginal information gain drops and surprise disappears [491-493].
* **Evidence Provenance Preservation:** Maintaining bidirectional links from synthesized opportunities back to exact transcript spans [572-573].

### 24. Downstream Product Specification
* **User Activity & Task Backbone:** Structuring product capability around user activities and tasks [423-430].
* **Walking Skeleton Definition:** Defining the thinnest end-to-end implementation supporting the entire backbone [439-441].
* **Horizontal Release Slicing:** Cutting release bands across all backbone activities rather than building deep isolated features [436-439, 441-442].

---

## Section 3: Knowledge Typology Classification

| Canonical Concept | Knowledge Type(s) |
| :--- | :--- |
| **Past Behavior over Future Intention** | Principle, Evidence Rule |
| **Specific Instances over Generic Claims** | Interviewer Behavior, Question Pattern, Follow-up Heuristic |
| **Sequential Workflow Reconstruction** | Question Pattern, Follow-up Heuristic, Interpretation Rule |
| **Existing Workarounds as Pain Evidence** | Evidence Rule, Interpretation Rule, Opportunity Rule |
| **Non-Leading Question Discipline** | Interviewer Behavior, Question Pattern |
| **Separation of Discovery from Pitching** | Principle, Interviewer Behavior, Anti-pattern |
| **Compliments & Opinions as Bad Data** | Evidence Rule, Interpretation Rule |
| **Fact vs. Interpretation Separation** | Principle, Synthesis Rule |
| **Commitment & Advancement Signals** | Evidence Rule, Buying Signal |
| **Research vs. Participant Questions** | Principle, Interviewer Behavior |
| **Script as Coverage Graph** | Interviewer Behavior, Follow-up Heuristic |
| **Four Forces of Progress (Push/Pull/Anxiety/Habit)** | Interpretation Rule, Adoption Barrier, Opportunity Rule |
| **Struggling Moment Identification** | Question Pattern, Evidence Rule |
| **Timeline Interviewing** | Interviewer Behavior, Question Pattern |
| **True Alternatives Identification** | Interpretation Rule, Opportunity Rule |
| **False Close / Reaching for the Door** | Interviewer Behavior, Question Pattern |
| **Rubber Duck / Active Silence** | Interviewer Behavior, Follow-up Heuristic |
| **Non-Judgmental World Mapping** | Principle, Interviewer Behavior |
| **Process existence probing** | Question Pattern, Follow-up Heuristic |
| **Actor Mapping (User/Chooser/Payer)** | Interpretation Rule, Qualification Rule |
| **Artifact Registry & Observation** | Interviewer Behavior, Evidence Rule |
| **Unresolved Entity / Causal Stack** | Follow-up Heuristic |
| **Native Terminology Preservation** | Interviewer Behavior, Synthesis Rule |
| **Job Syntax Standardization** | Interpretation Rule, Synthesis Rule |
| **Job vs. Outcome Separation** | Principle, Interpretation Rule |
| **Job Hierarchy & Step Mapping** | Interpretation Rule, Opportunity Rule |
| **Problem-Aware Sampling** | Principle, Recruiting Rule |
| **Recruitment Difficulty as Market Signal** | Evidence Rule, Interpretation Rule |
| **Explicit Constraint Modeling** | Interpretation Rule, Adoption Barrier |
| **Opportunity Solution Tree (OST)** | Opportunity Rule, Synthesis Rule |
| **Customer Perspective Framing** | Opportunity Rule, Synthesis Rule |
| **Row-by-Row Compare & Contrast** | Opportunity Rule, Synthesis Rule |
| **Solution Assumption Decomposition** | Interpretation Rule, Experiment Rule |
| **Importance vs. Evidence Mapping** | Experiment Rule, Decision Rule |
| **Cheapest Meaningful Signal** | Experiment Rule |
| **Account vs. Contact Qualification** | Qualification Rule, Buying Signal |
| **Tech Curiosity Disqualification** | Qualification Rule, Anti-pattern |
| **Mode Switch Permission Protocol** | Interviewer Behavior, Sales Rule |
| **Pre/Post-Pitch Evidence Partitioning** | Evidence Rule, Synthesis Rule |
| **Two-Stage Synthesis Pass** | Synthesis Rule |
| **Adversarial Pattern Testing** | Synthesis Rule, Interpretation Rule |
| **User Activity & Task Backbone** | Downstream Product Rule |
| **Walking Skeleton** | Downstream Product Rule |
| **Horizontal Release Slicing** | Downstream Product Rule |

---

## Section 4: Redundancy, Disagreement, and Operationalization Analysis

### 4.1 Highly Redundant Concepts across Corpus
1. **Behavioral Primacy (Past vs. Future):** Repeated in all 13 texts [35, 333, 376, 472, 514, 665]. *Canonical Choice:* Adopt Fitzpatrick [665-666] for dialogue filtration and Bland & Osterwalder [376-378] for formal evidence laddering.
2. **Anti-Pitching Constraint:** Repeated in 8 texts [180, 219, 280, 350, 525, 672, 770]. *Canonical Choice:* Adopt Kazanjy's [770-775] operational mode-switching state machine.
3. **Feature Requests -> Underlying Needs:** Repeated in 6 texts [476, 525, 639, 684]. *Canonical Choice:* Adopt Kalbach [639-641] and Torres [525-527] for mapping requested features to underlying desired outcomes.

### 4.2 Superior Operationalizations
* **Interview Dialogue Craft:** Hansen (*Deploy Empathy*) [164-180] and Portigal (*Interviewing Users*) [249-270] provide drastically superior conversational mechanics compared to Fitzpatrick [663-690]. Hansen provides explicit dialogue moves (`VALIDATE_AND_WAIT`, `MIRROR_KEYWORD`, `FALSE_CLOSE`) [173, 177, 217]; Portigal provides probe toolkits and coreference stacks [256, 302].
* **Opportunity Mapping & Synthesis:** Torres (*Continuous Discovery Habits*) [529-575] completely supersedes generic Lean Startup "hypothesis" language [68-70] by offering the Opportunity Solution Tree structure and two-stage synthesis [529, 567].
* **Switching & Buying Mechanics:** Moesta (*Demand-Side Sales 101*) [114-130] and Kazanjy (*Founding Sales*) [740-798] drastically supersede general customer discovery books regarding commercial movement, four forces [114], qualification [751], and buying timelines [127].
* **Experiment Design:** Bland & Osterwalder (*Testing Business Ideas*) [359-421] completely supersedes Ries's abstract "MVP" concept [65-67] by supplying an explicit 20+ experiment repertoire matched to specific assumption types [382-398].
* **Product Specification:** Patton (*User Story Mapping*) [422-454] supersedes flat feature backlogs by providing the walking skeleton and horizontal release slicing [436, 439].

### 4.3 Concepts to Discard or Demote
* **Generic "MVP" Umbrella Term (Ries / Blank):** Discard as a vague operational instruction [65-67]. Replace with Bland's specific experiment types (Concierge, Pre-sale, Fake Door, Spike) [385-398] and Patton's Walking Skeleton [439-441].
* **Direct Willingness-to-Pay Questions:** Discard direct WTP questions during discovery as invalid data [220, 686]. Replace with historical expenditure analysis [191, 686] and Bland's financial commitment ladder [380-382].
* **Opaque Arithmetic Opportunity Scoring (RICE / Fake Math):** Discard formulas that generate arbitrary numerical scores (e.g., `Risk = 8.42`) [368, 547]. Replace with qualitative interval judgments and gap identification [368, 547-548].

### 4.4 Resolving Disagreements and Tensions
* **Tangents vs. Learning Goals:** Resolved by scoring tangents dynamically (`Relevance x Novelty x Evidence Potential`). High-scoring tangents are pursued; low-scoring tangents are gracefully truncated [171, 320].
* **Broad Discovery vs. Outcome Scope:** Resolved by running broad operational discovery during early SMB reconnaissance, then locking an Opportunity Solution Tree around a specific target domain once acute pain is validated [240, 580].
* **Research vs. Sales Mode:** Resolved by Kazanjy's pre/post-pitch partitioning. Pre-pitch evidence remains pure discovery data; post-pitch evidence is tagged as sales reaction data [774-775, 794].

### 4.5 Abstract Concepts Converted to Operational Mechanics
* *Validated Learning* [58-61] -> **Evidence Ledger** tracking prior confidence, observed behavior, source, and updated belief [81-83].
* *Build-Measure-Learn* [62-64] -> **Hypothesis-Experiment-Decision Loop** [65, 413-414].
* *Innovation Accounting* [81-83] -> **Multi-dimensional Evidence Ladder** (E0 to E5) with commitment tracking [376-378, 484, 708-709].

---

## Section 5: Missing Methodology & Gaps Analysis

Based *strictly* on the supplied source corpus [1-798], the following gaps exist for an AI-assisted discovery harness used by a solo technical founder interviewing SMB owners:

1. **AI Interviewer Execution & Dialogue Mechanics:**
   * *Gap:* The sources assume human-to-human interviewing. They lack specs for AI turn-taking, latency thresholds, voice interruption handling, or prompt-safety guardrails during live interviews.
2. **Technical & AI/Agentic Suitability Evaluation:**
   * *Gap:* Sources evaluate general "feasibility" [364], but provide no criteria to determine whether a manual SMB workflow requires deterministic software, SaaS, process improvement, LLM/AI assistance, or autonomous agents (e.g., assessing data structuredness, API availability, error-tolerance, or non-deterministic reasoning needs).
3. **Data Security, Privacy, & Regulatory Constraints for AI:**
   * *Gap:* SMB owners fear client confidentiality breaches, AI data leakage, or compliance violations (GDPR, DATEV). Traditional literature covers general organizational risk [108] but lacks AI-specific security qualification protocols.
4. **Asynchronous & Multimodal Workflow Capture:**
   * *Gap:* SMB workflows rely on physical paper, handwritten notes, legacy desktop GUIs, WhatsApp voice notes, and mobile photos. Sources cover basic screensharing [223] or physical observation [285], but lack protocols for asynchronous, multi-modal artifact extraction.
5. **Solo-Founder Resource Allocation & Build vs. Research Thresholds:**
   * *Gap:* Literature assumes product trios [578] or human sales teams [790]. A solo founder handling research, code, sales, and support lacks explicit decision rules for balancing interview hours against development time.
6. **Shadow AI / Informal Workaround Detection:**
   * *Gap:* SMB employees increasingly use unapproved personal AI tools (ChatGPT, Claude) alongside official software. Traditional workaround frameworks [37, 629] do not explicitly probe for shadow AI adoption.

---

## Section 6: Canonical Concept Inventory

| ID | Canonical Name | Functional Category | One-Sentence Rule | Sources | Confidence | Importance |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **PREP-01** | Assumption Inventory | Research preparation | Unwritten business beliefs must be externalized into explicit assumptions before conducting research [360, 455]. | Bland [360], Alvarez [455] | High | Critical |
| **PREP-02** | Problem Hypothesis | Research preparation | Express target uncertainties as testable `[Actor] + [Problem] + [Context]` propositions [371, 459]. | Bland [371], Alvarez [459] | High | Critical |
| **PREP-03** | Coverage Map | Research preparation | Treat the interview guide as a dynamic topic graph rather than a linear questionnaire [168, 249]. | Hansen [168], Portigal [249] | High | Important |
| **RECR-01** | Behavioral Segment | Selection & recruiting | Define target interviewees by operating circumstances and behaviors rather than firmographics [20, 461]. | Christensen [20], Alvarez [461] | High | Critical |
| **RECR-02** | Earlyvangelist Focus | Selection & recruiting | Prioritize recruiting customers who recognize their problem and have already attempted workarounds [464]. | Alvarez [464], Blank | High | Important |
| **RECR-03** | Access Channel Mapping | Selection & recruiting | Map pragmatic access channels directly from target customer congregating points [325, 468]. | Constable [325], Alvarez [468] | High | Supporting |
| **DIAL-01** | Non-Judgment Posture | Opening & rapport | Assume observed customer behavior makes sense within their incentives and constraints [158]. | Hansen [158] | High | Critical |
| **DIAL-02** | Rubber Duck Posture | Opening & rapport | Suppress interviewer ego, expertise, solution advice, and personal stories during discovery [160, 180]. | Hansen [160, 180] | High | Critical |
| **DIAL-03** | Gentle & Simple Wording | Opening & rapport | Use uncomplicated, non-corporate vocabulary and a gentle intonation to reduce defensiveness [164, 166]. | Hansen [164, 166] | High | Important |
| **DIAL-04** | Praise Suppression | Opening & rapport | Replace enthusiastic agreement ("Great!") with low-evaluation neutral acknowledgments [276, 675]. | Portigal [276], Fitzpatrick [675] | High | Important |
| **CONTEXT-01** | Account vs. Contact Fit | Business & role context | Evaluate company operational fit separately from individual contact authority [743]. | Kazanjy [743] | High | Critical |
| **CONTEXT-02** | Strategic Scope Filter | Business & role context | Filter thread prioritization through founder capabilities and strategy without manipulating answers [239]. | Hansen [239] | High | Important |
| **EPISODE-01** | Episodic Anchoring | Selecting recent events | Ground research claims in concrete recent occurrences ("Tell me about the last time...") [183, 253, 665]. | Fitzpatrick [665], Hansen [183], Portigal [253] | High | Critical |
| **EPISODE-02** | Generalizer Interception | Selecting recent events | Interrupt generalizers ("usually", "normally") to pull the interviewee back to the specific incident [185, 518]. | Hansen [185], Torres [518] | High | Critical |
| **EPISODE-03** | Typicality Check | Selecting recent events | Verify whether a reconstructed incident represents standard operation or an extreme outlier [253, 302]. | Portigal [253, 302] | High | Supporting |
| **STORY-01** | Temporal Excavation | Story reconstruction | Reconstruct incidents chronologically using temporal prompts ("What happened first? Then what?") [185, 257, 516]. | Hansen [185], Portigal [257], Torres [516] | High | Critical |
| **STORY-02** | Contextual Scene Anchoring | Story reconstruction | Anchor memory by asking for physical location, time, devices, and people present [130, 265]. | Moesta [130], Portigal [265] | High | Important |
| **WORK-01** | Workflow Step Extraction | Workflow reconstruction | Extract chronological workflow steps, triggers, inputs, outputs, and completion criteria [182, 257, 310, 611]. | Hansen [182], Portigal [257], Kalbach [611] | High | Critical |
| **WORK-02** | Formal vs. Actual Process | Workflow reconstruction | Disentangle official company policy from real informal execution [301]. | Portigal [301] | High | Critical |
| **WORK-03** | Process Existence Probing | Workflow reconstruction | Investigate why a process step exists before deciding it should be automated [186]. | Hansen [186] | High | Important |
| **PAIN-01** | Implicit Friction Detection | Pain & friction discovery | Spot manual copying, waiting, checking, and re-entry without demanding explicit complaints [188, 310]. | Hansen [188], Portigal [310] | High | Critical |
| **PAIN-02** | Emotion Probe Trigger | Pain & friction discovery | Use emotional words as triggers to locate events, not as proof of commercial value [201, 265]. | Hansen [201], Portigal [265] | High | Important |
| **SOLN-01** | Workarounds as Evidence | Solutions & workarounds | Treat shadow spreadsheets, manual fixes, and improvised tools as primary evidence of active pain [37, 196, 629, 679]. | Fitzpatrick [679], Christensen [37], Kalbach [629] | High | Critical |
| **SOLN-02** | Effort Absence Analysis | Solutions & workarounds | Investigate why persistent claimed pain has not generated any attempted solution [680]. | Fitzpatrick [680] | High | Critical |
| **SOLN-03** | Previous Failure Analysis | Solutions & workarounds | Examine past solution attempts to discover switching barriers and hidden requirements [196, 682]. | Hansen [196], Fitzpatrick [682] | High | Important |
| **METRIC-01** | Pain x Frequency Burden | Frequency & economic impact | Evaluate operational friction by multiplying single-event severity by recurring frequency [190, 478]. | Hansen [190], Alvarez [478] | High | Critical |
| **METRIC-02** | Labor Time Expenditure | Frequency & economic impact | Measure labor hours consumed as concrete existing economic cost [191, 753]. | Hansen [191], Kazanjy [753] | High | Critical |
| **METRIC-03** | Quantifier Resolution | Frequency & economic impact | Translate vague adjectives ("often", "expensive") into concrete quantities and frequencies [259, 479, 693]. | Portigal [259], Fitzpatrick [693], Alvarez [479] | High | Critical |
| **PEOPLE-01** | Actor Role Mapping | Handoffs & dependencies | Distinguish users, choosers, approvers, payers, and blockers [211, 593, 758]. | Hansen [211], Kalbach [593], Kazanjy [758] | High | Critical |
| **PEOPLE-02** | Handoff Failure Analysis | Handoffs & dependencies | Probe information transfers between roles where data loss or delay occurs [211, 261, 310]. | Hansen [211], Portigal [261, 310] | High | Critical |
| **PEOPLE-03** | Teaching Prompts | Handoffs & dependencies | Ask interviewees how they would teach a newcomer to surface tacit knowledge [275]. | Portigal [275] | High | Supporting |
| **TOOL-01** | Artifact-Anchored Probing | Tools & data artifacts | Use screens, forms, spreadsheets, and physical paper as anchors for workflow discovery [223, 285, 338]. | Hansen [223], Portigal [285], Constable [338] | High | Critical |
| **TOOL-02** | Artifact Registry | Tools & data artifacts | Track artifact creator, inputs, outputs, consumers, transitions, and storage [288]. | Portigal [288] | High | Important |
| **EXCEPT-01** | Exception Probing | Failure cases | Ask "When is it different?" or "When do you skip that step?" to reveal hidden rules [270, 302]. | Portigal [270, 302] | High | Critical |
| **EXCEPT-02** | Recovery Mapping | Failure cases | Document failure modes, operational consequences, and manual recovery steps [310, 443]. | Portigal [310], Patton [443] | High | Important |
| **JTBD-01** | Progress Definition | JTBD & circumstances | Express jobs as intended progress independent of current technology [2, 587]. | Christensen [2], Kalbach [587] | High | Critical |
| **JTBD-02** | Circumstance Primacy | JTBD & circumstances | Segment demand by triggering situation rather than customer demographics [6, 605]. | Christensen [6], Kalbach [605] | High | Critical |
| **JTBD-03** | Job Syntax Rule | JTBD & circumstances | Format canonical job statements as `[Verb] + [Object] + [Context]` [594]. | Kalbach [594] | High | Critical |
| **JTBD-04** | Job vs. Outcome Split | JTBD & circumstances | Separate the job (what is accomplished) from desired outcomes (how well) [596]. | Kalbach [596] | High | Critical |
| **JTBD-05** | Three Job Dimensions | JTBD & circumstances | Capture functional, emotional, and social aspects of desired progress [25, 199, 602]. | Christensen [25], Hansen [199], Kalbach [602] | High | Important |
| **SWITCH-01** | Four Forces Balancing | Switching & buying behavior | Evaluate switching by balancing Push + Pull against Anxiety + Habit [114]. | Moesta [114] | High | Critical |
| **SWITCH-02** | Struggling Moment | Switching & buying behavior | Locate the specific episode that transformed latent dissatisfaction into active search [100]. | Moesta [100] | High | Critical |
| **SWITCH-03** | Buying Timeline Tracing | Switching & buying behavior | Reconstruct chronology across First Thought -> Passive Search -> Active Search -> Decision -> Consumption [116, 127]. | Moesta [116, 127] | High | Critical |
| **SWITCH-04** | True Alternatives | Switching & buying behavior | Identify non-software competitors including Excel, paper, status quo, and hiring [15, 134, 623]. | Christensen [15], Moesta [134], Kalbach [623] | High | Critical |
| **SWITCH-05** | "Why Now?" Trigger | Switching & buying behavior | Isolate the recent environmental change that activated demand [39, 137]. | Christensen [39], Moesta [137] | High | Critical |
| **EVID-01** | Evidence Hierarchy | Evidence quality | Score evidence on a strict ladder from Opinion (E0) to Transaction/Commitment (E5) [376, 484, 708]. | Bland [376], Alvarez [484], Fitzpatrick [708] | High | Critical |
| **EVID-02** | Commitment Validation | Evidence quality | Verify customer interest through surrender of time, data, reputation, access, or money [687, 376, 764]. | Fitzpatrick [687], Bland [376], Kazanjy [764] | High | Critical |
| **OPP-01** | Story-to-Opportunity | Opportunity extraction | Extract needs, pains, and desires directly from concrete story passages [522]. | Torres [522] | High | Critical |
| **OPP-02** | Customer Framing | Opportunity extraction | Phrase opportunities in native customer language, excluding solution or metric terms [524]. | Torres [524] | High | Critical |
| **OPP-03** | Feature Abstraction | Opportunity extraction | Translate requested solution features upward into underlying progress needs [476, 639, 684]. | Alvarez [476], Kalbach [639], Fitzpatrick [684] | High | Critical |
| **OPP-04** | Opportunity Tree (OST) | Opportunity decomposition | Structure opportunities hierarchically into parent-child and sibling graphs [529]. | Torres [529] | High | Critical |
| **OPP-05** | Row-by-Row Comparison | Opportunity decomposition | Prioritize sibling opportunities at the same abstraction level [544]. | Torres [544] | High | Important |
| **ASSUMP-01** | 5-Category Decomposition | Assumptions & unknowns | Decompose solutions into Desirability, Viability, Feasibility, Usability, and Ethical assumptions [363, 554]. | Bland [363], Torres [554] | High | Critical |
| **ASSUMP-02** | Importance x Evidence | Assumptions & unknowns | Prioritize critical assumptions that have little supporting evidence [366, 559]. | Bland [366], Torres [559] | High | Critical |
| **EXP-01** | Test Specific Assumption | Experiment selection | Test isolated, high-risk assumptions rather than whole product ideas [368, 561]. | Bland [368], Torres [561] | High | Critical |
| **EXP-02** | Cheapest Meaningful Signal | Experiment selection | Select the cheapest experiment capable of producing sufficient decision evidence [384, 564]. | Bland [384], Torres [564] | High | Critical |
| **EXP-03** | Falsifiable Criteria | Experiment selection | Lock metrics, thresholds, populations, and decision rules before executing tests [371, 410]. | Bland [371, 410] | High | Critical |
| **QUAL-01** | Commercial Buying Signals | Qualification | Track implementation questions, price inquiries, stakeholder intros, and calendar movement [764]. | Kazanjy [764] | High | Critical |
| **QUAL-02** | Tech Curiosity Filter | Qualification | Disqualify conversations driven by AI fascination without operational business pain [760]. | Kazanjy [760] | High | Critical |
| **QUAL-03** | Concrete Next Action | Qualification | Require every live commercial opportunity to have an owner, date, and objective [768]. | Kazanjy [768] | High | Critical |
| **TRANS-01** | Mode Switch Permission | Research to sales transition | Complete discovery, verify qualification, and request explicit permission before presenting solutions [770, 793]. | Kazanjy [770, 793] | High | Critical |
| **TRANS-02** | Pre/Post-Pitch Partition | Research to sales transition | Freeze discovery data and tag all evidence after solution exposure as `POST_PITCH` [774, 794]. | Kazanjy [774, 794] | High | Critical |
| **TRANS-03** | Bounded Pilot Scope | Research to sales transition | Define explicit commercial hypotheses, success criteria, and customer contribution for pilots [775]. | Kazanjy [775] | High | Important |
| **SYNTH-01** | Two-Stage Synthesis Pass | Synthesis across interviews | Synthesize within-interview snapshots before performing cross-interview aggregation [567]. | Torres [567] | High | Critical |
| **SYNTH-02** | Adversarial Pattern Test | Synthesis across interviews | Actively seek counterexamples to challenge emerging qualitative patterns [488]. | Alvarez [488] | High | Critical |
| **SYNTH-03** | Saturation Signal | Synthesis across interviews | Stop interviewing when marginal information gain drops and surprise disappears [491]. | Alvarez [491] | High | Important |
| **SYNTH-04** | Provenance Traceability | Synthesis across interviews | Maintain bidirectional links from opportunities/assumptions back to exact transcript spans [572]. | Torres [572] | High | Critical |
| **PROD-01** | Backbone Mapping | Downstream product spec | Structure product capability around user activities and tasks arranged in narrative order [423, 427]. | Patton [423, 427] | High | Downstream |
| **PROD-02** | Walking Skeleton | Downstream product spec | Define the thinnest end-to-end implementation supporting the complete user backbone [439]. | Patton [439] | High | Downstream |
| **PROD-03** | Horizontal Release Slicing | Downstream product spec | Cut release bands horizontally across all backbone activities rather than building deep isolated features [436, 441]. | Patton [436, 441] | High | Downstream |

---
