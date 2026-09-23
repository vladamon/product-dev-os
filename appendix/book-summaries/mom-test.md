Below is the methodology reconstructed as an **interviewing/evidence system** rather than a book summary. Where I extend it into machinery suitable for an AI interviewer, I label that separately rather than attributing it to Fitzpatrick.

## I. High-confidence Mom Test concepts

These are strongly characteristic of *The Mom Test* and safe to treat as the book's core doctrine.

### 1\. Talk about their life, not your idea

**Classification:** Principle **Confidence:** **High — explicitly characteristic of Fitzpatrick**

**Explanation:** The interview should primarily investigate the customer's situation, behavior, problems, constraints, and existing processes. Once you start describing your proposed solution, the conversation becomes contaminated by politeness, speculation, and attempts to help you.

**Why it matters:** You are trying to learn whether reality supports the business, not whether somebody can imagine liking your idea.

**Good example:** "How do you currently assign workers to construction sites?"

**Bad example:** "We're building an AI system that automatically assigns workers to sites. Would that be useful?"

**Evidence produced:** Existing workflow, actors, tools, frequency, friction, ownership, and operational constraints.

**AI operationalization:** Default to `customer_context_mode`. Do not reveal the proposed product or desired solution unless the interview has explicitly moved from discovery into solution testing. Questions should be generated from the interviewee's world rather than the founder's proposed feature set.

\-------------------------------------------------------------------------------- 

### 2\. Past behavior beats future intention

**Classification:** Evidence rule **Confidence:** **High**

**Explanation:** Statements about what somebody *would*, *might*, or *probably will* do are weak evidence. Concrete descriptions of what they actually did are much stronger.

**Why it matters:** People systematically overestimate future motivation and underestimate inconvenience, cost, competing priorities, and inertia.

**Good example:** "Tell me about the last time you needed prices from suppliers for a bid."

**Bad example:** "Would you use software that automatically collected supplier prices?"

**Evidence produced:** Actual behavior under real constraints.

**AI operationalization:** Detect future-tense answers such as "I would", "probably", "maybe", "I'd definitely", "sounds useful". Automatically redirect:

"How did you handle this the last time it actually happened?"

Do not count hypothetical intent toward validation.

\-------------------------------------------------------------------------------- 

### 3\. Specific instances beat generic claims

**Classification:** Interview heuristic **Confidence:** **High**

**Explanation:** Generic descriptions such as "we usually", "we often", "that's always a problem", or "everyone struggles with that" are weaker than reconstruction of a particular incident.

This is a major part of what Fitzpatrick calls avoiding **fluff**.

**Why it matters:** Generalizations compress, rationalize, and distort reality.

**Good example:** "When did that last happen?" "What happened next?" "Who was involved?"

**Bad example:** "So this happens pretty often?"

**Evidence produced:** Concrete episodes that can be examined for sequence, frequency, consequences, and cost.

**AI operationalization:** Maintain a `specificity_state`. Whenever an answer remains generic after one exchange, request an instance. Prefer episode reconstruction over further abstract discussion.

\-------------------------------------------------------------------------------- 

### 4\. Facts beat opinions

**Classification:** Evidence rule **Confidence:** **High**

**Explanation:** Opinions can be sincere while still being useless for determining whether a business opportunity exists. Observable facts—what happened, what they bought, what they attempted, what they abandoned—are more informative.

**Why it matters:** An interviewee can genuinely believe a problem is important without behaving as though it is important.

**Good example:** "How many tenders did you prepare last month?" "How long did the last one take?"

**Bad example:** "Do you think procurement is inefficient?"

**Evidence produced:** Frequency, magnitude, actual constraints and behavior.

**AI operationalization:** Tag statements:

`FACT`, `BEHAVIOR`, `OPINION`, `HYPOTHETICAL`, `COMPLIMENT`, `IDEA`.

Only facts and behavior should materially increase problem-validation confidence.

\-------------------------------------------------------------------------------- 

### 5\. Don't reveal the answer you want

**Classification:** Anti-pattern **Confidence:** **High**

**Explanation:** Leading questions cause interviewees to infer the answer that would please the interviewer.

**Why it matters:** The interviewee is usually socially cooperative. Once they know your thesis, they may unconsciously help confirm it.

**Good example:** "What is the hardest part of preparing an offer?"

**Bad example:** "Is getting supplier prices the most frustrating part of preparing an offer?"

**Evidence produced:** Unprompted problem importance rather than agreement with the founder.

**AI operationalization:** Before emitting a question, perform a leading-question check:

* Does the question contain the hypothesized pain?
* Does it imply that something is difficult?
* Does it imply that a proposed solution is desirable?
* Does it suggest the expected answer?

If yes, rewrite neutrally.

