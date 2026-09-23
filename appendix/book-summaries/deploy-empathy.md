# Deploy Empathy — Practical Methodology Extraction

I checked Hansen’s public draft material and later explanations against my internal knowledge so I could separate distinctive *Deploy Empathy* techniques from generic customer-research practice. The methodology is especially useful for your harness because Hansen concentrates on something *The Mom Test* covers less deeply: **the conversational mechanics that cause a person to feel safe enough to keep talking**. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

### Provenance labels

* **[H] Hansen-characteristic** — strongly associated with Hansen's treatment, phrasing, or emphasis.
* **[S] Shared** — clearly part of *Deploy Empathy*, but also common to JTBD, qualitative interviewing, *The Mom Test*, Portigal, etc.
* **[E] Extrapolation** — implementation logic I am deriving for your AI interviewer rather than attributing directly to Hansen.

\-------------------------------------------------------------------------------- 

# I. Foundational interview posture

## 1\. Build a map of their world

**Classification:** Principle / Empathy technique **Origin:** **[H]**

**Purpose:** Understand why a person's behavior is reasonable given their incentives, constraints, history, organization, and goals.

**How it works:** The interviewer temporarily suspends its own judgment about whether a workflow is sensible. The goal is not to diagnose what's "wrong" with the interviewee's behavior but to discover why that behavior exists. Hansen describes empathy as recognizing that someone else's actions make sense from their perspective. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

**Example:** Instead of:

"Why are you still using spreadsheets for that?"

Use something like:

"Can you walk me through how the spreadsheet became part of this process?"

Then investigate approvals, collaborators, downstream dependencies, legacy requirements, customer expectations, etc.

**Bad alternative:** Treating apparently inefficient behavior as stupidity, resistance to change, or evidence that the customer simply needs your solution.

**Signal produced:** Constraints, incentives, dependencies, historical reasons, hidden stakeholders, switching barriers.

**AI interviewer implementation:** Maintain an explicit internal rule:

`Observed irrationality =&gt; investigate context, never correct it.`

When something looks inefficient, trigger a **constraint-exploration branch**, not a recommendation.

\-------------------------------------------------------------------------------- 

## 2\. Make the interview about them, not about you

**Classification:** Principle / Anti-pattern **Origin:** **[H]**

**Purpose:** Prevent the interviewer from contaminating the conversation with its own experiences, expertise, or opinions.

**How it works:** The interviewer suppresses the normal conversational instinct to relate, impress, explain, sympathize through personal stories, or offer solutions. Hansen has described the ideal as making the interviewer almost disappear as a person with opinions so attention remains on the interviewee's experience. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

**Example:**

Interviewee: "We usually spend Friday afternoons fixing the invoices."

Useful:

"Friday afternoons?"

or:

"Can you tell me more about what happens then?"

Not useful:

"Yeah, I know exactly what you mean. We had the same issue at my previous company."

**Bad alternative:** Reciprocal conversation in which interviewer and interviewee trade experiences.

**Signal produced:** More uninterrupted narrative and fewer answers shaped by the interviewer.

**AI interviewer implementation:** Ban responses that introduce the AI's own experience, advice, product ideas, or judgment while in discovery mode.

\-------------------------------------------------------------------------------- 

## 3\. Empathy is behavior, not sentiment

**Classification:** Empathy technique **Origin:** **[H]**

**Purpose:** Make empathy operational rather than merely instructing the interviewer to "be empathetic."

**How it works:** Empathy appears through concrete actions:

* listening;
* allowing space;
* reflecting;
* validating the person's perspective;
* asking without judgment;
* showing curiosity;
* letting them correct you.

Hansen explicitly treats empathy as something a person can learn and *do*, rather than a personality trait one either possesses or lacks. ([CaSE](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.case-podcast.org%2F46-michele-hansen-on-customer-interviews-and-deploying-empathy%2Ftranscript%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

"That makes sense."

Pause.

Interviewee often continues without another actual question.

**Bad alternative:**

"Don't worry, that's totally normal."

That reassures or interprets rather than investigates.

**Signal produced:** Longer answers, disclosure, corrections, emotional context.

**AI interviewer implementation:** Treat empathy as a repertoire of observable dialogue moves, not a tone prompt such as "be warm."

\-------------------------------------------------------------------------------- 

# II. Getting people to talk

## 4\. Use a harmless, gentle conversational tone

**Classification:** Conversation technique / Empathy technique **Origin:** **[H]**

**Purpose:** Reduce defensiveness and perceived judgment.

**How it works:** Hansen emphasizes a soft, calm, genuinely curious manner. Identical semantic questions can produce very different answers depending on intonation and framing. Her published material specifically recommends the least threatening voice possible while still treating the participant as an adult you respect. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fhow-to-talk-so-people-will-talk-use-a-gentle-tone-of-voice-and-simple-wording-478218))

**Example:**

Better:

"Can you tell me a little more about why you do it that way?"

Worse:

"Why would you do it that way?"

**Bad alternative:** Abrupt, clinical, highly formal, skeptical, or interrogative delivery.

**Signal produced:** Reduced defensiveness and more explanation around unusual behavior.

**AI interviewer implementation:** For voice:

* moderate pace;
* neutral-warm intonation;
* no incredulous stress;
* no rapid-fire questioning.

For text:

* use conversational softeners sparingly;
* avoid prosecutorial "why?";
* keep syntax uncomplicated.

\-------------------------------------------------------------------------------- 

## 5\. Use simple language

**Classification:** Conversation technique **Origin:** **[H]**

**Purpose:** Minimize cognitive load and social distance.

**How it works:** Hansen explicitly recommends ordinary wording rather than polished research/business terminology. Even imperfect conversational grammar can be preferable to formal wording. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fhow-to-talk-so-people-will-talk-use-a-gentle-tone-of-voice-and-simple-wording-478218))

**Example:**

Better:

"What's the big picture of what you're trying to get done?"

Rather than:

"What are your primary objectives for this operational process?"

**Bad alternative:** Corporate language, consultant vocabulary, compound questions.

**Signal produced:** More natural responses in the interviewee's own vocabulary.

**AI interviewer implementation:** Apply a simplicity filter before sending each question:

* one conceptual question;
* ordinary words;
* short sentence;
* use interviewee's terminology where possible.

For small-business interviews, this is particularly important when talking to employees who do not use software/product-management terminology.

