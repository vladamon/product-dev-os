# Testing Business Ideas — David Bland &amp; Alex Osterwalder

**Weight: CORE — evidence and experiment extraction**

This book is especially useful for the part of the harness that begins **after an opportunity has been discovered**. Its central contribution is not interview technique; it is turning uncertain business ideas into explicit assumptions and systematically generating stronger evidence before investing heavily.

### Attribution legend

* **High confidence — Book:** central, distinctive methodology I confidently attribute to *Testing Business Ideas*.
* **Medium confidence — Book/Strategyzer:** clearly consistent with the book and broader Strategyzer methodology, but terminology may also appear in related Strategyzer work.
* **Synthesis:** useful implementation rule derived from the methodology; do not treat it as a direct rule or phrase from the book.
* **General Lean practice:** compatible with the book but not distinctive enough to attribute specifically to Bland/Osterwalder.

\-------------------------------------------------------------------------------- 

# 1\. Business Ideas Are Bundles of Assumptions

**Classification:** Principle **Attribution:** **High confidence — Book**

**Explanation**

A business idea should not initially be treated as a plan to execute. It is a collection of beliefs about customers, problems, behaviors, technology, economics, channels, operations, and other factors.

Until those beliefs have evidence behind them, they remain assumptions.

The testing process therefore begins by asking:

What must be true for this idea to work?

rather than:

How should we build this?

**Example**

Opportunity:

Small contractors spend excessive time manually sourcing supplier prices when preparing bids.

Potential assumptions:

* this problem happens frequently;
* the delay is economically meaningful;
* contractors actively want to reduce it;
* suppliers will respond through an automated workflow;
* quotes can be parsed reliably;
* contractors will trust automatically consolidated pricing;
* contractors will pay €X/month for the capability.

These are different uncertainties and should not be collapsed into one claim that "the idea is good."

**Evidence produced**

None directly. This principle creates the objects that must subsequently be tested.

**Strength of evidence**

N/A — assumption identification is not evidence.

**Appropriate use**

Immediately after promising opportunities or solution concepts emerge.

**Misuse**

Turning every observation into a product requirement.

**AI harness operationalization**

For every proposed opportunity or solution, force the model to generate:

```
OPPORTUNITY
↓
WHAT MUST BE TRUE?
↓
DESIRABILITY ASSUMPTIONS
FEASIBILITY ASSUMPTIONS
VIABILITY ASSUMPTIONS

```

Do not allow `solution_candidate` to become `recommended_build` while critical assumptions remain untested.

\-------------------------------------------------------------------------------- 

# 2\. Desirability, Feasibility, and Viability

**Classification:** Assumption rule **Attribution:** **High confidence — Book**

**Explanation**

Business-model risk should be considered across three major dimensions:

### Desirability

Do customers actually want this?

Includes questions such as:

* Is the problem real?
* Is it important?
* Does it happen often enough?
* Are people motivated to change?
* Will they adopt the proposed behavior?
* Does the value proposition matter?

### Feasibility

Can we actually create and deliver it?

Includes:

* technical capability;
* integrations;
* data availability;
* reliability;
* operational capability;
* partners/resources;
* regulatory or execution constraints.

### Viability

Can the business model work?

Includes:

* willingness to pay;
* pricing;
* customer acquisition economics;
* margins;
* cost to serve;
* scalable delivery;
* revenue mechanism.

**Example**

For automated procurement:

**Desirability:** contractors care enough about supplier-price collection to change workflows.

**Feasibility:** quotes arriving in PDF/email can be extracted and normalized accurately.

**Viability:** a contractor will pay €200/month while service costs remain sufficiently below that.

**Evidence produced**

Depends on the experiment associated with each assumption.

**Strength of evidence**

N/A as a categorization system.

**Appropriate use**

Ensuring the harness does not equate "customers have a problem" with "there is a business."

**Misuse**

Treating these dimensions as three boxes that each need one test. Each may contain many independent assumptions.

**AI harness operationalization**

Every significant assumption gets:

```
dimension:
  - desirability
  - feasibility
  - viability

```

The system should flag opportunities where one dimension contains almost no evidence.

\-------------------------------------------------------------------------------- 

# 3\. Assumption Mapping

**Classification:** Assumption rule **Attribution:** **High confidence — Book**

**Explanation**

Not every assumption deserves equal testing effort.

The methodology maps assumptions according to roughly two questions:

* **How important is this assumption to the idea succeeding?**
* **How much evidence do we already have for it?**

The dangerous region is therefore:

**important + little evidence**

These assumptions deserve priority.

**Example**

Suppose you have these beliefs:

| Assumption                                   | Importance | Existing evidence |
| -------------------------------------------- | ---------- | ----------------- |
| Contractors receive supplier quotes by email | High       | Strong            |
| Quote extraction can reach usable accuracy   | High       | Low               |
| Contractors want automatic price comparison  | High       | Medium            |
| Contractors prefer a dark-mode interface     | Low        | None              |

Testing dark mode is pointless even though evidence is nonexistent.

The quote-extraction assumption is far more dangerous.

**Evidence produced**

No new evidence; this organizes existing uncertainty.