\-------------------------------------------------------------------------------- 

### 6\. Discovery and pitching are different activities

**Classification:** Principle **Confidence:** **High**

**Explanation:** Pitching too early destroys the quality of discovery because subsequent responses become reactions to your proposition.

The rule is not that you must never explain your product. It is that **learning about the customer's reality should happen before you contaminate the conversation with the solution**.

**Why it matters:** Once the interviewee starts evaluating your idea, you stop discovering their natural priorities.

**Good example:** Spend the first part understanding how bidding currently works, then—if appropriate—briefly test whether the discovered workflow maps to a proposed solution.

**Bad example:** Spend ten minutes explaining the product and then ask, "So how are you solving this today?"

**Evidence produced:** Cleaner problem evidence.

**AI operationalization:** Maintain explicit modes:

`PROBLEM_DISCOVERY → SOLUTION_TEST → COMMITMENT`

Do not accidentally switch from discovery to pitch because the participant asks, "So what are you building?"

\-------------------------------------------------------------------------------- 

### 7\. Compliments are bad data

**Classification:** Evidence rule **Confidence:** **High**

**Explanation:** Statements such as "great idea", "very interesting", "I love this", or "you should definitely build this" have almost no evidentiary value.

Compliments are one of Fitzpatrick's canonical forms of **bad data**.

**Why it matters:** Compliments are cheap and socially easy.

**Good example:** Treat "That sounds amazing" as a conversational signal, not validation.

**Bad example:** Record "customer loved the product" as evidence of demand.

**Evidence produced:** Essentially none unless followed by behavior or commitment.

**AI operationalization:** Give compliments approximately zero validation weight. Immediately return to reality:

"How are you dealing with that today?"

or later:

"Would you be willing to introduce me to the person who owns this process?"

\-------------------------------------------------------------------------------- 

### 8\. Deflect praise instead of harvesting it

**Classification:** Follow-up rule **Confidence:** **High**

**Explanation:** When someone praises your idea, don't invite more praise. Redirect toward evidence.

**Why it matters:** Founders naturally enjoy compliments and unconsciously prolong conversations that produce them.

**Good example:**

Customer: "That's a really smart product."

Interviewer: "Thanks. You mentioned your team currently does this manually. Can you walk me through the last time?"

**Bad example:**

"Great. Which feature do you like most?"

**Evidence produced:** Converts a zero-value signal into behavioral information.

**AI operationalization:** Compliment detection should trigger `return_to_evidence`, not `explore_positive_sentiment`.

\-------------------------------------------------------------------------------- 

### 9\. Reconstruct the current workflow

**Classification:** Question pattern **Confidence:** **High**

**Explanation:** Understand how the customer accomplishes the job today before discussing replacing it.

**Why it matters:** Current workflows reveal competitors you may not recognize as competitors: spreadsheets, WhatsApp, assistants, manual work, memory, paper, outsourcing, doing nothing.

**Good example:** "Walk me through what happens from the moment you receive the tender documents until the offer is submitted."

**Bad example:** "Would an integrated procurement dashboard simplify your workflow?"

**Evidence produced:** Process stages, dependencies, people, tools, bottlenecks and workarounds.

**AI operationalization:** Build a lightweight process graph:

`trigger → steps → actors → tools → handoffs → failure points → output`

Missing nodes become follow-up targets.

\-------------------------------------------------------------------------------- 

### 10\. Existing workaround is evidence of pain

**Classification:** Evidence rule **Confidence:** **High**

**Explanation:** A person who already spends time, money, or effort solving a problem provides much stronger evidence than someone who merely agrees the problem exists.

**Why it matters:** Actions reveal priority.

**Good example:** "We have one employee who spends two afternoons every week emailing suppliers and copying prices into Excel."

**Bad example:** "It would be convenient if this were automated."

**Evidence produced:** Existing resource expenditure and revealed importance.

**AI operationalization:** Explicitly search for:

* manual procedures;
* spreadsheets;
* duplicated data entry;
* hired labor;
* consultants;
* purchased software;
* recurring meetings;
* scripts;
* workarounds;
* tolerated errors.

Create `existing_solution_cost`.

\-------------------------------------------------------------------------------- 

### 11\. No attempted solution can be evidence that the problem isn't important

**Classification:** Evidence rule **Confidence:** **High**

**Explanation:** If someone has lived with a supposed serious problem for years but has never attempted to fix it, that weakens the hypothesis that solving it is a priority.

This is not absolute: sometimes structural constraints prevent action. But lack of effort is important evidence.

**Why it matters:** Founders often confuse inconvenience with purchasing motivation.

**Good example:** "What have you tried to improve this?"

If the answer is "nothing", investigate why.

**Bad example:** Ignoring that they have made no attempt to solve a supposedly critical problem.

