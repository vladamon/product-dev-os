Below is the extraction I would carry forward into the synthesis notebook. I’m distinguishing provenance as:

* **[T] Torres-specific / strongly characteristic of Continuous Discovery Habits**
* **[B] Broader discovery/research practice used by Torres**
* **[X] Harness extrapolation** — useful for your solo-founder SMB system, but not something I would attribute directly to Torres.

A foundational correction first: the canonical Torres chain is closer to **story → opportunity → opportunity map → target opportunity → solution ideas → assumptions → assumption tests**. An assumption is a belief that must hold for a **solution** to succeed; it should not normally be attached directly to an opportunity. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fglossary-discovery-opportunity-solution-tree%2F%3Futm%5Fsource%3Dchatgpt.com))

\-------------------------------------------------------------------------------- 

# I. Interviewing and story extraction

## 1\. Continuous interviewing

**Classification:** Principle **Provenance:** **[T]**

**Explanation:** Discovery should be a continuous habit rather than an occasional research phase. Torres generally recommends at least one customer interview per week for product teams, emphasizing consistency over batching—for example, one every week is preferable to four interviews followed by a month of silence. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcustomer-interviews%2F))

**Example:** Instead of doing 15 construction-company interviews in January and then designing for three months, interview one or two SMB operators every week while the opportunity model evolves.

**Failure example:** Conduct 20 interviews, write a research report, declare discovery complete, and design a product from that frozen snapshot.

**Evidence required:** A regular flow of recent interviews from participants relevant to the current discovery scope.

**AI harness implementation:** Maintain an `evidence_recency` dimension. The harness should identify branches supported only by stale interviews and recommend new interviews specifically targeting those branches.

For your reconnaissance context, **[X]** I would weaken Torres's literal weekly requirement. The important invariant is *persistent evidence acquisition*, not "one interview every Tuesday."

\-------------------------------------------------------------------------------- 

## 2\. Separate research questions from interview questions

**Classification:** Interview technique **Provenance:** **[T]**, incorporating broader qualitative-research practice.

**Explanation:** What you want to learn is not necessarily what you should directly ask. Torres distinguishes **research questions** from **interview questions**. Asking every research question directly tends to produce a questionnaire and generalized answers. Instead, several research questions can often be answered by eliciting one rich story. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fstory-based-customer-interviews%2F))

**Example:**

Research goals:

* How does a contractor obtain supplier prices?
* Where are delays introduced?
* Who is involved?
* What information gets lost?
* What workarounds exist?

Interview question:

"Tell me about the last offer you prepared where you had to get prices from several suppliers."

Then excavate that event.

**Failure example:** "How do you source prices? How many suppliers do you contact? What problems do you have? How long does it take? Would automation help?"

The interviewer has already imposed the structure.

**Evidence required:** A concrete episode rather than a collection of abstract answers.

**AI harness implementation:** Store both separately:

```
research_goal[]
story_prompt

```

The model should never mechanically convert each research goal into one interview question.

\-------------------------------------------------------------------------------- 

## 3\. Ask for a specific instance of past behavior

**Classification:** Story-extraction technique **Provenance:** **[T]** and one of the strongest transferable Torres rules.

**Explanation:** Specific stories about actual past behavior yield richer and more reliable evidence than asking people to characterize what they "usually" do. Torres explicitly frames this as protection against aspirational self-description and other cognitive biases. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcustomer-interviews%2F))

**Example:** "Tell me about the last time you had to prepare a bid."

Better than:

"How do you normally prepare bids?"

**Failure example:** "Would getting supplier prices automatically be useful?"

That produces speculation about a hypothetical future.

**Evidence required:** An identifiable event with time, context, actors and actions.

**AI harness implementation:** Every important claim gets an evidence type:

```
SPECIFIC_PAST_EVENT
GENERALIZED_BEHAVIOR
OPINION
FUTURE_SPECULATION
SOLUTION_REACTION

```

Confidence should strongly favor `SPECIFIC_PAST_EVENT`.

\-------------------------------------------------------------------------------- 

## 4\. Excavate the story temporally

**Classification:** Story-extraction technique **Provenance:** **[T]**

**Explanation:** "Tell me about the last time..." usually produces only the beginning of the story. Torres recommends reconstructing the sequence using temporal prompts such as what happened first, what happened next, and what happened before a particular moment. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026%2F))

**Example:**

"They sent us a Leistungsverzeichnis."

"What happened after you received it?"

"I opened it in ORCA."

"And then?"

"I separated the items by supplier..."

This can uncover an entire operational workflow without the AI having predicted its structure.

**Failure example:** Participant says, "We prepared the quote last Thursday," and the AI immediately moves to its next prepared question.

**Evidence required:** Ordered actions with transitions between them.

**AI harness implementation:** Construct an event sequence:

```
trigger
→ action
→ actor
→ tool
→ information/input
→ decision
→ outcome

```

Whenever a causal or temporal gap appears, generate a follow-up before moving topics.

\-------------------------------------------------------------------------------- 

## 5\. Pull generalizations back into the concrete story

**Classification:** Story-extraction technique **Provenance:** **[T]**

**Explanation:** People naturally oscillate between a specific incident and statements such as "usually we..." or "normally..." Torres says the interviewer should recognize the transition and gently return to the actual instance, preferably after a natural pause. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fstory-based-customer-interviews%2F))

**Example:**

Participant: "Usually the Bauleiter calls suppliers."

AI: "In the project you were just describing, who actually contacted them?"

**Failure example:** Treat "the Bauleiter normally does that" as factual evidence that the Bauleiter performed the step in the specific episode.

**Evidence required:** Confirmation of what happened in the incident being reconstructed.

**AI harness implementation:** Detect linguistic generalizers:

```
usually
normally
typically
generally
most of the time
we tend to

```

Then generate a **story-return probe**.

\-------------------------------------------------------------------------------- 

## 6\. Let the story reveal what you did not know to ask

**Classification:** Interview technique **Provenance:** **[T]**