**Strength of evidence**

N/A.

**Appropriate use**

Before choosing an experiment.

**Misuse**

Prioritizing assumptions purely because they are easy to test.

**AI harness operationalization**

Do **not** let the LLM simply produce a long assumption list.

Require something like:

```
Criticality: critical / material / secondary
Existing evidence: none / weak / moderate / strong

```

Then prioritize:

```
critical + none
critical + weak
material + none
...

```

Avoid fake mathematical precision such as `"risk = 7.43"` unless there is meaningful underlying data. The original logic is primarily comparative.

\-------------------------------------------------------------------------------- 

# 4\. Test the Riskiest Assumption First

**Classification:** Assumption rule **Attribution:** **High confidence — Book**

**Explanation**

The highest-priority experiment should normally attack the assumption whose failure would most seriously damage the idea and for which evidence is weakest.

This differs from testing whatever is easiest.

**Example**

You are considering an AI procurement agent.

You already know from actual workflow observation that price sourcing consumes hours every week.

Possible assumptions:

1. LLM extraction can understand supplier quotes.
2. Companies will allow software to send supplier inquiries.
3. Companies will pay €250/month.
4. Managers like dashboards.

Testing dashboard preferences is nearly worthless.

If customers would never permit automated supplier communication, the entire proposed workflow may collapse. That assumption deserves investigation first.

**Evidence produced**

Depends on the chosen experiment.

**Strength of evidence**

Depends on experiment.

**Appropriate use**

Experiment prioritization.

**Misuse**

Defining "riskiest" as "technically hardest."

Business-model risk can come from desirability, feasibility **or** viability.

**AI harness operationalization**

Ask explicitly:

```
If this assumption is false, what happens?

A. Idea fundamentally breaks
B. Major redesign required
C. Moderate adjustment
D. Minor inconvenience

```

Combine this with existing evidence.

\-------------------------------------------------------------------------------- 

# 5\. Convert Assumptions Into Testable Hypotheses

**Classification:** Hypothesis pattern **Attribution:** **High confidence concept; exact pattern below is synthesis**

**Explanation**

An assumption becomes testable when translated into something observable and falsifiable.

Bad:

Companies want automated procurement.

Better:

Construction companies that prepare at least five supplier-dependent bids per month will initiate an automated quote request when given the option.

Better still:

At least 4 of 10 qualified companies will submit a real upcoming procurement request through a concierge version of the service.

The exact sentence structure is less important than specifying observable behavior.

**Evidence produced**

The hypothesis defines what evidence counts.

**Strength of evidence**

Depends on test.

**Appropriate use**

Immediately before experiment design.

**Misuse**

Writing hypotheses so vague that every result can be interpreted positively.

**AI harness operationalization**

Represent hypotheses as:

```
actor:
context:
expected_behavior:
metric:
success_threshold:
time_window:
assumption_id:

```

\-------------------------------------------------------------------------------- 

# 6\. Define the Success Criteria Before Running the Test

**Classification:** Validation rule **Attribution:** **High confidence — Book/Strategyzer**

**Explanation**

Experiments require a threshold for deciding whether evidence supports or weakens the hypothesis.

Otherwise teams reinterpret disappointing results afterward.

**Example**

Weak:

Put up a landing page and see whether people are interested.

Strong:

Send 200 qualified visitors to the page. Consider the hypothesis supported enough for another test if at least 10 request access.

**Evidence produced**

Quantified experiment result.

**Strength of evidence**

Depends on the underlying behavior.

**Appropriate use**

Almost every validation experiment.

**Misuse**

Choosing the threshold after seeing the result.

**AI harness operationalization**

The harness must reject experiments without:

```
Metric
Threshold
Population
Time window
Decision rule

```

\-------------------------------------------------------------------------------- 

# 7\. Discovery Evidence and Validation Evidence Are Different

**Classification:** Evidence rule **Attribution:** **High confidence — Book**

**Explanation**

The book distinguishes experiments aimed at discovering facts and patterns from experiments intended to validate important assumptions with stronger evidence.

Discovery asks:

What seems to be happening?

Validation increasingly asks:

Will people actually behave as required for this business model to work?

Customer conversations are excellent for discovery.

They usually cannot establish strong evidence for future purchasing or adoption behavior by themselves.

**Example**

Interview:

"Yes, I'd definitely use something that automatically compares supplier quotes."

Useful for understanding the person's reasoning.

Not strong validation that they will actually use or pay for it.

A stronger next step might be:

Give me the next supplier request you're preparing and I'll process it for you manually.

**Evidence produced**

Discovery produces insights and candidate assumptions.

Validation produces behavioral evidence against explicit assumptions.

**Strength of evidence**

Discovery evidence: usually weak–moderate for demand validation.

**Appropriate use**

Separating problem exploration from proof of business behavior.

**Misuse**

Calling ten enthusiastic interviews "validated demand."

**AI harness operationalization**

Tag evidence as:

```
purpose:
  - discovery
  - validation

```

Never automatically promote a discovery statement into a validated business assumption.

\-------------------------------------------------------------------------------- 

# 8\. Evidence Has Different Strengths

