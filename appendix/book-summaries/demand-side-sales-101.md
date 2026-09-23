# Demand-Side Sales 101 — Bob Moesta

**Weight: STRONG — switching/buying behavior extraction**

The distinctive contribution of Moesta’s demand-side approach is that it treats **purchase as a change process**, not merely as a response to a problem.

A conventional problem interview may establish:

“This workflow is painful.”

Moesta pushes further:

“Why did this person tolerate the pain for two years, begin looking last Tuesday, consider three alternatives, reject two, finally buy one, and then struggle to adopt it?”

That difference is highly relevant to your harness. **Problem severity alone does not explain switching.** You need to reconstruct the forces and events that convert dissatisfaction into action.

\-------------------------------------------------------------------------------- 

## 1\. The Struggling Moment

**Classification:** Switching-force concept

### Explanation

A **struggling moment** is a situation where the customer recognizes that their current way of doing something is no longer good enough and begins to desire progress.

The important unit is not a generalized “pain point.” It is usually a **specific circumstance or episode**.

The struggle may have existed for months, but some particular event makes it salient enough that change becomes conceivable.

A struggle therefore contains:

* an existing situation,
* dissatisfaction or constraint,
* desired progress,
* circumstances that make the issue matter now.

The struggling moment is often the beginning of demand.

### Small-business software example

A construction-company manager has scheduled workers through WhatsApp and Excel for years.

Ordinary complaints:

* messages get lost;
* workers forget things;
* Excel is cumbersome.

Nothing changes.

Then one Monday:

* two workers arrive at the wrong site,
* one subcontractor receives outdated instructions,
* a client complains,
* the manager spends two hours reconstructing what happened.

That episode becomes the struggling moment.

### Interview questions

* “Can you remember when you first thought your current way of doing this wasn't working anymore?”
* “What happened?”
* “Where were you?”
* “Who else was involved?”
* “What made that particular situation frustrating?”
* “Had this happened before?”
* “Why did it matter more this time?”
* “What did you do immediately afterward?”

### Signal produced

High-value evidence includes:

* concrete event;
* temporal specificity;
* consequences;
* emotional intensity;
* immediate reaction;
* change in behavior.

Weak evidence:

“Scheduling is always annoying.”

Strong evidence:

“After we sent three people to the wrong Baustelle in March, I started looking for something else.”

### AI harness implementation

When the user states a generalized problem, the interviewer should attempt to locate a **specific episode**.

```
ABSTRACT PROBLEM
→ request latest concrete occurrence
→ reconstruct circumstances
→ identify consequence
→ ask what happened next

```

Store something like:

```
struggling_moment:
  event:
  circumstance:
  consequence:
  emotional_intensity:
  immediate_action:
  triggered_search: true/false

```

\-------------------------------------------------------------------------------- 

# 2\. Push of the Current Situation

**Classification:** Switching-force concept

### Explanation

The **push** is the dissatisfaction creating pressure to leave the current situation.

It is not simply “there is a problem.”

Push becomes meaningful when staying with the status quo begins to feel unacceptable.

Push can arise from:

* failures;
* increased workload;
* changing circumstances;
* growth;
* new regulation;
* staffing changes;
* customer complaints;
* financial pressure;
* breakdown of a workaround.

### Example

A bookkeeping firm manages client onboarding through email.

For years the system is annoying but workable.

Then the firm grows from 5 to 15 employees. Missing attachments and duplicated requests increase sharply.

Growth increases the **push away from email**.

### Questions

* “What wasn't working anymore?”
* “Why couldn't you continue doing it the old way?”
* “What changed?”
* “What was getting worse?”
* “What finally became unacceptable?”
* “What would have happened if you did nothing?”

### Signal produced

Evidence of:

* status-quo dissatisfaction;
* cost of inaction;
* increasing pressure;
* triggering circumstances.

### AI harness implementation

Separate:

```
problem exists

```

from:

```
problem generates switching pressure

```

Suggested variables:

```
push:
  source:
  intensity:
  increasing_or_stable:
  consequences:
  cost_of_inaction:

```

A recurring annoyance with negligible consequence should receive lower switching significance than a recent breakdown with operational consequences.

\-------------------------------------------------------------------------------- 

# 3\. Pull of the New Solution

**Classification:** Switching-force concept

### Explanation

The **pull** is the attractiveness of a different future.

Customers do not switch purely because the old solution is bad. They must perceive an alternative capable of enabling meaningful progress.

The pull can come from:

* a product;
* another workflow;
* outsourcing;
* hiring someone;
* automation;
* an internal tool;
* simply doing the task differently.