**Explanation:** One weakness of direct questioning is that the interviewer can only discover dimensions they already thought of. Rich stories reveal context, motivations, constraints, social interactions and workarounds that were outside the original discussion guide. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fstory-based-customer-interviews%2F))

**Example:** You investigate quote preparation expecting procurement delays but discover that employees print every document, assign handwritten protocol numbers, and then rename digital files accordingly.

That unexpected workflow may be more commercially interesting than the original topic.

**Failure example:** AI follows a fixed questionnaire and suppresses anything outside predefined categories.

**Evidence required:** Unexpected but concrete story elements.

**AI harness implementation:** The interviewer should maintain:

```
planned_threads
emergent_threads

```

and be allowed to pursue high-evidence emergent threads when they reveal new pain, cost, dependency, workaround or decision complexity.

\-------------------------------------------------------------------------------- 

## 7\. Interview for opportunities, not solution validation

**Classification:** Principle / Anti-pattern **Provenance:** **[T]**

**Explanation:** Torres draws a sharp boundary between interviews used to discover needs/context and tests designed to evaluate solutions. Asking customers what they think of a proposed solution often creates misleading confidence. Interviews are primarily generative; assumption tests are evaluative. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fstory-based-customer-interviews%2F))

**Example:** Ask how invoices are processed today.

Do not begin by showing your "AI Invoice Agent" and asking whether they would use it.

**Failure example:** Every interview becomes a disguised sales demo.

**Evidence required:** Evidence about the person's current goal, context, behavior, difficulty or desire independent of your proposed solution.

**AI harness implementation:** Add a hard state distinction:

```
DISCOVERY_INTERVIEW
SOLUTION_TEST
SALES_CONVERSATION

```

The discovery interviewer should block or heavily discourage solution-pitch questions.

This complements *The Mom Test* extremely well.

\-------------------------------------------------------------------------------- 

# II. Turning stories into opportunities

## 8\. An opportunity is a customer need, pain point or desire

**Classification:** Opportunity rule **Provenance:** **[T]**

**Explanation:** Torres collectively calls unmet needs, pain points and desires **opportunities**—places where a product team might positively intervene. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcustomer-interviews%2F))

The categories do not need to be rigidly separated.

For the harness:

```
NEED      = something required to achieve a goal
PAIN      = undesirable friction/current negative state
DESIRE    = preferred state or aspiration

```

All three become opportunity candidates.

**Example:**

Observation: "Before every offer, she opens five previous PDFs looking for the most recent supplier price."

Opportunity: "I need to find reliable recent prices quickly."

**Failure example:**

Opportunity: "Build an AI procurement agent."

That is a solution.

**Evidence required:** At least one story passage supporting the underlying need/pain/desire.

**AI harness implementation:** Extract opportunity candidates but require links back to transcript evidence.

\-------------------------------------------------------------------------------- 

## 9\. Frame opportunities from the customer's perspective

**Classification:** Opportunity rule **Provenance:** **[T]**

**Explanation:** Torres recommends phrasing opportunities as something the customer could plausibly say. This helps prevent business objectives or solutions from masquerading as customer problems. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026-2%2F))

**Example:**

Good:

"I don't know which supplier has the best current price."

Bad:

"Increase procurement efficiency."

Worse:

"Implement automated price comparison."

The first is customer opportunity, the second business outcome, the third solution.

**Failure example:** "Increase customer retention" appears inside the opportunity space.

No customer wakes up wanting your retention metric to improve.

**Evidence required:** A story demonstrating the customer's underlying perspective.

**AI harness implementation:** Run a framing test:

Could the interviewee plausibly say or experience this?

If not, classify it as `BUSINESS_OUTCOME`, `SOLUTION`, `INTERNAL_METRIC`, or `UNKNOWN`.

\-------------------------------------------------------------------------------- 

## 10\. Opportunities should emerge from stories rather than be reverse-engineered from solutions

**Classification:** Opportunity rule / Anti-pattern **Provenance:** **[T]**

**Explanation:** Torres explicitly criticizes starting with an idea and asking "what problem does this solve?" The direction should normally run from outcome and customer evidence toward opportunities, then solutions. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fprioritize-opportunities%2F))

**Example:**

Correct:

```
Story:
Estimator emails 6 suppliers and waits 2 days.

Opportunity:
"I need current supplier prices without delaying my quote."

Possible solutions:
supplier portal
automated email workflow
price database
agentic procurement workflow

```

**Failure example:**

```
Idea: procurement agent
↓
invented problem: contractors need AI

```

**Evidence required:** Independent evidence for the problem prior to evaluating the proposed solution.

**AI harness implementation:** Store solution-independent evidence separately and mark opportunities created only by "solution backfilling" as low confidence.

\-------------------------------------------------------------------------------- 

## 11\. Preserve an observation layer between transcript and opportunity

**Classification:** Synthesis rule **Provenance:** **[X]** — not a canonical Torres layer, but important for your harness.

**Explanation:** I would not allow an LLM to jump directly:

```
quote → opportunity

```

Instead:

```
quote/story
→ factual observation
→ interpreted opportunity

```

This provides a check against hallucinated interpretation.

**Example:**

Transcript evidence:

"I opened three Excel files because I wasn't sure which one had the current prices."

Observation:

`User searched multiple spreadsheets because version freshness was unclear.`

Opportunity:

`I need to know which price information is current.`

**Failure example:**

Transcript:

"I opened three Excel files."

AI opportunity:

`The company desperately needs an ERP.`

The inference exploded far beyond the evidence.

**Evidence required:** Verbatim or timestamped story evidence supporting the observation.

**AI harness implementation:** Keep separate entities:

```
EvidenceSpan
Observation
Opportunity

```

with confidence and provenance edges.

This is one of the most important improvements I would add beyond Torres.

\-------------------------------------------------------------------------------- 

# III. Opportunity mapping

## 12\. Build an opportunity space, not an opportunity backlog

**Classification:** Mapping rule **Provenance:** **[T]**

**Explanation:** A flat list obscures relationships among problems of different sizes. Torres uses a tree structure to represent parent-child and sibling relationships and make the opportunity space easier to reason about. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026-2%2F))