**Classification:** Evidence rule **Attribution:** **High confidence concept; exact ladder below is synthesis**

**Explanation**

A major principle of the book is that evidence varies dramatically in quality.

A useful harness approximation is:

```
OPINION
↓
STATED INTENTION
↓
PAST BEHAVIOR
↓
EXPERIMENTAL BEHAVIOR
↓
COMMITMENT
↓
TRANSACTION / PAYMENT

```

This should **not** be treated as an exact universal hierarchy from the book.

It is a practical synthesis of its emphasis on evidence strength.

Evidence strength is also **assumption-specific**.

A payment may strongly support willingness to pay while saying almost nothing about technical feasibility.

**Example**

"I'd pay €100 for that."

Weak.

Customer gives you an upcoming real procurement task.

Stronger.

Customer signs a paid pilot.

Much stronger evidence concerning willingness to pay.

**Evidence produced**

Different experiments generate different evidence classes.

**Strength of evidence**

Varies.

**Appropriate use**

Comparing experiments.

**Misuse**

Treating all customer feedback as equivalent.

**AI harness operationalization**

Every evidence object should contain:

```
evidence_type:
source:
observed_behavior:
assumption_supported:
strength:
limitations:

```

Critically, strength must be evaluated **relative to the assumption**.

\-------------------------------------------------------------------------------- 

# 9\. Interview Evidence Is Not Purchase Evidence

**Classification:** Evidence rule **Attribution:** **High confidence — consistent with book methodology**

**Explanation**

Interviews can provide strong evidence about:

* existing behavior;
* workflow;
* frequency;
* context;
* current alternatives;
* previous spending;
* past attempts;
* constraints.

They provide much weaker evidence about:

* future purchases;
* willingness to adopt;
* willingness to switch;
* willingness to pay a specific price.

**Example**

Strong interview evidence:

"Last month we prepared 14 bids and I spent two afternoons requesting supplier prices."

That supports the existence and frequency of the workflow.

Weak demand evidence:

"I would absolutely buy an AI procurement agent."

**Evidence produced**

Primarily qualitative evidence.

**Strength of evidence**

High for some existing facts, low for predictions of future behavior.

**Appropriate use**

Opportunity identification and assumption generation.

**Misuse**

Treating interview enthusiasm as product validation.

**AI harness operationalization**

Evidence extraction should separately encode:

```
Observed past behavior
Current behavior
Existing expenditure
Stated future intention
Opinion

```

Do not assign them equal confidence.

\-------------------------------------------------------------------------------- 

# 10\. Willingness to Pay Should Progress Toward Commitment

**Classification:** Evidence rule **Attribution:** **High confidence in principle; ladder is synthesis**

**Explanation**

Questions about theoretical price sensitivity produce weaker evidence than real economic behavior.

Useful progression:

```
price opinion
↓
existing spend
↓
request for quote
↓
budget discussion
↓
letter of intent / commitment
↓
deposit
↓
pre-order
↓
payment

```

Again, this exact ladder should be treated as harness logic rather than a verbatim Bland/Osterwalder framework.

**Example**

"Would you pay €200/month?"

Weak.

"We currently spend €1,500/month of staff time doing this."

Useful viability context.

"I'll pay €300 for you to process the next five tenders."

Strong evidence.

**Evidence produced**

Economic commitment.

**Strength of evidence**

Potentially very strong for desirability/viability.

**Appropriate use**

Pricing and commercial validation.

**Misuse**

Assuming willingness to pay proves retention or scalability.

**AI harness operationalization**

Never output:

```
WTP validated = yes

```

from interview statements alone.

Require actual commitment for high confidence.

\-------------------------------------------------------------------------------- 

# 11\. Choose Experiments Based on the Assumption

**Classification:** Experiment-selection rule **Attribution:** **High confidence — Book**

**Explanation**

There is no inherently "best experiment."

The experiment must fit the uncertainty.

Examples:

| Unknown                                | Better experiment         |
| -------------------------------------- | ------------------------- |
| Does this workflow occur?              | interview / observation   |
| Will users click this capability?      | fake door                 |
| Can they understand the interface?     | prototype                 |
| Will they hand over real work?         | concierge                 |
| Will they pay?                         | pre-sale / paid pilot     |
| Can the technology perform adequately? | technical prototype/spike |

**Evidence produced**

Assumption-specific.

**Strength of evidence**

Depends on experiment.

**Appropriate use**

All experiment selection.

**Misuse**

Using interviews for every uncertainty because interviews are cheap.

**AI harness operationalization**

Experiments must be selected **after** an assumption is chosen.

Never:

```
Opportunity → experiment library

```

Instead:

```
Opportunity
→ assumptions
→ riskiest assumption
→ required evidence
→ candidate experiment

```

\-------------------------------------------------------------------------------- 

# 12\. Choose the Cheapest Experiment That Produces Meaningful Evidence

**Classification:** Experiment-selection rule **Attribution:** **High confidence — central book logic**

**Explanation**

Experiments differ in:

* cost;
* preparation effort;
* execution time;
* evidence strength.

The objective is not simply "run the cheapest experiment."