\-------------------------------------------------------------------------------- 

## 6\. The script is scaffolding, not a questionnaire

**Classification:** Principle / Failure mode **Origin:** **[H/S]**

**Purpose:** Preserve conversational flow.

**How it works:** Hansen explicitly says interviews rarely follow the planned order and that this can be evidence of a good interview. The script supplies territory that should eventually be explored, not a sequence that must be executed. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-template-relatively-new-customer-aka-jtbd-switch-interview-415338))

**Example:**

Planned:

1. process;
2. frequency;
3. tools;
4. people;
5. frustrations.

But the participant mentions an accountant during question one.

Follow the accountant thread immediately if it appears consequential rather than saying:

"I'll get to stakeholders later."

**Bad alternative:** Ask Q1 → receive answer → ask Q2 → receive answer → ask Q3.

**Signal produced:** Unexpected dependencies, causal chains, rich stories.

**AI interviewer implementation:** Represent the guide as a **coverage graph**, not a numbered questionnaire.

Maintain:

`covered_topics` `open_threads` `high-value_threads` `unresolved_claims`

Question selection should depend on the preceding answer.

\-------------------------------------------------------------------------------- 

## 7\. Let useful tangents happen

**Classification:** Conversation technique **Origin:** **[H/S]**

**Purpose:** Discover things the researcher's assumptions did not predict.

**How it works:** Allow the interviewee to wander if the new thread illuminates their process, motivation, constraints, or pain. Gently redirect only when the tangent stops producing relevant information. Hansen explicitly notes that interviews veering off script are normal and often desirable. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-template-relatively-new-customer-aka-jtbd-switch-interview-415338))

**Example:**

Interviewee:

"Actually, before we can order anything, the project manager has to approve it..."

Do not return immediately to your planned procurement question.

Instead:

"How does that approval normally work?"

**Bad alternative:** Optimizing script completion rather than information gain.

**Signal produced:** Organizational topology and hidden process steps.

**AI interviewer implementation:** Score tangents by:

`relevance × novelty × evidence potential`

Follow high-value tangents even when they occur "too early."

\-------------------------------------------------------------------------------- 

# III. Hansen's core conversational machinery

## 8\. Validating statements

**Classification:** Empathy technique / Follow-up pattern **Origin:** **[H — highly characteristic]**

**Purpose:** Encourage continuation without inserting another demanding question.

**How it works:** Use brief acknowledgments indicating that the person's behavior is understandable from their perspective.

Hansen repeatedly emphasizes validating statements and specifically notes that they may function as follow-ups even though they are not grammatically questions. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

**Example:**

"That makes sense."

Then **pause**.

Another variation:

"I can see how that follows."

But the first is safer because it introduces less of the interviewer's interpretation.

**Bad alternative:**

"That's a really inefficient process."

or even:

"I agree."

Agreement inserts your judgment.

**Signal produced:** Spontaneous elaboration.

**AI interviewer implementation:** Add a dialogue action:

`VALIDATE_AND_WAIT`

It should sometimes replace a follow-up question entirely.

This is particularly important for an AI interviewer because LLMs are heavily biased toward generating another sentence immediately.

\-------------------------------------------------------------------------------- 

## 9\. Silence after validation

**Classification:** Conversation technique **Origin:** **[H/S]**

**Purpose:** Give the participant psychological and conversational space to continue.

**How it works:**

"That makes sense."

Then do nothing.

Humans often fill the space with additional detail.

**Bad alternative:**

"That makes sense. So how often does that happen and what software do you use?"

The second question kills the continuation the validation might have produced.

**Signal produced:** Self-selected detail — often more useful than interviewer-directed detail.

**AI interviewer implementation:** In voice mode, deliberately insert a short listening window after validation. Do not treat every silence as a failure requiring immediate prompting.

\-------------------------------------------------------------------------------- 

## 10\. Elaboration prompts

**Classification:** Follow-up pattern **Origin:** **[H/S]**

**Purpose:** Go deeper without steering the answer.

**How it works:** Hansen prominently teaches simple invitations such as asking the participant to say more or elaborate. Her workshop guidance identifies this as one of the most important beginner skills. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fhow-to-run-your-own-customer-interview%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

"Can you say a little more about that?"

"Can you tell me more about what happened there?"

**Bad alternative:**

"Was that because your supplier was unreliable?"

**Signal produced:** Participant-controlled explanation.

**AI interviewer implementation:** These should have high priority whenever:

* emotional language appears;
* a new stakeholder appears;
* a workaround appears;
* the participant gives an unexplained judgment;
* something contradicts an earlier statement.

\-------------------------------------------------------------------------------- 

## 11\. Mirroring

**Classification:** Follow-up pattern / Empathy technique **Origin:** **[H]**

**Purpose:** Encourage elaboration while minimizing interviewer interpretation.

**How it works:** Reflect a key phrase back to the participant, sometimes almost verbatim.

**Example:**

Interviewee:

"Getting the quote ready is always a nightmare."

AI:

"A nightmare?"

Pause.

**Bad alternative:**

"So your quoting software is bad?"

That interprets the cause prematurely.

**Signal produced:** Clarification about what the interviewee considers important.

**AI interviewer implementation:** Extract emotionally or operationally salient noun phrases and selectively mirror them.

Avoid mirroring every statement or the AI becomes robotic.

\-------------------------------------------------------------------------------- 

## 12\. Reflect back—even imperfectly—to invite correction

**Classification:** Follow-up pattern / Empathy technique **Origin:** **[H]**

**Purpose:** Let the participant refine your model in their own words.