The customer's imagined future matters as much as the feature set.

### Example

The construction manager sees another company using an app where:

* workers see tomorrow's site automatically;
* photos are attached to the project;
* managers know who received instructions.

The imagined future becomes:

“I wouldn't need to coordinate everything myself every evening.”

That is stronger than “the app has scheduling.”

### Questions

* “When you started looking, what were you hoping would be different?”
* “What did you imagine a better way would look like?”
* “What attracted you to this particular approach?”
* “What made you think this could actually solve the problem?”
* “Which part of the new way seemed most valuable?”

### Signal produced

Evidence of:

* desired progress;
* expected outcomes;
* perceived differentiation;
* customer-defined value.

### AI harness implementation

Do not translate pull immediately into features.

Capture:

```
pull:
  desired_future:
  expected_progress:
  attractive_attributes:
  expected_outcomes:

```

Example:

Bad synthesis:

Customer wants automated scheduling.

Better:

Customer wants to stop manually coordinating worker assignments every evening.

\-------------------------------------------------------------------------------- 

# 4\. Anxiety of the New Solution

**Classification:** Adoption barrier

### Explanation

Even when customers dislike their current situation and like an alternative, uncertainty about switching can prevent action.

Typical anxieties include:

* implementation risk;
* price;
* migration;
* employee resistance;
* learning curve;
* reliability;
* vendor longevity;
* data security;
* fear that the promised improvement will not materialize.

This is a major difference between problem discovery and buying-process discovery.

A customer can simultaneously say:

“I really need this.”

and:

“I'm not going to buy it.”

### Example

A company likes a new field-management system but worries:

“My workers barely use email. They're never going to install and learn another application.”

The product solves the manager's problem but creates perceived adoption risk.

### Questions

* “What worried you about changing?”
* “What almost stopped you?”
* “What questions did you need answered before deciding?”
* “What seemed risky?”
* “Who was concerned about the change?”
* “Was there anything you didn't trust yet?”
* “What did you think could go wrong?”

### Signal produced

Evidence of:

* adoption blockers;
* perceived risk;
* unresolved questions;
* stakeholder objections.

### AI harness implementation

Maintain an explicit **anxiety ledger**:

```
anxieties:
  - concern:
    stakeholder:
    severity:
    evidence_needed:
    resolved_by:

```

This later informs onboarding, messaging, trials, guarantees, implementation services, and sales collateral.

\-------------------------------------------------------------------------------- 

# 5\. Habit of the Present

**Classification:** Adoption barrier

### Explanation

Habit is the inertia pulling customers back toward their current method.

The existing approach has advantages that innovators often underestimate:

* familiar;
* already configured;
* socially accepted;
* employees understand it;
* no migration required;
* sunk learning;
* known imperfections;
* embedded into surrounding processes.

The alternative doesn't merely compete with the weaknesses of the old system. It competes with its **familiarity and accumulated integration into everyday work**.

### Example

The construction company complains constantly about WhatsApp.

Yet WhatsApp has enormous habit strength:

* every worker already has it;
* no onboarding;
* everyone knows how to send photos;
* no passwords;
* managers already understand the workflow.

A replacement must beat those advantages as well as fix the problems.

### Questions

* “What worked well enough about the old way?”
* “What made it difficult to stop using?”
* “What would you miss?”
* “What did everyone already know how to do?”
* “What information would have to be moved?”
* “What routines would have to change?”

### Signal produced

Evidence of:

* switching friction;
* incumbent strengths;
* migration burden;
* behavioral inertia.

### AI harness implementation

Whenever an interviewee criticizes the current solution, deliberately probe its advantages.

```
Current solution weakness
→ Why haven't you replaced it?
→ What does it still do well?
→ What would switching disrupt?

```

This prevents a severe discovery error:

assuming dissatisfaction means willingness to switch.

\-------------------------------------------------------------------------------- 

# 6\. Four Forces of Progress

**Classification:** Switching-force concept

This is the central switching model associated with Moesta's JTBD work.

The switch is shaped by four forces:

```
FOR CHANGE
Push of current situation
+
Pull of new solution

VERSUS

AGAINST CHANGE
Habit of current situation
+
Anxiety of new solution

```

Conceptually:

```
             SWITCH

Push ───────────────►
Pull ───────────────►

Habit ◄──────────────
Anxiety ◄────────────

```

A strong opportunity may therefore fail commercially if the second pair remains strong.

### Example

A contractor considers field-management software.

**Push**

“Scheduling mistakes are costing us money.”

**Pull**