It is:

obtain enough evidence to reduce the current uncertainty without making a larger investment than necessary.

A €50 experiment generating irrelevant evidence is not cheaper than a €500 experiment that resolves the critical uncertainty.

**Example**

Question:

Will contractors give an automated system a real supplier request?

Building a production SaaS platform is unnecessary.

A form + manual concierge workflow may answer the question.

**Evidence produced**

Depends on experiment.

**Strength of evidence**

Should be adequate for the current decision.

**Appropriate use**

Experiment optimization.

**Misuse**

Optimizing exclusively for low cost even when the test cannot falsify the assumption.

**AI harness operationalization**

For candidate experiments compare:

```
setup_cost:
setup_time:
run_time:
evidence_strength:
assumption_fit:

```

Select for **evidence-per-unit-of-investment**, not minimum cost alone.

\-------------------------------------------------------------------------------- 

# 13\. Landing-Page Tests

**Classification:** Experiment-selection rule **Attribution:** **High confidence — Book experiment repertoire**

**Explanation**

A landing page exposes a value proposition and asks visitors to take some measurable action.

Potential actions:

* join waitlist;
* request demo;
* submit contact details;
* start signup;
* request pricing;
* preorder.

**Example**

Landing page:

"Turn supplier quotations into a comparable bid sheet automatically."

Call to action:

Upload your next quotation package.

**Evidence produced**

Interest and conversion behavior.

**Strength of evidence**

Usually **weak to moderate**, depending on the CTA.

Email signup is weaker than submitting real documents or payment details.

**Appropriate use**

Testing positioning, message resonance, channel acquisition, initial interest.

**Misuse**

Concluding:

"20% signup rate means customers will pay."

**AI harness operationalization**

Require identification of:

```
CTA friction level
traffic source
audience quality
conversion denominator

```

Traffic from friends and traffic from qualified buyers are not equivalent evidence.

\-------------------------------------------------------------------------------- 

# 14\. Fake-Door Tests

**Classification:** Experiment-selection rule **Attribution:** **High confidence — Book experiment repertoire**

**Explanation**

Expose an apparent capability before implementing it and observe whether people attempt to use it.

The goal is to measure behavior rather than ask whether someone hypothetically wants the feature.

**Example**

Inside an existing application:

"Automatically request updated supplier prices"

Users can click it, after which they may see:

This capability is currently in early access.

**Evidence produced**

Behavioral evidence of initial interest.

**Strength of evidence**

Usually **moderate**, depending on realism and friction.

**Appropriate use**

Testing feature demand before implementation.

**Misuse**

Treating clicks as equivalent to repeated usage or payment.

**AI harness operationalization**

Record separately:

```
exposure → click → next commitment

```

A click is evidence of curiosity.

It is not automatically evidence of demand.

\-------------------------------------------------------------------------------- 

# 15\. Prototypes

**Classification:** Experiment-selection rule **Attribution:** **High confidence — Book experiment repertoire**

**Explanation**

Prototypes let users interact with a representation of a proposed solution without building the complete underlying system.

They can test:

* comprehension;
* workflow;
* usability;
* perceived utility;
* interaction assumptions.

**Example**

Clickable prototype of a supplier-price comparison screen built from realistic tender data.

**Evidence produced**

Interaction and qualitative usability evidence.

**Strength of evidence**

Usually **moderate** for interaction assumptions.

Weak for willingness to pay unless coupled with stronger behavior.

**Appropriate use**

When the primary uncertainty concerns how the proposed solution should work.

**Misuse**

Showing an impressive prototype, hearing:

"This looks great!"

and declaring product-market fit.

**AI harness operationalization**

Require the system to identify:

What exact assumption requires something visual or interactive?

If no such assumption exists, a prototype may be premature.

\-------------------------------------------------------------------------------- 

# 16\. Concierge Experiments

**Classification:** Experiment-selection rule **Attribution:** **High confidence — Book experiment repertoire / Lean practice**

**Explanation**

Deliver the intended outcome manually rather than building the automation.

The customer experiences the value while humans perform much of the backend work.

This is exceptionally useful for service-like software or agentic workflows.

**Example**

Instead of building a procurement agent:

1. contractor forwards a tender;
2. you manually extract material requirements;
3. you contact suppliers;
4. you consolidate replies;
5. contractor receives the finished comparison.

**Evidence produced**

Evidence about:

* whether users submit real work;
* value of the outcome;
* workflow requirements;
* edge cases;
* repeated usage;
* potentially willingness to pay.

**Strength of evidence**

Often **moderate to strong** for desirability.

**Appropriate use**

When automation is expensive but manual fulfillment is possible.

**Misuse**

Concluding that a labor-intensive concierge service proves automated SaaS economics.

**AI harness operationalization**

Explicitly separate:

```
VALUE VALIDATION
from
DELIVERY FEASIBILITY
from
SCALABLE ECONOMICS

```

\-------------------------------------------------------------------------------- 

# 17\. Pre-Sales

**Classification:** Validation rule **Attribution:** **High confidence — Book experiment repertoire**

**Explanation**

Ask customers to commit financially before the completed product exists.

