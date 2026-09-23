Below is the extraction I would use for the discovery harness. I’m treating **Kalbach as a synthesizer and operationalizer of JTBD rather than assuming every technique in the book originated with him**.

I’ll use three provenance labels:

* **[KALBACH]** — clearly part of Kalbach’s treatment or framing in *The Jobs To Be Done Playbook*.
* **[JTBD]** — broader JTBD/ODI material that Kalbach incorporates or builds on; do not attribute its invention to him.
* **[HARNESS]** — implementation guidance I am deriving for your AI interviewer.

\-------------------------------------------------------------------------------- 

# 1\. Principle — Discover the job, not the current solution

**Provenance:** [KALBACH] + [JTBD]

### Name

**Separate what people are trying to accomplish from how they currently accomplish it**

### Explanation

The fundamental analytical move is to describe customer needs independently of products, software, vendors, and current process implementations.

A customer saying:

“We use Outlook, Excel, and phone calls to prepare quotations.”

has described a **solution configuration**, not yet the job.

The interviewer needs to move downward from the tools into the purpose:

* Why is Outlook being used?
* Why Excel?
* Why phone calls?
* What is the person ultimately trying to produce or achieve?
* What must happen successfully regardless of which tools are used?

The job should remain meaningful even if Outlook, Excel, and phones disappeared tomorrow.

### Small-business example

Surface:

“We keep a spreadsheet of subcontractors.”

Underlying job might be:

“Identify suitable subcontractors for a project.”

Or, depending on evidence:

“Select subcontractors capable of fulfilling the required work within project constraints.”

### Bad formulation

“Manage subcontractors in Excel.”

This contaminates the job with the existing solution.

Also bad:

“Use software to improve subcontractor management.”

This has already jumped to a proposed solution.

### Evidence needed

The interviewer should establish:

* what event triggers the activity;
* what result must exist when the activity is complete;
* what information is required;
* what decisions are made;
* what constraints matter;
* what happens if the activity fails.

### AI harness representation

```
surface_behavior:
  tools: [Excel]
  activity: "maintains subcontractor spreadsheet"

candidate_job:
  verb: "identify"
  object: "suitable subcontractors"
  context: "for a specific construction project"

solution_independence: high
evidence_refs: [...]

```

\-------------------------------------------------------------------------------- 

# 2\. Job definition rule — Define a job as progress or accomplishment

**Provenance:** [KALBACH] + broader [JTBD]

### Name

**A job describes something the performer is trying to get done**

### Explanation

A job should capture an intended accomplishment rather than a feature, product category, or abstract preference.

In practical business discovery, the safest interpretation is:

A job is something a person or organization is trying to accomplish under particular circumstances.

Kalbach’s treatment spans different JTBD traditions, so you should not force all jobs into Christensen-style “hire a product” language. For your harness, the operational definition should be broader and more precise.

### Small-business example

A construction estimator needs to:

“Determine the expected cost of completing a proposed project.”

They might currently use:

* PDFs,
* ORCA,
* email,
* phone,
* supplier portals,
* Excel.

Those are implementations of the job.

### Bad formulation

“Needs an estimating platform.”

That is a product requirement, not a job.

### Evidence needed

The interviewee should be able to describe:

* the starting condition;
* the desired end state;
* concrete actions taken;
* success/failure;
* recurring circumstances.

### AI harness representation

```
job:
  performer: "estimator"
  accomplishment: "determine expected project cost"
  trigger: "request for quotation received"
  end_state: "cost basis sufficiently reliable to prepare customer offer"

```

\-------------------------------------------------------------------------------- 

# 3\. Job definition rule — Identify the job performer

**Provenance:** [KALBACH], strongly related to ODI terminology [JTBD]

### Name

**Explicitly identify who performs the job**

### Explanation

The person buying a solution, approving it, using it, and benefiting from it may not be the same person.

The **job performer** is the actor actually trying to accomplish the job being studied.

This distinction becomes essential in B2B interviews.

### Small-business example

For construction quoting:

* Owner: approves final quotation.
* Estimator: performs most estimation work.
* Project manager: contributes quantities/specification.
* Supplier: provides prices.
* Office administrator: gathers documents.

The job:

“Determine the expected procurement cost for a project”

may primarily belong to the estimator even though the owner buys the software.

### Bad formulation

“The construction company needs quotes faster.”

It obscures the actor.

### Evidence needed

Ask:

* Who actually does this?
* Who initiates it?
* Who supplies information?
* Who makes decisions?
* Who approves the result?
* Who suffers when it goes wrong?

### AI harness representation

```
actors:
  performer: "estimator"
  approver: "owner"
  contributors:
    - project_manager
    - supplier
  beneficiary: "company"

```

Do not collapse all actors into `"customer"`.

\-------------------------------------------------------------------------------- 

# 4\. Job definition rule — Use a solution-independent job statement

**Provenance:** [KALBACH] incorporating [JTBD]/ODI conventions

### Name

**Express jobs as verb + object + relevant context**

### Explanation

A useful job statement describes the accomplishment concisely.

An ODI-influenced pattern commonly used in JTBD work is approximately:

**verb + object + contextual qualifier**

The exact wording should remain neutral regarding solutions and performance criteria.

### Small-business example

Good:

“Determine the materials required for a construction project.”

Good:

“Obtain current supplier prices for required materials.”

Good:

“Prepare a commercially viable quotation for a prospective project.”

### Bad formulation

“Automatically retrieve supplier prices.”

“Automatically” specifies a solution property.

Also bad:

“Quickly prepare accurate quotations.”

“Quickly” and “accurate” are outcome criteria and should generally be represented separately.

### Evidence needed

The interviewer needs evidence for:

* actual action;
* object acted upon;
* meaningful context.

### AI harness representation

Separate the job from its desired outcomes:

```
job_statement:
  verb: "obtain"
  object: "supplier prices"
  context: "for materials required by a proposed construction project"

outcomes:
  - "minimize time required to obtain current prices"
  - "minimize likelihood that an outdated price is used"

```