**Example:**

```
Preparing a project offer
├─ I need to understand what must be priced
├─ I need current supplier prices
│  ├─ I need to identify relevant suppliers
│  ├─ I need to send comparable requests
│  └─ I need to consolidate responses
└─ I need to calculate our final price confidently

```

**Failure example:**

```
Need prices
Emails are slow
Supplier comparison
PDF extraction
Automate quotes
ORCA integration
Price history

```

This mixes abstraction levels and solutions.

**Evidence required:** Multiple opportunities plus enough story context to infer their relationships.

**AI harness implementation:** Maintain an explicit graph/tree rather than only embedding clusters.

\-------------------------------------------------------------------------------- 

## 13\. Use key moments in the experience to create distinct top-level branches

**Classification:** Mapping rule **Provenance:** **[T]**

**Explanation:** Torres recommends using distinct moments in the customer's experience map to help structure major branches. Her current book guide explicitly suggests identifying roughly 3–5 distinct moments as candidate top-level opportunities. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026-2%2F))

**Example:**

For construction tendering:

```
Receive tender
→ understand scope
→ source prices
→ calculate costs
→ assemble offer
→ submit
→ handle revisions

```

Opportunities discovered during each moment can then be grouped accordingly.

**Failure example:** Organize branches according to your future product modules:

```
AI module
dashboard module
email module
reporting module

```

That is solution architecture, not opportunity structure.

**Evidence required:** Concrete chronological stories demonstrating the customer experience.

**AI harness implementation:** Build an `experience_map` before or alongside the opportunity tree.

\-------------------------------------------------------------------------------- 

## 14\. Structure by similarity and distinctness

**Classification:** Mapping rule **Provenance:** **[T]**

**Explanation:** Sibling opportunities should be sufficiently similar to make comparison meaningful yet sufficiently distinct that they represent different opportunities. Torres emphasizes that this is not perfectly objective; restructuring the tree is part of learning. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fprioritize-opportunities%2F))

**Example:**

Parent:

`I need supplier prices in time to submit my offer.`

Children:

```
I don't know whom to ask.
I have to prepare each inquiry manually.
Suppliers respond at different times.
Responses arrive in incompatible formats.
I can't easily compare the replies.

```

**Failure example:**

Sibling nodes:

```
Procurement is difficult.
Supplier A responds slowly.
Automate emails.

```

Different abstraction levels and one solution are mixed together.

**Evidence required:** Story evidence showing meaningful distinctions.

**AI harness implementation:** Before adding a node, evaluate:

```
Is it a duplicate?
Is it a subset?
Is it a parent?
Is it a sibling?
Is it actually a solution?

```

\-------------------------------------------------------------------------------- 

## 15\. Decompose broad opportunities into smaller opportunities

**Classification:** Mapping rule **Provenance:** **[T]**

**Explanation:** Large problems become more actionable when broken into smaller customer opportunities. Torres explicitly connects this decomposition with continuous delivery: solve smaller portions rather than treating the whole opportunity as one project. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2F2023%2F11%2Fbenefits-of-opportunity-solution-trees%2F%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

Too broad:

`Preparing offers takes too much time.`

Breakdown:

```
I need to extract quantities from tender documents.
I need current material prices.
I need subcontractor quotes.
I need to know our labor cost.
I need to detect missing cost items.
I need to assemble everything into the required format.

```

**Failure example:** Leave "offer creation is inefficient" as the sole opportunity and immediately brainstorm an end-to-end autonomous agent.

**Evidence required:** Sufficient workflow detail to identify separable sub-problems.

**AI harness implementation:** Trigger decomposition when an opportunity contains multiple actors, stages, outcomes or distinct frictions.

\-------------------------------------------------------------------------------- 

## 16\. Avoid malformed opportunity trees

**Classification:** Anti-pattern **Provenance:** **[T]**

Torres identifies several structural warning signs. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026-2%2F))

**Explanation:** Particularly suspicious structures include:

* a long **vertical chain** with one child under each parent;
* opportunities that belong naturally under several parents;
* company-centered rather than customer-centered nodes;
* branches operating at wildly different levels of abstraction.

**Example:** A parent with one child may indicate that the parent-child distinction is artificial or that missing sibling opportunities have not been discovered.

**Failure example:**

```
Need better procurement
└─ Need faster procurement
   └─ Need automated procurement
      └─ Need AI procurement

```

That is basically the same concept rewritten four times.

**Evidence required:** Comparison of neighboring tree nodes and their supporting evidence.

**AI harness implementation:** Add structural linting:

```
VERTICAL_CHAIN_WARNING
MULTIPLE_PARENT_WARNING
SOLUTION_IN_OPPORTUNITY_SPACE
BUSINESS_FRAMING_WARNING
ABSTRACTION_MISMATCH
UNSUPPORTED_NODE

```

\-------------------------------------------------------------------------------- 

## 17\. Treat the opportunity map as provisional

**Classification:** Mapping rule **Provenance:** **[T]**

**Explanation:** Torres emphasizes that opportunity-space structure gets revised as understanding improves. There is often more than one defensible arrangement. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026-2%2F))

**Example:** After six interviews you organize supplier-response problems by workflow stage. After another ten interviews, you realize company size creates two materially different workflows and restructure the branch.

**Failure example:** The first generated tree becomes your ontology and all subsequent evidence gets forced into it.

**Evidence required:** New stories that challenge existing relationships or reveal missing branches.

**AI harness implementation:** Never silently overwrite the tree. Suggest operations such as:

```
MERGE
SPLIT
MOVE
RENAME
ADD_PARENT
ADD_SIBLING
MARK_UNCERTAIN

```

with explanations and supporting evidence.

\-------------------------------------------------------------------------------- 

# IV. Desired outcome and selecting what to investigate

## 18\. The desired outcome constrains discovery

**Classification:** Principle **Provenance:** **[T]**

**Explanation:** In an OST, the desired outcome sits above the opportunity space and establishes the scope. Opportunities matter because addressing them could contribute to that outcome. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fglossary-discovery-opportunity-solution-tree%2F%3Futm%5Fsource%3Dchatgpt.com))