**How it works:** Hansen has described reflecting what you think you heard, even if your interpretation is imperfect. Correction gives control to the interviewee and surfaces nuance. ([CaSE](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.case-podcast.org%2F46-michele-hansen-on-customer-interviews-and-deploying-empathy%2Ftranscript%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

"So it sounds like the main reason you use Excel is because everybody already knows it?"

Interviewee:

"Not exactly. Actually it's because accounting needs the export in a particular format."

That correction is excellent evidence.

**Bad alternative:** Silently assume your interpretation is correct.

**Signal produced:** Corrections, priority distinctions, causal clarification.

**AI interviewer implementation:** Mark interpretations explicitly as tentative:

`It sounds like X — is that roughly right?`

Do not present inference as fact.

\-------------------------------------------------------------------------------- 

## 13\. Be a rubber duck

**Classification:** Principle / Empathy technique **Origin:** **[H — explicit metaphor]**

**Purpose:** Prevent interviewer ego and solutioning.

**How it works:** Hansen teaches new interviewers to imagine themselves as a programmer's rubber duck: listen, reflect, and create the conditions in which the other person explains the problem themselves. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fhow-to-run-your-own-customer-interview%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

Interviewee explains an odd purchasing workflow.

The interviewer does not optimize it. Instead:

"And after the Bauleiter sends that, what happens?"

**Bad alternative:** Become consultant, debugger, salesperson, or product designer halfway through discovery.

**Signal produced:** Participant's actual mental model.

**AI interviewer implementation:** Strong system-level rule:

`INTERVIEW_MODE ≠ SOLUTION_MODE`

No recommendations unless the research session explicitly transitions afterward.

\-------------------------------------------------------------------------------- 

# IV. Moving from claims to useful stories

## 14\. Start from the overall process

**Classification:** Question pattern **Origin:** **[H/S]**

**Purpose:** Establish the activity before investigating individual problems.

**How it works:** Hansen repeatedly structures discovery around:

* what the person is trying to accomplish;
* the steps;
* tools;
* people;
* costs;
* difficulties.

Her published discovery script begins by asking the person to walk through the process. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**Example:**

"Can you walk me through what happens when you need to prepare a quote for a new project?"

**Bad alternative:**

"What's your biggest problem with procurement?"

The latter assumes that the participant has already decomposed their work into explicit "problems."

**Signal produced:** Workflow topology.

**AI interviewer implementation:** The default opening branch should establish:

`goal → trigger → steps → actors → tools → outputs`

before aggressively pursuing pain.

\-------------------------------------------------------------------------------- 

## 15\. Walk through concrete instances

**Classification:** Question pattern **Origin:** **[H/S — strongly shared with JTBD and Mom Test]**

**Purpose:** Replace abstract process descriptions with remembered behavior.

**How it works:** Ask for a real occurrence or recent instance.

**Example:**

"Can you walk me through the last time you had to do that?"

Then:

"What happened first?"

"And then?"

**Bad alternative:**

"How do you normally do this?"

Abstract descriptions tend to omit exceptions, informal work, and forgotten steps.

**Signal produced:** Actual sequence, tools, interruptions, people, edge cases.

**AI interviewer implementation:** When an answer contains generic language such as:

* "usually";
* "typically";
* "we just";
* "normally";
* "it depends";

consider triggering:

`ABSTRACT → SPECIFIC_INSTANCE`

\-------------------------------------------------------------------------------- 

## 16\. Reconstruct the sequence

**Classification:** Follow-up pattern **Origin:** **[H/S]**

**Purpose:** Reveal invisible work.

**How it works:** Progress sequentially through the activity.

**Example:**

"What happened after the customer sent the request?"

Then:

"What did you do next?"

Then:

"Who did you send that to?"

**Bad alternative:** Jump randomly between opinions.

**Signal produced:** Process map suitable for automation analysis.

**AI interviewer implementation:** Maintain a temporary event model:

`trigger -&gt; action -&gt; artifact -&gt; actor -&gt; next action`

Flag missing links.

\-------------------------------------------------------------------------------- 

## 17\. Ask why the process exists

**Classification:** Question pattern **Origin:** **[H]**

**Purpose:** Discover the goal beneath the workflow.

Hansen's discovery material explicitly distinguishes understanding what someone does from understanding why the organization does it in the first place. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**Example:**

"What's the reason the company does that step?"

**Bad alternative:**

"Could you eliminate that step?"

Solutioning skips understanding.

**Signal produced:** Business objective, regulatory constraint, customer requirement, organizational history.

**AI interviewer implementation:** Every major workflow should eventually acquire both:

`HOW` and `WHY_EXISTS`.

\-------------------------------------------------------------------------------- 

# V. Understanding pain correctly

## 18\. Look for pain through the process, not by demanding complaints

**Classification:** Evidence heuristic **Origin:** **[H]**

**Purpose:** Prevent social desirability and feedback-style answers.

**How it works:** People may not spontaneously identify a workflow as a "problem." Reconstruct the process and notice where complexity, frustration, expense, or effort emerges.

Hansen argues that process interviewing can surface frustrations naturally without directly requiring the person to criticize a product or process. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fhow-different-cultures-give-feedback%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

Interviewee:

"Then I export everything, email it to myself, open it on the office computer and rename each file."

You don't need them to say:

"This is painful."

The behavior itself deserves investigation.

**Bad alternative:**

"Is that process annoying?"

**Signal produced:** Behavioral friction independent of explicit complaint.

**AI interviewer implementation:** Maintain a **friction detector** for:

* copying;
* duplicate entry;
* waiting;
* checking;
* chasing;
* manual reconciliation;
* repeated communication;
* switching applications;
* paper-to-digital transitions;
* memory-dependent steps;
* work outside official systems.

\-------------------------------------------------------------------------------- 

## 19\. Pain × frequency

**Classification:** Evidence heuristic / Synthesis technique **Origin:** **[H/S — Hansen explicitly uses it while crediting related frameworks]**

**Purpose:** Separate dramatic one-off irritation from commercially significant recurring pain.

**How it works:** Investigate both severity and recurrence. Hansen explicitly recommends focusing on problems that are both painful and frequent. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

**Example:**

Problem A: costs two hours once a year.

Problem B: costs twenty minutes every working day.

Problem B may represent substantially greater operational pain despite sounding less dramatic.

**Bad alternative:** Prioritize whichever complaint sounds emotionally strongest.

**Signal produced:** Expected cumulative burden.

**AI interviewer implementation:**

For every candidate pain:

`severity` `frequency` `duration` `people_affected`

Do not calculate a fake precision score during interviewing, but ensure these dimensions are captured.

\-------------------------------------------------------------------------------- 

## 20\. Time is expenditure

**Classification:** Evidence heuristic **Origin:** **[H/S]**

**Purpose:** Detect willingness-to-solve even when no software budget currently exists.

**How it works:** Hansen explicitly recommends measuring existing expenditure in both time and money. Someone spending substantial labor on a process is already paying for the problem. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

**Example:**

"Roughly how long does preparing one of those reports take?"

Then:

"How often are you doing that?"

**Bad alternative:**

"Would you pay €100 per month to automate that?"

**Signal produced:** Existing economic cost.

**AI interviewer implementation:** Convert qualitative pain into measurable evidence only after obtaining the raw facts:

`frequency × labor time × participants`

But preserve uncertainty rather than inventing exact ROI.

\-------------------------------------------------------------------------------- 

## 21\. Money already spent is stronger than hypothetical willingness

**Classification:** Evidence heuristic **Origin:** **[H/S — overlaps heavily with Mom Test]**

**Purpose:** Estimate willingness to pay from behavior.

**How it works:** Ask about tools, contractors, employees, services, and other existing expenditures. Hansen explicitly argues against asking what someone *would* pay because humans are poor predictors of future behavior. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

**Example:**

"What tools are involved?"

"Do you know roughly what those cost?"

**Bad alternative:**

"Would you pay €300/month for one tool that handled everything?"

**Signal produced:** Revealed rather than stated willingness to spend.

**AI interviewer implementation:** Treat:

`current spend &gt; claimed future willingness`

in evidence confidence.

\-------------------------------------------------------------------------------- 

## 22\. Complexity itself is evidence

**Classification:** Evidence heuristic **Origin:** **[H]**

**Purpose:** Detect pain hidden inside routines people have normalized.

Hansen explicitly looks for steps involving significant time, money, **or complexity**. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Finterviewing-in-text-479759))