**Evidence produced:** Priority relative to competing problems.

**AI operationalization:** When `reported_severity = high` but `attempted_solution = none`, trigger contradiction probing:

"You've said this costs quite a lot of time. What has prevented you from changing it?"

\-------------------------------------------------------------------------------- 

### 12\. Investigate previous attempts

**Classification:** Question pattern **Confidence:** **High**

**Explanation:** Ask what they have already tried and why those attempts succeeded or failed.

**Why it matters:** Previous attempts reveal requirements, barriers, competing products, willingness to invest, and the difference between apparent and real causes.

**Good example:** "Have you tried changing this process before?" "What did you try?" "What happened?"

**Bad example:** "Would you switch to my system?"

**Evidence produced:** Switching barriers, failed alternatives, purchasing history and hidden requirements.

**AI operationalization:** Whenever a meaningful pain appears, seek:

`past_attempts → outcome → reason_abandoned → cost → remaining_gap`.

\-------------------------------------------------------------------------------- 

### 13\. Feature requests and ideas are not validation

**Classification:** Evidence rule **Confidence:** **High**

**Explanation:** Customer ideas may be interesting, but the requested feature itself is not automatically the correct solution. Investigate why they want it.

Ideas are another major category of Fitzpatrick's bad-data discussion.

**Why it matters:** Customers understand their problems better than they understand the optimal product architecture.

**Good example:**

Customer: "You should add automatic PDF generation."

Interviewer: "What would that allow you to do?"

Then investigate the current situation which generated the request.

**Bad example:** Add "automatic PDF generation" to the validated requirements list.

**Evidence produced:** Underlying job, constraint, desired outcome or current failure.

**AI operationalization:** Every feature request becomes:

`REQUESTED_SOLUTION → WHY → CURRENT_TRIGGER → CURRENT_BEHAVIOR → UNDERLYING_PROBLEM`

Store the feature separately from the evidence.

\-------------------------------------------------------------------------------- 

### 14\. Ask about actual spending instead of hypothetical willingness to pay

**Classification:** Question pattern **Confidence:** **High**

**Explanation:** Asking "Would you pay €100?" produces weak evidence. Asking what they currently spend solving the underlying problem produces stronger information.

**Why it matters:** Declared willingness to pay does not carry the consequences of actually spending money.

**Good example:** "What software do you currently use for this?" "What does it cost?" "Who approves that expense?"

**Bad example:** "Would €99 per month be reasonable?"

**Evidence produced:** Existing budget, economic alternatives and purchasing reality.

**AI operationalization:** During discovery, distinguish:

`CURRENT_SPEND` from `STATED_WTP`.

Give `CURRENT_SPEND` much higher evidentiary weight.

Price testing should eventually use actual purchasing behavior, not only interview answers.

\-------------------------------------------------------------------------------- 

### 15\. Commitment is stronger than enthusiasm

**Classification:** Commitment signal **Confidence:** **High**

**Explanation:** Meaningful validation involves the customer giving up something scarce rather than merely expressing interest.

Fitzpatrick emphasizes commitments and **advancement**.

**Why it matters:** Saying yes is cheap. Giving something up introduces consequences.

**Good example:** A prospect agrees to give you access to data, schedules implementation time, introduces you to a decision-maker, or pays for a pilot.

**Bad example:** "Send me a link when it's ready."

**Evidence produced:** Revealed seriousness.

**AI operationalization:** Track whether the participant has sacrificed:

* time;
* money;
* reputation;
* access;
* internal political capital;
* effort.

Do not collapse these into generic "interest."

\-------------------------------------------------------------------------------- 

### 16\. Advancement matters alongside commitment

**Classification:** Commitment signal **Confidence:** **High**

**Explanation:** A useful customer conversation should, when appropriate, move the relationship forward. A commitment which does not advance the relationship may not tell you much.

**Why it matters:** Endless friendly conversations can feel productive while producing neither learning nor commercial progress.

**Good example:** "Let's bring our operations manager into the next meeting; she owns this process."

**Bad example:** "Very interesting. Let's stay in touch."

**Evidence produced:** Movement toward a real decision, test, purchase, or deeper access.

**AI operationalization:** After sufficiently strong opportunity evidence appears, ask:

`What concrete next step would expose the hypothesis to more risk?`

Examples include data access, workflow observation, decision-maker introduction, pilot, deposit or purchase.

\-------------------------------------------------------------------------------- 

### 17\. Time, reputation and money are qualitatively different from words

**Classification:** Commitment signal **Confidence:** **High**

**Explanation:** Fitzpatrick strongly emphasizes commitments which cost the customer something.

**Why it matters:** Costly signals separate politeness from genuine motivation.