For established teams the outcome might be:

`Increase weekly viewing hours.`

For your system that exact formulation often does **not** transfer directly.

**Example — solo-founder adaptation [X]:**

Your outcome could initially be:

`Identify recurring operational problems in construction SMBs with enough pain and commercial potential to justify further validation.`

**Failure example:** Collect every complaint anyone mentions without defining what makes an opportunity relevant.

**Evidence required:** Connection between a candidate opportunity and the current discovery objective.

**AI harness implementation:** Every opportunity should answer:

```
Why does resolving/understanding this matter to our discovery objective?

```

But avoid fabricating a strong causal relationship merely because the opportunity sounds interesting.

\-------------------------------------------------------------------------------- 

## 19\. Prioritize opportunities before solutions

**Classification:** Prioritization heuristic **Provenance:** **[T]**, central Torres doctrine.

**Explanation:** Product strategy happens primarily in the opportunity space. Decide which customer problem deserves attention before deciding which implementation deserves attention. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-june-2026%2F))

**Example:**

First compare:

```
supplier price acquisition
document registration
worker scheduling
invoice reconciliation

```

Only after selecting one should you deeply explore possible products or automations.

**Failure example:**

Compare:

```
AI agent
mobile app
OCR system
dashboard
Zapier automation

```

without knowing which problem is worth solving.

**Evidence required:** Multiple evidence-backed opportunity candidates.

**AI harness implementation:** Hard separation:

```
opportunity_priority ≠ solution_priority

```

No solution ranking should be allowed before identifying its target opportunity.

\-------------------------------------------------------------------------------- 

## 20\. Prioritize row by row using compare-and-contrast

**Classification:** Prioritization heuristic **Provenance:** **[T]**

**Explanation:** Do not compare every node in a large tree globally. Compare sibling opportunities at the same level, select a branch, then compare its children. This prevents comparing very differently sized problems. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fprioritize-opportunities%2F))

**Example:**

First:

```
A. Lead generation
B. Project preparation
C. Project execution
D. Accounting/admin

```

Suppose B warrants further exploration.

Then compare:

```
B1. Tender understanding
B2. Price sourcing
B3. Cost estimation
B4. Offer generation

```

**Failure example:** Rank "entire procurement process" against "renaming PDF attachments."

**Evidence required:** Reasonably structured parent/sibling relationships.

**AI harness implementation:** The prioritizer should only compare nodes sharing a meaningful parent unless explicitly doing cross-domain reconnaissance.

\-------------------------------------------------------------------------------- 

## 21\. Assess opportunities multidimensionally; do not manufacture mathematical certainty

**Classification:** Prioritization heuristic **Provenance:** **[T]**

**Explanation:** Torres describes factors including:

* opportunity size: how many customers and how often;
* market factors;
* company/strategic factors;
* customer factors such as importance and satisfaction;
* ultimately, likely contribution to the desired outcome.

She explicitly resists turning inherently uncertain judgments into arbitrary scoring formulas. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fglossary-discovery-assessing-opportunities%2F%3Futm%5Fsource%3Dchatgpt.com))

**Example:** A document-renaming pain occurs daily but costs only seconds. Tender-price sourcing may happen less frequently but consume eight employee-hours and delay €100k offers.

Frequency alone therefore cannot decide.

**Failure example:**

```
pain × frequency × market × AI-fit = 87.4

```

and treating 87.4 as objectively superior to 83.2.

**Evidence required:** Evidence supporting each dimension, plus explicit gaps where evidence is missing.

**AI harness implementation [X]:** You can still maintain structured dimensions, but they should be qualitative/interval judgments:

```
frequency: HIGH [3 interview sources]
severity: UNKNOWN
financial_impact: POSSIBLY_HIGH
existing_spend: MEDIUM
strategic_fit: HIGH
evidence_confidence: MEDIUM

```

Then let the system say **what information would discriminate between alternatives** instead of hiding uncertainty inside a score.

\-------------------------------------------------------------------------------- 

## 22\. Opportunity selection is often a reversible decision

**Classification:** Prioritization heuristic **Provenance:** **[T]**, borrowing the broader one-way/two-way-door concept.

**Explanation:** Torres treats many target-opportunity decisions as two-way doors. Select one with enough evidence, investigate it, and reverse course when evidence says you chose poorly. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-june-2026%2F))

**Example:** Spend three interviews specifically investigating procurement rather than interviewing another 30 companies before choosing any direction.

**Failure example:** Demand statistically conclusive proof that procurement is the single best SMB opportunity before investing another day in it.

**Evidence required:** Enough evidence to justify a cheap next step, not necessarily enough to justify building a company.

**AI harness implementation:** Associate decisions with:

```
reversibility
cost_of_next_step
evidence_needed
disconfirming_signal

```

This is particularly valuable for a solo founder.

\-------------------------------------------------------------------------------- 

# V. Solutions and premature convergence

## 23\. Select one target opportunity before serious ideation

**Classification:** Opportunity rule **Provenance:** **[T]**

**Explanation:** After prioritizing the opportunity space, Torres recommends focusing on a **target opportunity** and generating solutions specifically for it. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fglossary-discovery-target-opportunity%2F%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

Target:

`I need comparable supplier prices quickly enough to complete my bid.`

Now ideate against that target.

**Failure example:** Simultaneously design field scheduling, procurement, CRM, document storage and invoice automation because all appeared in interviews.

**Evidence required:** Evidence that this opportunity merits deeper exploration relative to siblings.

**AI harness implementation:** `target_opportunity_id` becomes an explicit discovery state. Downstream solution ideation must reference it.

\-------------------------------------------------------------------------------- 

## 24\. Maintain multiple solution ideas

**Classification:** Principle / Anti-pattern **Provenance:** **[T]**

**Explanation:** Torres strongly favors generating multiple solutions for the same target opportunity so the team can compare alternatives instead of becoming attached to the first plausible idea. The OST guidance commonly works with three ideas before assumption testing. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2F2016%2F08%2Fopportunity-solution-tree%2F%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