**Example:**

The participant unemotionally explains:

"We download it, print it, stamp it, scan it again and put the protocol number into the folder name."

Even if they do not complain, this deserves probing.

**Bad alternative:** Require emotional language before classifying something as friction.

**Signal produced:** Structural inefficiency and automation opportunity.

**AI interviewer implementation:** Distinguish:

`expressed pain` from `observed process burden`.

Store both.

\-------------------------------------------------------------------------------- 

# VI. Workarounds and alternatives

## 23\. Ask what they have already tried

**Classification:** Question pattern / Evidence heuristic **Origin:** **[H/S]**

**Purpose:** Test whether the problem generates action.

**How it works:** Hansen explicitly includes previous tools, manual attempts, and failed solutions in both her discovery framework and interview scripts. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**Example:**

"What have you tried to make this easier?"

Then:

"What happened with that?"

**Bad alternative:**

"Would an AI assistant help?"

**Signal produced:** Problem seriousness, constraints, previous failure reasons, competitive landscape.

**AI interviewer implementation:** A workaround should automatically trigger:

1. what triggered it;
2. how long they used it;
3. what it cost;
4. what worked;
5. what failed;
6. why they stopped or retained it.

\-------------------------------------------------------------------------------- 

## 24\. Investigate manual work

**Classification:** Question pattern **Origin:** **[H]**

**Purpose:** Surface tasks that software descriptions often hide.

Hansen's discovery script explicitly asks what manual steps are involved. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**Example:**

"Which parts of that are still done manually?"

Then avoid assuming "manual" means undesirable.

Follow with:

"How does that work?"

**Bad alternative:**

"Which manual steps should be automated?"

**Signal produced:** Labor, judgment-heavy tasks, handoffs, copy/paste work, offline work.

**AI interviewer implementation:** Manual step ≠ automatic automation opportunity.

Investigate whether manual intervention serves:

* judgment;
* trust;
* control;
* compliance;
* exception handling;
* social coordination.

\-------------------------------------------------------------------------------- 

# VII. Functional, social, and emotional dimensions

## 25\. Explore all three dimensions

**Classification:** Principle / Evidence heuristic **Origin:** **[H/S — JTBD influenced]**

**Purpose:** Avoid interpreting a workflow as purely functional.

Hansen explicitly separates **functional**, **social**, and **emotional** dimensions of processes. A functional action such as submitting an expense report can coexist with fear of looking irresponsible or frustration about the work required. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Finterviewing-in-text-479759%3Futm%5Fsource%3Dchatgpt.com))

### Functional

What must actually happen?

"What do you need to produce at the end?"

### Social

Who matters and what social consequences exist?

"Who else is involved?"

"Who has to approve that?"

### Emotional

How does the situation affect them?

"What was that like when it happened?"

**Bad alternative:** Capture only software features and procedural steps.

**Signal produced:** Buying dynamics, switching barriers, reputation concerns, anxiety, frustration, control, status.

**AI interviewer implementation:** Maintain three parallel slots:

`functional_job` `social_context` `emotional_context`

A process model missing two dimensions should be considered incomplete.

\-------------------------------------------------------------------------------- 

# VIII. Detecting emotional intensity

## 26\. Treat emotional words as probe triggers

**Classification:** Follow-up pattern **Origin:** **[H/S]**

**Purpose:** Locate episodes that matter disproportionately.

**How it works:** When someone spontaneously says:

* horrible;
* annoying;
* stressful;
* nightmare;
* embarrassing;
* scared;
* worried;
* relieved;
* love;
* hate;

do not merely record the adjective. Investigate the event behind it.

**Example:**

"You said that was stressful. What was happening?"

**Bad alternative:**

"Got it. Next question."

**Signal produced:** Consequences and motivation.

**AI interviewer implementation:**

`emotion detected -&gt; increase follow-up priority`

But never infer intensity from vocabulary alone.

\-------------------------------------------------------------------------------- 

## 27\. Emotion without behavior is weaker evidence

**Classification:** Evidence heuristic **Origin:** **[S/E]**

**Purpose:** Prevent dramatic language from overpowering behavioral evidence.

**How it works:** Connect emotional claims to specific episodes and actions.

Interviewee:

"I absolutely hate that software."

Follow with:

"Can you tell me about the last time it caused a problem?"

And:

"Have you tried anything else?"

**Bad alternative:** Convert "hate" directly into "high-value SaaS opportunity."

**Signal produced:** Whether emotional intensity causes action.

**AI interviewer implementation:** Emotional evidence should gain confidence when accompanied by:

* frequent occurrence;
* workaround;
* spending;
* switching;
* escalation;
* lost time;
* missed outcome.

This weighting is an **[E]** operationalization rather than a Hansen formula.

\-------------------------------------------------------------------------------- 

# IX. Handling vague answers

## 28\. Vague answer → elaborate, don't reinterpret

**Classification:** Follow-up pattern **Origin:** **[H/S]**

**Purpose:** Prevent interviewer assumptions.

**Example:**

Interviewee:

"It's complicated."

Useful:

"Can you tell me a little more about what makes it complicated?"

**Bad alternative:**

"Because there are too many suppliers?"

