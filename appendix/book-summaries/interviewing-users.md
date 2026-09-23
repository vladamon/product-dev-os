# Interviewing Users — Steve Portigal

## Operational extraction for an AI qualitative-discovery interviewer

Portigal’s central contribution is not a bag of clever questions. It is a model of **interviewing as disciplined listening and adaptive inquiry**. The interviewer prepares enough to know what must be learned, but during the session follows the participant’s language, stories, context, surprises, and contradictions rather than mechanically executing a questionnaire.

A useful distinction for your harness is:

* **Portigal-specific / high confidence** — techniques I can tie closely to *Interviewing Users*, Portigal’s published interview guides, or his own explanations of his method.
* **Standard qualitative practice** — compatible with Portigal and often implicit in his approach, but not something I would attribute uniquely to him.
* **AI extrapolation** — implementation logic I am deriving for your interviewer rather than attributing to Portigal.

The second edition explicitly covers research logistics, contextual methods, fieldwork, interviewing practices, asking questions, documentation, analysis/synthesis, bias, and organizational impact. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2FBooks%2Finterviewing-users-2%2F))

\-------------------------------------------------------------------------------- 

# I. HIGH-CONFIDENCE PORTIGAL INTERVIEW CRAFT

## 1\. Start with the learning problem, not the question list

**Classification:** Principle

**Explanation:** Interview questions should descend from a research purpose. Portigal distinguishes the **business question**, the **research objective**, and only then the **participant questions**. Jumping immediately into "What should we ask customers?" tends to produce interviews full of individually reasonable questions that do not collectively answer the actual problem. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:** Business problem: estimates take too long to prepare. Research objective: understand how supplier pricing enters estimate creation. Participant question: "Walk me through the last estimate you prepared that required prices from suppliers."

**Failure example:** "What software do you use? Do you like it? Would automation help? What features would you want?"

The second version collects disconnected opinions instead of reconstructing the phenomenon.

**Signal to watch:** Answers are interesting but you cannot explain what decision they will inform.

**AI implementation:** Every interview should maintain three separate objects:

`business_question → learning_objectives → candidate_questions`

Before asking anything, the model should be able to identify which learning objective the question serves. Questions without a purpose should have lower priority.

\-------------------------------------------------------------------------------- 

## 2\. Treat the interview guide as a map, not a script

**Classification:** Interview behavior

**Explanation:** Portigal strongly favors prepared interviewing without rigid execution. He explicitly argues against progressing through the guide line by line: the richest material emerges through follow-up questions based on what the participant has just said. In an excellent interview, much of the dialogue can branch naturally from the initial question. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Flisten-to-steve-on-the-product-mastery-now-podcast%2F%3Futm%5Fsource%3Dchatgpt.com))

**Interview example:** Guide topic: invoice processing.

Participant: "Normally Martina handles those, unless it's one of the weird ones."

Instead of asking the next prepared question:

"What makes an invoice one of the weird ones?"

That answer may expose approval rules, exceptions, supplier relationships, manual workarounds, and responsibility boundaries.

**Failure example:** Participant: "We sometimes lose half a day fixing this."

Interviewer: "Okay. Next question: What software do you use?"

**Signal to watch:** An answer introduces a new actor, workaround, exception, strong emotion, unexplained term, handoff, or consequence.

**AI implementation:** Questions need priorities, not fixed ordering. Maintain:

* objectives still uncovered;
* active conversational threads;
* unresolved references;
* promising new threads;
* remaining time.

The next question should be generated from that state rather than retrieved mechanically from position `n + 1`.

\-------------------------------------------------------------------------------- 

## 3\. Move from Question–Answer to Question–Story

**Classification:** Principle

**Explanation:** One of the clearest Portigal ideas is that effective interviewing shifts the participant from supplying answers to **telling experiences**. Stories contain sequences, actors, decisions, tools, interruptions, exceptions, causes, and consequences that abstract answers remove. Portigal explicitly frames the goal as moving from question-answer interaction toward question-story interaction. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:** Weak:

"Is supplier communication difficult?"

Better:

"Tell me about the last time you needed a price from a supplier for an offer."

Then reconstruct that episode.

**Failure example:** Participant: "Yes, procurement can be inefficient."

Interviewer records `procurement inefficient` and moves on.

**Signal to watch:** Abstract nouns and adjectives: "usually," "inefficient," "complicated," "manual," "often," "a problem," "bad communication."

These are **prompts for stories**, not completed evidence.

**AI implementation:** Introduce an `ABSTRACT_CLAIM` detector. An abstract answer should normally trigger:

`claim → request specific instance → reconstruct instance → test typicality`

\-------------------------------------------------------------------------------- 

## 4\. Ask for a specific example before asking for generalizations

**Classification:** Question pattern

**Explanation:** Portigal repeatedly recommends asking about a particular instance rather than simply asking people what they generally do. Specific memories are easier to answer and create material for further probing. After learning the concrete case, the interviewer can ask whether it was typical. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:**

"Think about the most recent offer you sent to a client. How did that process start?"

Later:

"Is that how it normally works, or was this case unusual?"

**Failure example:**

"How do you normally prepare offers?"

Participant produces a cleaned-up description of the formal process.