“The new system would centralize jobs and worker instructions.”

**Anxiety**

“Will my older workers actually use it?”

**Habit**

“Everyone already has WhatsApp.”

The buying decision cannot be understood by studying the pain alone.

### Questions

The harness should explicitly reconstruct all four:

**Push**

* “What made the old way unacceptable?”

**Pull**

* “What attracted you to a different way?”

**Anxiety**

* “What made you hesitate?”

**Habit**

* “What made staying with the old way easier?”

### Signal produced

A **switching-force profile**.

### AI harness implementation

```
switching_forces:
  push:
  pull:
  anxiety:
  habit:

```

Never infer:

```
high pain → high purchase probability

```

Instead establish whether the interview contains actual evidence for each force.

\-------------------------------------------------------------------------------- 

# 7\. First Thought

**Classification:** Timeline rule

### Explanation

A purchase process often begins long before active shopping.

The **first thought** is the earliest moment when the customer begins to imagine that things could be different.

It may be:

“Maybe we should find some software for this.”

This often precedes actual research by weeks or months.

The first thought helps expose **why demand started forming**.

### Example

A business owner says:

“We bought the software in June.”

A conventional interview begins in June.

A timeline interview discovers:

“Actually, in February our office manager left, and that's when I first started thinking we couldn't keep coordinating everything manually.”

That February event may contain the real causal insight.

### Questions

* “When did the idea of changing first enter your mind?”
* “What was happening at the time?”
* “Do you remember the first time you thought, ‘there must be a better way’?”
* “What caused that thought?”

### Signal produced

* originating circumstance;
* initial trigger;
* gap between problem awareness and action.

### AI harness implementation

When interviewing a recent purchaser, force chronology backward until the interviewee reaches the **earliest identifiable thought of change**.

\-------------------------------------------------------------------------------- 

# 8\. Passive Looking

**Classification:** Timeline rule / Buying signal

### Explanation

After the first thought, customers may begin collecting information without committing to solving the problem.

This can include:

* noticing advertisements;
* asking colleagues;
* casually browsing;
* watching videos;
* remembering competitors;
* reading articles;
* asking someone what they use.

This matters because buying often develops gradually rather than appearing as a clean funnel.

### Example

The owner sees a LinkedIn post about construction scheduling software and bookmarks it but does nothing.

Three weeks later he asks another contractor which app they use.

Neither action looks like formal procurement, but both reveal growing demand.

### Questions

* “Before you seriously started looking, did you notice any possible solutions?”
* “Did you ask anyone what they used?”
* “Did you bookmark or save anything?”
* “What did you casually look at?”
* “What made you pay attention to those things?”

### Signal produced

Early intent formation.

### AI harness implementation

Distinguish:

```
awareness
≠
passive consideration
≠
active evaluation

```

Capture low-commitment search activity rather than treating the purchase as beginning with a demo request.

\-------------------------------------------------------------------------------- 

# 9\. Active Looking

**Classification:** Buying signal / Timeline rule

### Explanation

At some point, search becomes purposeful.

The customer starts investing meaningful effort:

* Google searches;
* demos;
* comparison pages;
* asking vendors;
* requesting prices;
* involving colleagues;
* creating spreadsheets;
* testing products.

The transition from passive to active looking often signals that the **push has intensified**.

### Example

After another scheduling failure, the manager searches:

“Baustellen Mitarbeiterplanung App”

He opens five products and books two demonstrations.

### Questions

* “When did you start seriously looking?”
* “What happened just before that?”
* “What did you search for?”
* “Which products or approaches did you investigate?”
* “Who did you speak to?”
* “How many alternatives did you consider?”

### Signal produced

Strong behavioral evidence of purchase intent.

### AI harness implementation

Look for **resource expenditure**:

* time;
* attention;
* meetings;
* internal discussions;
* trials;
* budget investigation.

These are substantially stronger demand signals than statements like:

“I'd probably use something like that.”

\-------------------------------------------------------------------------------- 

# 10\. Deciding

**Classification:** Timeline rule

### Explanation

The customer's decision is not necessarily determined by the feature comparison a vendor imagines.

The buyer may narrow choices based on:

* trust;
* implementation effort;
* compatibility;
* recommendation;
* timing;
* familiarity;
* price;
* risk reduction;
* internal stakeholder approval.

Timeline reconstruction should identify the actual **decision criteria and trade-offs**.

### Example

A company compares three products.

One has the most functionality.

They choose another because:

“The workers could use it without individual accounts.”

That implementation detail—not broad product superiority—becomes decisive.

### Questions