**Signal produced:** Interviewee-defined meaning of "complicated."

**AI interviewer implementation:** Detect low-information predicates:

* difficult;
* complicated;
* annoying;
* slow;
* inefficient;
* expensive;
* sometimes;
* often;
* many;
* a lot.

Trigger clarification.

\-------------------------------------------------------------------------------- 

## 29\. Abstract answer → concrete episode

**Classification:** Follow-up pattern **Origin:** **[S]**

**Purpose:** Transform generalization into inspectable evidence.

**Example:**

"You mentioned that this often gets delayed. Can you think of the most recent time that happened?"

**Bad alternative:** Ask another abstract question about the delays.

**Signal produced:** Event-level evidence.

**AI interviewer implementation:** Maintain a distinction between:

`claim` and `supporting episode`.

Important claims should ideally acquire at least one episode.

\-------------------------------------------------------------------------------- 

## 30\. Ambiguous term → adopt their vocabulary, then clarify

**Classification:** Follow-up pattern **Origin:** **[H/S]**

**Purpose:** Understand the participant's conceptual model without replacing it with yours.

**Example:**

Interviewee:

"Then it goes to controlling."

AI:

"When you say 'controlling,' what happens at that point?"

**Bad alternative:**

"So finance approves the invoice."

Maybe they do not.

**Signal produced:** Native terminology and actual responsibilities.

**AI interviewer implementation:** Build a temporary interview-specific lexicon rather than normalizing everything immediately into your predefined ontology.

This matters enormously for small businesses, where the same operational role can have different names from company to company.

\-------------------------------------------------------------------------------- 

# X. Exploring motivations and switching

## 31\. Reconstruct the trigger for change

**Classification:** Question pattern **Origin:** **[H/S — strongly JTBD-derived]**

**Purpose:** Discover what moved someone from tolerating the status quo to taking action.

Hansen's new-customer/switch interview explicitly investigates when someone began considering an alternative and what prompted the search. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-template-relatively-new-customer-aka-jtbd-switch-interview-415338))

**Example:**

"When did you first start thinking you might need a different way of doing this?"

Follow:

"What was happening around that time?"

**Bad alternative:**

"Why did you choose Product X?"

That jumps to selection rather than motivation.

**Signal produced:** Trigger event and activation threshold.

**AI interviewer implementation:** Model:

`status quo → trigger → search → alternatives → decision → outcome`

\-------------------------------------------------------------------------------- 

## 32\. Explore anxieties and hesitation

**Classification:** Question pattern **Origin:** **[H/S — JTBD]**

**Purpose:** Understand forces resisting change.

Hansen's switch-interview script explicitly investigates what the customer was unsure or nervous about before switching. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-template-relatively-new-customer-aka-jtbd-switch-interview-415338))

**Example:**

"Before you changed the system, was there anything you were worried might go wrong?"

**Bad alternative:**

"Why didn't you switch sooner?"

The latter may sound accusatory.

**Signal produced:** Risk, migration concerns, training cost, organizational resistance, trust barriers.

**AI interviewer implementation:** Any proposed automation opportunity should carry both:

`motivation_for_change` `anxiety_about_change`

Otherwise opportunity assessment will be systematically optimistic.

\-------------------------------------------------------------------------------- 

# XI. Organizational context

## 33\. Map everyone involved

**Classification:** Question pattern **Origin:** **[H]**

**Purpose:** Discover the actual system beyond the person being interviewed.

Hansen explicitly asks about people inside the team, outside the team, and outside the company who participate in the process or tool decision. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**Example:**

"Who else touches this before it's finished?"

Then:

"What do they do?"

**Bad alternative:** Assume the interviewee represents the complete workflow.

**Signal produced:** Actors, handoffs, buyers, users, approvers, blockers.

**AI interviewer implementation:** Build an actor graph:

`actor → role → action → artifact → dependency`

This is especially important for automation discovery.

\-------------------------------------------------------------------------------- 

## 34\. Separate user, chooser, approver, and payer

**Classification:** Evidence heuristic **Origin:** **[H/S]**

**Purpose:** Avoid assuming one person controls the purchasing decision.

**Example:**

Worker uses the app. Bauleiter chooses it. Owner approves it. Accounting pays for it.

**Bad alternative:** Ask one employee:

"Would your company buy this?"

**Signal produced:** Buying topology.

**AI interviewer implementation:** Whenever a tool or purchase emerges, capture:

`uses` `selects` `approves` `pays` `can veto`

\-------------------------------------------------------------------------------- 

# XII. Avoiding interrogation

## 35\. Questions should be a minority of the conversation

**Classification:** Conversation technique **Origin:** **[H]**

Hansen explicitly notes that the prepared questions are only a small fraction of what occurs in a good interview because validation and follow-up fill much of the conversation. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-template-relatively-new-customer-aka-jtbd-switch-interview-415338))

**Purpose:** Avoid question-answer-question-answer rhythm.

**Example:**

Participant speaks for two minutes.

Interviewer:

"That makes sense."

Pause.

Participant continues.

Then:

"You mentioned the site manager there — what does he need to do?"

**Bad alternative:**

Twenty prepared questions asked in twenty consecutive turns.

**Signal produced:** Narrative rather than survey answers.

**AI interviewer implementation:** Measure interviewer dominance.

If the AI is producing comparable or greater word volume than the participant during discovery, something is probably wrong.

\-------------------------------------------------------------------------------- 

## 36\. One question at a time

**Classification:** Conversation technique **Origin:** **[S/E]**

**Purpose:** Reduce cognitive load and avoid participants choosing whichever sub-question is easiest.

**Example:**

Ask:

"How often does that happen?"

Wait.

Then later ask:

"How long does it take?"

**Bad alternative:**

"How often does it happen, how long does it take, who does it, and how frustrating is it?"

**Signal produced:** Cleaner evidence.

**AI interviewer implementation:** Hard constraint on multi-part questions unless the second clause merely clarifies the first.

\-------------------------------------------------------------------------------- 

# XIII. The "reaching for the door" technique

## 37\. Fake the ending before the actual ending

**Classification:** Conversation technique / Question pattern **Origin:** **[H — highly characteristic]**

**Purpose:** Surface information the participant did not reveal while answering the formal questions.