**Signal to watch:** The participant speaks in policy language rather than event language: "we always," "normally you're supposed to," "the process is."

**AI implementation:** Prefer evidence in this order:

`recent concrete episode &gt; multiple remembered episodes &gt; generalized self-report &gt; hypothetical claim`

Do not discard generalizations, but mark them as lower-resolution evidence until grounded.

\-------------------------------------------------------------------------------- 

# 5\. Follow-ups are the interview

**Classification:** Probe

**Explanation:** Portigal places enormous weight on follow-up questions. They demonstrate listening, deepen rapport, and uncover information the researcher did not know to include in the guide. Stock-question interviews with little probing remain shallow and never become genuine conversations. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Flisten-to-steve-on-the-product-mastery-now-podcast%2F%3Futm%5Fsource%3Dchatgpt.com))

**Interview example:**

Participant: "Then I send everything to the office."

Possible sequence:

"What is 'everything'?" "How do you send it?" "Who receives it?" "What do they do with it?" "How do you know they've received it?" "What happens if something is missing?"

**Failure example:** Asking ten good standalone questions but never examining any answer.

**Signal to watch:** Every unexplained noun or transition:

* "they"
* "the system"
* "normally"
* "someone checks it"
* "then it gets approved"
* "we sort it out"

**AI implementation:** Maintain an **unresolved-entity stack** and **unresolved-causal-link stack**. A workflow should not be considered reconstructed while important pronouns, transitions, actors, or states remain unresolved.

\-------------------------------------------------------------------------------- 

# 6\. Reconstruct sequence

**Classification:** Question pattern

**Explanation:** Portigal explicitly identifies sequence questions as a technique for collecting concrete contextual details: start at the beginning and ask what happens next. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

For business discovery, this is probably the highest-value Portigal technique for your harness.

**Interview example:**

"The customer asks for an offer. What happens first?" "And then?" "What do you have at that point?" "What happens next?" "Who gets involved then?"

**Failure example:**

"Describe your quotation workflow."

The participant compresses forty actions into four conceptual stages.

**Signal to watch:** Temporal jumps such as:

"Then eventually we send the offer."

"Eventually" may conceal thirty minutes or three days of work.

**AI implementation:** Construct a workflow graph while interviewing:

`trigger → step → actor → input → tool → output → next step`

Do not merely store transcript text.

\-------------------------------------------------------------------------------- 

# 7\. Ask about quantity

**Classification:** Question pattern

**Explanation:** Portigal explicitly recommends quantity questions as another way of turning fuzzy descriptions into concrete information. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

"When you say you receive lots of those, roughly how many in a normal week?"

Or:

"You said you contact several suppliers. How many did you contact for this job?"

**Failure example:** Converting "a lot" into an analyst assumption such as twenty.

**Signal to watch:** Quantifier language:

* many
* often
* rarely
* several
* constantly
* huge
* occasionally
* takes forever

**AI implementation:** Detect qualitative quantities and probe when magnitude matters to the research objective.

Importantly, the AI should not interrogate every vague adjective. Probe when knowing magnitude would change the interpretation.

\-------------------------------------------------------------------------------- 

# 8\. Ask for the complete set

**Classification:** Probe

**Explanation:** Portigal includes "complete list" questioning: participants frequently provide only salient examples unless prompted repeatedly. "What else?" is therefore legitimate and useful. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

"Which tools are involved?" "Excel and Outlook." "Anything else?" "Actually, WhatsApp." "Anything else?" "The supplier websites and sometimes a paper catalog."

The fourth answer may be operationally more important than the first.

**Failure example:** Taking the first two recalled items as the complete toolchain.

**Signal to watch:** Enumerations that sound illustrative rather than exhaustive.

**AI implementation:** Represent lists as either:

`EXAMPLES` or `ATTEMPTED_COMPLETE_SET`

Do not infer completeness merely because multiple items were named.

\-------------------------------------------------------------------------------- 

# 9\. Probe relationships and organizational structure

**Classification:** Question pattern

**Explanation:** Portigal explicitly includes questions about relationships and organizational structure as useful ways of understanding context. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

This matters heavily for small-business workflow discovery because many "software problems" are actually handoff or responsibility problems.

**Interview example:**

"Who sends the supplier request?" "Who decides which supplier to ask?" "Who can approve the price?" "Who notices when a response hasn't arrived?" "Who does this when you aren't here?"

**Failure example:** Mapping only software steps and never discovering that the owner's wife informally reconciles missing documents every evening.

**Signal to watch:** New people, departments, customers, suppliers, external professionals, approvals, delegations.

**AI implementation:** Maintain an actor graph:

`actor → responsibility → information supplied → information received → authority → dependencies`

This becomes essential for identifying handoffs and automation boundaries.

\-------------------------------------------------------------------------------- 

# 10\. Probe the participant's native language

**Classification:** Listening rule

**Explanation:** Portigal emphasizes using participants' own vocabulary rather than imposing researcher terminology. He also explicitly recommends probing unusual "code words" and native expressions. Correcting terminology or replacing it with professional jargon moves the researcher into the expert role and may erase valuable distinctions. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:**

"You called those invoices 'problem children.' What makes an invoice a problem child?"

**Failure example:**

"So that's an exception-processing workflow."