**Good example:** The owner introduces you to three other contractors because they genuinely believe the problem is worth investigating.

**Bad example:** "Yeah, I know loads of people who would want that."

**Evidence produced:** Skin in the game.

**AI operationalization:** Maintain commitment classes:

`VERBAL &lt; TIME &lt; ACCESS &lt; REPUTATION &lt; MONEY`

This ordering is an **AI implementation heuristic**, not a Fitzpatrick formula. Context can change the relative strength.

\-------------------------------------------------------------------------------- 

### 18\. Ask for introductions rather than claims about "other customers"

**Classification:** Commitment signal **Confidence:** **High**

**Explanation:** People frequently say "lots of companies need this." A concrete introduction converts that assertion into a reputational commitment.

**Why it matters:** The person is risking social capital.

**Good example:** "You mentioned two contractors who have the same problem. Would you be comfortable introducing me?"

**Bad example:** "So you think there's a big market?"

**Evidence produced:** Reputation-backed evidence plus access to independent interviews.

**AI operationalization:** When interviewees make third-party market claims, convert them into an introduction request when socially appropriate.

\-------------------------------------------------------------------------------- 

### 19\. Follow vague statements until they touch reality

**Classification:** Follow-up rule **Confidence:** **High**

**Explanation:** The interviewer should not accept phrases such as:

* "It's difficult."
* "It takes forever."
* "We do this constantly."
* "It's expensive."
* "People hate it."

Each contains an unresolved factual question.

**Why it matters:** Adjectives are not measurements.

**Good example:** "When you say 'constantly', how often did it happen last month?"

**Bad example:** "Yes, that does sound frustrating."

**Evidence produced:** Frequency, duration, actors, consequences and magnitude.

**AI operationalization:** Detect vague quantifiers and evaluative adjectives and request resolution.

Examples:

`often → how often?` `expensive → how much?` `slow → how long?` `everyone → who specifically?` `problematic → what happened?`

\-------------------------------------------------------------------------------- 

### 20\. Listen more than you explain

**Classification:** Interview heuristic **Confidence:** **High**

**Explanation:** The interviewer's job is learning. Excessive explaining is usually evidence that the founder has begun selling, defending, or teaching.

**Why it matters:** Every minute the founder spends describing the product is a minute in which the customer is not revealing their world.

**Good example:** Short question → long customer answer → focused follow-up.

**Bad example:** Three-minute explanation followed by "Does that make sense?"

**Evidence produced:** More spontaneous and less contaminated customer information.

**AI operationalization:** Track interviewer/customer word ratio. High interviewer dominance should trigger shorter prompts and fewer explanatory statements.

\-------------------------------------------------------------------------------- 

## II. Concepts strongly consistent with the book, but worth attributing more cautiously

These fit Fitzpatrick closely, but I would avoid saying he formalizes them exactly in the structures below.

### 21\. Reconstruct incidents chronologically

**Classification:** Interview heuristic **Confidence:** **Medium**

**Explanation:** Once a useful incident appears, reconstruct what happened step by step.

**Why it matters:** Causal detail often appears between the headline statements.

**Good example:** "You received the tender on Monday. What did you do next?" "Then what happened?"

**Bad example:** "So procurement was basically the problem?"

**Evidence produced:** Actual causal chain and bottleneck location.

**AI operationalization:** Enter `episode_reconstruction` when a concrete incident has high information value. Continue until the relevant sequence is understood rather than jumping immediately to another topic.

\-------------------------------------------------------------------------------- 

### 22\. Contradictions deserve investigation

**Classification:** Follow-up rule **Confidence:** **Medium**

**Explanation:** Statements and behavior sometimes disagree. The behavior usually deserves more evidentiary weight.

**Why it matters:** Contradictions often reveal the real opportunity.

Example:

"This is our biggest operational problem."

versus:

"We've never tried to change it."

**Good example:** "What has stopped you from addressing it?"

**Bad example:** Assume the first statement is validation.

**Evidence produced:** Hidden constraints, low priority, switching cost or organizational barriers.

**AI operationalization:** Maintain a contradiction detector across the interview:

`claimed_importance ↔ actual_frequency ↔ actual_cost ↔ attempted_solution ↔ commitment`.

Contradictions should trigger curiosity, not accusations.

\-------------------------------------------------------------------------------- 

### 23\. Enter interviews with explicit learning goals

**Classification:** Process recommendation **Confidence:** **Medium-to-high**

**Explanation:** Fitzpatrick advises founders to know what important questions they need answered instead of conducting shapeless conversations.

A commonly remembered formulation from the book involves identifying a small number of critical learning questions before conversations.

**Why it matters:** Without learning goals, interviews gravitate toward whatever is pleasant to discuss.

**Good example:** Before interviews, define:

1. How is supplier pricing currently collected?
2. What does the process cost?
3. What causes firms to seek alternatives?

**Bad example:** "Let's talk to contractors and see what they think."

**Evidence produced:** Comparable learning across interviews.

**AI operationalization:** Founder supplies hypotheses; AI converts them into neutral **learning objectives**, not leading questions.

\-------------------------------------------------------------------------------- 

### 24\. Keep discovery conversations relatively natural

**Classification:** Process recommendation **Confidence:** **Medium**

**Explanation:** The methodology does not require a formal research ceremony. Valuable conversations can occur informally.

**Why it matters:** Over-formalization can produce rehearsed answers and makes customer discovery unnecessarily expensive.

**Good example:** Natural discussion with targeted follow-ups.

**Bad example:** Mechanically reading 40 questionnaire items regardless of what the participant says.

**Evidence produced:** Richer narrative information.

**AI operationalization:** Treat the interview guide as a graph, not a script. Skip questions already answered. Pursue unexpected evidence.

\-------------------------------------------------------------------------------- 

### 25\. Segment evidence instead of averaging everybody together

**Classification:** Synthesis rule **Confidence:** **Medium**

**Explanation:** Evidence from meaningfully different customer groups should not be blended indiscriminately.

A five-person contractor and a 2,000-person enterprise may have completely different purchasing processes despite nominally sharing a problem.

**Why it matters:** Mixed segments generate contradictory requirements and false confidence.

**Good example:** "Four of six construction firms with 10–30 field workers manually coordinate scheduling."

**Bad example:** "Seven out of ten interviewees had scheduling problems," when the ten include architects, contractors, consultants and software vendors.

**Evidence produced:** Segment-specific patterns.

**AI operationalization:** Attach every evidence item to attributes such as:

`company_size`, `role`, `industry`, `workflow`, `buyer/user status`, `current_solution`.

Do not synthesize across incompatible populations without saying so.

\-------------------------------------------------------------------------------- 

### 26\. Good notes preserve evidence, not conclusions

**Classification:** Synthesis rule **Confidence:** **Medium**

**Explanation:** Notes should distinguish what the customer actually described from the founder's interpretation.

**Why it matters:** Otherwise observations rapidly turn into increasingly confident stories.

**Good example:**

**Observation:** "Owner manually copied 43 supplier prices into Excel for the last tender."

**Interpretation:** "Price consolidation may be a meaningful automation opportunity."

**Bad example:** "Customer desperately needs automated procurement."

**Evidence produced:** Auditable qualitative evidence.

**AI operationalization:** Store separately:

`raw_statement / observed_fact / interpretation / hypothesis / confidence`.

Never rewrite an inference as though the participant said it.

\-------------------------------------------------------------------------------- 

### 27\. Validation requires patterns, not memorable anecdotes

**Classification:** Synthesis rule **Confidence:** **Medium**

**Explanation:** A striking customer story is evidence, not proof that a market exists. You need repeated observations in an appropriately defined segment.

**Why it matters:** Founders disproportionately remember extreme or enthusiastic interviews.

**Good example:** Several independent firms display similar painful behavior and meaningful attempts to solve it.

**Bad example:** One owner says "I'd pay anything for this," therefore product-market fit.

**Evidence produced:** Replication across independent cases.

**AI operationalization:** Aggregate evidence by hypothesis while keeping interview-level provenance. Avoid converting one observation into a market-wide claim.

This principle is also strongly rooted in broader qualitative/customer-development practice, not uniquely Fitzpatrick.

\-------------------------------------------------------------------------------- 

## III. Useful AI-interviewer extensions — do not attribute these directly to Fitzpatrick

### 28\. Explicit evidence hierarchy

**Classification:** Evidence rule **Confidence:** **Extrapolation**

A useful approximation for the harness is:

**Observed/current behavior** → **historical specific behavior** → **costly existing workaround** → **actual purchase/payment** → **concrete commitment** → **quantified factual claim** → **generic opinion** → **future intention** → **compliment**

The exact ordering is context-dependent. Fitzpatrick does **not**, to my knowledge, provide this formal scoring ladder.

**AI operationalization:** Validation scoring must weight evidence by type rather than count positive statements.

\-------------------------------------------------------------------------------- 

### 29\. Evidence should be stored against hypotheses

**Classification:** Synthesis rule **Confidence:** **Extrapolation**

Instead of producing a generic interview summary, maintain a structure such as:

`Hypothesis H1: supplier-price collection is painful enough to justify switching`

Then attach:

* supporting evidence;
* contradicting evidence;
* unknowns;
* commitments;
* segment;
* confidence.

This is much more useful for an AI harness than ordinary meeting summaries.

\-------------------------------------------------------------------------------- 

### 30\. The AI should optimize for information gain, not questionnaire completion