**How it works:** Hansen recommends asking an apparent closing question well before the interview actually needs to end—roughly halfway through the allotted time in her scripts. The participant believes the structured questioning is over and is invited to mention anything important that has been missed. Hansen regards this as one of the most important parts of an interview. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-template-relatively-new-customer-aka-jtbd-switch-interview-415338))

**Example, paraphrased:**

"This has been really useful. Before we wrap up, is there anything important about this process that I haven't asked you about?"

Then let them talk.

**Bad alternative:** Save this question until thirty seconds before the calendar event ends.

**Signal produced:** Unprompted priorities, candid criticism, omitted contextual information.

**AI interviewer implementation:** Include a deliberate **false-close phase** around 55–70% of the interview budget.

If new information appears, reopen the interview naturally.

\-------------------------------------------------------------------------------- 

# XIV. Bias avoidance

## 38\. Do not pitch during discovery

**Classification:** Anti-pattern **Origin:** **[H/S — strong overlap with Mom Test]**

**Purpose:** Prevent participant answers from becoming reactions to your concept.

Hansen explicitly separates discovery research from sales and recommends making it clear to participants that research is not a pitch. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**Example:**

Interviewee:

"We spend hours combining supplier quotes."

Bad interviewer response:

"Interesting, because we're developing an AI system that does exactly that."

Useful:

"Can you walk me through how you combine them?"

**Signal produced:** Uncontaminated problem evidence.

**AI interviewer implementation:** Hide the hypothesized solution from the interview model's conversational output during the evidence-gathering phase.

\-------------------------------------------------------------------------------- 

## 39\. Do not ask the literal future question

**Classification:** Anti-pattern / Evidence heuristic **Origin:** **[H/S]**

**Purpose:** Avoid unreliable predictions.

Hansen explicitly uses willingness-to-pay as an example: the business question you want answered is not necessarily the question you should directly ask. Instead investigate present and past behavior. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

**Example:**

Need to know:

Will they pay?

Ask instead:

* what they use now;
* what it costs;
* how much labor is involved;
* what they previously bought;
* what they attempted to replace.

**Bad alternative:**

"Would you pay €200/month?"

**Signal produced:** Behavioral proxies.

**AI interviewer implementation:** Translate latent research objectives into evidence questions.

For example:

`willingness_to_pay` should **not** generate a direct willingness-to-pay question.

\-------------------------------------------------------------------------------- 

## 40\. Avoid yes/no interview questions

**Classification:** Anti-pattern **Origin:** **[H/S]**

**Purpose:** Maximize context and explanation.

Hansen distinguishes interviews from surveys partly by whether questions invite context rather than simple yes/no or predefined-choice responses. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fsurvey-or-interview-699405%3Futm%5Fsource%3Dchatgpt.com))

**Example:**

Instead of:

"Do you use Excel?"

Ask:

"What tools are involved when you do this?"

**Signal produced:** Unexpected answers and richer context.

**AI interviewer implementation:** Before sending a question, evaluate whether "yes" or "no" would be a complete response. If so, usually rewrite it.

\-------------------------------------------------------------------------------- 

# XV. Observing and screensharing

## 41\. Show me, don't only tell me

**Classification:** Evidence heuristic / Question pattern **Origin:** **[H/S]**

**Purpose:** Discover details participants forget or cannot articulate.

Hansen recommends screensharing as a valuable complement to interviews because seeing someone perform the process can reveal otherwise invisible details, while also warning that screenshare alone may miss offline activities such as approvals. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**Example:**

"Would you mind showing me how you'd normally do that?"

**Bad alternative:** Assume the verbal description is exhaustive.

**Signal produced:** Actual interfaces, artifacts, sequence, workarounds, environmental context.

**AI interviewer implementation:** For multimodal interviews, treat visible behavior as another evidence stream and reconcile discrepancies:

`said_process ≠ observed_process`

Neither should automatically overwrite the other.

\-------------------------------------------------------------------------------- 

# XVI. Interview medium

## 42\. Rich conversation beats convenience when depth matters

**Classification:** Principle **Origin:** **[H]**

Hansen notes that text interviews can reveal high-level functional information but tend to produce more edited and less emotionally/socially rich responses. She has found audio conversations more effective for deeper disclosure and even notes that people may be more guarded on video than audio. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Finterviewing-in-text-479759%3Futm%5Fsource%3Dchatgpt.com))

**Purpose:** Select medium based on evidence needed.

**AI implementation:**

For your system:

* **voice interview** → preferred for discovery;
* **text** → acceptable for qualification or follow-up;
* **screenshare + conversation** → strong for workflow reconstruction;
* **form/survey** → quantification after discovery.

Do not treat all channels as equivalent.

\-------------------------------------------------------------------------------- 

# XVII. Transitioning between topics

## 43\. Follow first, steer second

**Classification:** Conversation technique **Origin:** **[H/S]**

**Purpose:** Move through planned coverage without making the interview feel scripted.

**How it works:**

1. let the current thread resolve;
2. acknowledge it;
3. use something they said to bridge;
4. introduce the next area.

**Example:**

"That makes sense. You mentioned earlier that accounting gets involved after the quote is approved. What happens when it reaches them?"

**Bad alternative:**

"Okay. Question seven: How many employees are involved?"

**Signal produced:** Continuity and psychological safety.

**AI interviewer implementation:** Generate transitions from previously mentioned entities whenever possible.

The exact bridging algorithm is **[E]**, but it follows Hansen's conversational rather than sequential approach.

\-------------------------------------------------------------------------------- 

# XVIII. Evidence hierarchy for the AI interviewer

This hierarchy is partly **[E]**, synthesized from Hansen's methodology:

### Stronger evidence

Observed/recalled event → actual workaround → actual expenditure → actual switching/search behavior → repeated time burden → organizational consequence → emotional intensity attached to a concrete episode.

### Medium evidence

Detailed description of current process → recurring frustration → explicit unmet need with contextual support.

### Weak evidence

General opinion → feature request → hypothetical intention → compliment → ungrounded future prediction.

Hansen strongly supports the underlying distinction between existing behavior and hypothetical prediction; the explicit hierarchy is my implementation abstraction. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

\-------------------------------------------------------------------------------- 

# XIX. Failure modes

## 44\. Interview-as-survey

**Classification:** Failure mode **Origin:** **[H]**

Symptoms:

* fixed sequence;
* yes/no questions;
* shallow answers;
* interviewer immediately proceeds to next question.

**Correction:** Elaborate, mirror, validate, investigate.