For supplier prices:

```
1. searchable historical-price database
2. semi-automated supplier RFQ workflow
3. agent that sources and normalizes live quotes

```

**Failure example:** Interview reveals procurement friction → "We should build an AI agent" → everything afterwards attempts to prove the agent works.

**Evidence required:** Same target opportunity shared by all compared solutions.

**AI harness implementation:** If only one solution exists, flag:

`PREMATURE_SOLUTION_CONVERGENCE`.

\-------------------------------------------------------------------------------- 

# VI. Assumptions

## 25\. Decompose solutions into assumptions

**Classification:** Assumption rule **Provenance:** **[T]**

**Explanation:** Rather than testing a full idea, identify what must be true for that idea to succeed. Torres defines five major assumption categories: **desirability, viability, feasibility, usability, and ethical**. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fglossary-discovery-assumption%2F%3Futm%5Fsource%3Dchatgpt.com))

**Example — procurement agent:**

**Desirability:** Estimators will trust an automatically assembled supplier-price comparison.

**Viability:** Construction firms will pay enough to support the service.

**Feasibility:** Supplier responses can be extracted reliably from heterogeneous PDFs/emails.

**Usability:** Estimators can recognize and resolve uncertain matches.

**Ethical:** Automated supplier outreach will not create misleading commitments or inappropriate disclosures.

**Failure example:** "Will our procurement agent work?" is treated as one giant hypothesis.

**Evidence required:** Explicit articulation of beliefs underlying a solution.

**AI harness implementation:** Generate an `AssumptionSet` for every serious solution.

\-------------------------------------------------------------------------------- 

## 26\. Use the imagined user journey to reveal hidden assumptions

**Classification:** Assumption rule **Provenance:** **[T]**, building partly on broader story-mapping practice.

**Explanation:** Torres suggests story-mapping the solution **as if it already exists**, mapping actors and steps required to obtain value, then asking what has to be true at each step. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-august-2026%2F))

**Example:**

```
Estimator uploads tender
→ AI identifies line items
→ chooses relevant suppliers
→ drafts requests
→ estimator approves
→ emails sent
→ responses parsed
→ prices normalized
→ estimator selects inputs

```

Each transition exposes assumptions.

**Failure example:** Only test whether users "like the idea."

**Evidence required:** A concrete proposed solution workflow.

**AI harness implementation:** Automatically run a "what must be true?" pass against every critical transition.

\-------------------------------------------------------------------------------- 

## 27\. Generate more assumptions than feels necessary

**Classification:** Assumption rule **Provenance:** **[T]**

**Explanation:** Torres's current chapter guidance recommends generating roughly 15–20+ assumptions for a serious solution idea; teams often identify far too few. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-august-2026%2F))

**Example:** The obvious risk may be extraction accuracy, while the fatal hidden risk is that purchasing decisions require informal relationships and cannot simply be optimized by price.

**Failure example:** Write down three technical assumptions because they are easiest for a software founder to recognize.

**Evidence required:** Broad examination across the five categories.

**AI harness implementation:** Detect category blind spots. A software founder with 14 feasibility assumptions and zero viability assumptions should get a warning.

This is particularly important in your case because your engineering background will naturally make technical uncertainty more salient than commercial uncertainty.

\-------------------------------------------------------------------------------- 

## 28\. Prioritize assumptions by importance and evidence

**Classification:** Assumption rule **Provenance:** **[T]**

**Explanation:** Torres's assumption mapping uses two dimensions:

* importance to the solution succeeding;
* strength of existing evidence.

The riskiest "leap-of-faith" assumptions are **important + weakly evidenced**. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-august-2026%2F))

**Example:**

"Supplier emails can technically be parsed" may have strong prototype evidence.

"Companies will let software autonomously contact suppliers" may be highly important but almost unsupported.

Test the latter sooner.

**Failure example:** Test whichever assumption is easiest to test.

**Evidence required:** Existing supporting evidence plus causal importance to solution success.

**AI harness implementation:**

```
assumption:
  criticality
  evidence_strength
  evidence_refs[]
  test_priority

```

Do not collapse these dimensions into opaque arithmetic.

\-------------------------------------------------------------------------------- 

# VII. Assumption testing and experiments

## 29\. Test assumptions, not entire products

**Classification:** Experiment rule **Provenance:** **[T]**

**Explanation:** Testing a whole idea makes negative results ambiguous: you do not know which assumption failed. Smaller tests create faster, clearer learning. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-august-2026%2F))

**Example:** Before building supplier automation, manually process ten supplier responses and measure whether you can normalize them accurately.

**Failure example:** Build the complete SaaS, launch it to five firms, get poor adoption, and then wonder whether the problem was pricing, workflow fit, trust, UX or technical quality.

**Evidence required:** One identified risky assumption.

**AI harness implementation:** Every experiment must reference:

```
assumption_id

```

rather than merely `solution_id`.

\-------------------------------------------------------------------------------- 

## 30\. Evaluate behavior, not stated intention

**Classification:** Experiment rule **Provenance:** **[T]**, consistent with the Ladder of Evidence.

**Explanation:** A strong assumption test simulates the relevant experience and observes what people actually do. Asking what they *would* do is weaker evidence. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fladder-of-evidence%2F))

**Example:**

Weak:

"Would you pay €150/month for this?"

Stronger:

"Here is the manually produced supplier comparison for your current tender. Do you want us to prepare the next one for €150?"

**Failure example:** Ten interviewees say "That sounds amazing" and the harness labels willingness-to-pay validated.

**Evidence required:** Action, commitment, actual usage or sufficiently realistic simulated behavior.

**AI harness implementation:** Reuse an evidence hierarchy similar to:

```
future_opinion
&lt; generalized_past_report
&lt; specific_past_story
&lt; simulated_behavior
&lt; real_behavior

```

This also fits cleanly with Fitzpatrick.

\-------------------------------------------------------------------------------- 

## 31\. Define success before seeing the results

**Classification:** Experiment rule **Provenance:** **[T]**