The interviewer has substituted a conceptual model before learning what the participant meant.

**Signal to watch:** Unusual labels, slang, repeated phrases, local terminology, metaphors.

**AI implementation:** Maintain a participant-specific glossary and preferentially mirror their vocabulary.

Never normalize terminology silently in the interview itself. Semantic normalization can happen later during synthesis.

\-------------------------------------------------------------------------------- 

# 11\. Probe emotional and behavioral cues

**Classification:** Probe

**Explanation:** Portigal explicitly recommends examining cues around how something is said, including laughter or other reactions. The cue itself may reveal tension, embarrassment, contradiction, absurdity, pride, frustration, or social norms. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

Participant laughs: "Then I put it into our very sophisticated database."

"You laughed when you said 'sophisticated database.' What's behind that?"

And perhaps the "database" is a shared Excel file everyone hates.

**Failure example:** Ignore tone and record only literal semantic content.

**Signal to watch:** In voice/video interactions:

* laughter;
* hesitation;
* sighing;
* sudden speed changes;
* long pause;
* self-correction;
* obvious emphasis.

For text interviews:

* scare quotes;
* repeated punctuation;
* hedging;
* abrupt shifts;
* phrases such as "well, technically..."

**AI implementation:** Treat affective cues only as **probe candidates**, not as conclusions.

Do not infer:

`laugh → hates system`.

Instead infer:

`laugh → investigate meaning`.

\-------------------------------------------------------------------------------- 

# 12\. Clarify ambiguous references instead of filling them in yourself

**Classification:** Probe

**Explanation:** Portigal explicitly recommends clarification probes. Interviewers routinely believe they understand references because their own mental model fills in missing information. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

"When you say 'the system,' which system are you referring to?"

**Failure example:** Participant says "we upload it there," and the interviewer assumes SharePoint because SharePoint was mentioned fifteen minutes earlier.

**Signal to watch:** Pronouns, generic nouns, implied actors, missing objects, ambiguous chronology.

**AI implementation:** Run coreference-resolution internally but expose uncertainty. If confidence is insufficient and the distinction matters, ask.

\-------------------------------------------------------------------------------- 

# 13\. Ask "why" through the participant's worldview

**Classification:** Probe

**Explanation:** Portigal includes direct causal probing but often frames it around the participant's interpretation: why something happened, why another person behaves that way, or why something matters. He also recommends delicate probing where the topic warrants it. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

The important distinction is between **curiosity** and **challenge**.

**Interview example:**

"What makes that important to you?"

or:

"Why do you think they prefer doing it that way?"

or softer:

"What was driving that decision?"

**Failure example:**

"Why didn't you just use the software correctly?"

That contains blame and a proposed solution.

**Signal to watch:** Defensive tone or the participant beginning to justify themselves to the interviewer.

**AI implementation:** Prefer neutral causal formulations when social judgment is plausible:

* "What led to that?"
* "What made that the better option at the time?"
* "What was going on there?"
* "How did you decide?"

Use bare "why?" selectively.

\-------------------------------------------------------------------------------- 

# 14\. Explore exceptions

**Classification:** Question pattern

**Explanation:** Portigal's own interview guide probes whether behavior is always the same and asks about special circumstances where people behave differently. Exceptions expose rules that ordinary behavior hides. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Finterview-guide))

**Interview example:**

"Is that always how invoices are approved?" "No, urgent invoices are different." "Tell me about the last urgent one."

**Failure example:** Build the product around the "normal workflow" while edge cases represent 30% of actual effort.

**Signal to watch:** always, never, except, unless, normally, sometimes, depends.

**AI implementation:** Any rule-like statement can generate an `EXCEPTION_PROBE`.

Model:

`default path` `known exception conditions` `exception path`

rather than a single linear workflow.

\-------------------------------------------------------------------------------- 

# 15\. Compare across situations to reveal mental models

**Classification:** Question pattern

**Explanation:** Portigal recommends comparisons between processes, between people, and across time. Comparison forces distinctions that participants may never have explicitly formulated. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

"What's different when you get a request from a long-standing customer versus a new customer?"

Or:

"How does your process differ when the project is €5,000 versus €500,000?"

**Failure example:** Asking directly:

"What factors determine how rigorously you prepare a quote?"

The participant now has to theorize about themselves.

**Signal to watch:** Two seemingly similar situations with different behavior.

**AI implementation:** Once two workflow instances exist, perform contrast detection automatically and ask about the highest-value differences.

\-------------------------------------------------------------------------------- 

# 16\. Compare across time

**Classification:** Question pattern

**Explanation:** Portigal explicitly uses temporal comparison: how something has changed and, sometimes, how someone imagines it changing. Importantly, future questions can serve to expose frameworks and possibilities rather than being treated as accurate forecasts. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

"How did you prepare these offers five years ago?" "What changed?" "What caused that change?"

**Failure example:** Interpreting:

"In five years everything will be automated"

as reliable demand forecasting.

**Signal to watch:** Changes in tools, staffing, business scale, regulations, customer expectations, or responsibility.

**AI implementation:** Maintain a temporal model:

`before → change event → after → consequences`

Future statements receive an `imagined_future` evidence tag, never `observed_behavior`.

\-------------------------------------------------------------------------------- 