A pre-sale turns verbal demand into economic behavior.

**Example**

€250 deposit reserves participation in a five-company beta beginning next month.

**Evidence produced**

Actual purchase commitment.

**Strength of evidence**

**Strong** for willingness to pay relative to interview statements or signups.

**Appropriate use**

Testing serious demand and price.

**Misuse**

Assuming several pre-sales prove:

* retention;
* scalable acquisition;
* delivery feasibility;
* long-term economics.

**AI harness operationalization**

Treat real money as strong evidence, but attach evidence only to the assumptions it actually informs.

\-------------------------------------------------------------------------------- 

# 18\. Pilots

**Classification:** Validation rule **Attribution:** **High confidence — Book-compatible experiment**

**Explanation**

A pilot lets real users use the proposed value proposition in a realistic environment for a limited period.

Pilots can test multiple important assumptions simultaneously:

* actual usage;
* workflow integration;
* implementation difficulty;
* organizational adoption;
* measurable value;
* willingness to continue/pay.

**Example**

Three construction companies use a semi-automated procurement system for eight weeks on real tenders.

**Evidence produced**

High-fidelity behavioral and operational evidence.

**Strength of evidence**

Potentially **strong**.

**Appropriate use**

Later in the validation sequence after cheaper uncertainties have already been reduced.

**Misuse**

Starting with pilots because they feel "real."

Pilots can be expensive and slow.

Custom attention may also make an unscalable solution appear successful.

**AI harness operationalization**

Recommend pilots only when important cheaper tests cannot sufficiently resolve the remaining uncertainty.

\-------------------------------------------------------------------------------- 

# 19\. Technical / Feasibility Experiments

**Classification:** Experiment-selection rule **Attribution:** **Book principle; particular implementation is general product practice**

**Explanation**

Some critical assumptions concern whether something can technically or operationally work.

These require evidence from actual execution rather than customer research.

**Example**

Hypothesis:

Supplier PDF quotes can be converted into normalized line-item pricing with ≥95% accuracy on fields required for bid preparation.

Experiment:

Run 100 historical documents through a prototype extraction pipeline.

**Evidence produced**

Technical performance data.

**Strength of evidence**

Potentially **strong** for the narrowly tested feasibility assumption.

**Appropriate use**

When technical capability is genuinely uncertain and critical.

**Misuse**

Building large technical prototypes when customer desirability remains almost completely unknown.

**AI harness operationalization**

The harness should be allowed to say:

"Do not conduct another customer interview. This uncertainty now requires a technical experiment."

\-------------------------------------------------------------------------------- 

# 20\. Sequence Experiments From Cheap Learning Toward Stronger Evidence

**Classification:** Experiment-selection rule **Attribution:** **High confidence — Book**

**Explanation**

Early experiments should reduce uncertainty cheaply.

As confidence grows and the remaining decisions become more consequential, stronger and usually more expensive experiments become justified.

One possible progression:

```
interviews
→ observation
→ landing page / fake door
→ prototype
→ concierge
→ pre-sale
→ paid pilot
→ real product behavior

```

This is a **synthesis**, not a mandatory book sequence.

The correct sequence depends on the assumption.

**Example**

It makes little sense to run a six-month pilot before establishing that anyone cares about the underlying problem.

Conversely, after customers repeatedly submit actual work, conducting another 30 generic interviews may add little.

**Evidence produced**

Progressively stronger evidence.

**Strength of evidence**

Increasing where appropriate.

**Appropriate use**

Portfolio-level experiment planning.

**Misuse**

Treating the sequence above as a mandatory funnel.

**AI harness operationalization**

After each experiment ask:

What uncertainty remains that blocks the next meaningful commitment?

That determines the next test.

\-------------------------------------------------------------------------------- 

# 21\. Maximize Learning Velocity, Not Activity

**Classification:** Principle **Attribution:** **High confidence — Book theme**

**Explanation**

The objective of experimentation is not to run many experiments.

It is to reduce important uncertainty quickly.

Ten low-value experiments may produce less progress than one well-targeted experiment.

**Example**

Weak learning:

* logo test;
* landing-page headline A/B test;
* color experiment;
* pricing survey.

Meanwhile nobody has tested whether customers will submit an actual procurement job.

**Evidence produced**

Depends on experiment.

**Strength of evidence**

N/A.

**Appropriate use**

Prioritization.

**Misuse**

Using number of experiments as the team's success metric.

**AI harness operationalization**

Measure something closer to:

```
critical assumptions resolved

```

rather than:

```
experiments completed

```

\-------------------------------------------------------------------------------- 

# 22\. Triangulate Important Claims

**Classification:** Evidence rule **Attribution:** **Medium confidence — book-consistent, broader research/testing practice**

**Explanation**

Critical decisions should rarely depend on one isolated piece of evidence.

Different tests reveal different failure modes.

For example:

* interviews show existing pain;
* concierge use shows willingness to change behavior;
* payment shows commercial commitment.

Together they tell a much stronger story than any one signal alone.

**Evidence produced**

Independent corroboration.

**Strength of evidence**

Stronger when different experiment mechanisms point toward the same conclusion.