\-------------------------------------------------------------------------------- 

## 45\. Interview-as-sales-call

**Classification:** Failure mode **Origin:** **[H/S]**

Symptoms:

* explaining product;
* correcting misunderstandings;
* asking for approval of the idea;
* reacting enthusiastically when the participant confirms the hypothesis.

**Correction:** Return to the person's existing situation.

\-------------------------------------------------------------------------------- 

## 46\. Interviewer tries to impress

**Classification:** Failure mode **Origin:** **[H]**

Symptoms:

* showing expertise;
* explaining terminology;
* telling related stories;
* demonstrating how much the interviewer understands.

**Correction:** Rubber-duck posture.

\-------------------------------------------------------------------------------- 

## 47\. Premature problem labeling

**Classification:** Failure mode **Origin:** **[H/E]**

Interviewee:

"We do this in Excel."

Interviewer internally concludes:

"Spreadsheet problem."

But Excel may not be the problem at all. Perhaps approvals, supplier response latency, incomplete specifications, or customer change requests dominate the workflow.

**Correction:** Reconstruct context first.

\-------------------------------------------------------------------------------- 

## 48\. Premature solutioning

**Classification:** Failure mode **Origin:** **[H/S]**

The interviewer sees three manual steps and starts designing automation.

**Correction:** Understand why every step exists before classifying it as removable.

\-------------------------------------------------------------------------------- 

## 49\. Ignoring apparently boring detail

**Classification:** Failure mode **Origin:** **[H/E]**

Small procedural details frequently contain the operational opportunity.

"Then I print it."

"Then I WhatsApp him."

"Then someone manually adds the project number."

Those statements may be more commercially useful than:

"Our biggest challenge is digital transformation."

**AI implementation:** Give procedural verbs unusually high information value.

\-------------------------------------------------------------------------------- 

## 50\. Treating emotional language as proof

**Classification:** Failure mode **Origin:** **[S/E]**

Someone saying:

"I hate this."

does not automatically imply willingness to pay.

Require supporting behavior.

\-------------------------------------------------------------------------------- 

## 51\. Over-controlling the interview

**Classification:** Failure mode **Origin:** **[H]**

Symptoms:

* repeated redirection;
* strict question order;
* interrupting because an answer is not answering the intended question.

Hansen explicitly encourages allowing interviews to wander productively. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-template-relatively-new-customer-aka-jtbd-switch-interview-415338))

\-------------------------------------------------------------------------------- 

## 52\. Filling every silence

**Classification:** Failure mode **Origin:** **[H/S]**

Particularly dangerous for AI.

A short acknowledgement followed by silence may produce better information than another question.

\-------------------------------------------------------------------------------- 

# XX. Synthesis methodology

## 53\. Reconstruct the process before synthesizing "insights"

**Classification:** Synthesis technique **Origin:** **[H]**

**Purpose:** Avoid creating generic theme summaries detached from actual behavior.

For each interview reconstruct:

`goal → trigger → process → actors → tools → friction → workarounds → cost → outcome`

Hansen repeatedly frames interviewing as reconstructing people's processes and goals. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Finterviewing-in-text-479759))

\-------------------------------------------------------------------------------- 

## 54\. Preserve the participant's language

**Classification:** Synthesis technique **Origin:** **[H/S]**

**Purpose:** Preserve how customers conceptualize the problem.

Useful output:

Participant calls this "closing the Baustelle."

Not merely:

"Project completion workflow."

**AI interviewer implementation:** Store both:

`verbatim/native term` `normalized concept`

Do not destroy the original terminology during normalization.

\-------------------------------------------------------------------------------- 

## 55\. Synthesize across process stages

**Classification:** Synthesis technique **Origin:** **[H/S]**

Rather than only clustering generic topics such as:

* communication;
* procurement;
* scheduling;

compare participants at specific workflow moments:

`trigger` `preparation` `execution` `handoff` `approval` `exception` `completion`

This makes automation opportunities easier to identify.

\-------------------------------------------------------------------------------- 

## 56\. Compare frequency and severity

**Classification:** Synthesis technique **Origin:** **[H]**

Aggregate candidate problems by:

* frequency;
* pain/severity;
* time;
* money;
* complexity.

Hansen explicitly recommends focusing on frequent, painful problems. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))

\-------------------------------------------------------------------------------- 

## 57\. Look for repeated structures, not merely repeated sentences

**Classification:** Synthesis technique **Origin:** **[E]**

Three companies may describe:

* WhatsApp photos;
* emailed PDFs;
* paper delivery slips;

but the deeper pattern may be:

field-generated evidence must be reconciled with back-office project records.

The AI should therefore find both literal recurrence and structural recurrence.

\-------------------------------------------------------------------------------- 

## 58\. Divergence is evidence too

**Classification:** Synthesis technique **Origin:** **[H/S]**

If five interviews produce radically different workflows, do not force a common pattern. Hansen notes that this can indicate that the research scope is too broad; her public draft cites the idea that more interviews may be needed until repetition becomes predictable. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fcustomer-interview-script-discovery-phase-i-e-before-you-ve-built-anything-415336))

**AI interviewer implementation:** Distinguish:

`no pattern yet`

from:

`pattern = diverse workflows`.

\-------------------------------------------------------------------------------- 

# XXI. A particularly important Hansen rule for your AI harness

## 59\. Actionability requires business context