This separation is critical.

\-------------------------------------------------------------------------------- 

# 5\. Principle — Keep job and outcome separate

**Provenance:** [KALBACH] + strongly [JTBD]/ODI

### Name

**The job describes what is being accomplished; outcomes describe how well**

### Explanation

Users frequently mix the two:

“We need to prepare accurate offers quickly.”

There are really two layers:

**Job**

Prepare a quotation.

**Desired outcomes**

Reduce preparation time.

Reduce pricing mistakes.

Reduce omissions.

Increase confidence in cost assumptions.

This distinction makes opportunity discovery much cleaner.

### Small-business example

Job:

“Schedule workers across active construction sites.”

Outcomes:

* minimize unstaffed shifts;
* minimize scheduling conflicts;
* minimize time spent revising schedules;
* minimize travel inefficiency;
* minimize delay in communicating changes.

### Bad formulation

“Efficiently manage workers.”

Too vague, and performance is mixed into the job itself.

### Evidence needed

Ask:

* What makes this difficult?
* What mistakes matter?
* What takes too long?
* What makes you nervous?
* How do you know you've done it properly?

### AI harness representation

```
job:
  statement: "schedule workers across active projects"

desired_outcomes:
  - metric: "time"
    direction: minimize
    object: "time required to revise schedule"

  - metric: "likelihood"
    direction: minimize
    object: "worker assigned to conflicting locations"

```

\-------------------------------------------------------------------------------- 

# 6\. Outcome rule — Desired outcomes must be measurable conceptually

**Provenance:** [KALBACH] drawing heavily from ODI [JTBD]

### Name

**Translate vague needs into measurable success criteria**

### Explanation

Statements such as:

“It should be easier.”

“I want better visibility.”

“We need it more organized.”

are poor analytical endpoints.

They should be decomposed into dimensions that could theoretically improve or deteriorate.

Typical outcome dimensions include:

* time;
* likelihood;
* number/frequency;
* effort;
* cost;
* errors;
* predictability;
* completeness.

The interviewer does not necessarily need numerical measurements. The criterion merely needs to be conceptually measurable.

### Small-business example

Raw:

“Getting supplier prices is a mess.”

Possible outcomes:

Minimize the time required to collect all required supplier prices.

Minimize the likelihood of using an expired price.

Minimize the number of suppliers that must be contacted before sufficient pricing information is available.

### Bad formulation

“Make procurement better.”

### Evidence needed

Evidence of:

* what constitutes failure;
* what creates delay;
* what gets checked;
* what gets corrected;
* what matters to the customer.

### AI harness representation

Store raw statement and normalized interpretation separately.

```
raw_evidence:
  "Getting supplier prices is a mess."

normalized_outcomes:
  - candidate: "minimize supplier-response waiting time"
    confidence: 0.72

  - candidate: "minimize missing price information"
    confidence: 0.61

```

The AI should **not silently turn guesses into facts**.

\-------------------------------------------------------------------------------- 

# 7\. Principle — Jobs contain functional, emotional, and social dimensions

**Provenance:** broader [JTBD], incorporated into Kalbach’s treatment

### Name

**Do not reduce jobs to functional mechanics**

### Explanation

A person can simultaneously be trying to accomplish:

**Functional progress**

Get the quotation completed correctly.

**Emotional progress**

Feel confident that nothing important was missed.

**Social progress**

Appear competent and reliable to the client.

These dimensions are analytically distinct.

Your harness should not treat emotional statements as noise because they often indicate strong commercial value.

### Small-business example

A construction owner sending a €400,000 quotation may want to:

Functional:

determine a profitable price.

Emotional:

feel confident that the company is not accidentally underpricing the project.

Social:

appear professional and credible to the general contractor.

### Bad formulation

“The job is to feel good about quotations.”

That ignores the underlying functional job.

### Evidence needed

Functional evidence:

* actions;
* outputs;
* decisions.

Emotional evidence:

* anxiety;
* confidence;
* frustration;
* fear;
* relief.

Social evidence:

* reputation;
* appearing competent;
* avoiding embarrassment;
* signaling professionalism.

### AI harness representation

```
job_dimensions:
  functional: [...]
  emotional:
    personal:
      - "feel confident quote is economically safe"
  social:
      - "appear reliable to client"

```

Do not automatically turn every emotion into a separate job.

\-------------------------------------------------------------------------------- 

# 8\. Context rule — Circumstances are part of understanding demand

**Provenance:** [KALBACH] + broader [JTBD]

### Name

**Jobs occur under circumstances, not in isolation**

### Explanation

The same nominal job may behave completely differently depending on circumstances.

For example:

“Prepare a quotation”

is different when:

* the deadline is tomorrow;
* supplier prices are volatile;
* the customer sent incomplete plans;
* the project contains unfamiliar trades;
* it is a repeat project;
* the estimator already has reliable historical prices.

Context can expose where unmet needs emerge.

### Small-business example

A construction firm may tolerate manual quotation preparation when handling two offers per month but experience serious pain when bidding on ten simultaneously.

The job has not changed.

The circumstances have.

### Bad formulation

“Quoting is painful for construction companies.”

That is too universal.

### Evidence needed

Capture:

* triggering event;
* frequency;
* deadline;
* project size;
* complexity;
* uncertainty;
* volume;
* exceptions;
* dependencies.

### AI harness representation

```
context:
  trigger: "customer RFQ"
  deadline_days: 3
  project_complexity: high
  supplier_dependency: high
  price_volatility: medium

```

Context should be linked to individual episodes whenever possible.

\-------------------------------------------------------------------------------- 

# 9\. Interview technique — Anchor interviews in actual episodes

**Provenance:** compatible with [KALBACH] and broader JTBD; also strongly overlaps other interview methodologies

### Name

**Ask about the last time the job was performed**

### Explanation

General statements often describe an idealized process.

Actual episodes reveal:

* true sequence;
* actual tools;
* exceptions;
* missing information;
* workarounds;
* coordination;
* decisions.

Rather than:

“How do you normally prepare quotations?”

prefer moving toward:

“Think about the most recent quotation you prepared. What started it?”

Then reconstruct events.

### Small-business example

The interviewee says:

“We normally get prices from our suppliers.”

Episode-level probing reveals:

* five suppliers were emailed;
* two did not reply;
* one price came by phone;
* one came as a PDF;
* the estimator copied figures into Excel;
* a colleague remembered an old discount;
* the final offer went out late.

That is vastly more useful.

### Bad formulation

“Would automated supplier-price collection help you?”

### Evidence needed

A named or identifiable real episode with:

* time;
* trigger;
* actors;
* actions;
* artifacts;
* outcome.

### AI harness representation

```
episode_id: quote_2026_09_x

job_instance:
  trigger: ...
  steps: [...]
  artifacts: [...]
  exceptions: [...]
  outcome: ...

```

Keep episode evidence separate from generalized claims.

\-------------------------------------------------------------------------------- 

# 10\. Interview technique — Repeatedly ask purpose questions

**Provenance:** [KALBACH]/JTBD-compatible; implementation pattern partly [HARNESS]

### Name

**Move from activity to underlying purpose**

### Explanation

When someone describes an activity, the interviewer should determine why it exists.

Example:

“Then I put everything into Excel.”

Probe:

What are you trying to accomplish at that point?

Answer:

“I need to compare the suppliers.”

Now the job is moving from:

use Excel

toward:

compare supplier offers.

Probe further:

What are you trying to determine from the comparison?

Perhaps:

“Which supplier combination gives us the right price without creating delivery risk.”

That exposes a richer job.

### Small-business example

Raw:

“I call the foreman every afternoon.”

Purpose:

“Find out what was completed.”

Higher purpose:

“Determine whether each site is progressing according to plan.”

### Bad formulation

Assuming:

“The problem is too many phone calls.”

The calls may be an implementation symptom rather than the important unmet need.

### Evidence needed

A chain:

```
behavior → immediate purpose → decision → desired progress

```

### AI harness representation

Preserve hierarchy:

```
surface_activity: "call foreman"
enables_job: "collect site progress"
supports_job: "assess project progress"
higher_job: "keep project delivery on plan"

```

\-------------------------------------------------------------------------------- 

# 11\. Job-mapping rule — Decompose the core job into steps

**Provenance:** [KALBACH] adopting established ODI/job-mapping work [JTBD]

### Name

**Map the universal structure of getting the job done**

### Explanation

A job map represents what must happen to complete a job without describing a particular solution.

The well-known ODI job-mapping framework commonly uses phases roughly corresponding to:

**Define → Locate → Prepare → Confirm → Execute → Monitor → Modify → Conclude**

This structure predates Kalbach; his playbook draws on this JTBD tradition.

The important principle for your harness is not memorizing eight labels. It is identifying the **logical stages necessary for successful completion**.

### Small-business example

Core job:

Prepare a quotation for a construction project.

Possible job map:

**Define** Determine scope and quotation requirements.

**Locate** Find quantities, specifications, historical information, supplier options.

**Prepare** Structure cost items and obtain required inputs.

**Confirm** Check completeness and validate assumptions.

**Execute** Calculate costs and construct the commercial offer.

**Monitor** Check whether costs, margins, and requirements remain acceptable.

**Modify** Resolve missing prices or adjust assumptions.

**Conclude** Approve and submit the quotation.

### Bad formulation

```
1. Open Outlook
2. Download PDF
3. Open Excel
4. Call supplier
5. Enter price

```

That is a **workflow map of the existing solution**, not a job map.

### Evidence needed

Across multiple episodes determine:

* what must happen regardless of tool;
* sequence;
* dependencies;
* decisions;
* failure points.

### AI harness representation

```
job_map:
  core_job: "prepare project quotation"

  steps:
    - objective: "determine quotation scope"
    - objective: "obtain required cost inputs"
    - objective: "calculate expected project cost"
    - objective: "validate commercial assumptions"
    - objective: "submit quotation"

```

Store observed workflows separately.

\-------------------------------------------------------------------------------- 

# 12\. Anti-pattern — Do not confuse process mapping with job mapping

**Provenance:** [KALBACH] / [JTBD]

### Name

**Current workflow ≠ underlying job**

### Explanation

This is particularly important for your project.

You absolutely should collect the current workflow.

But that workflow is evidence about the job, not the job itself.

Consider:

```
Email supplier
↓
Wait
↓
Phone supplier
↓
Receive PDF
↓
Copy value into Excel

```

These steps might disappear completely with a new solution.

The deeper structure:

```
identify needed price
↓
obtain credible current price
↓
associate price with cost item
↓
validate applicability

```

is more stable.

### Small-business example

An administrator manually renames PDFs using protocol numbers.

Observed process:

print → stamp/write number → scan → rename → file.

Possible jobs:

* uniquely identify a business document;
* associate a document with a case/project;
* retrieve the document later;
* preserve a traceable document record.

### Bad formulation

“The user's job is renaming PDFs.”

### Evidence needed

Ask what would still have to happen if the current implementation disappeared.

### AI harness representation

Maintain:

```
current_workflow

```

and

```
job_map

```

as two different structures.

Never overwrite one with the other.

\-------------------------------------------------------------------------------- 

# 13\. Job-mapping rule — Find stable steps across different solutions

**Provenance:** [KALBACH]/[JTBD]

### Name

**Abstract from multiple implementations toward stable job structure**

### Explanation

One useful test for a good job step is:

Would someone using a completely different solution still need to accomplish something equivalent?

Suppose Company A phones suppliers.

Company B uses supplier portals.

Company C uses ERP integrations.

All three still need to:

obtain current prices for required items.

That is likely a legitimate job step.

### Small-business example

Different scheduling methods:

* whiteboard;
* WhatsApp;
* Excel;
* construction management software.