**Explanation:** Success criteria must be specified beforehand to reduce reinterpretation after results arrive. Torres's current guidance pushes for criteria specific enough that another person could independently call the test a win or loss. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fch-10-testing-assumptions%2F))

**Example:**

Before test:

"If at least 4 of 6 estimators can correctly verify the normalized supplier comparison without our assistance, usability evidence is sufficient for another iteration."

**Failure example:**

Three users struggle.

Founder: "But they seemed interested, so this is actually positive."

**Evidence required:** Predetermined threshold and observed results.

**AI harness implementation:** Do not permit `experiment_result` until these exist:

```
assumption
expected_behavior
sample/context
success_threshold
failure_threshold

```

\-------------------------------------------------------------------------------- 

## 32\. Seek the smallest useful early signal

**Classification:** Experiment rule **Provenance:** **[T]**

**Explanation:** Torres recommends small assumption tests that can often be completed in a day or two rather than starting with large experiments. Early discovery is about reducing uncertainty quickly, not producing publication-grade proof. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fch-10-testing-assumptions%2F))

**Example:** Manually process five real RFQ responses before building an ingestion pipeline.

**Failure example:** Spend eight weeks implementing a complete supplier-integration architecture to learn whether supplier data can be normalized.

**Evidence required:** Enough observations to change confidence in a specific assumption.

**AI harness implementation:** Ask:

"What is the cheapest test capable of materially changing our belief?"

Then escalate only if the decision at stake requires stronger evidence.

\-------------------------------------------------------------------------------- 

## 33\. Test across competing ideas to reduce attachment

**Classification:** Experiment rule **Provenance:** **[T]**

**Explanation:** Torres recommends testing assumptions across a **set of ideas**, not sequentially falling in love with one idea and testing only it. This guards against confirmation bias and escalation of commitment. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-august-2026%2F))

**Example:** Instead of devoting all discovery to the agentic RFQ solution, test critical assumptions behind:

* historical price lookup;
* workflow automation;
* autonomous sourcing.

**Failure example:** Generate three solutions, then spend every test on the founder's favorite one.

**Evidence required:** Comparable candidate solutions addressing the same target opportunity.

**AI harness implementation:** Track assumption-test coverage by solution and detect overinvestment in one option.

\-------------------------------------------------------------------------------- 

# VIII. Synthesis across interviews

## 34\. Synthesize each interview before synthesizing across interviews

**Classification:** Synthesis rule **Provenance:** **[T]**, now explicitly reinforced by Torres's AI work.

**Explanation:** Torres recommends first preserving each interview's individual context, then synthesizing across interviews. Jumping directly from transcripts into cross-interview themes can strip away narrative context and produce shallow clusters. Her 2026 AI-OST work explicitly retains this two-stage approach. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fai-opportunity-solution-trees%2F))

**Example:**

```
Interview A → snapshot A
Interview B → snapshot B
Interview C → snapshot C
        ↓
cross-interview opportunity synthesis

```

**Failure example:**

```
30 transcripts
→ embedding clustering
→ "Top 10 customer pain points"

```

with no ability to reconstruct where or why any pain occurred.

**Evidence required:** Individual interview representations before aggregation.

**AI harness implementation:** Two distinct passes:

```
Pass 1: within-interview synthesis
Pass 2: cross-interview synthesis

```

Never merge them into one LLM call.

\-------------------------------------------------------------------------------- 

## 35\. Use interview snapshots to preserve context

**Classification:** Synthesis rule **Provenance:** **[T]**

**Explanation:** Torres's interview snapshot captures quick contextual facts, memorable evidence, opportunities, notable insights and an experience map for each interview. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026%2F))

For your system, the visual/photo aspect is mostly unnecessary.

**Example harness snapshot:**

```
Company:
Role:
Company size:
Story:
Trigger:
Workflow:
Actors:
Tools:
Experience map:
Observed pains:
Workarounds:
Opportunities:
Notable evidence:
Open questions:

```

**Failure example:** Store only a summary like "Company struggles with procurement."

**Evidence required:** The original interview plus timestamps.

**AI harness implementation:** Generate a structured snapshot immediately after each conversation while maintaining transcript links.

\-------------------------------------------------------------------------------- 

## 36\. AI synthesis should produce a draft, not canonical truth

**Classification:** Synthesis rule **Provenance:** **[T]**, especially explicit in Torres's 2026 AI work.

**Explanation:** Torres now explicitly uses AI to extract key moments and opportunities and generate draft OSTs, but describes those trees as drafts requiring human review, restructuring and judgment. She reports AI finding things she missed and her finding things AI missed. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fai-opportunity-solution-trees%2F))

**Example:** AI suggests merging:

`"I don't know current prices"` and `"I don't trust my old prices."`

Founder reviews the stories and decides whether these actually represent one underlying opportunity.

**Failure example:** Let the LLM regenerate the entire opportunity tree after every interview and accept its ontology automatically.

**Evidence required:** Source-linked suggestions and human-review state.

**AI harness implementation:**

```
AI_PROPOSED
HUMAN_CONFIRMED
HUMAN_MODIFIED
REJECTED

```

should be explicit node states.

For your proposed system, this rule is non-negotiable.

\-------------------------------------------------------------------------------- 

# IX. Traceability architecture for your harness

This part is primarily **[X]**, but follows Torres's logic closely.

I would make the discovery graph explicitly traceable:

```
Interview
   ↓
Story
   ↓
Evidence spans
   ↓
Observation
   ↓
Opportunity
   ↓
Parent opportunity / sub-opportunity
   ↓
Target-opportunity decision
   ↓
Solution candidate
   ↓
Assumption
   ↓
Experiment
   ↓
Result
   ↓
Updated belief / decision

```

Every derived object should retain links upward.

For example:

```
OPP-23
"I need supplier responses in a comparable format"

supported_by:
  OBS-51 → INT-004 18:42–20:10
  OBS-78 → INT-007 09:14–10:03
  OBS-91 → INT-009 24:02–26:51

parent:
  OPP-17 "I need to collect supplier prices efficiently"

confidence:
  medium-high

```