**Appropriate use**

Critical assumptions.

**Misuse**

Running ten versions of essentially the same weak survey and calling that triangulation.

**AI harness operationalization**

Maintain:

```
assumption
├── evidence item A
├── evidence item B
└── evidence item C

```

Prefer independent evidence mechanisms.

\-------------------------------------------------------------------------------- 

# 23\. Continue, Change, or Stop Based on Evidence

**Classification:** Validation rule **Attribution:** **High confidence principle; exact labels are broader Lean terminology**

**Explanation**

Experiments should cause decisions.

Possible outcomes:

**Continue**

Evidence sufficiently supports the assumption to justify testing the next uncertainty.

**Change**

Evidence suggests the opportunity may remain valuable but the assumption, segment, solution, price, channel, or business model needs revision.

**Stop**

A critical assumption has been convincingly falsified and no credible adaptation remains attractive.

**Example**

A paid concierge test reveals:

* customers highly value consolidated supplier quotations;
* nobody wants software sending messages autonomously.

Correct conclusion:

Not necessarily "procurement automation failed."

Instead:

The autonomous communication assumption failed. Human-approved sending may need testing.

**Evidence produced**

Decision.

**Strength of evidence**

Depends on preceding tests.

**Appropriate use**

Every meaningful experiment.

**Misuse**

Continuing automatically because the team has invested effort.

**AI harness operationalization**

Every experiment must end in:

```
decision:
  - continue
  - modify
  - stop
reason:
new_assumptions:
next_unknown:

```

\-------------------------------------------------------------------------------- 

# 24\. Anti-pattern: Building the Product as the Experiment

**Classification:** Anti-pattern **Attribution:** **High confidence — core philosophy of the book**

**Explanation**

Building a finished product is often an extraordinarily expensive way to discover that an assumption was wrong.

**Example**

Six months building supplier-integration infrastructure before determining whether contractors will allow automated supplier outreach.

**Evidence produced**

Potentially strong evidence eventually, but at unnecessarily high cost.

**Strength of evidence**

Can be strong, but economically irrational.

**Appropriate use**

Only when the implementation itself is the irreducible uncertainty.

**Misuse**

Calling normal product development "experimentation."

**AI harness operationalization**

Whenever an experiment proposal requires substantial production development, ask:

Can the same assumption be tested without building this?

\-------------------------------------------------------------------------------- 

# 25\. Anti-pattern: Testing the Easy Assumption

**Classification:** Failure mode **Attribution:** **High confidence — consequence of assumption mapping**

**Explanation**

Teams naturally prefer experiments that are safe, interesting, easy, or within their skill set.

That is precisely why assumption mapping matters.

**Example**

Developer tests whether OCR can extract quotation PDFs because that is technically interesting.

The fatal assumption — whether anyone will pay — remains untouched.

**Evidence produced**

Real but strategically low-value evidence.

**Strength of evidence**

Irrelevant to the critical uncertainty.

**Appropriate use**

N/A.

**Misuse**

Confusing technical progress with risk reduction.

**AI harness operationalization**

Before recommending an experiment, the AI must explicitly state:

"If this experiment succeeds, which major uncertainty disappears?"

If the answer is insignificant, deprioritize it.

\-------------------------------------------------------------------------------- 

# 26\. Anti-pattern: Vanity and Proxy Metrics

**Classification:** Anti-pattern **Attribution:** **Book/Lean practice**

**Explanation**

Metrics can look impressive while failing to test the actual assumption.

Examples:

* page views;
* likes;
* vague positive feedback;
* email opens;
* waitlist numbers without qualification.

These may be useful operational measurements but weak validation signals.

**Example**

1,000 page views and 80 signups sound promising.

But if none will upload a real tender document, the core workflow may still be unsupported.

**Evidence produced**

Usually indirect evidence.

**Strength of evidence**

Weak unless tightly connected to the hypothesis.

**AI harness operationalization**

For every metric ask:

What customer behavior does this metric represent, and why would that behavior make the assumption more likely to be true?

\-------------------------------------------------------------------------------- 

# 27\. Failure Mode: Moving the Goalposts

**Classification:** Failure mode **Attribution:** **Strongly consistent with experiment methodology; broader scientific/Lean practice**

**Explanation**

Teams often reinterpret failure after seeing the result.

Expected:

20% conversion.

Actual:

4%.

Post-hoc explanation:

Four percent is actually pretty good.

This destroys falsifiability.

**Evidence produced**

Corrupted interpretation.

**Strength of evidence**

Low because the decision criterion was modified.

**AI harness operationalization**

Lock the hypothesis and threshold before recording results.

The AI may challenge the threshold beforehand but should not silently rewrite it afterward.

\-------------------------------------------------------------------------------- 

# 28\. Failure Mode: Treating Low-Friction Behavior as Strong Demand

**Classification:** Failure mode **Attribution:** **Synthesis from evidence-strength methodology**

**Explanation**

Behavior matters, but not all behavior requires meaningful commitment.

Clicks are better evidence than opinions in some contexts, but clicking a button costs almost nothing.

**Example**

500 people click:

"AI procurement assistant."