Stable underlying steps might include:

* determine required workers;
* understand worker availability;
* assign workers to sites;
* communicate assignment;
* resolve conflicts.

### Bad formulation

“Update the Excel schedule.”

### Evidence needed

Cross-interview comparison of alternative implementations.

### AI harness representation

Calculate a conceptual abstraction:

```
observed_behaviors:
  - "calls supplier"
  - "emails supplier"
  - "checks supplier portal"

normalized_job_step:
  "obtain current supplier price"

supporting_interviews: 7
solution_variants: 3

```

This is a strong use case for AI synthesis.

\-------------------------------------------------------------------------------- 

# 14\. Principle — Jobs exist in hierarchies

**Provenance:** [KALBACH] + broader [JTBD]

### Name

**Capture jobs above and below the focal job**

### Explanation

Jobs can be framed at different levels.

For example:

```
Run a profitable construction company
        ↓
Win profitable construction projects
        ↓
Prepare competitive project quotations
        ↓
Estimate material costs
        ↓
Obtain current supplier prices

```

All are legitimate accomplishments.

But they are not equally useful for product discovery.

Too high:

Run a successful business.

Too low:

Enter a price.

The harness should discover the hierarchy and deliberately select the level being investigated.

### Small-business example

Surface activity:

“Get supplier prices.”

Higher jobs:

estimate project cost

→ prepare profitable quotation

→ win profitable construction work.

### Bad formulation

Collapsing all these into one giant statement:

“Help construction companies make money.”

### Evidence needed

Ask:

What does completing this allow you to do?

and:

What needs to happen in order to accomplish that?

### AI harness representation

```
job_hierarchy:

  higher_job:
    "win profitable construction work"

  focal_job:
    "prepare commercially viable quotation"

  sub_jobs:
    - "estimate material cost"
    - "estimate labor cost"
    - "validate project requirements"

```

\-------------------------------------------------------------------------------- 

# 15\. Job definition rule — Related jobs should be captured without contaminating the core job

**Provenance:** [KALBACH]/broader [JTBD]

### Name

**Distinguish core, supporting, and adjacent jobs**

### Explanation

Customers frequently perform other jobs around the focal job.

For quotation preparation, these might include:

* maintaining supplier relationships;
* maintaining price history;
* qualifying opportunities;
* collecting project documentation;
* negotiating supplier discounts;
* tracking quotation status.

They matter because a strong product opportunity may span several related jobs.

But they should not automatically be merged into the core job.

### Small-business example

Core:

prepare a project quotation.

Related:

decide whether a project is worth bidding on.

Related:

maintain reliable supplier pricing information.

Related:

follow up with customer after submitting bid.

### Bad formulation

“Manage the entire construction company.”

### Evidence needed

Look for activities immediately before, after, or supporting the focal job.

### AI harness representation

```
jobs:
  focal: ...
  related:
    upstream: [...]
    downstream: [...]
    supporting: [...]

```

\-------------------------------------------------------------------------------- 

# 16\. Context rule — Identify triggers and starting conditions

**Provenance:** [KALBACH]/broader [JTBD]

### Name

**Understand when the job becomes active**

### Explanation

A job is often dormant until circumstances cause the customer to act.

Your interviewer should identify the triggering condition.

This is commercially important because triggers tell you **when demand appears**.

### Small-business example

Quotation job trigger:

An architect or general contractor sends an RFQ with plans.

Scheduling job trigger:

New project requirements or worker availability change.

Document filing job trigger:

Incoming invoice or project document arrives.

### Bad formulation

“Companies need quotations.”

True but practically useless.

### Evidence needed

Ask:

* What happened immediately before you started?
* Who requested this?
* Why did it need doing then?
* What would have happened if you ignored it?

### AI harness representation

```
job_trigger:
  event: "RFQ received"
  source: "general contractor"
  urgency: "submission deadline"

```

\-------------------------------------------------------------------------------- 

# 17\. Interview technique — Investigate current alternatives broadly

**Provenance:** [KALBACH] + [JTBD]

### Name

**An alternative is anything currently used to accomplish the job**

### Explanation

Competitors are not limited to companies selling similar software.

For a job like:

coordinate field workers across sites

alternatives might include:

* WhatsApp;
* Excel;
* whiteboard;
* morning meeting;
* phone calls;
* foreman's memory;
* construction ERP;
* doing nothing systematically.

The customer is already allocating resources somehow.

### Small-business example

For procurement-price collection:

Direct software competitor:

procurement platform.

Alternative:

estimator emails three suppliers.

Alternative:

old Excel price list.

Alternative:

calls trusted supplier.

Alternative:

adds a safety margin and guesses.

### Bad formulation

“They have no solution.”

Almost never true.

They may have no software product, but they nearly always have a behavior.

### Evidence needed

Capture:

* current method;
* historical methods;
* fallback method;
* reason for using each;
* switching conditions;
* tradeoffs.

### AI harness representation

```
alternatives:
  - type: manual
    mechanism: email_suppliers

  - type: information_asset
    mechanism: historical_excel_prices

  - type: behavioral_workaround
    mechanism: estimate_plus_buffer

```

This is particularly useful for determining whether a product must beat a real incumbent behavior.

\-------------------------------------------------------------------------------- 

# 18\. Opportunity rule — Look for outcomes that matter and are poorly satisfied

**Provenance:** [KALBACH], heavily influenced by ODI [JTBD]

### Name

**Opportunity exists where important outcomes remain inadequately satisfied**

### Explanation

A job itself is not automatically a product opportunity.

Everyone may perform a job while being perfectly satisfied with the existing solution.

The interesting question is where execution falls short.

Kalbach’s treatment draws on the JTBD/ODI idea of investigating the relationship between:

* importance;
* satisfaction;
* unmet outcomes.

For qualitative discovery, you do not need prematurely precise numerical scoring.

You need evidence that:

1. the outcome matters;
2. existing approaches fail meaningfully;
3. the failure occurs sufficiently often or carries sufficient cost.