Then:

```
SOL-12
Automatically parse incoming supplier quotes

addresses:
  OPP-23

assumptions:
  A-42 supplier replies are sufficiently machine-readable
  A-43 line items can be matched reliably
  A-44 estimator trusts extracted values

```

This prevents the classic LLM failure mode where a neat-looking product hypothesis progressively loses contact with the original customer evidence.

\-------------------------------------------------------------------------------- 

# X. Recommended AI transformation pipeline

Your requested transformation should therefore be modified slightly.

### Stage 1 — Story

Identify a **specific past incident**:

"Tell me about the last bid where you had to request prices."

Output:

```
STORY
specificity: HIGH
time: last month
goal: prepare tender
trigger: tender request received
actors: estimator, suppliers, manager

```

### Stage 2 — Observation **[X]**

Extract only what demonstrably happened.

```
OBSERVATION
Estimator emailed six suppliers individually.
Four replied by email.
Two returned PDFs.
One returned Excel.
One supplied prices in the email body.
Estimator manually transferred prices into costing software.

```

No problem inference yet.

### Stage 3 — Opportunity **[T]**

Interpret gaps/needs/pains/desires:

```
OPPORTUNITY
"I need supplier responses in a format I can compare easily."

```

Attach evidence.

### Stage 4 — Sub-opportunity **[T]**

Decompose:

```
"I need to identify corresponding line items."
"I need units to be comparable."
"I need to know which supplier price is current."
"I need missing prices to be obvious."

```

### Stage 5 — Target opportunity decision **[T]**

Compare siblings based on evidence and relevance.

Do **not** automatically treat the most frequently mentioned one as best.

### Stage 6 — Solutions **[T]**

Generate alternatives only now:

```
S1 standardized supplier portal
S2 email parser + comparison sheet
S3 autonomous procurement agent

```

### Stage 7 — Assumptions **[T]**

For S2:

```
A1 suppliers will continue replying via email
A2 documents can be parsed reliably
A3 line items can be matched
A4 estimator can resolve uncertain matches
A5 enough time is saved to create willingness to pay

```

### Stage 8 — Experiment **[T]**

Pick important + weakly evidenced assumption.

```
Assumption:
A3 line items can be matched reliably

Test:
Take 20 historical real supplier responses and manually/AI-match
them to the source tender.

Success criteria:
≥ 90% of commercially relevant items correctly matched,
with uncertain cases reliably flagged.

```

That is much more faithful to Torres than:

`story → pain → product idea → build`.

\-------------------------------------------------------------------------------- 

# XI. Deciding what to investigate next

This is where Torres becomes particularly useful for your harness.

The **shape and evidence state of the tree should determine the next discovery action**. Torres explicitly notes that a shallow opportunity space suggests more interviewing; an overly sprawling one suggests narrowing focus; too few solution alternatives suggest ideation; insufficient assumption tests suggest increasing testing. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2F2023%2F11%2Fbenefits-of-opportunity-solution-trees%2F%3Futm%5Fsource%3Dchatgpt.com))

I would operationalize that as:

| Current state                                                        | Harness recommendation                              |
| -------------------------------------------------------------------- | --------------------------------------------------- |
| Few specific stories                                                 | Conduct more story interviews                       |
| Stories exist but workflow/context unclear                           | Probe same workflow more deeply                     |
| Many observations but weak opportunity structure                     | Synthesize/map                                      |
| Opportunity branch shallow                                           | Interview specifically around that moment           |
| Opportunity supported by one interview only                          | Seek replication/variation                          |
| Large broad opportunity                                              | Decompose                                           |
| Two competing opportunity branches with insufficient differentiation | Recruit interviews designed to discriminate         |
| Clear opportunity but only one solution                              | Ideate alternatives                                 |
| Multiple solutions but assumptions implicit                          | Generate assumptions                                |
| Many assumptions but no prioritization                               | Map importance × evidence                           |
| Critical weak-evidence assumption                                    | Design smallest behavioral test                     |
| Test contradicts hypothesis                                          | Revise solution/assumption; possibly return up tree |
| New interviews invalidate opportunity structure                      | Restructure tree                                    |

This creates a genuine **discovery controller**, rather than merely an interview chatbot.

\-------------------------------------------------------------------------------- 

# XII. What does not transfer cleanly from Torres to your solo-founder SMB reconnaissance

Several parts of *Continuous Discovery Habits* should be deliberately down-weighted.

### Product trio mechanics — **down-weight heavily**

Torres's default operating unit is the PM + designer + engineer product trio. She explicitly recommends that the trio interview and synthesize together because this creates shared understanding. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Finterview-customers-together%2F%3Futm%5Fsource%3Dchatgpt.com))

You do not have this organizational problem.

Your substitution should be:

```
Trio shared understanding
→ founder + structured evidence system + AI adversarial reviewer

```

The AI should challenge your interpretations rather than pretending to substitute three genuinely different human perspectives.

\-------------------------------------------------------------------------------- 

### Existing product outcome — **adapt significantly**

Torres often assumes that a team has an existing product and an outcome such as activation, retention or engagement.

You are earlier.

You're doing something closer to **market/problem reconnaissance across businesses**.

So instead of:

```
Desired outcome:
increase activation 10%

```

you initially need:

```
Discovery objective:
identify operational problems that are
recurring,
meaningful,
poorly served,
commercially actionable,
and reachable by a small software/automation business.

```

That modification is **[X]**, not Torres.

Once you select a product/domain, her standard outcome-oriented model becomes much more directly applicable.

\-------------------------------------------------------------------------------- 

### Weekly interviewing — **keep the principle, not the dogma**

The continuous cadence matters.

"One interview per week" is a sensible benchmark for persistent product teams. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcustomer-interviews%2F))

For SMB reconnaissance, a burst such as:

```
8 interviews over 3 weeks
→ select promising domain
→ 5 deeper interviews
→ experiments

```

may make more sense.

Do not turn the weekly habit into ritualistic methodology.

\-------------------------------------------------------------------------------- 