# 17\. Use outsider/teaching prompts to uncover tacit knowledge

**Classification:** Question pattern

**Explanation:** Portigal suggests asking people to explain something to an outsider or explain how they would teach someone else. This surfaces assumptions and procedural knowledge that experts normally omit. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

"Suppose a new employee started tomorrow and had to prepare this report. How would you explain the process to them?"

**Failure example:**

"Is the process documented?"

"Yes" tells you almost nothing about the process.

**Signal to watch:** Steps the participant suddenly realizes need explanation: "Oh, before that you actually have to..."

**AI implementation:** Trigger teaching prompts when the workflow contains gaps likely caused by expert compression.

\-------------------------------------------------------------------------------- 

# 18\. Build rapport by demonstrating attention, not similarity

**Classification:** Rapport rule

**Explanation:** Portigal explicitly warns against manufacturing rapport by telling participants how similar you are to them. That redirects attention toward the interviewer. Instead, rapport grows from listening, follow-up questions, genuine interest, and treating the participant's perspective as valuable. He also warns against enthusiastic affirmation that can push participants into performing for the researcher. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:**

Participant: "We built that spreadsheet ourselves."

Good:

"How did it come about?"

Less good:

"That's awesome! I build spreadsheets like that too."

**Failure example:** Excessive:

"Great!" "Amazing!" "Exactly!" "That's so interesting!"

after every answer.

These signals tell the participant what earns approval.

**Signal to watch:** The participant starts looking for validation or tailoring answers toward what pleased the interviewer previously.

**AI implementation:** Use low-evaluation acknowledgments:

* "Mm-hm."
* "I see."
* "Tell me more about that."
* paraphrase for confirmation.

Minimize `great`, `perfect`, `exactly`, `awesome`, etc.

This should be an explicit lexical constraint.

\-------------------------------------------------------------------------------- 

# 19\. Silence is an interviewing technique

**Classification:** Listening rule

**Explanation:** Portigal has repeatedly emphasized silence as an active interviewing tool. The interviewer can remain engaged while giving participants space to think and continue. Filling every pause deprives participants of the chance to add the less rehearsed second answer. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fsteves-5-minute-talk-on-the-power-of-silence%2F%3Futm%5Fsource%3Dchatgpt.com))

**Interview example:**

Participant:

"I guess that's basically it..."

**3–5 seconds of silence.**

Participant:

"...well, except every Friday I actually redo the whole thing manually."

That second sentence may contain the discovery.

**Failure example:**

Participant pauses for one second.

Interviewer:

"Okay, and what software do you use?"

**Signal to watch:** Participant appears to be thinking rather than signaling completion.

**AI implementation:** Voice systems need deliberate silence thresholds. Do not treat 500–800 ms of silence as turn completion.

A useful state distinction:

`hesitation ≠ finished_answer`

The exact timing should adapt to the speaker rather than being universally hard-coded.

\-------------------------------------------------------------------------------- 

# 20\. Do not become the expert

**Classification:** Anti-pattern

**Explanation:** If participants ask about features, solutions, or the researcher's expertise, Portigal warns against switching into expert mode. Once the interviewer becomes teacher, salesperson, defender, or product representative, the social relationship changes and subsequent answers can become less candid. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:**

Participant:

"Does your product automate this?"

Interviewer:

"What about automating it would be useful to you?"

**Failure example:**

"Yes, we're actually building an AI workflow that solves exactly that."

You have effectively contaminated the remainder of the discovery conversation.

**Signal to watch:** Participant begins asking for the researcher's opinion rather than explaining their own behavior.

**AI implementation:** Implement an `EXPERT_ROLE_GUARD`.

During discovery mode, product questions should normally be:

1. acknowledged;
2. deferred;
3. converted into probes about the underlying motivation.

\-------------------------------------------------------------------------------- 

# 21\. Do not correct the participant

**Classification:** Anti-pattern

**Explanation:** Portigal specifically warns researchers not to correct misunderstandings, mispronunciations, or inaccurate beliefs during discovery. The misconception itself may be crucial research data. Correction also reasserts interviewer expertise. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:**

Participant wrongly believes a system automatically deletes invoices after ninety days.

Instead of correcting them:

"What makes you think they're deleted after ninety days?"

You may discover why they print every invoice.

**Failure example:**

"Actually, that isn't how SharePoint works."

Evidence destroyed.

**Signal to watch:** The AI detects a factual contradiction with product documentation.

**AI implementation:** Separate:

`participant_belief`

from:

`external_truth`.

During interviewing, record both. Do not automatically reconcile them in the conversation.

\-------------------------------------------------------------------------------- 

# 22\. Hear your own assumptions

**Classification:** Failure mode

**Explanation:** Portigal repeatedly stresses that researchers bring expectations and judgments into fieldwork. He describes noticing one's own judgment, challenging it, and allowing new data to modify the initial assumption. The second edition explicitly adds further treatment of bias. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:**

Internal assumption:

"They're using paper because they're technologically unsophisticated."

Observed reality:

Paper forms are required because workers wear gloves, have unreliable connectivity, and require signatures on site.

**Failure example:** Every subsequent question implicitly assumes technology resistance.

**Signal to watch:** Interviewer thoughts such as:

* "Obviously..."
* "They should..."
* "They don't understand..."
* "The real problem is clearly..."

**AI implementation:** Maintain hypotheses explicitly rather than silently.

For every active hypothesis:

`supporting evidence` `contradicting evidence` `unresolved evidence`

Question generation should deliberately seek discriminating evidence rather than continually confirming the current interpretation.

\-------------------------------------------------------------------------------- 

# 23\. Observe context rather than relying only on reported behavior

**Classification:** Observation technique

**Explanation:** Portigal places contextual methods alongside interviewing: meet people where the activity occurs when possible, because environments contain meaningful details that neither researcher nor participant would have thought to mention. His observation resources explicitly focus on sequence, people, interactions, objects, technologies, roles, and environment. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**Interview example:**

Participant says:

"Everything is digital."

But during the session the interviewer sees:

* an inbox tray;
* handwritten project numbers;
* printed supplier price lists;
* sticky notes;
* two separate Excel sheets.

Each object becomes a probe.

**Failure example:** Accept "we have a digital process" as a sufficient workflow description.

**Signal to watch:** Difference between **said process** and **visible process**.

**AI implementation:** If images, screen sharing, or video are available, treat observed artifacts as first-class evidence and generate questions from discrepancies.

\-------------------------------------------------------------------------------- 

# 24\. Follow objects and artifacts

**Classification:** Observation technique

**Explanation:** Portigal's observation materials explicitly direct attention toward what people carry, use, create, and draw from their environments. The AEIOU framework linked in his resources similarly covers Activities, Environments, Interactions, Objects, and Users; AEIOU itself should be treated as a broader field-research framework, not as a Portigal invention. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fobservation-frameworks))

**Interview example:**

"You opened that spreadsheet when the supplier replied. What is that file?"

Then:

"Can you show me what you enter?"

Then:

"Where does this number come from?"

Then:

"What happens to this sheet afterward?"

**Failure example:** Ask only about people's attitudes toward "digitalization."

**Signal to watch:** Documents, spreadsheets, forms, inboxes, folders, screens, handwritten notes, whiteboards, photos, physical trays, labels.

**AI implementation:** Create an `artifact registry`:

`artifact → creator → fields → source → purpose → consumers → storage → transitions → pain/workaround`

Artifacts are often the best anchors for reconstructing business workflows.

\-------------------------------------------------------------------------------- 

# 25\. Record when possible; notes are inherently selective

**Classification:** Interview behavior

**Explanation:** Portigal recommends recordings because real-time notes inevitably filter what the researcher heard. Recordings permit later review with a different interpretive perspective. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:** The interviewer notes:

`"Supplier responses slow."`

Later, the recording reveals the participant actually distinguished:

* responses arrive quickly;
* matching them back to individual tenders takes time;
* missing attachment formats create manual work.

**Failure example:** Treating five terse handwritten bullets as equivalent to the interview.

**Signal to watch:** Notes consist primarily of analyst interpretations rather than participant evidence.

**AI implementation:** Preserve several layers:

`raw recording/transcript` `timestamped observations` `structured facts` `researcher interpretations` `hypotheses`

Never collapse these into one representation.

\-------------------------------------------------------------------------------- 

# 26\. Debrief immediately

**Classification:** Synthesis practice

**Explanation:** Portigal's supplied debrief worksheet explicitly calls for completing the debrief immediately after the session. It asks researchers to capture the participant and context, process, challenges, surprises, new thinking, connections to other interviews, and what should be asked differently next time. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fdebrief))

**Interview example:** Immediately after Interview 4:

* major surprise: supplier price updates are not the bottleneck;
* unresolved issue: who decides preferred suppliers?;
* emerging pattern: WhatsApp appears in 3/4 interviews;
* next interview change: probe handoff from estimator to purchaser.

**Failure example:** Conduct eight interviews, then begin interpretation several days later from transcripts.

**Signal to watch:** Important situational impressions and interviewer uncertainty disappear from memory.

**AI implementation:** Automatically generate a post-session debrief containing:

* evidence;
* observations;
* surprises;
* contradictions;
* unresolved questions;
* emerging patterns;
* guide changes;
* hypotheses strengthened/weakened.

But keep it separate from final synthesis.

\-------------------------------------------------------------------------------- 

# 27\. Analysis and synthesis are different

**Classification:** Synthesis practice

**Explanation:** Portigal distinguishes **analysis**, breaking research material into meaningful pieces, from **synthesis**, recombining material to form higher-level understanding. He also emphasizes that insights usually do not arrive as perfect participant soundbites; they are assembled from multiple pieces of evidence. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fmy-talk-great-user-research-for-non-researchers-at-mind-the-product%2F))

**Interview example:**

Individual evidence:

* Interview A manually copies prices.
* Interview B maintains a price spreadsheet.
* Interview C phones suppliers.
* Interview D asks another employee who remembers historical prices.

Synthesis:

Current pricing knowledge is fragmented across external suppliers, spreadsheets, personal memory, and communication channels.

That conclusion may never have been spoken verbatim by anyone.

**Failure example:** Searching transcripts for a quote that literally states the desired "insight."

**Signal to watch:** Conclusions supported by only one colorful quote.

**AI implementation:** Require synthesis claims to maintain an evidence graph linking back to interviews and observations.