### Small-business example

Outcome:

Minimize time required to obtain current material prices.

Evidence:

* estimator spends 4–6 hours per quotation contacting suppliers;
* bids are delayed waiting for responses;
* old prices sometimes get reused;
* project volume makes this recur weekly.

That is stronger than:

“It would be nice if prices were easier to get.”

### Bad formulation

“They use Excel, therefore there is a SaaS opportunity.”

That conclusion is unjustified.

### Evidence needed

Look for:

* frequency;
* time cost;
* money;
* risk;
* delays;
* rework;
* failures;
* workaround investment;
* emotional intensity.

### AI harness representation

```
opportunity:
  outcome: "reduce time obtaining valid supplier prices"

  evidence:
    frequency: weekly
    time_cost: "4-6 hours/quotation"
    consequence: "submission delays"

  confidence: high

```

\-------------------------------------------------------------------------------- 

# 19\. Opportunity rule — Workarounds indicate unmet outcomes, not automatically product demand

**Provenance:** broader [JTBD]; interpretation sharpened for [HARNESS]

### Name

**Treat compensating behavior as evidence**

### Explanation

Customers create workarounds because current solutions do not fully satisfy a requirement.

Examples:

* shadow spreadsheets;
* duplicate data entry;
* phone confirmations;
* screenshots;
* manually maintained lists;
* personal reminders;
* buffers added to prices;
* asking one knowledgeable employee.

These are useful signals.

But a workaround alone does not mean someone will buy your solution.

### Small-business example

The estimator keeps:

`preise_final_NEU_v7.xlsx`

because supplier price information is scattered.

That suggests an unmet information-management outcome.

It does not prove willingness to buy a procurement platform.

### Bad formulation

“They use spreadsheets, therefore spreadsheets are the pain.”

### Evidence needed

Ask:

* Why did you create this?
* What happens without it?
* How much effort does it require?
* Who maintains it?
* Have you tried replacing it?

### AI harness representation

```
workaround:
  behavior: "maintains private supplier-price spreadsheet"
  compensates_for:
    candidate_outcome: "access reliable historical prices"
  effort: ...
  consequence_without: ...

```

\-------------------------------------------------------------------------------- 

# 20\. Outcome rule — Preserve customer language before normalization

**Provenance:** [KALBACH]-compatible qualitative practice; normalization design largely [HARNESS]

### Name

**Raw evidence must survive translation**

### Explanation

JTBD analysis requires transforming messy language into stable job structures.

But normalization creates interpretation risk.

Customer:

“Before I send an offer I basically go through everything three times because I'm always afraid something wasn't included.”

AI normalization:

Minimize the likelihood that required cost items are omitted from a quotation.

That is useful.

But the raw statement contains additional information:

* repeated checking;
* anxiety;
* lack of trust;
* potentially large consequence.

Do not discard it.

### Small-business example

Store both:

```
raw:
"I'm always afraid something wasn't included."

normalized:
"minimize likelihood of missing required cost items"

```

### Bad formulation

Only storing:

“Needs automated quotation validation.”

That skips directly to a feature.

### Evidence needed

Original statement + context.

### AI harness representation

```
evidence:
  raw_quote: ...
  episode: ...
  speaker: ...

interpretation:
  job: ...
  outcome: ...
  confidence: ...

```

Every normalized object should be traceable back to evidence.

\-------------------------------------------------------------------------------- 

# 21\. Synthesis rule — Consolidate linguistic variants without erasing differences

**Provenance:** [KALBACH]-consistent; [HARNESS] implementation

### Name

**Normalize semantically equivalent jobs across interviews**

### Explanation

Different users might say:

“I need supplier quotes.”

“I get prices from wholesalers.”

“I check what the materials will cost.”

“Before quoting I ask three suppliers.”

These may partially represent the same underlying job:

Obtain current material pricing.

AI is particularly well suited to discovering these equivalences.

But normalization must remain conservative.

### Small-business example

Cluster:

```
"call suppliers"
"request price lists"
"check merchant portal"
"email wholesaler"

```

Possible normalized job:

Obtain applicable current prices for required materials.

### Bad formulation

Merging:

obtain prices

and

select supplier

They are related but distinct accomplishments.

### Evidence needed

Compare:

* purpose;
* input;
* output;
* decision;
* end condition.

### AI harness representation

```
normalized_job_id: J-17
variants:
  - interview_4/evidence_23
  - interview_7/evidence_11
  - interview_9/evidence_08

semantic_confidence: 0.88

```

\-------------------------------------------------------------------------------- 

# 22\. Synthesis rule — Separate observed workflow from canonical job map

**Provenance:** [HARNESS], derived directly from JTBD abstraction

### Name

**Maintain two models simultaneously**

This is one of the most important architecture decisions for your harness.

You need:

**Observed workflow**

What Company A actually does today.

And:

**Canonical job structure**

What must be accomplished independently of implementation.

For example:

```
CURRENT WORKFLOW

Receive PDF
→ Email suppliers
→ Call supplier
→ Download offer PDFs
→ Copy prices into Excel
→ Calculate markup
→ Generate quotation
→ Email customer

```

versus:

```
JOB STRUCTURE

Understand quotation requirements
→ Determine required resources
→ Obtain applicable cost inputs
→ estimate project cost
→ determine commercial price
→ validate quotation
→ submit quotation

```

The first is excellent automation material.

The second is strategic product-discovery material.

Do not choose one or the other. You need both.

\-------------------------------------------------------------------------------- 

# 23\. Anti-pattern — Do not convert complaints directly into jobs

**Provenance:** [JTBD] + [HARNESS]

### Name

**“Pain” is evidence about execution, not necessarily the job itself**

### Explanation

Customer:

“Suppliers never answer emails quickly.”

The job is not:

get suppliers to answer emails.

Potential job:

obtain applicable supplier pricing before the quotation deadline.

The complaint identifies an obstacle or poorly satisfied outcome.

