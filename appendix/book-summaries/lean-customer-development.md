Alvarez is most useful here as a **bridge between interviewing and deciding what to build next**. Much of her interviewing advice overlaps with The Mom Test and Portigal, but her framing of hypotheses, target-customer selection, constraints, validation patterns, and MVP choice gives the harness additional structure. The book explicitly moves from assumptions → target customers → interview evidence → validated hypothesis → MVP selection. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

## 1\. Externalize assumptions before interviewing

**Classification:** Evidence rule **Origin:** Strong Alvarez implementation; underlying idea is general Lean/customer development.

**Principle or heuristic:** Write down what you currently believe before collecting evidence.

**Explanation:** Customer discovery should begin with an explicit inventory of assumptions about the customer, problem, behavior, constraints, value, and potential solution. Unwritten assumptions are dangerous because the interviewer can unconsciously reinterpret evidence to preserve them. Alvarez makes assumption identification an explicit first exercise before writing the problem hypothesis. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:** Assumptions for a construction company:

* Project managers lose significant time coordinating workers.
* Coordination happens mainly through WhatsApp and phone calls.
* Schedule changes frequently create confusion.
* Managers would pay to reduce that coordination overhead.

These are not findings. They are propositions awaiting evidence.

**Evidence produced:** None initially. The output is an **assumption registry** against which later observations can be classified as supporting, contradicting, or unresolved.

**AI harness implementation:** Before interviews, generate:

```
ASSUMPTION
Customer: small construction-company owner
Belief: daily worker reassignment consumes substantial management time
Confidence: low
Evidence: none
Evidence required: concrete recent examples + frequency + consequences

```

Never allow an assumption to silently become an "insight."

**Adds vs existing books:** Testing Business Ideas handles assumption mapping much more deeply. Alvarez's useful addition is placing this explicitly **before customer interviewing**, so the interviewer knows what beliefs are at risk of confirmation bias.

\-------------------------------------------------------------------------------- 

## 2\. Convert assumptions into a narrow problem hypothesis

**Classification:** Evidence rule **Origin:** Distinctive Alvarez operationalization of general hypothesis-driven customer development.

**Principle or heuristic:** Turn the central belief into a falsifiable statement connecting **customer + problem + activity/context**.

Alvarez uses a formulation along the lines of:

I believe [type of person] experiences [type of problem] while doing [type of activity].