**Classification:** Process recommendation **Confidence:** **Extrapolation**

The best next question is not necessarily the next scripted question. It is the question most likely to reduce an important uncertainty.

Example:

If the participant suddenly says:

"We hired somebody mainly because of this process."

the AI should investigate that immediately rather than continuing to Question 7.

This is fully compatible with *The Mom Test*, but it is an AI-system design inference rather than a rule I would attribute directly to Fitzpatrick.

\-------------------------------------------------------------------------------- 

# Detecting false positives

For your harness, the most dangerous false positives are especially clear through the Mom Test lens.

| Statement                                                                    | Interpretation                                                 |
| ---------------------------------------------------------------------------- | -------------------------------------------------------------- |
| "That's a great idea."                                                       | Compliment; almost no evidence                                 |
| "I'd definitely use it."                                                     | Hypothetical                                                   |
| "I think companies would pay for that."                                      | Speculation about others                                       |
| "We often have this problem."                                                | Fluff until quantified                                         |
| "You should add feature X."                                                  | Idea; investigate underlying reason                            |
| "Send it to me when it's ready."                                             | Weak interest unless followed by action                        |
| "We tried three tools and currently pay €500/month but still do X manually." | Strong problem evidence                                        |
| "I'll introduce you to our operations manager."                              | Commitment + advancement                                       |
| "Can we pilot this on our next project?"                                     | Strong advancement                                             |
| "Where do I sign / how much does it cost?"                                   | Strong commercial signal                                       |
| Actual payment/deposit                                                       | Very strong behavior, though still not proof of a large market |

The fundamental pattern is:

**Words become useful when they reveal past reality. Actions become useful when they impose a cost.**

\-------------------------------------------------------------------------------- 

# How to recover from a bad question

This deserves explicit handling in an AI interviewer.

Suppose the AI accidentally asks:

"Would an automated system help?"

The participant answers:

"Yes, absolutely."

Do **not** store that as validation.

Recover by moving backward from hypothetical opinion to reality:

"How are you handling it currently?"

Then:

"Can you take me through the last time?"

Then perhaps:

"What was difficult about that?"

"What did that cost in time or money?"

The contaminated answer can remain in the transcript but should be tagged `HYPOTHETICAL / LEADING_QUESTION_RESPONSE` and excluded from validation.

That recovery strategy is **strongly Mom-Test-consistent**, while the explicit tagging system is an AI implementation extension.

\-------------------------------------------------------------------------------- 

# How to know an interview is going badly

A harness should detect several conditions.

### Mostly compliments

The founder is probably pitching too much.

### Mostly hypothetical answers

Questions are probably framed around future behavior.

### Mostly generic claims

The AI is failing to request concrete examples.

### Lots of product suggestions

The conversation has drifted from problem discovery into collaborative product design.

### Interviewer speaking more than participant

Likely pitching, explaining or defending.

### Strong claimed pain but no historical action

Potential false positive requiring investigation.

### No understanding of current process

The interview is prematurely solution-focused.

### "Great conversation" but no new facts

Learning quality was low.

### Every respondent agrees

Especially suspicious if questions expose the founder's hypothesis.

### No surprises

Not necessarily failure, but repeatedly learning nothing unexpected may indicate leading questions or a hypothesis that is already sufficiently understood.

The last two are **interpretive extensions**, not canonical Mom Test rules.

\-------------------------------------------------------------------------------- 

# How to decide when to dig deeper

A Mom-Test-compatible AI should deepen rather than move on when it encounters:

**Specific pain:** "Last month we missed the submission deadline."

**Unexpected workaround:** "We built our own spreadsheet."

**Resource expenditure:** "One employee spends half a day on this every week."

**Previous attempted solutions:** "We tried software X but abandoned it."

**Contradiction:** "It's critical, but we've never tried fixing it."

**Emotion backed by events:** "The owner had to drive back to the office at 10 p.m. to finish it."

**Purchasing behavior:** "We already pay €400/month for something similar."

**Organizational complexity:** "I don't decide this; accounting does."

**Switching barrier:** "All historical data is in our current system."

A strong AI harness should allocate interview time asymmetrically. One surprising high-value thread may deserve ten follow-ups; a low-information topic may deserve none.

\-------------------------------------------------------------------------------- 

# Problem severity under The Mom Test lens

A particularly useful interpretation for your application is that severity should not primarily be inferred from adjectives.

Instead, infer it from **consequences**.

Strong evidence includes:

* money currently spent;
* employee hours consumed;
* lost revenue;
* delays;
* missed opportunities;
* rework;
* errors;
* customer complaints;
* regulatory exposure;
* dedicated staff;
* purchased tools;
* homemade systems;
* escalation to management;
* repeated attempts to fix it;
* active search for alternatives.