Distinguish:

`participant statement ≠ researcher interpretation ≠ cross-interview insight`.

\-------------------------------------------------------------------------------- 

# II. STANDARD QUALITATIVE-RESEARCH PRACTICES CONSISTENT WITH PORTIGAL

These fit Portigal's method closely, but I would not label them uniquely Portigalian.

## 28\. Handle sensitive subjects progressively

**Classification:** Rapport rule

Begin with less threatening context, establish the participant's vocabulary, then approach sensitive material. Give participants control over what they disclose.

Instead of:

"Why did your employee mess this up?"

try:

"You mentioned that this situation became difficult. Can you tell me what happened?"

Portigal explicitly includes delicate probing of difficult situations, but the broader progressive-disclosure protocol is standard qualitative interviewing. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

**AI implementation:** Estimate sensitivity from subject matter and participant behavior. Reduce directness before increasing it. Never pressure after explicit reluctance.

\-------------------------------------------------------------------------------- 

# 29\. Let stories finish before optimizing the interview

**Classification:** Listening rule

When a participant is producing a relevant narrative, the default should be **do not interrupt**.

Interrupt when:

* clarification is necessary to understand what follows;
* the discussion has clearly moved far outside scope;
* time constraints threaten essential objectives;
* the participant is repeating material without adding information.

Portigal's repeated emphasis on silence, following threads, and allowing participants space strongly supports this orientation, though the precise interruption rule here is synthesis rather than a named Portigal rule. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fsteves-5-minute-talk-on-the-power-of-silence%2F%3Futm%5Fsource%3Dchatgpt.com))

**AI implementation:** Prefer `continue_listening` while information gain remains positive.

\-------------------------------------------------------------------------------- 

# 30\. Separate observation from interpretation

**Classification:** Observation technique

Record:

"Three printed folders were stacked beside the monitor."

separately from:

"Participant distrusts digital storage."

The first is observation. The second is interpretation requiring evidence.

**AI implementation:** Give every stored item an epistemic type:

`observed` `reported` `inferred` `hypothesized`

This is crucial. Without it, an AI researcher can manufacture confidence extremely quickly.

\-------------------------------------------------------------------------------- 

# 31\. Look for contradictions without treating the participant as inconsistent

**Classification:** Listening rule

Example:

"We don't use WhatsApp for business."

Thirty minutes later:

"Then I just send him the picture on WhatsApp."

Do not accuse:

"You contradicted yourself."

Probe:

"Earlier you mentioned that WhatsApp isn't normally used for business. What makes this case different?"

The contradiction may reveal a meaningful category boundary: formal business communication versus emergency coordination.

**AI implementation:** Contradiction detection should generate curiosity, not error correction.

\-------------------------------------------------------------------------------- 

# 32\. Distinguish formal process from actual process

**Classification:** Observation technique

This is especially important in small businesses.

Ask about:

* what is supposed to happen;
* what happened last time;
* what happens when things go wrong;
* what people actually use;
* who really does the work.

The difference is often where automation opportunities live.

**AI implementation:** Maintain parallel models:

`declared_process` `observed/reconstructed_process`

and explicitly search for gaps.

\-------------------------------------------------------------------------------- 

# III. PORTIGAL'S QUESTION TOOLKIT, REDUCED TO REUSABLE GENERATORS

Portigal published a useful taxonomy that can be converted almost directly into AI question-generation primitives. It includes sequence, quantity, concrete examples, complete sets, relationships, organizational structure, clarification, native language, emotional cues, causal probes, delicate probes, outsider explanations, teaching prompts, and contrasts. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

| Generator         | Generic form                       | Business-workflow form                                          |
| ----------------- | ---------------------------------- | --------------------------------------------------------------- |
| Sequence          | What happened first? Then what?    | "The request arrives. What happens next?"                       |
| Concrete instance | Tell me about the last time…       | "Tell me about the last tender you prepared."                   |
| Typicality        | Is that typical?                   | "Does it normally work that way?"                               |
| Exception         | When is it different?              | "When would you skip that step?"                                |
| Quantity          | How many/how often/how long?       | "How many requests like this per week?"                         |
| Complete set      | What else?                         | "What other tools are involved?"                                |
| Relationship      | How do you work with X?            | "How do site managers communicate with the office?"             |
| Organization      | Who owns/reports/decides?          | "Who can approve that?"                                         |
| Clarification     | When you say X…?                   | "What exactly is the 'project folder'?"                         |
| Native language   | Why do you call it X?              | "Why do you call those 'red jobs'?"                             |
| Affect probe      | I noticed X when you said Y        | "You laughed when you mentioned Excel—what's behind that?"      |
| Causal            | What led to that?                  | "What makes you handle urgent jobs differently?"                |
| Delicate          | You mentioned X. Can you say more? | "You mentioned disputes around invoices. What tends to happen?" |
| Outsider          | Explain this to a newcomer         | "Imagine I've never worked in construction—what is an Aufmaß?"  |
| Teach             | How would you teach someone?       | "How would you train a new employee to do this?"                |
| Compare process   | What's different between A and B?  | "How does a small job differ from a large tender?"              |
| Compare people    | Do others do the same?             | "Do the other Bauleiter handle it this way?"                    |
| Compare time      | How has this changed?              | "How did you do this before the current software?"              |