**Classification:** Synthesis technique / AI failure mode **Origin:** **[H — particularly explicit in Hansen's newer work]**

Hansen makes an important distinction highly relevant to your system: an LLM can summarize an interview correctly and still identify the **wrong "key insights"** because actionability depends on the business's strategy, capabilities, acquisition model, economics, and constraints. She argues that the interviewer should know enough about the company's strategy to decide which interesting threads deserve additional probing. ([Deploy Empathy](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fdeployempathy.substack.com%2Fp%2Fhow-do-you-know-whats-important-in))

For your harness this implies:

### Interview understanding

"What is happening in this business?"

and

### Opportunity assessment

"What should *I* potentially build or sell?"

must be **separate reasoning stages**.

An interview agent without business context can reliably capture evidence.

It cannot reliably decide that every observed inefficiency is a good opportunity.

**AI interviewer implementation:**

Feed the system a separate **research context** containing:

* target market;
* capabilities;
* desired business model;
* solution boundaries;
* strategic interests;
* things explicitly out of scope.

But do **not** let this context turn the interview into confirmation seeking.

Its purpose is **thread prioritization**, not answer manipulation.

This is one of the most important additions *Deploy Empathy* contributes to your eventual harness.

\-------------------------------------------------------------------------------- 

# Hansen versus The Mom Test

The two are highly compatible, but they solve somewhat different layers of the problem.

| Dimension                             | The Mom Test                             | Deploy Empathy                                                                 |
| ------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------ |
| Central concern                       | Whether evidence is trustworthy          | How to get people comfortable enough to produce rich evidence                  |
| Core enemy                            | Compliments, hypotheticals, pitching     | Judgment, stiffness, interrogation, interviewer ego                            |
| Main evidence                         | Past behavior, commitments, actual costs | Process, context, behavior, time/money/complexity, emotional/social dimensions |
| Interview style                       | Evidence-disciplined                     | Empathetic, conversational, exploratory                                        |
| Follow-up craft                       | Dig into specifics                       | Extensive emphasis on validation, mirroring, soft probing, silence             |
| Emotional information                 | Secondary                                | Explicitly important                                                           |
| Social context                        | Present but not central                  | Explicit functional/social/emotional model                                     |
| Scripts                               | Some question advice                     | Detailed practical scripts                                                     |
| Interview flow                        | Don't collect bad data                   | Let conversations wander productively                                          |
| Solution pitching                     | Strongly prohibited                      | Strongly discouraged during research                                           |
| Hypotheticals                         | Strongly distrusted                      | Prefer existing/past behavior                                                  |
| Buying evidence                       | Commitments, spending, action            | Existing time/money expenditure, alternatives, switching                       |
| Particularly distinctive contribution | **Evidence epistemology**                | **Conversational execution**                                                   |

The cleanest integration is:

**The Mom Test tells the AI what evidence to trust. Deploy Empathy tells the AI how to behave so humans actually reveal that evidence.**

There is very little fundamental conflict.

One subtle difference of emphasis is that Fitzpatrick can be read as almost adversarial toward "bad data": avoid compliments, ignore opinions, search for commitments. Hansen adds an important corrective: **you obtain better behavioral evidence by making the conversation psychologically safe, curious, and non-judgmental rather than clinically extracting facts.**

For your harness, I would make Hansen dominant at the **dialogue-policy layer** and Fitzpatrick dominant at the **evidence-evaluation layer**.

\-------------------------------------------------------------------------------- 

# Canonical Deploy Empathy Rules for an AI Interviewer

1. **Enter the participant's world before evaluating it.** Assume their behavior has reasons you do not yet understand.
2. **Keep the spotlight on the interviewee.** Do not demonstrate expertise, relate personal experiences, defend ideas, or solve problems during discovery.
3. **Use gentle, simple, conversational language.**
4. **Treat the interview guide as a coverage map, not a questionnaire.**
5. **Follow interesting threads.** Unexpected deviations are often where the most valuable evidence appears.
6. **Validate without judging.** Short acknowledgements such as a neutral "That makes sense" can encourage continuation.
7. **Use silence deliberately.** Do not fill every pause.
8. **Mirror important words and phrases.** Let interviewees elaborate in their own conceptual language.
9. **Reflect tentative interpretations back and invite correction.**
10. **Behave like a rubber duck.** Listen, reflect, and encourage explanation instead of trying to look smart.
11. **Start with the person's goal and process.** Understand what they are trying to accomplish and how they currently accomplish it.
12. **Move from abstraction to concrete episodes.** When possible, investigate an actual recent occurrence.
13. **Reconstruct sequences step by step.**
14. **Investigate why apparently strange processes exist before evaluating them.**
15. **Probe manual steps, handoffs, waiting, repeated work, duplicate entry, checking, and reconciliation.**
16. **Explore what they have already tried.**
17. **Investigate current tools and current expenditure rather than hypothetical willingness to pay.**
18. **Treat time as a real cost.**
19. **Measure both pain and frequency.**
20. **Do not require explicit complaints.** Complexity and costly behavior can reveal pain even when the participant considers it normal.
21. **Track functional, social, and emotional dimensions of the process.**
22. **Treat spontaneous emotion as a signal to probe, not as proof of commercial pain.**
23. **When an answer is vague, ask for elaboration instead of supplying an explanation.**
24. **When an answer is generic, ask for a concrete instance.**
25. **Use the participant's terminology before translating it into your ontology.**
26. **Map all actors involved.** Distinguish user, collaborator, chooser, approver, payer, and blocker.
27. **Avoid yes/no questions when contextual answers are possible.**
28. **Ask one meaningful question at a time.**
29. **Do not pitch the hypothesized solution.**
30. **Do not ask people to predict behavior when current or past behavior can answer the research question.**
31. **Investigate triggers that caused people to search for alternatives or change behavior.**
32. **Investigate anxiety and forces resisting change as well as motivation toward change.**
33. **When possible, observe the process through artifacts or screensharing rather than relying entirely on recollection.**
34. **Use voice when emotional and social context matters; text loses substantial depth.**
35. **Use a false closing before the actual end.** Ask what else matters while enough interview time remains to explore the answer.
36. **Do not optimize for completing every scripted question. Optimize for understanding the participant's reality.**
37. **After each interview, reconstruct the process before generating conclusions.**
38. **Preserve raw evidence separately from interpretation.**
39. **Across interviews, compare processes, costs, actors, frequency, pain, workarounds, and motivations—not merely feature requests.**
40. **Do not manufacture consensus. Divergent interviews may indicate segmentation or overly broad research scope.**
41. **Separate evidence extraction from opportunity selection.** An AI may accurately understand what happened while still choosing strategically irrelevant "insights."
42. **Use business strategy to decide where to probe, never to pressure the participant toward the desired answer.**
43. **The AI interviewer's primary behavior should be curiosity, not cleverness.**

The most valuable material to carry forward from Hansen into your eventual synthesis is therefore not another library of questions. It is a **dialogue control system**:

**listen → notice → validate → pause → probe → reconstruct → clarify → follow → gently steer → verify → preserve evidence.**

That fills a major gap left by *The Mom Test*: Fitzpatrick gives you an excellent filter for whether an answer is evidence; Hansen gives you much more machinery for **causing high-quality answers to emerge in the first place**. ([Intercom](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fwww.intercom.com%2Fblog%2Fpodcasts%2Fgeocodios-michele-hansen-on-interviewing-customers%2F))