### Small-business example

Complaint:

“Excel gets completely chaotic when prices change.”

Possible job:

maintain an accurate cost basis while quotation inputs change.

Potential outcome:

minimize effort required to propagate a changed input throughout the quotation.

### Bad formulation

“Fix chaotic Excel.”

### Evidence needed

Determine:

* what they were trying to accomplish;
* why the complaint prevented it;
* consequence of failure.

### AI harness representation

```
friction:
  statement: "supplier doesn't answer"
  affects_job_step: "obtain supplier price"
  affected_outcome: "time to obtain price"

```

\-------------------------------------------------------------------------------- 

# 24\. Anti-pattern — Do not accept feature requests as jobs

**Provenance:** [KALBACH]/broader JTBD

### Name

**Translate requested features back into desired progress**

### Explanation

Customer:

“It should integrate with Outlook.”

Interviewer:

What would that allow you to do?

Customer:

“Then supplier offers would automatically belong to the correct project.”

Possible job/outcome:

Associate incoming supplier information with the correct quotation.

Feature requests are valuable evidence, but they belong in the **solution layer**.

### Small-business example

Request:

“We need AI reading the PDFs.”

Underlying job may be:

extract relevant supplier prices from incoming quotations.

### Bad formulation

Adding immediately:

```
requirement: AI PDF extraction

```

### Evidence needed

Ask:

* What does that feature enable?
* What happens today?
* What problem disappears?
* What outcome improves?

### AI harness representation

```
solution_request:
  "Outlook integration"

linked_job:
  "associate supplier response with project quotation"

linked_outcome:
  "reduce manual classification effort"

```

\-------------------------------------------------------------------------------- 

# 25\. Context rule — Consumption and surrounding lifecycle can reveal additional jobs

**Provenance:** broader JTBD/ODI-style thinking; not uniquely Kalbach

### Name

**Examine what happens before, during, and after the focal job**

### Explanation

The value chain surrounding a job frequently creates opportunities outside the core execution step.

For a quotation:

Before:

* obtain project documents;
* qualify opportunity;
* determine deadline.

During:

* estimate;
* source prices;
* calculate margin.

After:

* submit;
* answer questions;
* revise quotation;
* negotiate;
* convert winning quote into project plan.

This resembles consumption-chain thinking: obtaining, setting up, using, maintaining, updating, and disposing of a solution can create additional needs.

For your harness, use this mainly as an **adjacency discovery mechanism**.

### Small-business example

The quoting process might reveal that the bigger pain occurs **after acceptance**, when quoted cost structures need to become procurement and project-control data.

### Bad formulation

Automatically expanding interview scope until you map the entire company.

### Evidence needed

Ask:

What happens immediately before this?

What happens once you're finished?

### AI harness representation

```
job_ecosystem:
  upstream_jobs: [...]
  core_job: ...
  downstream_jobs: [...]

```

\-------------------------------------------------------------------------------- 

# 26\. Opportunity rule — Search for repeated failure around specific job steps

**Provenance:** [KALBACH]/JTBD + [HARNESS]

### Name

**Opportunities frequently cluster around one part of the job map**

### Explanation

Broad jobs are usually too large to productize directly.

The useful opportunity might occur around one step.

For example:

```
Prepare quotation

```

contains:

```
Obtain cost inputs

```

which contains:

```
Obtain supplier material prices

```

The pain may overwhelmingly concentrate there.

This is why job mapping improves opportunity detection.

### Small-business example

Interview evidence:

* requirements parsing: 20 minutes;
* quantity calculation: 30 minutes;
* supplier pricing: 5 hours;
* final document generation: 15 minutes.

The job map tells you where to investigate further.

### Bad formulation

“Quotation preparation takes too long, therefore automate quotation preparation.”

### Evidence needed

Associate pain with individual steps.

### AI harness representation

```
job_step:
  "obtain supplier prices"

frictions:
  - supplier response delay
  - inconsistent formats
  - missing items
  - outdated historic prices

evidence_density: high

```

\-------------------------------------------------------------------------------- 

# 27\. Synthesis rule — Preserve job hierarchy while ranking evidence

**Provenance:** [HARNESS]

### Name

**Do not flatten everything into one giant opportunity list**

### Explanation

Your system will eventually collect things like:

```
win profitable work
prepare quotation
estimate material cost
obtain supplier prices
find supplier contact
send price inquiry

```

A naïve LLM might rank these all together.

That is analytically wrong.

They exist at different abstraction levels.

The harness should compare opportunities primarily among comparable job levels.

### Small-business example

Compare:

* obtain current prices;
* estimate labor requirements;
* validate project quantities.

Do not compare those directly against:

operate a profitable construction business.

### Bad formulation

A flat vector database of `"pain points"` with no structural relationship.

### AI harness representation

Every job needs:

```
job_id
parent_job_id
job_level
job_type
performer
evidence
outcomes
frictions

```

\-------------------------------------------------------------------------------- 

# 28\. Interview technique — Determine the job’s completion criterion

**Provenance:** JTBD-compatible; [HARNESS] operationalization

### Name

**Ask how the performer knows the job is done**

### Explanation

Completion criteria help define the real job boundary.

If someone says:

“I collect prices.”

Ask:

When do you consider that finished?

They may respond:

“When I have enough reliable prices to calculate the offer.”

That shows the goal is not collection for its own sake.

### Small-business example

For worker scheduling:

Job isn't complete when names are entered into Excel.

It may be complete when:

* every required site is sufficiently staffed;
* workers have received assignments;
* conflicts are resolved.

### Bad formulation

Assuming the last visible software interaction represents completion.

### Evidence needed

Ask:

What has to be true before you can move on?

### AI harness representation

```
job:
  start_condition: ...
  completion_condition: ...

```

This dramatically improves job boundaries.

\-------------------------------------------------------------------------------- 

# 29\. Synthesis rule — Distinguish jobs, outcomes, pains, solutions, and evidence