Only two agree to upload an actual procurement package.

The second behavior is much more diagnostic.

**Evidence produced**

Behavioral evidence of varying strength.

**Strength of evidence**

Dependent on friction/commitment.

**AI harness operationalization**

Record the **cost to the participant**:

```
0 = passive
1 = click
2 = contact details
3 = workflow effort
4 = reputational/organizational commitment
5 = money

```

That numerical scale is an **implementation heuristic**, not a Bland/Osterwalder framework.

\-------------------------------------------------------------------------------- 

# The transition the harness should implement

This is the central transformation I would encode.

```
INTERVIEW EVIDENCE
        ↓
    OPPORTUNITY
        ↓
      UNKNOWNS
        ↓
     ASSUMPTIONS
        ↓
 ┌───────────────┐
 │ DESIRABILITY  │
 │ FEASIBILITY   │
 │ VIABILITY     │
 └───────────────┘
        ↓
 ASSUMPTION MAPPING
 importance × evidence
        ↓
 RISKIEST ASSUMPTION
        ↓
 TESTABLE HYPOTHESIS
        ↓
 REQUIRED EVIDENCE
        ↓
 CANDIDATE EXPERIMENTS
        ↓
 cheapest experiment
 capable of producing
 meaningful evidence
        ↓
 PREDEFINED THRESHOLD
        ↓
     RUN TEST
        ↓
   OBSERVE EVIDENCE
        ↓
 UPDATE ASSUMPTION
        ↓
 CONTINUE / CHANGE / STOP
        ↓
 NEXT RISKIEST UNKNOWN

```

There is an important architectural distinction here.

### Interviews produce opportunities, not automatically assumptions about solutions

Example interview evidence:

Six contractors independently describe waiting for supplier prices as a recurring source of bid delays.

Opportunity:

Reduce coordination effort and delay involved in obtaining current supplier pricing.

Now derive unknowns:

```
Would companies change their workflow?
Would suppliers cooperate?
Can quotes be normalized?
Would users trust consolidated prices?
Would businesses pay enough?
Can the service be delivered economically?

```

Those become assumptions.

Only then should experiment design begin.

\-------------------------------------------------------------------------------- 

# Suggested harness data model

A useful abstraction would be:

```
opportunity:
  description:
  supporting_evidence:
  affected_actor:
  context:
  severity:
  frequency:

unknowns:
  - question:

assumptions:
  - id:
    dimension: desirability | feasibility | viability
    statement:
    criticality: critical | material | secondary
    existing_evidence:
    evidence_strength: none | weak | moderate | strong
    status: untested | supported | weakened | falsified

hypothesis:
  assumption_id:
  actor:
  behavior:
  context:
  metric:
  threshold:
  timeframe:

experiment:
  assumption_id:
  method:
  cost:
  setup_time:
  run_time:
  expected_evidence_strength:
  success_criteria:

result:
  observations:
  metric_result:
  evidence_strength:
  limitations:

decision:
  outcome: continue | modify | stop
  assumption_update:
  new_unknowns:
  next_assumption:

```

The crucial relationship is:

```
Evidence → assumption

```

not merely:

```
Evidence → idea

```

This preserves traceability.

\-------------------------------------------------------------------------------- 

# Evidence-strength model for the harness

I would **not** teach the model a simplistic universal rule such as:

interviews weak, experiments strong.

That is too crude.

Instead evaluate evidence across several dimensions.

| Dimension    | Question                                                                |
| ------------ | ----------------------------------------------------------------------- |
| Directness   | Does this directly test the assumption?                                 |
| Behavior     | Did the person actually do something?                                   |
| Commitment   | Did it cost time, money, effort, reputation, or organizational capital? |
| Realism      | Was the situation close to real usage?                                  |
| Population   | Were these actual target customers?                                     |
| Repetition   | Did the behavior occur repeatedly?                                      |
| Independence | Has another evidence mechanism corroborated it?                         |

This part is primarily **harness synthesis**, not a named scoring model from the book.

It is nevertheless much closer to Bland/Osterwalder's logic than assigning confidence based merely on number of interviews.

\-------------------------------------------------------------------------------- 

# Critical separation from The Mom Test

The two methodologies should not be collapsed.

**The Mom Test** helps answer:

How do I obtain reliable evidence from conversations?

**Testing Business Ideas** helps answer:

Given what I currently believe, what uncertainty should I test next and what experiment can produce sufficient evidence?

Your system therefore wants approximately:

```
Mom Test
Portigal
Deploy Empathy
Torres
JTBD
    ↓
DISCOVERY ENGINE
    ↓
opportunities + evidence
    ↓
Testing Business Ideas
    ↓
VALIDATION ENGINE
    ↓
assumptions + experiments + decisions

```

That boundary is important.

\-------------------------------------------------------------------------------- 

# What belongs specifically to Bland/Osterwalder vs broader Lean thinking

### Confidently attributable to *Testing Business Ideas*