She emphasizes specificity because narrow hypotheses can be invalidated faster than vague ones. ([Lean Startup Co.](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fleanstartup.co%2Fresources%2Farticles%2Fwe-cant-find-customers-to-interview-now-what%2F%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

Weak:

Construction companies have scheduling problems.

Better:

I believe owners of 10–40-person construction companies experience significant coordination overhead when reallocating field workers between projects after schedule changes.

**Evidence produced:** A clearly testable discovery target.

**AI harness implementation:** Require each discovery campaign to have:

```
TARGET_ACTOR
CONTEXT / ACTIVITY
PROPOSED PROBLEM
EXPECTED CONSEQUENCE
CURRENT CONFIDENCE
DISCONFIRMING EVIDENCE

```

The harness should ask: **"What observation would make this hypothesis substantially less believable?"**

**Adds vs existing books:** The Mom Test tells you how not to corrupt evidence. Torres structures opportunities after discovery. Alvarez gives a useful **pre-interview hypothesis contract** connecting the two.

\-------------------------------------------------------------------------------- 

## 3\. Define the target customer behaviorally, not just demographically

**Classification:** Segmentation rule **Origin:** Alvarez-specific practical framing built on broader customer-development segmentation.

**Principle or heuristic:** Define who should be interviewed using characteristics relevant to the hypothesized problem rather than broad categories such as company size or industry alone.

Alvarez explicitly separates writing the problem hypothesis from mapping the target-customer profile. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:**

Instead of:

German construction firms with 10–50 employees.

Prefer:

Construction firms where one owner/project manager personally coordinates workers across multiple simultaneous sites, schedules change during the week, and coordination occurs through calls/messages rather than centralized scheduling software.

The second segment is much more causally connected to the suspected problem.

**Evidence produced:** Evidence tied to a meaningful segment rather than an averaged population.

**AI harness implementation:** Maintain **segment predicates**:

```
Company size: 10–50
Projects simultaneously active: &gt;= 3
Field workers: &gt;= 8
Scheduling responsibility: centralized in owner/Bauleiter
Schedule volatility: frequent
Current coordination: calls / WhatsApp / spreadsheet

```

Every interview should record which predicates actually apply.

**Adds vs existing books:** This is particularly useful to your harness because it connects **hypothesis → recruitment criteria**. Portigal says much more about interviewing the selected participant; Alvarez gives more startup-oriented guidance on **who should be selected in the first place**.

\-------------------------------------------------------------------------------- 

## 4\. Prefer people already experiencing the problem intensely

**Classification:** Segmentation rule **Origin:** Primarily Steve Blank's customer-development / "earlyvangelist" concept, explicitly used by Alvarez rather than invented by her.

**Principle or heuristic:** Early discovery should disproportionately recruit people who already recognize the problem and have demonstrated motivation to deal with it.

Alvarez points toward customers who have a problem, recognize it, can potentially act on it, and have already attempted some kind of solution. ([Lean Startup Co.](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fleanstartup.co%2Fresources%2Farticles%2Fwe-cant-find-customers-to-interview-now-what%2F%3Futm%5Fsource%3Dchatgpt.com))

**Example:** Two construction managers both say scheduling is difficult.

Manager A:

"Yeah, scheduling can be annoying."

Manager B has created a color-coded spreadsheet, a WhatsApp group per project, calls workers every evening, and has tried two scheduling apps.

Manager B is far more valuable for early problem discovery.

**Evidence produced:** High-information cases showing workarounds, urgency, constraints, vocabulary, and potentially willingness to change.

**AI harness implementation:** Calculate an **interview priority profile**, not a product-opportunity score:

```
Recognizes problem? yes/no
Problem frequency
Existing workaround? yes/no
Has attempted alternatives? yes/no
Resources already spent
Actively seeking improvement? yes/no

```

Use this to recruit information-rich participants.

**Adds vs existing books:** The Mom Test identifies commitment and existing behavior as evidence. Alvarez adds a useful **recruitment implication**: find these people preferentially instead of merely noticing those signals after the interview begins.

\-------------------------------------------------------------------------------- 

## 5\. Recruitment difficulty is itself weak market evidence

**Classification:** Evidence rule **Origin:** Strong Alvarez emphasis.

**Principle or heuristic:** If appropriately targeted people cannot be persuaded even to discuss a supposedly important problem, investigate why.

Alvarez emphasizes practical recruiting through introductions, professional networks, communities, offline channels, landing pages, and other places where the hypothesized customer actually congregates. She also treats recruitment failures as something worth diagnosing rather than simply increasing outreach volume. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2Fch03.html%3Futm%5Fsource%3Dchatgpt.com))

**Example:** You claim restaurant owners desperately need help with inventory management, but after 80 highly targeted approaches almost nobody will spend 20 minutes discussing inventory problems.

That does **not prove** there is no problem. But it should reduce confidence or force examination of your segment, wording, channel, or severity assumption.

**Evidence produced:** Weak indirect evidence about salience, accessibility, or segmentation accuracy.

**AI harness implementation:** Track recruiting funnel metadata:

```
segment
channel
outreach attempts
responses
interviews accepted
reason declined
problem wording used

```

Do not treat non-response as equivalent to problem invalidation, but flag unusually poor engagement.

**Adds vs existing books:** This is useful operationally and receives much less attention in Mom Test, Torres, or Testing Business Ideas.

\-------------------------------------------------------------------------------- 

## 6\. Ask about procedure rather than desired outcomes

**Classification:** Interview rule **Origin:** Alvarez-specific emphasis; heavily overlaps Mom Test and Portigal.

**Principle or heuristic:** Learn **how the person currently performs the activity**, step by step, before asking how they would improve it.

Chapter 4 explicitly emphasizes existing behavior, procedure rather than desired outcomes, and present behavior rather than future speculation. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:**

Avoid:

Would automated invoice classification save you time?

Prefer:

Walk me through what happened the last time an invoice arrived.

Then follow the workflow:

Where did it arrive? What happened next? Who touched it? Where was it saved? When was the protocol number created?

**Evidence produced:** Workflow steps, handoffs, tools, repetition, exceptions, workarounds, delays.

**AI harness implementation:** When detecting abstraction such as:

"Invoices are a mess."

automatically switch into **procedure reconstruction mode**:

```
LAST INSTANCE
↓
TRIGGER
↓
STEP
↓
TOOL
↓
PERSON
↓
OUTPUT
↓
NEXT STEP

```

Continue until a concrete workflow exists.

**Adds vs existing books:** Mostly duplication. Portigal supplies richer qualitative-interview craft; The Mom Test supplies the stronger behavior-vs-opinion rule. Keep Alvarez's version mainly as reinforcement.

\-------------------------------------------------------------------------------- 

## 7\. Stay in the present; distrust future behavior

**Classification:** Interview rule **Origin:** General customer-development principle; heavily overlaps The Mom Test.

**Principle or heuristic:** Current and past behavior carry more evidential weight than predictions about what someone might do.

**Example:**

Weak evidence:

"I'd definitely use something like that."

Better evidence:

"Last month this happened four times. I spent roughly an hour each time calling workers and updating the spreadsheet."

Better still:

"We bought Tool X six months ago because of this problem, but stopped using it because..."

**Evidence produced:** Historical incidents, frequency, current spending, existing alternatives, abandonment reasons.

**AI harness implementation:** Automatically classify statements:

```
"I would..."            → hypothetical
"I usually..."          → generalized claim
"Last Tuesday..."       → episodic evidence
"We pay €180/month..."  → behavioral + economic evidence

```

Follow hypothetical claims with requests for a recent analogous behavior.

**Adds vs existing books:** Essentially The Mom Test territory. Do not give Alvarez extra weight here.

\-------------------------------------------------------------------------------- 

## 8\. Explicitly investigate constraints

**Classification:** Evidence rule **Origin:** One of the more useful Alvarez-specific emphases.

**Principle or heuristic:** A customer's inability to achieve an outcome may come from different constraint classes, and those differences matter enormously for product design.

Alvarez explicitly calls out constraints including: the person not perceiving the situation as a problem, lack of awareness of technological possibilities, limited resources, and cultural/social expectations that restrict behavior. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:** Construction firms manually print documents and write protocol numbers on them.

Possible explanations:

* **Problem perception:** They don't consider the process troublesome.
* **Knowledge constraint:** They do not know automated document-routing systems exist.
* **Resource constraint:** Nobody has time or expertise to configure one.
* **Organizational constraint:** Auditors or senior management expect physical records.
* **Technical constraint:** Existing software cannot expose the required interfaces.

Identical behavior can therefore imply completely different opportunities.

**Evidence produced:** The mechanism preventing improvement.

**AI harness implementation:** Every discovered pain should have:

```
Constraint type:
- awareness
- resource
- technical
- organizational/process
- social/cultural
- regulatory
- authority
- dependency
- none identified

Constraint evidence:
...

```

The harness should probe **"Why hasn't this already been fixed?"**

**Adds vs existing books:** **High-value addition.** Mom Test establishes current behavior and costs; JTBD establishes circumstances; Alvarez gives a particularly useful prompt to explicitly model the **constraint preventing the customer from reaching the desired state**.

\-------------------------------------------------------------------------------- 

## 9\. Abstract upward from requested features to the underlying problem

**Classification:** Interview rule **Origin:** Alvarez framing, but general UX/JTBD/product practice.

**Principle or heuristic:** When a customer proposes a feature or solution, translate it upward into the outcome/problem that motivated it.

Alvarez explicitly discusses moving away from feature wish lists and back toward the underlying problem. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:**

Customer:

"You need a button that exports all workers to Excel."

Harness:

"What would you do with the Excel file?"

Customer:

"Every Friday I compare scheduled workers against their recorded hours."

Now the evidence is about **weekly schedule-vs-actual reconciliation**, not an Excel-export requirement.

**Evidence produced:** Underlying task, desired outcome, triggering context, and reason for the proposed workaround.

**AI harness implementation:** Detect solution-shaped statements and store both:

```
RAW REQUEST:
"Export workers to Excel"

UNDERLYING NEED:
Compare planned vs actual staffing weekly

STATUS:
Need supported
Proposed solution unvalidated

```

**Adds vs existing books:** Torres and JTBD already cover this more powerfully. Preserve Alvarez's rule but give it lower weight.

\-------------------------------------------------------------------------------- 

## 10\. Quantify frequency and consequences where possible

**Classification:** Evidence rule **Origin:** Strong practical Alvarez emphasis; broadly consistent with customer-development practice.