**Provenance:** [HARNESS], but essential for implementing Kalbach/JTBD correctly

This should probably become a hard schema constraint.

An AI discovery system should never put all interview statements into one generic `"insights"` bucket.

Use at least:

```
JOB
what the actor is trying to accomplish

JOB_STEP
a component of accomplishing the job

OUTCOME
how the performer evaluates successful execution

CONTEXT
circumstances affecting execution

FRICTION
something making execution difficult

CURRENT_SOLUTION
tool/process currently used

WORKAROUND
behavior compensating for an unmet need

SOLUTION_IDEA
proposed way of improving execution

EVIDENCE
actual interview observation supporting any of the above

```

This taxonomy prevents an enormous amount of discovery garbage.

\-------------------------------------------------------------------------------- 

# Transforming the Outlook + Excel + Phone example

Now take your specific statement:

**“We use Outlook, Excel and phone calls to prepare quotations.”**

An ordinary interviewer may record:

```
Customer uses:
- Outlook
- Excel
- phone

```

A weak product thinker jumps to:

Build an integrated quotation application.

A JTBD-oriented harness should instead progressively decompose it.

## Layer 1 — Current solution

```
Outlook
Excel
Phone calls

```

These are implementations.

\-------------------------------------------------------------------------------- 

## Layer 2 — Observed activities

The interviewer reconstructs what each tool is actually doing.

For example:

```
Outlook
→ receive RFQ
→ send inquiries
→ receive supplier quotations
→ send final offer

Excel
→ list cost items
→ enter supplier prices
→ calculate totals
→ apply margins

Phone
→ clarify requirements
→ chase suppliers
→ confirm prices

```

Still mostly workflow.

\-------------------------------------------------------------------------------- 

## Layer 3 — Tool-independent job steps

Now abstract:

```
understand customer requirements

determine required materials/services

identify missing cost information

obtain applicable supplier prices

compare available sourcing options

estimate project cost

determine commercial price

validate quotation completeness

submit quotation

```

Now you are describing the work.

\-------------------------------------------------------------------------------- 

# Layer 4 — Focal job

A plausible focal job might be:

**Prepare a commercially viable quotation for a prospective project.**

But this must be validated rather than assumed.

Another company might conceptualize the focal job as:

Determine an economically safe price for a proposed project.

Or:

Decide what price to offer for a project.

Those are related but not identical.

The interviewer needs evidence.

\-------------------------------------------------------------------------------- 

# Layer 5 — Higher-level jobs

```
Win profitable construction projects

↓ enables

Prepare commercially viable quotation

↓ requires

Estimate project costs

↓ requires

Obtain reliable cost inputs

```

This hierarchy matters because different product opportunities operate at different layers.

\-------------------------------------------------------------------------------- 

# Layer 6 — Desired outcomes

Now extract what customers are really trying to optimize.

Examples:

```
minimize time required to prepare the quotation

minimize likelihood that required cost items are omitted

minimize likelihood that outdated supplier prices are used

minimize effort required to obtain missing cost information

minimize time spent transferring information between systems

minimize effort required to revise a quotation when an input changes

minimize uncertainty about expected project margin

```

These are much more actionable than:

“They hate Excel.”

\-------------------------------------------------------------------------------- 

# Layer 7 — Circumstances

Add:

```
RFQ deadline
project size
number of trades
price volatility
number of suppliers
availability of historical pricing
quality of project documentation
customer type
quotation complexity

```

You may discover, for example, that quotation preparation is acceptable most of the time but becomes extremely painful when:

```
deadline &lt; 48 hours
AND
supplier inputs &gt; 10
AND
pricing volatility = high

```

That is valuable opportunity information.

\-------------------------------------------------------------------------------- 

# Layer 8 — Emotional and social dimensions

Possible evidence:

```
"I never know if I've forgotten something."

"We've lost money before because the price was wrong."

"I don't want to send some amateur-looking offer."

```

Normalize separately:

**Emotional**

feel confident that the quotation is financially safe.

**Social**

appear professional and reliable to the prospective customer.

Do not merge these into the functional job.

\-------------------------------------------------------------------------------- 

# Layer 9 — Current alternatives

```
Outlook
Excel
phone
old quotations
supplier PDFs
ORCA
supplier websites
colleague knowledge
personal memory
manual buffers

```

Now you have the actual incumbent system your product would have to displace or complement.

\-------------------------------------------------------------------------------- 

# Layer 10 — Candidate opportunity areas

Only after the preceding analysis should the system start generating candidates such as:

```
supplier price acquisition

quotation-input normalization

historical price intelligence

missing-item detection

cost-change propagation

margin/risk validation

quote revision management

supplier-response tracking

quote-to-project handoff

```

Notice how much stronger these are than:

“Build AI quotation software.”

\-------------------------------------------------------------------------------- 

# Recommended representation for your harness

I would make the model output something structurally close to:

```
DiscoveryEpisode
│
├── Performer
│
├── Trigger
│
├── Context
│
│
├── CurrentWorkflow
│   ├── Activity
│   ├── Tool
│   ├── Artifact
│   └── Actor
│
├── Jobs
│   ├── HigherJob
│   ├── FocalJob
│   ├── SubJob
│   └── RelatedJob
│
├── JobMap
│   └── JobStep[]
│
├── DesiredOutcomes
│   ├── Functional
│   ├── Emotional
│   └── Social
│
├── Frictions
│
├── Workarounds
│
├── CurrentAlternatives
│
├── SolutionIdeas
│
└── Evidence
    ├── RawStatement
    ├── EpisodeReference
    ├── InterpretationConfidence
    └── SupportingInterviews

```

The crucial architectural rule is:

```
EVIDENCE ≠ INTERPRETATION

```

and:

```
CURRENT WORKFLOW ≠ JOB MAP

```

and:

```
JOB ≠ OUTCOME ≠ PROBLEM ≠ SOLUTION

```

If your harness enforces those separations, it will avoid a large percentage of the garbage that AI-generated customer research usually produces.