### Outcome filtering can be dangerous too early

For an established team, filtering opportunities by a predefined business outcome is valuable.

For you, overly aggressive outcome filtering could cause exactly the kind of blindness you are trying to avoid.

If your current question is:

"What valuable operational problems exist in small construction companies?"

then rejecting an unexpected workflow problem because it is unrelated to your original procurement hypothesis would be foolish.

Use a **broad reconnaissance objective first**, then narrow to an OST around a specific domain.

This is **[X]**.

\-------------------------------------------------------------------------------- 

### Product-focused assumptions are insufficient for a founder

Torres's five categories are useful, but a solo founder needs additional market/business reconnaissance questions before solution assumption testing.

I would explicitly track **[X]**:

```
problem existence
problem frequency
problem severity
economic cost
existing workaround
existing spend
buyer/user relationship
purchase authority
switching friction
market reachability
willingness to change
regulatory/process constraints

```

Some overlap with Torres's desirability/viability categories, but they deserve explicit representation for your use case.

\-------------------------------------------------------------------------------- 

# XIII. Concepts borrowed from broader discovery practice

Not everything in CDH originated uniquely with Torres.

The following should not be attributed as uniquely hers:

* interviewing about actual behavior rather than hypothetical intent;
* qualitative interviewing and active listening;
* story mapping;
* behavioral experimentation;
* assumption identification;
* premortems;
* desirability / viability / feasibility thinking;
* reversible-decision thinking;
* experience mapping.

Her distinctive contribution is largely the **integration and operationalization** of these elements into a continuous discovery system, especially:

```
continuous interviewing
+
story-based opportunity discovery
+
opportunity mapping
+
Opportunity Solution Trees
+
target-opportunity selection
+
multiple-solution comparison
+
assumption mapping/testing

```

The **Opportunity Solution Tree itself and the particular opportunity-centered workflow around it are strongly Torres-associated.** ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fglossary-discovery-opportunity-solution-tree%2F%3Futm%5Fsource%3Dchatgpt.com))

\-------------------------------------------------------------------------------- 

# Canonical Continuous Discovery Rules for the Harness

I would preserve the following as the distilled Torres layer in your final interviewing harness.

1. **Collect specific stories about past behavior, not general descriptions or future intentions.**
2. **Separate what you want to learn from what you actually ask.** Research questions are not interview scripts.
3. **Excavate stories chronologically.** Follow "what happened next/before?" rather than firing predetermined questions.
4. **When the interviewee generalizes, return to the specific event.**
5. **Let unexpected details redirect the interview when they expose meaningful context, constraints, needs or pain.**
6. **Use discovery interviews to discover opportunities, not to validate proposed solutions.**
7. **Extract customer needs, pain points and desires as opportunities.**
8. **Never confuse an opportunity, business outcome and solution.**
9. **Phrase opportunities from the customer's perspective whenever possible.**
10. **Require source evidence for every extracted opportunity.**
11. **Add a factual observation layer between transcript evidence and AI interpretation.** **[Harness adaptation]**
12. **Synthesize each interview individually before synthesizing across interviews.**
13. **Preserve the customer's workflow through an experience map.**
14. **Organize opportunities into a structured opportunity space rather than a flat backlog.**
15. **Use meaningful moments in the customer journey to help create distinct branches.**
16. **Group similar opportunities while keeping siblings meaningfully distinct.**
17. **Decompose broad opportunities until they become concrete enough to investigate or solve independently.**
18. **Treat malformed vertical trees, mixed abstraction levels and multi-parent nodes as signals that understanding is weak.**
19. **Treat every opportunity map as provisional and revise it as new evidence arrives.**
20. **Prioritize opportunities before prioritizing solutions.**
21. **Compare sibling opportunities row by row rather than globally ranking incomparable problems.**
22. **Assess opportunities using size/frequency, customer importance and satisfaction, market considerations, strategic/business considerations and likely outcome impact.**
23. **Do not convert uncertain qualitative evidence into fake mathematical precision.**
24. **Treat target-opportunity selection as reversible when exploration is cheap.**
25. **Select a target opportunity before serious solution ideation.**
26. **Generate several materially different solutions for the same target opportunity.**
27. **Do not allow the first plausible solution to become the default hypothesis.**
28. **Decompose each serious solution into assumptions.**
29. **Inspect desirability, viability, feasibility, usability and ethical assumptions.**
30. **Use the proposed user journey and premortem thinking to expose hidden assumptions.**
31. **Prioritize assumptions that are both critical and weakly evidenced.**
32. **Test specific assumptions rather than whole product ideas whenever possible.**
33. **Prefer observed behavior to stated intention.**
34. **Simulate the relevant experience as cheaply as possible.**
35. **Define success/failure criteria before observing test results.**
36. **Prefer small early signals that reduce uncertainty quickly over unnecessarily large experiments.**
37. **Test assumptions across competing solutions to reduce confirmation bias and escalation of commitment.**
38. **Maintain complete traceability from evidence → observation → opportunity → target opportunity → solution → assumption → experiment → result.** **[Harness adaptation]**
39. **Have the AI propose synthesis, never silently establish truth. Human review must be able to merge, split, move, reject or reinterpret AI-generated opportunities.** Torres's own 2026 AI work explicitly treats AI-generated OSTs as drafts rather than final synthesis. ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fai-opportunity-solution-trees%2F))
40. **Let the current evidence structure determine the next discovery action.** Sparse opportunity evidence calls for interviews; poorly structured evidence calls for synthesis; one-solution fixation calls for ideation; critical unsupported assumptions call for experiments.

The part I would give the **highest weight in your final combined harness** is not the generic "interview continuously" advice. It is Torres's mechanism for converting messy qualitative evidence into a **structured, revisable decision system**. *The Mom Test* protects the quality of the evidence; Portigal and Hansen improve how you obtain it; **Torres provides much of the machinery for turning that evidence into an evolving model of what to investigate and potentially build next.** ([Product Talk](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.producttalk.org%2Fcdh-book-club-april-2026-2%2F))