* “What alternatives were left at the end?”
* “What were you comparing?”
* “What almost made you choose the other option?”
* “Why did you reject it?”
* “What ultimately tipped the decision?”
* “Who needed to agree?”
* “What happened immediately before you purchased?”

### Signal produced

* actual decision criteria;
* trade-offs;
* internal buying dynamics;
* decisive moments.

### AI harness implementation

Capture:

```
decision:
  finalists:
  decision_criteria:
  rejected_alternatives:
  decisive_factor:
  stakeholders:
  approval_process:

```

Do not substitute vendor-created competitive categories for customer-created criteria.

\-------------------------------------------------------------------------------- 

# 11\. Consuming / Using

**Classification:** Timeline rule / Sales implication

### Explanation

Buying does not end when payment occurs.

Moesta's demand-side perspective extends into **consumption**, because the customer hired something to make progress and must actually achieve that progress.

Critical questions include:

* Did adoption occur?
* Did expectations match reality?
* Where did implementation struggle?
* What surprised the buyer?
* When did value become visible?

This separates:

```
customer purchased

```

from:

```
customer successfully made progress

```

### Example

The construction company purchases the platform.

Management loves it.

Workers ignore notifications and continue sending photos through WhatsApp.

The purchase happened, but the job has not been fully accomplished.

### Questions

* “What happened immediately after you bought it?”
* “How did you start using it?”
* “What was difficult?”
* “When did you realize it was working?”
* “What didn't work as expected?”
* “Did you continue using the old system for anything?”

### Signal produced

* onboarding friction;
* product-value realization;
* incomplete switching;
* hidden coexistence with incumbents.

### AI harness implementation

Extend the timeline:

```
First Thought
→ Passive Looking
→ Active Looking
→ Deciding
→ Buying
→ First Use
→ Adoption
→ Ongoing Use

```

Do not terminate a switching interview at purchase.

\-------------------------------------------------------------------------------- 

# 12\. Timeline Interview

**Classification:** Interview technique

### Explanation

One of the most powerful techniques in Moesta's approach is reconstructing the actual chronology of a purchase.

Rather than ask:

“Why did you buy this?”

the interviewer reconstructs:

```
What happened?
Then what?
Then what?
When?
Who was there?
What changed?
What did you do next?

```

The goal is closer to **forensic reconstruction** than opinion collection.

Memories become more reliable when attached to:

* locations;
* people;
* events;
* sequence;
* actions.

### Example

Instead of:

“Why did you choose this CRM?”

reconstruct:

“When did you first think you needed something different?”

“What happened next?”

“When did you first Google something?”

“What did you type?”

“Who did you talk to?”

“Which products did you look at?”

“What made you eliminate the first one?”

### Signal produced

A causal sequence rather than post-hoc rationalization.

### AI harness implementation

Implement a **timeline state machine**.

```
FIRST THOUGHT
     ↓
PASSIVE SEARCH
     ↓
ACTIVE SEARCH
     ↓
EVALUATION
     ↓
DECISION
     ↓
PURCHASE
     ↓
USE

```

The model should keep track of missing transitions and revisit them.

Example:

```
Customer: “Eventually we bought Tool X.”

Harness:
“You mentioned deciding to buy it. Before that happened,
when did you first start seriously comparing alternatives?”

```

\-------------------------------------------------------------------------------- 

# 13\. Anchor Memories to Context

**Classification:** Interview technique

### Explanation

Timeline interviewing works better when the interviewer helps people reconstruct the scene.

Questions about context can unlock more accurate memories:

* Where were you?
* What day/week was it?
* Who were you talking to?
* What had happened earlier?
* What device were you using?
* What did you do immediately afterward?

This reduces generic retrospective explanation.

### Example

Instead of:

“How did you find the software?”

Ask:

“Do you remember where you were when you first searched for it?”

The owner may answer:

“I was sitting in the van after leaving the Baustelle because the supervisor hadn't sent the weekly report again.”

Now you have the actual trigger.

### Signal produced

Specificity and chronology.

### AI harness implementation

When responses become vague, invoke contextual anchors.

```
VAGUE MEMORY
→ physical context
→ people present
→ preceding event
→ subsequent action

```

\-------------------------------------------------------------------------------- 

# 14\. Behavior Before Explanation

**Classification:** Interview technique / Anti-pattern

### Explanation

People frequently produce reasonable-sounding explanations for purchases after the fact.

The interviewer should prioritize:

* events;
* behaviors;
* sequences;
* actions;

before abstract reasoning.

Instead of accepting:

“We wanted better collaboration.”

find out what actually happened.

### Example