Some of these specific severity dimensions are broader business-discovery concepts rather than Fitzpatrick's own taxonomy, but they follow his evidence philosophy closely.

A respondent saying:

"It's incredibly annoying"

may represent less opportunity than:

"It isn't particularly annoying, but our estimator spends eight hours every Thursday doing it."

The second statement exposes economic reality.

\-------------------------------------------------------------------------------- 

# Commitment versus validation

One subtle point is important.

A commitment is **stronger evidence**, but it isn't automatically market validation.

For example:

One customer pays €5,000 for a custom implementation.

This establishes that **one customer** was willing to pay €5,000 under those circumstances.

It does not establish:

* market size;
* repeatability;
* scalable acquisition;
* retention;
* acceptable implementation cost;
* that other customers share the problem;
* that the same customer will renew.

This distinction is partly broader startup reasoning, but it prevents abuse of the Mom Test's emphasis on commitment.

\-------------------------------------------------------------------------------- 

# Concepts often attributed to The Mom Test but actually broader

Several ideas fit perfectly with the book but should not be presented as unique Fitzpatrick inventions.

**Customer development / problem discovery.** Learning about customer problems before building is strongly associated with Steve Blank, Lean Startup and broader customer-development practice.

**Jobs To Be Done.** Reconstructing what customers are trying to accomplish is compatible with *The Mom Test*, but formal job statements, job maps, switching forces and related frameworks come from JTBD traditions.

**Five Whys / root-cause analysis.** Asking repeated "why" questions is not a Mom Test invention and can actually become irritating if applied mechanically.

**Qualitative coding and thematic analysis.** Formal transcript coding, saturation analysis and research protocols come primarily from qualitative research.

**Opportunity trees.** That's associated with Teresa Torres, not Fitzpatrick.

**Continuous weekly interviewing.** Compatible with Fitzpatrick, but modern continuous-discovery systems are broader than *The Mom Test*.

**ICP/persona development.** Segmentation matters, but detailed ICP frameworks shouldn't automatically be attributed to Fitzpatrick.

**Usability testing.** Watching someone use a prototype is a different research technique.

\-------------------------------------------------------------------------------- 

# Frequent misunderstandings of The Mom Test

### "Never tell customers your idea"

Too strong.

Eventually you need to test the actual proposition and ask for commitment. The principle is to **avoid contaminating discovery before you've learned about their reality**.

### "Never ask about the future"

Too strong.

Future **predictions** are weak evidence:

"Would you use this?"

Future **commitments** can be excellent evidence:

"Can we schedule your technical team for a pilot next Tuesday?"

The difference is consequence.

### "Opinions should never be discussed"

Too strong.

Opinions can generate hypotheses and useful follow-ups. They simply shouldn't be confused with behavioral validation.

### "Customers shouldn't suggest features"

They can. The mistake is treating the feature request as a validated requirement rather than investigating what produced it.

### "If customers complain, you've found a business"

No.

Complaints without significant consequences, existing effort, repeated occurrence or willingness to change may represent low-value annoyances.

### "A pre-order proves the business"

No.

It is strong evidence from one customer.

### "The Mom Test means asking a fixed set of questions"

Essentially the opposite.

Its value is primarily in **how evidence is elicited and judged**, not in a standardized questionnaire.

\-------------------------------------------------------------------------------- 

# Apparent tensions and limitations

## Past behavior can underrepresent genuinely new markets

The methodology is deliberately skeptical of hypothetical behavior, but radically new technologies sometimes enable behavior which has no historical analogue.

For example, before generative AI, a customer couldn't demonstrate historical purchasing behavior for an autonomous AI workflow exactly as it exists today.

You therefore need to examine adjacent behavior:

* what job they already perform;
* what they spend accomplishing it;
* what compromises they tolerate;
* what substitutes they use.

Then eventually test the new behavior experimentally.

\-------------------------------------------------------------------------------- 

## Existing workarounds can bias discovery toward incremental products

Someone who has invented an elaborate workaround is easy to identify as having a problem.

Someone who has simply accepted that something is impossible may possess an equally important latent need.

Mom-Test-style interviews alone can miss this.

Observation, domain expertise and technological insight may uncover opportunities customers cannot articulate.

\-------------------------------------------------------------------------------- 

## Problem evidence does not validate your solution

You can perfectly validate:

"Supplier-price collection is expensive."

while being completely wrong that:

"An autonomous procurement agent is the right solution."

Solution testing remains necessary.

\-------------------------------------------------------------------------------- 

## Interviews cannot establish prevalence

Ten excellent interviews can reveal mechanisms and hypotheses.

They cannot reliably tell you that:

"63% of German construction firms have this problem."