**Principle or heuristic:** A problem becomes more credible when the interviewer can establish how frequently it occurs and what it costs in time, money, effort, or risk.

Alvarez's interview material explicitly includes asking how often an activity occurs and how much additional time or money a problem creates. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:**

"Worker scheduling is annoying."

becomes:

"This happens three or four days per week. Each change requires about 20 minutes across calls and messages, and occasionally someone drives to the wrong site."

The latter is much more decision-useful.

**Evidence produced:** Frequency, duration, economic impact, operational impact.

**AI harness implementation:** Attempt to normalize every substantial problem into:

```
frequency
time_cost
money_cost
people_affected
delay_created
error/risk consequences
customer workaround cost

```

Store uncertainty when numbers are estimates rather than facts.

**Adds vs existing books:** Useful reinforcement of Mom Test's commitment/economic evidence. Not conceptually unique, but important enough to encode.

\-------------------------------------------------------------------------------- 

## 11\. Distinguish frustration from meaningful behavior

**Classification:** Evidence rule **Origin:** Alvarez-specific practical synthesis, though conceptually shared elsewhere.

**Principle or heuristic:** Emotional frustration is useful evidence of salience, but it is stronger when accompanied by behavioral consequences.

Alvarez explicitly asks the researcher to listen for what frustrates or motivates the customer and how customers make decisions, spend money, and determine value. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:**

Strong emotion only:

"I absolutely hate doing payroll."

Stronger evidence:

"I hate payroll, so I pay my accountant €450 each month and spend two hours preparing everything for her."

**Evidence produced:** Emotional intensity + behavioral response + economic consequence.

**AI harness implementation:** Treat emotion as a **salience signal**, not validation:

```
Emotional intensity: high
Behavioral response: yes
Financial consequence: €450/month
Repeated: monthly

```

High emotion without action remains weaker evidence than high emotion plus costly behavior.

**Adds vs existing books:** Deploy Empathy covers emotional cues more deeply. Alvarez contributes the useful combination of **emotion + behavior + spending/value**.

\-------------------------------------------------------------------------------- 

## 12\. Aspirational statements and feature wish lists are weak evidence

**Classification:** Anti-pattern **Origin:** General principle strongly operationalized by Alvarez; extensive Mom Test overlap.

**Principle or heuristic:** Compliments, enthusiasm, hypothetical adoption, and requested features can all occur without a meaningful underlying problem.

Alvarez explicitly distinguishes real from aspirational statements and warns against letting interviews become feature wish lists. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781449356576%2Fch06.html%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

"AI-generated project reports would be amazing."

Evidence strength: **very low**.

But:

"Every Friday I collect updates from five Bauleiter, copy them into Word, and spend 90 minutes writing the report."

Evidence strength: **substantially higher**.

**Evidence produced:** Primarily a warning about what **not** to count.

**AI harness implementation:** Assign evidence classes, for example:

```
E0 — opinion / compliment
E1 — hypothetical intention
E2 — generalized current claim
E3 — specific past event
E4 — repeated observed behavior / workaround
E5 — money/time/commitment already spent

```

This exact scale is a harness design choice, not Alvarez's taxonomy.

**Adds vs existing books:** The Mom Test covers this better. Alvarez should not be treated as an independent corroborating methodology here; it is mostly redundant.

\-------------------------------------------------------------------------------- 

## 13\. Validate patterns, not isolated anecdotes

**Classification:** Synthesis rule **Origin:** Strong Alvarez implementation.

**Principle or heuristic:** Individual interviews generate evidence; validation emerges from recurring patterns across appropriately selected interviewees.

Alvarez gives useful progress heuristics: after the first couple of interviews, assess whether you're learning the right things; around several interviews you may encounter someone with clearly intense pain; around ten, recurring patterns should become apparent. She also explicitly tells researchers to challenge those patterns and notes that sufficient interviewing eventually produces fewer genuine surprises. These are heuristics, not statistical thresholds. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781449356576%2Fch06.html%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

Interview 1:

Owner struggles with scheduling.

Not a validated opportunity.

Interviews 2–8:

Six independently describe the same schedule-change → WhatsApp → phone-call → spreadsheet-repair workflow.

Now a meaningful pattern exists.

**Evidence produced:** Cross-interview recurrence and saturation.

**AI harness implementation:** Build an evidence matrix:

| Opportunity                               | I1 | I2 | I3 | I4 | I5 |
| ----------------------------------------- | --- | --- | --- | --- | --- |
| Schedule changes create coordination work | ✓  | ✓  | —  | ✓  | ✓  |
| Wrong-site arrivals occur                 | —  | ✓  | —  | ✓  | —  |
| Managers pay for scheduling software      | —  | —  | —  | ✓  | —  |

The AI should distinguish:

**recurrence → stronger confidence** from **one vivid anecdote → interesting lead**

**Adds vs existing books:** Torres is stronger on opportunity synthesis and opportunity trees. Alvarez adds a useful **practical saturation heuristic** for deciding whether interviewing is still yielding fundamentally new information.

\-------------------------------------------------------------------------------- 

## 14\. Actively attack emerging patterns

**Classification:** Synthesis rule **Origin:** Strong Alvarez emphasis; grounded in general anti-confirmation-bias practice.

**Principle or heuristic:** Once a pattern appears, deliberately search for counterexamples instead of accumulating more confirmation.

Her validation chapter explicitly emphasizes healthy skepticism, recognizing bias, determining whether statements are real or aspirational, and challenging apparent patterns. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781449356576%2Fch06.html%3Futm%5Fsource%3Dchatgpt.com))

**Example:** After five managers report painful scheduling:

Do **not** ask interview six:

Scheduling workers is difficult for you too, right?

Instead seek firms where scheduling appears easy:

Walk me through how worker allocation worked last week.

Then discover why:

* stable crews,
* fewer concurrent sites,
* dedicated dispatcher,
* mature software,
* different project type.

Those differences may reveal the true segmentation boundary.

**Evidence produced:** Boundary conditions, disconfirming cases, sharper segmentation.

**AI harness implementation:** Once confidence rises, automatically generate a **challenge plan**:

```
Current hypothesis:
Schedule volatility causes coordination overhead.

Seek:
- low-volatility firms
- firms with dedicated dispatchers
- firms already using scheduling software

Question:
Does the problem disappear under these conditions?

```

**Adds vs existing books:** Very useful for an AI interviewer because LLMs naturally tend toward coherence and confirmation. Alvarez's "healthy skepticism" should become an explicit adversarial synthesis step.

\-------------------------------------------------------------------------------- 

## 15\. Stop based partly on saturation, not a magic interview count

**Classification:** Synthesis rule **Origin:** Alvarez-specific practical heuristic.

**Principle or heuristic:** There is no universal sufficient number of interviews. Required evidence depends on business complexity, experience, dependencies, and the investment required for the next step. A useful qualitative signal is that interviews increasingly repeat known patterns instead of surprising you. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:** A €500 concierge experiment may justify moving forward after relatively little evidence.

Building a six-month enterprise platform involving integrations, procurement, and compliance should require substantially stronger validation.

**Evidence produced:** Evidence about information saturation and residual uncertainty.

**AI harness implementation:** The harness should calculate **discovery saturation**, not blindly enforce "10 interviews":

```
new opportunities/interview
new workflow steps/interview
new constraints/interview
contradictions/interview
segment coverage
remaining high-risk assumptions
cost of next experiment

```

Recommend moving forward when marginal information gain falls while the next test remains cheap.

**Adds vs existing books:** This complements Testing Business Ideas particularly well: **evidence needed should scale with the cost/risk of the next commitment.**

\-------------------------------------------------------------------------------- 

## 16\. Translate evidence into revised product hypotheses

**Classification:** MVP transition rule **Origin:** Core Alvarez bridge from customer discovery into product development.

**Principle or heuristic:** Interviews should change what you believe should be tested next. They should not directly become a backlog of requested features.

Alvarez structures the book around moving from validated/invalidated customer hypotheses into deciding what kind of MVP should be built. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781492023784%2F))

**Example:**

Initial belief:

Construction managers need better scheduling software.

Discovery finds:

Scheduling itself is manageable; the real breakdown happens when plans change unexpectedly and information must propagate to workers.

Revised hypothesis:

A lightweight system that makes same-day allocation changes visible and acknowledged by workers will substantially reduce coordination work.

That is a **new hypothesis**, not yet a product requirement.

**Evidence produced:** A narrower problem/solution hypothesis suitable for experimentation.

**AI harness implementation:** Maintain explicit lineage:

```
RAW EVIDENCE
    ↓
OBSERVATION
    ↓
PATTERN
    ↓
OPPORTUNITY
    ↓
PRODUCT HYPOTHESIS
    ↓
ASSUMPTIONS TO TEST
    ↓
EXPERIMENT

```

Never let the LLM jump directly:

```
customer quote → feature

```

**Adds vs existing books:** Torres provides the stronger evidence→opportunity→solution structure. Testing Business Ideas provides the stronger hypothesis→experiment structure. Alvarez provides a simple practical bridge between them.

\-------------------------------------------------------------------------------- 

## 17\. Choose the MVP for learning, not feature completeness

**Classification:** MVP transition rule **Origin:** General Lean Startup concept, but Alvarez gives practical MVP variants.

**Principle or heuristic:** Build the smallest intervention capable of testing the important remaining uncertainty rather than a miniature version of the eventual product.

Alvarez discusses multiple MVP forms, including pre-order, audience-building, concierge, Wizard-of-Oz, single-use-case, and using another product to deliver the value. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781449356576%2Fch07.html%3Futm%5Fsource%3Dchatgpt.com))

**Example:** Interviews suggest construction managers need help generating daily site summaries.

Bad MVP:

Build project management SaaS with scheduling, chat, document storage, dashboards, users, permissions, and AI.

Better:

Have three managers forward their daily site information to you and manually produce the summary for two weeks.

This tests whether the output actually matters before automating it.

**Evidence produced:** Behavioral adoption, repeated usage, operational feasibility, willingness to continue/pay.

**AI harness implementation:** Given a validated problem, ask:

```
What is still uncertain?
What is the cheapest intervention that exposes that uncertainty?
Can humans perform the service manually?
Can an existing tool emulate it?
Can one workflow/use case be isolated?
Can payment or commitment be tested before automation?

```

**Adds vs existing books:** Testing Business Ideas contains a much richer experiment library and evidence hierarchy. Therefore **down-weight Alvarez here** except for using her as the discovery→MVP transition.

\-------------------------------------------------------------------------------- 

## 18\. Prefer a single-use-case MVP over broad coverage

**Classification:** MVP transition rule **Origin:** Strong Alvarez practical emphasis.

**Principle or heuristic:** Solve one valuable usage situation convincingly rather than weakly covering every discovered customer problem.

Her MVP taxonomy explicitly includes the **single-use-case MVP**. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781449356576%2Fch07.html%3Futm%5Fsource%3Dchatgpt.com))

**Example:** Discovery identifies:

* scheduling,
* photo reporting,
* worker messaging,
* invoice routing,
* task assignment.

Do not conclude:

MVP = all five.

If evidence indicates schedule changes are the acute pain:

MVP = manager changes worker assignment → worker immediately sees and acknowledges it.

Everything else stays outside the MVP unless required for this loop to function.

**Evidence produced:** Whether solving the narrow job changes behavior enough to justify expansion.

**AI harness implementation:** Generate an **MVP inclusion test** for every proposed capability:

```
Does removing this prevent testing the core hypothesis?
YES → candidate MVP requirement
NO  → postpone

```

**Adds vs existing books:** Useful implementation rule. Testing Business Ideas tells you how to test assumptions; Alvarez reinforces ruthless **scope isolation around one use case**.

\-------------------------------------------------------------------------------- 

## 19\. Avoid "minimum" becoming unusably bad

**Classification:** MVP transition rule **Origin:** More distinctive Alvarez nuance.

**Principle or heuristic:** Minimum does not mean delivering an experience so poor that failure tells you nothing about the underlying value proposition.

Alvarez discusses a "minimum exceptional product" and also notes that MVP expectations change when working with existing customers or established products. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781449356576%2Fch07.html%3Futm%5Fsource%3Dchatgpt.com))

**Example:** Testing whether busy construction managers value daily AI summaries with an interface that routinely loses uploaded photos would be invalid.

Failure could mean:

"The concept isn't useful."

or merely:

"The prototype is unusable."

**Evidence produced:** Cleaner behavioral evidence because implementation failure is less likely to confound value testing.

**AI harness implementation:** Before recommending an MVP, distinguish:

```
VALUE-ESSENTIAL QUALITY
required for a valid test

NONESSENTIAL POLISH
can be omitted

```

This prevents "smallest possible thing" from becoming "test something nobody could reasonably use."

**Adds vs existing books:** A useful counterweight to aggressive experiment minimization in Testing Business Ideas.