“Better collaboration” turns into:

“Our site manager took a sick day and nobody knew which subcontractors were expected that morning.”

The second statement contains usable evidence.

### Questions

* “What happened that made that important?”
* “Can you give me the specific example?”
* “What did you do?”
* “What happened immediately before that?”
* “And after?”

### Signal produced

Observable causal evidence.

### AI harness implementation

Create an abstraction detector for statements such as:

* “more efficient”;
* “better visibility”;
* “easy to use”;
* “save time”;
* “improve communication.”

Immediately request the event behind the abstraction.

\-------------------------------------------------------------------------------- 

# 15\. True Alternatives

**Classification:** Switching-force concept / Sales implication

### Explanation

Competition must be understood from the customer's perspective.

Products compete when customers consider them plausible ways of making the same progress.

Therefore competition may cross product categories.

A software product may compete with:

* Excel;
* WhatsApp;
* paper;
* an employee;
* outsourcing;
* doing nothing;
* tolerating the problem.

### Example

A field-management SaaS founder might believe competitors are:

Tool A, Tool B, Tool C.

The customer may actually consider:

1. keep WhatsApp;
2. hire another dispatcher;
3. reorganize Excel;
4. buy software.

Those are the true alternatives.

### Questions

* “What else did you consider doing?”
* “What would you have done if you hadn't bought this?”
* “Did you consider keeping the current process?”
* “Did you consider hiring someone?”
* “Did you try fixing the existing workflow first?”

### Signal produced

Actual competitive set.

### AI harness implementation

Never constrain competitor extraction to software vendors.

```
alternatives:
  - product
  - manual_workaround
  - internal_process
  - employee
  - outsourced_service
  - status_quo

```

\-------------------------------------------------------------------------------- 

# 16\. The Status Quo Is a Competitor

**Classification:** Switching-force concept

### Explanation

One of the strongest competitors in many markets is simply:

doing nothing differently.

Customers may dislike the existing situation but still choose it because switching costs exceed perceived benefit.

### Example

A company loses perhaps €500/month through inefficient scheduling but expects implementation to consume management attention for several weeks.

They keep Excel.

### Questions

* “Why didn't you change earlier?”
* “What allowed you to tolerate the problem?”
* “What would have happened if you simply kept doing things the same way?”
* “What made staying put attractive?”

### Signal produced

* inertia;
* switching threshold;
* hidden advantages of the incumbent.

### AI harness implementation

Always include:

```
STATUS QUO

```

as an explicit alternative during synthesis.

\-------------------------------------------------------------------------------- 

# 17\. Why Now?

**Classification:** Buying signal

### Explanation

A crucial demand-side question is not merely:

“Why do you have this problem?”

but:

**“Why did change happen now?”**

A persistent pain may exist for years.

Something usually changes in the customer's circumstances before action occurs.

### Example

Manual invoicing has been painful for years.

Then:

* invoice volume doubles;
* accountant raises fees;
* employee handling invoices resigns.

Suddenly software becomes urgent.

### Questions

* “What changed recently?”
* “Why didn't you solve it six months earlier?”
* “Why did you start looking at that particular moment?”
* “What would have happened if that event hadn't occurred?”

### Signal produced

Trigger conditions for demand.

### AI harness implementation

Require opportunity records to distinguish:

```
problem:
trigger:
why_now:

```

This is especially valuable for go-to-market strategy because trigger conditions can identify **who is entering the market right now**.

\-------------------------------------------------------------------------------- 

# 18\. Revealed Buying Criteria

**Classification:** Buying signal

### Explanation

Customers often claim certain attributes matter but behave according to different criteria during an actual purchase.

A switching interview identifies **revealed criteria** through elimination and decision behavior.

### Example

Customer says:

“Price was very important.”

But during reconstruction:

* they rejected the cheapest product;
* chose the more expensive product because setup was easier.

The revealed priority is implementation risk rather than price.

### Questions

* “Why didn't you choose the cheaper option?”
* “What caused you to eliminate that one?”
* “What did the winning solution have that mattered?”
* “What trade-off were you willing to make?”

### Signal produced

Observed trade-offs rather than declared preferences.

### AI harness implementation

Keep separate:

```
stated_criteria:
revealed_criteria:

```

Give more evidential weight to criteria supported by actual purchase behavior.

\-------------------------------------------------------------------------------- 

# 19\. Trade-Offs Reveal Value

**Classification:** Sales implication

### Explanation

Purchases involve trade-offs.

Understanding what customers willingly sacrifice can reveal what they actually value.

Examples:

* more money for easier implementation;
* fewer features for simplicity;
* less customization for reliability;
* manual onboarding for trust.

### Example

A trades company chooses a €200/month platform over a €100/month competitor because the vendor imports their current Excel data.

The trade-off reveals that migration effort matters more than €100/month.

### Questions

* “What was worse about the option you chose?”
* “What were you willing to give up?”
* “Why was that acceptable?”
* “What mattered more?”

### Signal produced

Relative priorities.

### AI harness implementation

Capture explicit trade-offs:

```
tradeoff:
  accepted_cost:
  received_benefit:

```

Trade-offs often contain more reliable value information than 1–10 importance scores.

\-------------------------------------------------------------------------------- 

# 20\. Purchase Momentum Is Gradual

**Classification:** Timeline rule

### Explanation

Customers rarely move cleanly from:

```
problem → search → purchase

```

Demand often accumulates through several events.

One failure produces dissatisfaction.

Another generates first thought.

A recommendation introduces an alternative.

Another failure increases urgency.

A demo reduces anxiety.

An internal event finally produces the purchase.

### Example

```
January:
missed assignment

March:
employee complains

April:
owner sees competitor using software

May:
another scheduling failure

May:
searches solutions

June:
trial

July:
purchase

```

### Questions

* “What happened between first thinking about it and actually buying?”
* “Was there anything that made you stop searching?”
* “What brought you back to the problem?”
* “Did urgency change over time?”

### Signal produced

Demand formation rather than merely final transaction.

### AI harness implementation

Allow **multiple events per force** rather than searching for one cause.

\-------------------------------------------------------------------------------- 

# 21\. Buying Is Not a Vendor Funnel

**Classification:** Sales implication / Anti-pattern

### Explanation

Businesses often conceptualize buyers through seller-centric stages:

```
lead
→ MQL
→ demo
→ proposal
→ close

```

Moesta's demand-side view asks instead what the buyer was actually doing:

```
struggling
→ considering change
→ noticing alternatives
→ actively searching
→ evaluating
→ reducing uncertainty
→ committing
→ consuming

```

These views are not identical.

### Example

A CRM records:

Demo booked Tuesday.

But the customer's buying process may have started four months earlier when their salesperson quit.

The CRM observes the vendor interaction, not the formation of demand.

### AI harness implementation

Keep customer-side chronology independent from vendor-side funnel events.

\-------------------------------------------------------------------------------- 

# 22\. Reduce Anxiety Instead of Increasing Persuasion

**Classification:** Sales implication

### Explanation

If push and pull are already strong, increasing sales pressure may be less useful than reducing anxiety.

Customers might already want the solution.

They may simply need:

* migration proof;
* trial;
* reference customer;
* data-security explanation;
* training;
* onboarding assistance;
* cancellation terms.

### Example

Manager:

“I know this would solve our issue, but I'm afraid my workers won't use it.”

The right intervention may not be another feature demo.

It could be:

“We'll onboard the crew with you and they don't need individual passwords.”

### Signal produced

Sales enablement opportunities.

### AI harness implementation

For every anxiety, ask:

```
What evidence/action would reduce this uncertainty?

```

This can later generate:

* onboarding requirements;
* proof assets;
* trial design;
* messaging;
* guarantees.

\-------------------------------------------------------------------------------- 

# 23\. Do Not Ask Customers to Design the Solution

**Classification:** Anti-pattern

### Explanation

Demand-side investigation centers on:

* circumstances;
* struggles;
* desired progress;
* behavior;
* decisions.

Questions such as:

“What features should we build?”

skip the underlying causal structure.

### Better questions

* “What were you trying to accomplish?”
* “What did you try?”
* “What was difficult?”
* “What alternatives did you consider?”
* “What made you switch?”

### AI harness implementation

Treat feature requests as evidence requiring decomposition.

```
“We need automatic reminders.”
↓
“When did you last need that?”
↓
“What happened?”
↓
“What were you trying to prevent?”

```

\-------------------------------------------------------------------------------- 

# 24\. Do Not Confuse Satisfaction With Switching Pressure

**Classification:** Anti-pattern

### Explanation

A customer can dislike a product yet remain indefinitely.

Conversely, a customer can consider an existing product fairly good but switch because circumstances change dramatically.

Therefore:

```
dissatisfaction ≠ demand

```

Demand emerges from the entire switching system.

### Example

Owner:

“Excel is terrible.”

Yet they have used it for seven years.

Unless something changes the force balance, the complaint has weak commercial significance.

### AI harness implementation

Never elevate an opportunity solely because complaint frequency is high.