\-------------------------------------------------------------------------------- 

# What is specifically Kalbach vs inherited JTBD machinery

The safest attribution is roughly this:

| Concept                                                                         | Attribution                                                                              |
| ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Organizing discovery around jobs rather than products                           | Core JTBD, central to Kalbach                                                            |
| Jobs as stable descriptions independent of solutions                            | Core JTBD, central to Kalbach                                                            |
| Job performer                                                                   | Strongly present in Kalbach; terminology closely associated with ODI                     |
| Functional/emotional/social aspects                                             | Broader JTBD tradition, used by Kalbach                                                  |
| Job statements                                                                  | JTBD/ODI methodology used and synthesized by Kalbach                                     |
| Job mapping                                                                     | Established ODI/Bettencourt-Ulwick technique used by Kalbach                             |
| Define/Locate/Prepare/Confirm/Execute/Monitor/Modify/Conclude                   | ODI/job-mapping heritage, **not invented by Kalbach**                                    |
| Desired outcomes                                                                | Strong ODI heritage, incorporated into Kalbach's JTBD playbook                           |
| Importance vs satisfaction / unmet outcomes                                     | ODI heritage                                                                             |
| Job hierarchy                                                                   | Broader JTBD concept used in Kalbach's framework                                         |
| Related jobs                                                                    | Broader JTBD / Kalbach synthesis                                                         |
| Current solutions and alternatives                                              | General JTBD logic, incorporated by Kalbach                                              |
| Interviewing concrete job episodes                                              | Compatible with Kalbach/JTBD, but overlaps heavily with broader qualitative interviewing |
| Evidence confidence and provenance graphs                                       | My [HARNESS] extrapolation                                                             |
| Explicit separation of current workflow and canonical job map in the data model | My [HARNESS] extrapolation                                                             |
| LLM clustering of job-language variants                                         | My [HARNESS] extrapolation                                                             |

The important takeaway is that **Kalbach's value is largely in making JTBD usable as a coherent research and strategy toolkit**, rather than inventing all of its component machinery.

# Canonical JTBD Rules for Business Opportunity Discovery

1. **Never treat a tool as the job.** Outlook, Excel, WhatsApp, paper, ERP, and phone calls describe current solutions.
2. **Express the job as an accomplishment.** Prefer “obtain current supplier prices” over “manage supplier emails.”
3. **Always identify the job performer.** Buyer, performer, approver, contributor, and beneficiary may be different people.
4. **Keep jobs solution-independent.** A valid job should still make sense if every currently used product disappeared.
5. **Keep performance criteria out of the basic job statement.** “Quickly,” “accurately,” “automatically,” and “easily” generally belong in outcomes.
6. **Represent outcomes separately from jobs.** The job says *what* must be accomplished; outcomes describe *how well* it needs to be accomplished.
7. **Turn vague desires into observable performance dimensions.** “Better visibility” must eventually resolve into things such as time, errors, uncertainty, completeness, or predictability.
8. **Capture functional, emotional, and social dimensions independently.** Do not collapse confidence, reputation, and functional execution into one field.
9. **Anchor discovery in real job episodes.** General descriptions are weaker evidence than reconstructing the last actual occurrence.
10. **Capture the trigger.** Understand what circumstance causes the job to become active.
11. **Capture the completion condition.** Understand what has to be true before the performer considers the job finished.
12. **Ask what each observed activity is trying to accomplish.** Repeatedly move from tool → behavior → purpose → job.
13. **Map the job independently of the current workflow.** Current process steps may disappear; job steps should represent enduring objectives.
14. **Maintain the current workflow anyway.** It reveals automation opportunities, coordination cost, artifacts, handoffs, and implementation constraints.
15. **Look for job steps that persist across different solutions.** Stability across implementations is strong evidence that you have found a real job.
16. **Build a hierarchy.** Distinguish higher jobs, focal jobs, sub-jobs, and related jobs.
17. **Choose the right level of abstraction deliberately.** “Run a profitable company” is too broad; “click the export button” is too narrow.
18. **Treat complaints as evidence about job execution, not as job definitions.**
19. **Treat feature requests as solution evidence.** Ask what progress the requested feature would enable.
20. **Treat workarounds as signals of unmet outcomes.** But do not assume workarounds imply willingness to buy.
21. **Treat every existing behavior as an alternative.** The incumbent may be Excel, memory, additional labor, delays, buffers, or simply accepting the problem.
22. **Do not infer opportunity from primitive tooling.** “They use Excel” is not evidence of a viable SaaS opportunity.
23. **Locate pain on the job map.** Determine exactly which job step and which desired outcome is failing.
24. **Evaluate opportunity through unmet outcomes.** Look for outcomes that matter and remain poorly satisfied.
25. **Investigate circumstances that amplify dissatisfaction.** Jobs often become commercially interesting only in particular contexts.
26. **Preserve raw customer language.** Never allow normalization to destroy the underlying evidence.
27. **Normalize across interviews conservatively.** Merge statements only when their purpose, object, and completion criteria are genuinely equivalent.
28. **Maintain explicit provenance.** Every inferred job, outcome, friction, and opportunity should link back to interview evidence.
29. **Maintain interpretation confidence.** AI-created abstractions should initially be hypotheses, not facts.
30. **Keep five layers distinct:** **evidence → job → outcome/friction → opportunity → solution.**
31. **Do not jump from evidence directly to solution.** That is precisely the failure mode JTBD is meant to prevent.
32. **The ultimate discovery question is not “What software should we build?”** It is: **“What important work is this business trying to accomplish, under what circumstances, where does the current way of accomplishing it fail, and which failures are significant enough to create economic demand for a better approach?”**

That final rule is probably the most important contribution of the JTBD layer to the interviewing harness: **The Mom Test protects the quality of your evidence; Portigal and Hansen improve how you elicit it; Torres helps organize opportunities; Kalbach gives you a model for translating messy business activity into stable, solution-independent units of work.**