* treating ideas as assumptions to be tested;
* desirability / feasibility / viability;
* making assumptions explicit;
* assumption mapping;
* prioritizing important assumptions with little evidence;
* explicit hypotheses;
* experiment design;
* differing evidence strengths;
* matching experiments to uncertainties;
* comparing experiments on cost/time/evidence characteristics;
* discovery versus validation experimentation;
* systematically progressing from assumptions to evidence;
* extensive experiment repertoire including prototypes, pre-sales, landing pages and related techniques;
* reducing risk through experimentation before scaling investment.

### Shared with wider Strategyzer work

* test-card/learning-card style thinking;
* business-model hypothesis testing;
* value proposition testing;
* desirability/feasibility/viability framing;
* explicit success criteria;
* evidence-based business-model iteration.

### Broader Lean Startup / experimentation practice rather than uniquely this book

* "build-measure-learn" framing;
* MVP terminology;
* pivot/persevere language;
* concierge MVP terminology;
* innovation accounting;
* generic A/B testing;
* lean analytics;
* avoiding vanity metrics;
* general scientific-method principles.

### Harness-specific synthesis I would add

* explicit evidence provenance;
* evidence-to-assumption traceability;
* commitment scoring;
* automatic generation of unknowns;
* ordinal assumption criticality;
* experiment/evidence-fit scoring;
* separating opportunity confidence from solution confidence;
* preventing interview enthusiasm from upgrading commercial confidence;
* requiring the AI to explain what uncertainty disappears if an experiment succeeds.

These additions are compatible with the book but should **not** be represented as quotations or canonical Bland/Osterwalder constructs.

\-------------------------------------------------------------------------------- 

# Canonical Evidence and Experiment Rules for the Harness

1. **Treat every business idea as a bundle of assumptions until evidence supports otherwise.**
2. **Never move directly from opportunity to build decision.** Insert unknowns, assumptions, hypothesis, and experiment selection.
3. **Classify assumptions as desirability, feasibility, or viability.**
4. **Ask "What must be true?" repeatedly until the major business-model dependencies are explicit.**
5. **Prioritize assumptions by importance and existing evidence.**
6. **Test critical assumptions with little evidence before secondary assumptions.**
7. **Do not confuse technical difficulty with business risk.**
8. **Turn each important assumption into a falsifiable hypothesis.**
9. **Specify the actor, behavior, context, metric, threshold, and time window whenever possible.**
10. **Define success/failure criteria before seeing experiment results.**
11. **Select experiments only after identifying the assumption being tested.**
12. **Choose the cheapest experiment capable of producing sufficiently strong evidence.**
13. **Do not choose the cheapest experiment if its evidence cannot change the decision.**
14. **Match evidence type to assumption type.**
15. **Treat interviews primarily as discovery evidence unless they contain actual historical behavior or commitments relevant to the assumption.**
16. **Do not treat stated future intention as equivalent to future behavior.**
17. **Do not treat stated willingness to pay as payment evidence.**
18. **Past behavior is generally more informative than hypothetical future behavior.**
19. **Observed experimental behavior is generally stronger than verbal enthusiasm when testing behavioral assumptions.**
20. **Commitments involving meaningful time, effort, reputation, data, workflow disruption, or money strengthen evidence.**
21. **Actual payment is strong evidence for willingness to pay, but does not validate retention, feasibility, or scalable economics.**
22. **A landing-page signup proves only the behavior required by that signup.**
23. **A fake-door click demonstrates interest, not necessarily adoption.**
24. **A prototype can validate interaction assumptions without validating commercial demand.**
25. **A concierge test can validate value before automation exists.**
26. **A successful concierge test does not automatically validate scalable delivery economics.**
27. **Pre-sales and paid pilots provide much stronger commercial evidence than compliments or surveys.**
28. **Use expensive pilots only after cheaper experiments have reduced earlier uncertainty where possible.**
29. **Building a production system should rarely be the first experiment.**
30. **Do not test easy assumptions simply because they are convenient.**
31. **Do not use experiment count as a proxy for learning.**
32. **Measure progress by important uncertainty removed.**
33. **Treat evidence strength as assumption-specific rather than universal.**
34. **Maintain provenance: every evidence item must identify what assumption it supports or contradicts.**
35. **Allow contradictory evidence. Never force all observations into one conclusion.**
36. **Prefer independent evidence mechanisms for critical assumptions.**
37. **Do not silently move success thresholds after observing results.**
38. **After every experiment, explicitly update the tested assumption.**
39. **Every experiment must terminate in a decision: continue, modify, stop, or gather stronger evidence.**
40. **Every decision should expose the next riskiest unresolved assumption.**
41. **Opportunity confidence, solution confidence, and business-model confidence must remain separate.**
42. **The harness must be able to recommend "do not build yet."**
43. **The harness must also be able to recommend "stop interviewing; this now requires behavioral, commercial, or technical evidence."**
44. **The final optimization target is not maximum validation. It is minimum remaining uncertainty necessary to justify the next investment.**

The core algorithm can therefore be reduced to:

**Find what must be true → find what matters most → find what you know least about → define observable evidence → obtain that evidence as cheaply as possible → update the belief → repeat.**

That is the part of *Testing Business Ideas* I would give very high weight in the downstream synthesis of your interviewing and opportunity-validation harness.