Ask:

* Has anyone changed behavior?
* Have they searched?
* Have they spent money?
* Have they constructed workarounds?
* Has a triggering event occurred?

\-------------------------------------------------------------------------------- 

# 25\. Interview Recent Switchers

**Classification:** Interview technique

### Explanation

For understanding buying causality, customers who **recently switched** are unusually valuable because they can reconstruct actual behavior.

They experienced:

* old solution;
* struggling moment;
* search;
* alternatives;
* decision;
* purchase;
* adoption.

Prospects who have never switched can speculate but cannot provide the same evidence.

### AI harness implementation

Tag interview type:

```
interviewee_state:
  current_nonbuyer
  searching
  recent_buyer
  recent_switcher
  churned

```

Use different interview logic for each.

For switch analysis, prioritize recent switchers.

\-------------------------------------------------------------------------------- 

# 26\. Reconstruct, Don't Rationalize

**Classification:** Interview technique / Anti-pattern

### Explanation

The question:

“Why did you buy?”

often invites a tidy explanation constructed after the event.

Chronological reconstruction forces greater fidelity.

Instead of asking for a conclusion:

“Why?”

reconstruct the sequence producing the conclusion.

### AI harness implementation

Prefer:

```
What happened before that?
What happened next?
When?
Who was involved?
What did you do?

```

over repeated abstract:

```
Why?

```

\-------------------------------------------------------------------------------- 

# What Moesta Adds Beyond Ordinary Problem Interviews

This is the main reason to retain **Demand-Side Sales 101** separately in your harness.

A strong conventional discovery interview may identify:

```
WHO
has
WHAT PROBLEM
under
WHAT CIRCUMSTANCES
with
WHAT CURRENT WORKAROUND

```

Moesta adds another layer:

```
WHY THEY FINALLY CHANGED
WHEN THEY CHANGED
WHAT CAUSED THE SEARCH
WHAT THEY CONSIDERED
WHAT PREVENTED THE SWITCH
WHAT REDUCED THE RISK
WHAT ACTUALLY WON THE DECISION

```

That produces materially different information.

| Ordinary discovery uncovers | Demand-side investigation adds              |
| --------------------------- | ------------------------------------------- |
| Pain                        | Whether pain generates switching pressure   |
| Current workflow            | Why the workflow survived despite its flaws |
| Desired outcome             | What future created sufficient pull         |
| Existing tools              | True alternatives considered                |
| Frustration                 | Triggering struggling moment                |
| Feature needs               | Revealed decision criteria                  |
| Stated willingness          | Actual search/purchase behavior             |
| Problem severity            | Why now                                     |
| Objections                  | Anxiety preventing adoption                 |
| Workaround                  | Habit protecting the status quo             |
| Buyer                       | Buying chronology and stakeholders          |
| Purchase                    | Consumption/adoption success                |

The most important conceptual distinction is:

**A good problem is not necessarily a good market.**

A commercially attractive opportunity requires some mechanism capable of producing movement away from the status quo.

\-------------------------------------------------------------------------------- 

# Implications for Your Discovery Harness

Your existing methodology from **The Mom Test + Deploy Empathy + Torres + JTBD** is already good at discovering:

* reality rather than hypotheticals;
* concrete stories;
* pain;
* jobs;
* desired outcomes;
* current workflows.

Moesta should not duplicate those layers.

His material should primarily power a separate **Switching Investigation Mode**.

A useful model would be:

```
DISCOVERY LAYER
What work are they doing?
What problems occur?
What outcomes matter?

        ↓

JTBD LAYER
What progress are they trying to make?
Under what circumstances?
What alternatives perform the job?

        ↓

SWITCHING LAYER
What creates push?
What creates pull?
What causes anxiety?
What preserves habit?
Why now?

        ↓

BUYING TIMELINE
First thought
→ passive looking
→ active looking
→ deciding
→ buying
→ consuming

```

This prevents the harness from asking an entire Demand-Side Sales interview when the interviewee has never bought or switched anything relevant.

\-------------------------------------------------------------------------------- 

# Suggested AI Switching Interview State Machine

A practical implementation could be:

```
1. IDENTIFY SWITCH
   “You mentioned moving from X to Y.”

2. FIRST THOUGHT
   “When did you first think you might need something different?”

3. STRUGGLING MOMENT
   “What was happening?”

4. PUSH
   “What wasn't working anymore?”

5. PASSIVE LOOKING
   “Did you notice or explore anything before seriously searching?”

6. ACTIVE LOOKING
   “When did you start seriously investigating alternatives?”

7. ALTERNATIVES
   “What else did you consider?”

8. PULL
   “What attracted you toward the new approach?”

9. ANXIETY
   “What worried you about switching?”

10. HABIT
    “What made staying with the old way easier?”

11. DECISION
    “What ultimately tipped the decision?”

12. ADOPTION
    “What happened after you bought?”

13. OUTCOME
    “Did it deliver the progress you expected?”

```