Market sizing, datasets, surveys or behavioral measurements are needed for prevalence.

\-------------------------------------------------------------------------------- 

## Users, buyers and decision-makers may differ

Especially in B2B:

* worker experiences problem;
* manager owns workflow;
* procurement selects vendor;
* IT blocks integration;
* owner approves spending.

One interview may therefore validate only one part of the buying system.

For your small-business focus this is often simpler because the owner may occupy several roles, but it should not be assumed.

\-------------------------------------------------------------------------------- 

## Commitment can be distorted by personal relationships

For a solo founder interviewing people they already know, introductions, pilots or even purchases can partly reflect goodwill toward the founder.

You should therefore distinguish:

`relationship-driven commitment` from `arms-length market behavior`.

That distinction is an extrapolation rather than a named Fitzpatrick rule.

\-------------------------------------------------------------------------------- 

# Where The Mom Test is insufficient

For the interviewing harness you're designing, it should be a **core evidence discipline**, not the entire discovery methodology.

You will need other frameworks for:

**Interview craft:** Portigal/Hansen are stronger on conversational technique, rapport, probing, sequencing and interview execution.

**Jobs and opportunity structure:** JTBD is stronger for understanding the underlying job independently of existing tools.

**Continuous synthesis:** Teresa Torres provides a stronger system for continuously organizing opportunities, evidence and solution experiments.

**Solution validation:** Prototype tests, concierge tests, fake doors, pilot programs and sales experiments.

**Pricing:** Van Westendorp, conjoint-style techniques where appropriate, actual pricing experiments, or simply real sales.

**Market sizing:** Desk research, datasets, surveys and market analysis.

**Usability:** Observation and task-based usability testing.

**Process discovery:** Workflow mapping, process mining, document analysis and direct observation can expose operational problems interviewees forget to mention.

For your particular use case—finding automation, digitization and agentic-workflow opportunities in small businesses—this last limitation is significant. Employees often normalize absurdly inefficient processes and therefore **do not report them as problems**. An interview harness should sometimes investigate workflows simply because they are manually expensive, even if the participant doesn't complain about them.

\-------------------------------------------------------------------------------- 

# A useful Mom Test evidence model for your AI harness

This part is an **implementation synthesis**, not something I would attribute directly to Fitzpatrick.

For every discovered opportunity, maintain something like:

```
OPPORTUNITY
  problem:
  segment:
  actor:
  trigger:
  current_workflow:
  frequency:
  consequence:
  current_workaround:
  time_cost:
  money_cost:
  failure_cost:
  existing_spend:
  previous_attempts:
  alternatives:
  switching_barriers:

EVIDENCE
  historical_facts:
  concrete_incidents:
  observed_behaviors:
  contradictory_evidence:
  opinions:
  hypotheticals:
  compliments:
  feature_requests:

COMMITMENT
  time:
  access:
  reputation:
  money:
  advancement:

CONFIDENCE
  evidence_strength:
  replication_across_interviews:
  unresolved_questions:

```

The key architectural choice is that **the transcript and the conclusions cannot be the same object**. The AI should preserve the evidentiary path from observation → inference → hypothesis.

That will protect you from one of the biggest dangers of using an LLM for discovery: the model producing a beautifully coherent narrative from weak evidence.

\-------------------------------------------------------------------------------- 

# Canonical Mom Test Rules for an AI Interviewer

If you wanted the smallest rule set that preserves most of the methodology, I would reduce it to these:

1. **Ask about the customer's life and workflow before discussing your solution.**
2. **Prefer specific past events and actual behavior over opinions or future intentions.**
3. **Whenever an answer is vague, ask for a concrete example, number, person, event or consequence.**
4. **Never reveal the answer you hope to hear through a leading question.**
5. **Treat compliments, generic claims and hypothetical promises as weak or zero evidence.**
6. **Treat customer ideas as clues; investigate the underlying problem rather than accepting the proposed solution.**
7. **Investigate how the problem is handled today, what it costs, what has already been tried and why.**
8. **Infer importance from costly behavior—time, money, effort and consequences—not adjectives.**
9. **When stated importance conflicts with actual behavior, investigate the contradiction.**
10. **Separate problem discovery from pitching and solution testing.**
11. **Prefer concrete commitments and advancement over verbal enthusiasm.**
12. **Treat time, money, reputation, access and real next steps as evidence of seriousness.**
13. **Store facts separately from interpretation and preserve contradictory evidence.**
14. **Look for repeated evidence within a defined customer segment; don't generalize from memorable anecdotes.**
15. **Never call something validated merely because customers said they liked it.**

If those 15 rules are enforced rigorously, you preserve most of what makes *The Mom Test* valuable. The rest is largely about becoming better at executing those rules without making the conversation feel like an interrogation.