\-------------------------------------------------------------------------------- 

# Weak evidence model for the harness

Alvarez reinforces a hierarchy you can combine with The Mom Test and Testing Business Ideas. I would encode it approximately as:

| Evidence                                 | Harness interpretation       |
| ---------------------------------------- | ---------------------------- |
| "Cool idea"                              | Ignore                       |
| Feature request                          | Problem lead only            |
| "I would use/pay for this"               | Weak hypothesis evidence     |
| Generalized claim about current behavior | Moderate/needs probing       |
| Specific recent story                    | Strong qualitative evidence  |
| Repeated behavior across stories         | Stronger                     |
| Existing workaround                      | Strong                       |
| Time/money already spent solving it      | Very strong problem evidence |
| Similar behavior across target customers | Strong pattern evidence      |
| Concrete commitment to test/pay/switch   | Transition toward validation |
| Actual usage/payment                     | Behavioral validation        |

That exact ladder is a **synthesis for your harness**, not Alvarez's formal scale. Alvarez herself emphasizes skepticism toward aspirational statements, concrete current behavior, frequency/cost, existing activity, patterns, and eventual behavioral MVP testing. ([O'Reilly Media](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.oreilly.com%2Flibrary%2Fview%2Flean-customer-development%2F9781449356576%2Fch06.html%3Futm%5Fsource%3Dchatgpt.com))

# What I would actually retain from Alvarez

Compared with the books already in your corpus, I would **not give significant additional weight** to her advice on open-ended questions, avoiding leading questions, recent behavior, avoiding feature wish lists, or hypothetical intent. Those are handled more strongly by **Portigal + The Mom Test + Deploy Empathy**.

The parts worth introducing as distinct rules are:

1. **Assumption → narrow problem hypothesis → target-customer profile** as the setup sequence.
2. **Recruit information-rich/problem-aware customers**, rather than sampling everyone equally.
3. **Treat recruiting friction as weak diagnostic evidence.**
4. **Explicitly model constraints**, especially why the customer has not already solved the problem.
5. **Combine frustration with procedure, frequency, cost, and existing behavior** rather than treating pain language alone as sufficient.
6. **Challenge apparent patterns** instead of simply accumulating supporting interviews.
7. **Use saturation / diminishing surprise rather than a fixed interview quota.**
8. **Scale confidence requirements according to the cost of what you intend to do next.**
9. **Convert discovery into a new testable product hypothesis**, not a feature backlog.
10. **Use a narrow/single-use-case MVP whose purpose is continued learning**, while maintaining enough quality that the experiment remains interpretable.

## Unique Contributions of Lean Customer Development to This Harness

The strongest unique contribution is **workflow around the interview**, rather than interview craft itself.

Alvarez effectively supplies this pipeline:

**Explicit assumptions → narrow problem hypothesis → behavioral customer profile → targeted recruiting → current workflow + constraints → cross-interview patterns → adversarial validation → narrow product hypothesis → learning-oriented MVP.**

For your AI harness, I would extract three mechanisms from the book with particularly high weight:

**First, constraint modeling.** For every meaningful problem, the system should ask not merely *what hurts?*, but **why has this remained unsolved?** That can reveal resource, awareness, organizational, social, technical, or other constraints. This materially improves opportunity assessment.

**Second, hypothesis-aware sampling and synthesis.** The interviewer should know which customer/problem hypothesis it is investigating, recruit participants capable of producing relevant evidence, then deliberately look for cases that contradict the emerging pattern. That prevents the LLM from turning discovery into confirmation theatre.

**Third, an explicit discovery→experiment gate.** A recurring pattern does not become a feature. It becomes a **revised hypothesis**, with remaining uncertainties identified, and only then a narrowly scoped MVP/experiment chosen to generate stronger behavioral evidence.

In the combined harness, I would therefore position Alvarez approximately as:

**The Mom Test** → evidence hygiene **Portigal / Deploy Empathy** → interview execution **Torres** → story → opportunity structure **JTBD** → job/workflow representation **Alvarez** → **hypothesis → recruiting → constraints → pattern validation → MVP handoff** **Testing Business Ideas** → assumption prioritization → experiment design → evidence strength

That middle bridge is the part of *Lean Customer Development* that meaningfully earns its **STRONG** weighting rather than simply duplicating the CORE books.