The AI should not rigidly run every question. It should use this model as **missing-evidence detection**.

\-------------------------------------------------------------------------------- 

# Evidence Model for the Harness

Moesta's framework suggests a useful distinction between **problem evidence** and **switching evidence**.

### Level 0 — Opinion

“Better scheduling software would be nice.”

Little value.

### Level 1 — Existing struggle

“Scheduling takes me an hour every evening.”

Problem evidence.

### Level 2 — Struggling event

“Last Friday two people went to the wrong site.”

Strong problem evidence.

### Level 3 — Search behavior

“After that I searched for scheduling tools.”

Switching evidence.

### Level 4 — Evaluation

“I demoed three products.”

Strong demand evidence.

### Level 5 — Commitment

“We paid €250/month and migrated our worker list.”

Very strong revealed demand.

This hierarchy is partly a synthesis with your other sources rather than a formal Moesta scoring system, but it fits his demand-side logic extremely well.

\-------------------------------------------------------------------------------- 

# Canonical Switching and Buying Rules for the Harness

1. **Do not equate pain with demand.** A painful problem becomes commercially meaningful only when circumstances create sufficient motivation to change.
2. **Find the struggling moment.** Replace generalized dissatisfaction with the concrete situation that caused the customer to consider progress.
3. **Always ask “why now?”** Persistent problems matter less than the event or circumstance that finally activates demand.
4. **Model all four switching forces.** Capture push, pull, anxiety, and habit independently.
5. **Study forces against the switch as seriously as forces toward it.** Anxiety and habit explain why apparently excellent opportunities remain unsold.
6. **Treat the status quo as a real competitor.** “Do nothing” often beats every vendor.
7. **Discover true alternatives from customer behavior.** Competition can include software, manual processes, employees, outsourcing, workarounds, and non-consumption.
8. **Reconstruct purchases chronologically.** Prefer actual sequences of events over retrospective explanations.
9. **Trace the journey back to first thought.** The meaningful cause of purchase often predates active shopping by weeks or months.
10. **Distinguish passive from active looking.** Casual attention indicates emerging demand; purposeful search indicates materially stronger intent.
11. **Ask what changed between stages.** Transitions reveal causal forces.
12. **Anchor memory in circumstances.** Ask where, when, who was present, what happened immediately before, and what happened afterward.
13. **Prefer behavior to stated preference.** Searches, trials, demos, comparisons, purchases, migrations, and workarounds outweigh hypothetical enthusiasm.
14. **Infer buying criteria from trade-offs.** What customers reject, tolerate, or pay more for frequently reveals value better than direct importance questions.
15. **Capture anxiety explicitly.** Fear of implementation, adoption, migration, cost, trust, or risk can block an otherwise desirable switch.
16. **Capture the advantages of the incumbent.** Familiarity, existing integrations, learned behavior, and low perceived risk explain habit.
17. **Do not stop at purchase.** Follow the customer through onboarding and consumption to determine whether the promised progress actually occurred.
18. **Interview recent switchers when studying buying behavior.** They provide actual switching evidence rather than hypothetical intent.
19. **Separate customer buying stages from the vendor's sales funnel.** The customer journey begins before the vendor sees the lead.
20. **Use sales to help customers make progress, not merely to persuade.** Identify which unresolved anxieties or switching costs prevent an already-motivated customer from moving.
21. **Do not treat complaints as market validation.** A complaint becomes stronger evidence when followed by search, workaround, spending, commitment, or switching.
22. **Preserve causal traceability.**

```
circumstance
→ struggling moment
→ push
→ first thought
→ search
→ alternatives
→ pull / anxiety / habit
→ decision
→ switch
→ consumption
→ progress

```

1. **The harness should ask “What caused movement?” rather than merely “What problem exists?”**
2. **The highest-value output of a switching interview is not a feature request.** It is an explanation of the circumstances and forces that caused a person to abandon one way of making progress and adopt another.
3. **Use Moesta primarily as a switching/buying module, not as the universal interview framework.** Fitzpatrick, Hansen, Portigal, Torres, and Kalbach are better foundations for general discovery; Moesta becomes particularly valuable once an actual change, purchase, abandonment, or active search can be reconstructed.