This taxonomy is extremely valuable for your harness because the model does **not** need to invent "a clever next question." It can first determine the missing information type and then select the corresponding probe family.

\-------------------------------------------------------------------------------- 

# IV. FAILURE MODES AN AI INTERVIEWER SHOULD EXPLICITLY DEFEND AGAINST

These follow directly from the methodology above.

### Questionnaire mode

The model optimizes for "questions completed" instead of understanding gained.

**Detection:** high guide coverage, low follow-up rate.

\-------------------------------------------------------------------------------- 

### Premature abstraction

Participant says:

"Invoice approval is chaotic."

AI records:

`Pain point: chaotic invoice approval`.

This is almost useless.

Correct response: reconstruct a recent chaotic approval.

\-------------------------------------------------------------------------------- 

### Completion hallucination

Participant:

"Then we process it."

AI internally invents what processing must entail.

This is particularly dangerous for LLM interviewers because language models are optimized to complete missing structure.

**Rule:** missing workflow information is an opportunity to ask, not to infer.

\-------------------------------------------------------------------------------- 

### Expertise contamination

The AI explains software, recommends automation, diagnoses the problem, or starts consulting.

That converts discovery into advisory work.

\-------------------------------------------------------------------------------- 

### Praise contamination

The AI repeatedly says:

"Great!" "That's smart!" "Exactly."

The participant learns which answers are rewarded.

\-------------------------------------------------------------------------------- 

### Vocabulary contamination

Participant says:

"our folders"

AI starts calling it:

"your document-management architecture."

Their conceptual model is gradually replaced by the model's.

\-------------------------------------------------------------------------------- 

### Over-probing

The opposite failure is also real. The AI notices every ambiguity and turns the interview into a deposition.

A good interviewer probes **high-information ambiguities**, not every incomplete sentence.

\-------------------------------------------------------------------------------- 

### Pathological "why?"

LLMs can recursively ask:

"Why?" "Why is that important?" "And why does that matter?"

The result becomes artificial and irritating.

Use varied causal probes and stop when the research objective is satisfied.

\-------------------------------------------------------------------------------- 

### Thread abandonment

The participant casually introduces the most important fact in the interview, but the model returns to its guide because the next question was preplanned.

\-------------------------------------------------------------------------------- 

### Rabbit-hole failure

The inverse: an interesting story consumes twenty minutes without contributing to the research purpose.

The model therefore needs both curiosity and objective tracking.

\-------------------------------------------------------------------------------- 

### Treating statements as truth about behavior

"I always check prices" may represent identity, aspiration, policy, or memory.

Ask for an episode.

\-------------------------------------------------------------------------------- 

### Treating future statements as behavioral evidence

"I'd definitely use that" is not equivalent to observed current behavior.

Portigal does use future-oriented prompts, but they can serve to expose mental models and possibilities rather than predict actual future behavior. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Fcategory%2Finterviewing-users%2F))

\-------------------------------------------------------------------------------- 

### Confusing participant interpretation with observation

Participant:

"Nobody reads those reports."

Evidence class:

`participant belief`.

Not:

`fact: nobody reads reports`.

\-------------------------------------------------------------------------------- 

# V. WORKFLOW-RECONSTRUCTION MODE FOR YOUR HARNESS

For your specific use case—interviewing small businesses to find operational and automation opportunities—I would turn Portigal's craft into a **workflow reconstruction loop**.

For every meaningful process uncovered, the AI should try to fill:

```
TRIGGER
What starts the process?

ACTOR
Who starts it?

INPUT
What information/document/event do they receive?

ACTION
What exactly do they do?

TOOL / ARTIFACT
Email? Excel? Paper? ERP? WhatsApp? Phone? Memory?

DECISION
What judgment or choice is made?

RULE
How is that choice made?

OUTPUT
What gets created or changed?

RECIPIENT
Who receives it next?

HANDOFF
How is it transferred?

WAIT
Does anyone wait for something?

EXCEPTION
When does the normal path change?

FAILURE
What goes wrong?

RECOVERY
What happens when it goes wrong?

FREQUENCY
How often does this happen?

VOLUME
How many items?

TIME
How long does it take?

VARIABILITY
How much does the process differ case to case?

CONSEQUENCE
What happens if the step is late/wrong/missed?

WORKAROUND
What unofficial fix exists?

HISTORY
How was this done before?

MEANING
Why do they believe this process exists?

```

The important part is that this **must not become a twenty-question checklist**.

It is an internal completeness model.

The conversation should still sound like:

"Tell me about the last time that happened."

followed by intelligent Portigal-style probing.

That distinction is fundamental.

\-------------------------------------------------------------------------------- 

# VI. A GOOD AI INTERVIEWER NEEDS TWO SIMULTANEOUS STATES

This is the main architectural extrapolation I would take from Portigal.

### State A — Conversation state

The interviewer tracks:

* what the participant just said;
* unresolved references;
* new actors;
* unusual terminology;
* affective cues;
* contradictions;
* promising threads;
* conversational comfort;
* whether the participant is telling a story.

### State B — Research state

Separately track:

* research objectives;
* evidence accumulated;
* missing evidence;
* hypotheses;
* workflow gaps;
* unexplored exceptions;
* remaining time;
* topics still necessary.

The next question should optimize across both.

A rigid questionnaire only uses State B.

A pleasant but useless conversation only uses State A.

Good qualitative interviewing requires both.

\-------------------------------------------------------------------------------- 

# VII. EVIDENCE MODEL IMPLIED BY PORTIGAL'S APPROACH

I would encode interview material approximately like this:

```
OBSERVATION
"I saw three printed supplier catalogs beside the monitor."

BEHAVIORAL EPISODE
"Yesterday she emailed four suppliers before finishing the estimate."

GENERALIZED BEHAVIOR
"We normally ask several suppliers."

BELIEF / INTERPRETATION
"Calling is faster."

ATTITUDE
"I hate doing procurement."

ORGANIZATIONAL RULE
"Anything above €20k must be approved by the owner."

EXCEPTION
"Urgent jobs skip the normal comparison."

WORKAROUND
"If nobody answers, we reuse the previous project's price."

HYPOTHETICAL
"I'd probably use an automatic price system."

DESIRE
"I wish this were easier."

RESEARCHER INFERENCE
"Supplier-price retrieval may be a bottleneck."

CROSS-INTERVIEW SYNTHESIS
"Price sourcing depends substantially on personal supplier relationships."

```

These categories should **never be flattened together**.

This is one of the biggest improvements you can make over a normal LLM interviewer.

\-------------------------------------------------------------------------------- 

# VIII. CANONICAL INTERVIEW CRAFT RULES FOR AN AI INTERVIEWER

These are the rules I would actually feed downstream into the final interviewing harness.

1. **Know what you are trying to learn, but do not script the conversation.**
2. **Treat the interview guide as coverage guidance, not question order.**
3. **Prefer stories over opinions.**
4. **Prefer specific remembered episodes over generalized descriptions.**
5. **When given an abstract claim, ask for a concrete example.**
6. **After understanding an example, ask whether it was typical.**
7. **Follow interesting answers before returning to the guide.**
8. **Probe new actors, tools, artifacts, handoffs, exceptions, decisions, consequences, and unexplained terminology.**
9. **Reconstruct processes sequentially: what happened first, then what happened next.**
10. **Do not silently fill workflow gaps from common sense. Ask.**
11. **Probe vague quantities when magnitude matters.**
12. **Use "What else?" when a list may be incomplete.**
13. **Use the participant's language rather than replacing it with researcher terminology.**
14. **Treat unusual words and local jargon as research opportunities.**
15. **Notice laughter, hesitation, emphasis, and other cues, but investigate them rather than interpreting them automatically.**
16. **Clarify ambiguous pronouns and references.**
17. **Ask about exceptions whenever someone describes a rule or normal process.**
18. **Compare situations to expose decision criteria and mental models.**
19. **Compare behavior over time to understand how processes evolved.**
20. **Ask participants to explain or teach processes when tacit knowledge is being compressed.**
21. **Build rapport through attention, patience, and follow-up—not through self-disclosure.**
22. **Do not manufacture rapport through praise.**
23. **Allow silence. Do not rescue participants from every pause.**
24. **Do not interrupt a productive relevant story merely to follow the guide.**
25. **Do not become the expert during discovery.**
26. **Do not pitch solutions while collecting evidence.**
27. **Do not correct participant misconceptions during the research portion unless safety or ethics requires it.**
28. **Treat misconceptions themselves as evidence.**
29. **Watch your own hypotheses and confirmation bias.**
30. **Actively seek evidence that could disconfirm the current interpretation.**
31. **Observe behavior, environment, artifacts, and tools whenever possible rather than relying exclusively on reported behavior.**
32. **Treat artifacts as workflow anchors: ask where they came from, who modifies them, where they go, and why they exist.**
33. **Separate formal process from actual process.**
34. **Separate observation, participant report, and researcher inference.**
35. **Treat contradictions as probes, not participant errors.**
36. **Handle sensitive issues progressively and nonjudgmentally.**
37. **Record interviews when consent and circumstances allow; do not pretend notes are equivalent to the full interaction.**
38. **Debrief immediately after each session.**
39. **Capture surprises and unanswered questions, not merely findings.**
40. **Modify subsequent interviews based on what earlier interviews revealed.**
41. **Do not mistake memorable quotes for insights.**
42. **Analyze individual evidence before synthesizing across interviews.**
43. **Require synthesized claims to remain traceable to underlying evidence.**
44. **Distinguish actual behavior from attitudes, desires, and hypothetical future behavior.**
45. **Optimize for understanding, not number of questions asked.**
46. **A successful interview should increasingly resemble a participant telling and demonstrating their world while the interviewer intelligently follows it—not a questionnaire being completed.**

The most important Portigal contribution for your final harness is therefore **adaptive follow-up discipline**. *The Mom Test* gives you powerful rules about **what evidence to trust**; Portigal supplies much more of the machinery for **how to remain in the conversation long enough, listen carefully enough, and probe intelligently enough to obtain that evidence in the first place**. ([portigal.com](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fportigal.com%2Flisten-to-steve-on-the-product-mastery-now-podcast%2F%3Futm%5Fsource%3Dchatgpt.com))

