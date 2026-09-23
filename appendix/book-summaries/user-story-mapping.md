# User Story Mapping — Jeff Patton

**Weight: DOWNSTREAM — product-model and release-slicing extraction**

For your harness, Patton belongs **after discovery synthesis and opportunity validation**, not inside the interviewing engine. The valuable contribution is a transformation:

**validated user workflow → structured activity/task model → complete end-to-end product slice → progressively deeper releases → implementation stories**

This is exactly where story mapping is strong. Patton explicitly contrasts the map with a flat backlog: the map preserves the overall system, users, workflow, goals, preceding/following steps, and release context instead of reducing everything to isolated stories. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fuser-story-mapping-presentation%2F))

One qualification matters for an AI implementation: **a story map is not supposed to be an exact process model or flowchart.** Patton treats narrative order as a device for telling and understanding the user's story. The AI should therefore not turn interview evidence into a giant deterministic BPMN-like graph. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fqa%5Fbranches%5Fin%5Fmaps%2F))

\-------------------------------------------------------------------------------- 

## 1\. User Activities

**Explanation**

Activities are the large things users do to accomplish a goal. They sit at a higher level than individual user tasks and form the major sections of the story map.

Patton gives examples such as managing email versus smaller tasks such as reading, sending, or deleting a message. Activities provide stable context under which smaller behaviors can be organized. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

**Example**

For software helping a small contractor handle field jobs:

**Plan work → Dispatch workers → Perform work → Report completion → Review job**

"Dispatch workers" is an activity.

"Assign Ahmed to Site A for Tuesday morning" is a task within it.

**Input required from discovery**

* user's overall goal/job;
* major phases of getting it done;
* actor responsible for each phase;
* start and end states;
* actual language users use for the activity.

**Output for product specification**

A small set of high-level product-capability areas expressed from the **user's perspective**, rather than:

* screens;
* database entities;
* modules;
* proposed features.

**AI harness operationalization**

Cluster validated workflow steps into activity groups.

A useful internal representation:

```
Activity
- actor
- user_goal
- description
- constituent_tasks[]
- evidence_refs[]

```

The AI should prefer verb-oriented activity names such as:

Schedule today's workers

over solution-oriented names such as:

Scheduling Dashboard

\-------------------------------------------------------------------------------- 

# 2\. User Tasks

**Explanation**

Activities decompose into **user tasks**: concrete things people do to reach their goals. Patton specifically distinguishes user tasks from developer tasks. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

Tasks are the important bridge between discovery evidence and implementation.

**Example**

Activity:

Report completed work

Tasks:

* capture what was completed;
* record hours;
* photograph the result;
* note problems;
* submit the report;
* correct a rejected report.

**Input required from discovery**

For each observed workflow:

* actions taken;
* actor performing them;
* trigger;
* inputs required;
* output/result;
* next step;
* tools currently used;
* variations;
* failures/recovery steps.

**Output for product specification**

A user-task model sufficiently granular that later functionality can be attached to real work.

**AI harness operationalization**

Convert workflow evidence into normalized tasks while retaining original evidence.

For example:

```
Raw:
"At five o'clock I WhatsApp the foreman and ask what they finished."

Normalized task:
Collect daily completion report

Evidence:
Interview 07, timestamp 32:14
Actor:
Site manager
Current mechanism:
WhatsApp

```

Do **not** prematurely convert it into:

Build daily-report messaging feature.

That is already a solution.

\-------------------------------------------------------------------------------- 

# 3\. Backbone

**Explanation**

The backbone is the high-level structure running across the top of the map. It consists of the important activities and higher-level tasks that explain the product's usage.

Patton deliberately keeps these elements visible instead of decomposing them away. They provide context for everything below them. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

An important Patton rule is that the backbone generally isn't where fine-grained prioritization happens. If a capability is necessary to complete the overall experience, asking whether "step 2 or step 4 is more important" may be meaningless. Depth underneath those steps is where choices usually occur. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

**Example**

```
Create job
    ↓
Plan work
    ↓
Assign workers
    ↓
Execute work
    ↓
Report progress
    ↓
Review / close job

```

This becomes the conceptual backbone of the product.

**Input required from discovery**

The harness needs:

* complete job/workflow boundaries;
* major phases;
* chronological or narrative relationships;
* necessary handoffs;
* actors involved;
* goal reached when the flow completes.

**Output for product specification**

A product-wide narrative that answers:

What does this product actually help someone accomplish from beginning to end?

**AI harness operationalization**

Generate the backbone **before generating features or tickets**.

Require every later product requirement to attach to:

```
Job
  → Activity
    → Task
      → Story / Product behavior

```

This prevents orphan features.

\-------------------------------------------------------------------------------- 

# 4\. Narrative Flow / Sequencing From the User's Perspective

**Explanation**

The horizontal axis represents narrative progression.

Patton says that where strict ordering is ambiguous, the appropriate order is often simply **the order in which you would explain what the user does**. The purpose is to make the system understandable as a story, not mathematically encode every possible route. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

This is a subtle but important distinction.

**Example**

A business owner might:

receive request → prepare quote → negotiate → create job → schedule workers → do work → invoice

In reality:

* negotiations can loop;
* scheduling may begin before the quote is formally complete;
* workers may be reassigned;
* invoicing may happen in stages.

The story map doesn't need to become an enormous graph encoding every branch.

**Input required from discovery**

Capture:

* typical ordering;
* mandatory predecessors;
* optional ordering;
* loops;
* handoffs;
* alternate paths;
* exception paths.

**Output for product specification**

A **canonical narrative path**, annotated with known variants.

**AI harness operationalization**

Represent these separately:

```
narrative_order
hard_dependencies
common_variants
exception_paths

```

Do not confuse narrative order with hard system dependency.

That distinction will prevent the AI from inventing unnecessarily rigid workflows.

\-------------------------------------------------------------------------------- 

# 5\. Walking the Workflow

**Explanation**

Patton recommends literally walking through the map from beginning to end with users, stakeholders, and developers. Doing this exposes missing steps, incorrect decomposition, pain points, and misunderstandings. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

For your harness, this becomes a critical **verification stage between discovery synthesis and specification generation**.

**Example**

The generated map says:

Assign worker → worker completes work → manager receives report.

During walkthrough someone notices:

"No. The foreman first checks whether they have materials. If materials are missing, the office has to arrange them."

A missing operational dependency appears.

**Input required from discovery**

The initial workflow model plus unresolved uncertainties.

**Output for product specification**

A corrected workflow with:

* missing tasks added;
* ordering corrected;
* exceptions recorded;
* actor responsibilities clarified.

**AI harness operationalization**

Before producing an MVP specification, run a consistency pass:

"Walk through this workflow as [persona]. What happens first? What information do I need? Who gives it to me? What happens next? Where can I get blocked?"

Then surface suspected gaps as questions or uncertainty markers rather than filling them with invented assumptions.

\-------------------------------------------------------------------------------- 

# 6\. Maintain End-to-End Context

**Explanation**

This may be the most important Patton contribution for your use case.

A flat backlog destroys relationships between:

* goals;
* users;
* activities;
* tasks;
* sequence;
* surrounding workflow.

Patton's criticism is essentially that decomposition without preserved context leaves you with disconnected fragments. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

His presentation specifically describes the story map as giving a story contextual information about the user, goals, surrounding work, what came before, and what comes next. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fuser-story-mapping-presentation%2F))

**Example**

Bad specification:

```
P1 Add photo upload
P1 Add employee assignment
P1 Add notifications
P2 Add comments
P2 Add calendar

```

Better:

```
Job: Complete today's site work

Prepare
  - View assignment

Execute
  - Read instructions
  - Perform work

Report
  - Record completed work
  - Attach photos

Resolve problems
  - Flag blocker
  - Notify manager

```

Now "photo upload" has meaning.

**Input required from discovery**

Every task should retain:

* job;
* activity;
* actor;
* context;
* trigger;
* desired result;
* evidence.

**Output for product specification**

Traceability:

```
Interview evidence
→ observed workflow
→ task
→ opportunity
→ proposed behavior
→ release
→ implementation story

```

**AI harness operationalization**

Never emit context-free requirements.

Every story generated by the harness should retain references back to its parent task and evidence.

\-------------------------------------------------------------------------------- 

# 7\. Vertical Depth: Essential Workflow vs Richness

**Explanation**

Once the complete workflow exists horizontally, items underneath each backbone element can be ordered vertically.

Patton places the most necessary behavior higher and less necessary variations/depth lower. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

This creates a very useful mental model:

**Horizontal dimension = breadth of the experience.**

**Vertical dimension = depth of support.**

**Example**

Under:

Submit daily report

you might have:

```
Essential
- enter text summary
- submit report

Next depth
- attach photos
- edit before approval

Further depth
- offline mode
- voice transcription
- AI-generated draft
- reusable templates

```

The first release doesn't necessarily remove the entire "reporting" activity.

It reduces its **depth**.

**Input required from discovery**

The harness therefore needs to know:

* what's necessary for task completion;
* common versus rare variations;
* workaround acceptability;
* frequency;
* consequence of omission;
* edge cases;
* user expectations.

**Output for product specification**

A layered product model:

```
Task
├── minimal support
├── important enhancement
├── secondary variation
└── edge case / future depth

```

**AI harness operationalization**

Do not prioritize only at feature level.

Ask instead:

"What is the least functionality required to support this necessary user task?"

That question is much more useful for MVP generation.

\-------------------------------------------------------------------------------- 

# 8\. Horizontal Release Slicing

**Explanation**

The defining planning move is cutting a release **across the map**, rather than finishing one capability deeply while leaving the rest unsupported.

Patton describes drawing release boundaries across the map and moving stories vertically into release bands. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

The resulting release should support a coherent end-to-end user experience rather than an arbitrary group of high-ranking features.

**Example**

Suppose the backbone is:

```
Create job → Schedule → Work → Report → Review

```

A bad first release might fully implement "Create job" with:

* templates;
* attachments;
* imports;
* duplicate detection;
* custom fields;

while offering no way to schedule or report work.

A story-map slice instead might provide:

```
Create job      → manually enter basic job
Schedule        → assign one worker/date
Work            → worker sees today's assignment
Report          → submit text + photo
Review          → manager marks complete

```

Each component is crude.

The overall system works.

**Input required from discovery**

You need enough evidence to distinguish:

* workflow-essential tasks;
* optional variations;
* important exceptions;
* quality-of-life improvements.

**Output for product specification**

Release slices such as:

```
R1 — minimal end-to-end workflow
R2 — frequent variations + major friction reduction
R3 — lower-frequency cases + optimization

```

**AI harness operationalization**

A release-slicing algorithm should optimize for:

**smallest coherent support across the validated workflow**

rather than:

highest individually scored features.

\-------------------------------------------------------------------------------- 

# 9\. Walking Skeleton

**Explanation**

The highest-priority stories across the map can describe the smallest system capable of providing end-to-end functionality. Patton uses Alistair Cockburn's term **walking skeleton** for this and says he tries to build it first. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

This concept is more precise for your harness than using "MVP" casually.

**Example**

For job-management software:

**Not walking skeleton**

job creation + powerful customer management + document storage.

There is no completed user outcome.

**Walking skeleton**

create simple job → assign employee → employee sees assignment → reports completion → manager closes job.

It can be ugly and constrained.

But the job can happen.

**Input required from discovery**

The harness must know:

* successful end state;
* indispensable tasks;
* indispensable actors;
* necessary handoffs;
* minimum information required between stages.

**Output for product specification**

An explicit:

```
Walking Skeleton

```

containing the minimum behavior needed at **each necessary stage**.

**AI harness operationalization**

Test every proposed MVP:

"Can the target user complete the target job from trigger to outcome using only this slice?"

If no, it isn't a valid end-to-end slice.

\-------------------------------------------------------------------------------- 

# 10\. Release Slices as Increasing Capability

**Explanation**

Subsequent releases deepen support under the same workflow.

The map therefore supports **incremental product growth without losing the whole-system perspective**. Patton describes gradually building more capability across all major parts of the system instead of completing one feature area at a time. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))

**Example**

### Slice 1 — Walking skeleton

Worker manually receives assignment and submits completion report.

### Slice 2 — Operationally viable

Add:

* photos;
* status changes;
* rescheduling;
* manager notifications.

### Slice 3 — Operational efficiency

Add:

* recurring schedules;
* templates;
* batch assignment;
* automatic summaries.

### Later

Handle:

* unusual permissions;
* complex offline synchronization;
* advanced analytics;
* uncommon exceptions.

**Input required from discovery**

Evidence about:

* frequency;
* severity;
* common variations;
* edge cases;
* constraints;
* adoption barriers.

**Output for product specification**

A release roadmap organized around **increasingly capable user outcomes**, not arbitrary feature buckets.

**AI harness operationalization**

Require every release slice to state:

```
Target user
Target job
Supported circumstances
Workflow depth included
Workflow depth excluded
Expected outcome
Evidence supporting the slice

```

\-------------------------------------------------------------------------------- 

# 11\. Variations and Edge Cases

**Explanation**

Once the main flow exists, it can be expanded with alternatives, exceptions, subtasks, and variations.

But story mapping should not become a perfect process diagram. Patton explicitly warns that real user behavior branches and becomes messy; the map's purpose is to help people tell and discuss users' stories. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fqa%5Fbranches%5Fin%5Fmaps%2F))

**Example**

Core:

Worker submits daily report.

Variations:

* no work completed;
* worker absent;
* multiple sites in one day;
* no internet connection;
* supervisor submits on worker's behalf;
* report needs correction.

These belong beneath or alongside the primary workflow rather than replacing it with a six-page decision tree.

**Input required from discovery**

The interviewer should capture explicit signals such as:

"usually…"

"unless…"

"sometimes…"

"when that happens…"

"the exception is…"

**Output for product specification**

A structured distinction:

```
primary_path
common_variations
failure_recovery
rare_edge_cases

```

**AI harness operationalization**

Never allow rare complexity to silently inflate the walking skeleton.

Edge cases should remain associated with their task but carry evidence about frequency and consequence.

\-------------------------------------------------------------------------------- 

# 12\. Shared Understanding

**Explanation**

The story map is not valuable merely because it produces a diagram.

Patton repeatedly emphasizes the **conversation around the map**. Walking through it with users, stakeholders, and developers exposes disagreements, omissions, and alternative understandings. The map remains useful precisely because it preserves the big picture for continuing discussion. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fuser-story-mapping-presentation%2F))

This matters especially for an AI harness.

A fully automated AI that silently generates a beautiful map risks destroying one of story mapping's main advantages.

**Example**

AI says:

Invoice customer happens after manager approves completion.

Operations manager says:

"No. We invoice weekly regardless of whether the site manager has approved every daily report."

That disagreement is highly valuable.

**Input required from discovery**

Evidence plus uncertainty and contradictions.

**Output for product specification**

A reviewable model in which disputed assumptions remain visible.

**AI harness operationalization**

AI should act as:

**mapper + consistency checker + facilitator**

not:

**oracle**.

Flag:

```
CONFIRMED
INFERRED
CONFLICTING EVIDENCE
UNKNOWN

```

for important workflow relationships.

\-------------------------------------------------------------------------------- 

# What the Discovery Harness Must Capture Upstream

This is where Patton has a surprisingly important implication for your interviewing harness.

If discovery only extracts **problems**, you will later lack enough information to create good story maps.

You need **behavioral topology** as well.

For every meaningful workflow discovered, I would preserve at least:

| Discovery object     | Capture                                      |
| -------------------- | -------------------------------------------- |
| **Actor**            | Who performs the work                        |
| **Goal / Job**       | What they're ultimately trying to accomplish |
| **Trigger**          | What starts the workflow                     |
| **Activity**         | Major phase of work                          |
| **Task**             | Concrete action performed                    |
| **Narrative order**  | What normally precedes/follows it            |
| **Hard dependency**  | What genuinely must happen first             |
| **Input**            | Information/material needed                  |
| **Output**           | What the task produces                       |
| **Handoff**          | Who receives the result                      |
| **Current solution** | Tool/process/workaround currently used       |
| **Pain / friction**  | What makes the task difficult                |
| **Frequency**        | How often task/variant occurs                |
| **Importance**       | Consequence if it cannot happen              |
| **Variation**        | Other common ways it happens                 |
| **Exception**        | Failure or unusual condition                 |
| **Recovery**         | What users do when it goes wrong             |
| **Desired outcome**  | What "done well" means                       |
| **Evidence**         | Interview/story supporting the claim         |
| **Confidence**       | Confirmed, inferred, disputed, unknown       |

That is considerably richer than:

```
Problem:
Scheduling workers is annoying.

```

The latter gives you an opportunity statement.

It does **not** give you enough structure to design a product.

\-------------------------------------------------------------------------------- 

# Recommended Transformation Pipeline

Your combined harness should eventually be able to execute something close to:

```
RAW INTERVIEW EVIDENCE
        ↓
Observed stories / behavior
        ↓
Jobs and outcomes
        ↓
Workflow instances
        ↓
Normalized user tasks
        ↓
Activities
        ↓
Canonical workflow / backbone
        ↓
Pain points + opportunities attached to tasks
        ↓
Validated opportunity selection
        ↓
Candidate product behavior
        ↓
Full story map
        ↓
Walking skeleton
        ↓
Release slices
        ↓
Stories / implementation specification

```

The critical design decision is keeping the intermediate layers.

Do **not** jump:

```
Interview
→ problem
→ feature
→ Jira ticket

```

That destroys most of what Mom Test + JTBD + Continuous Discovery + Story Mapping collectively give you.

\-------------------------------------------------------------------------------- 

# What Patton Adds That Your Other Sources Don't

For your overall corpus, Patton should have a narrow but important role.

**The Mom Test / Portigal / Hansen**

Tell the harness how to obtain trustworthy evidence.

**Christensen / Moesta / Kalbach**

Tell it how to understand jobs, progress, circumstances, workflows, alternatives, and switching behavior.

**Torres**

Helps turn stories into opportunities and connect opportunities to solutions and assumptions.

**Patton**

Answers the next question:

**Given that we understand the job, workflow, and validated opportunity, how do we turn that knowledge into a coherent product whose first release still supports the whole user journey?**

That is his distinctive contribution here.

I would therefore **not import large amounts of Story Mapping into the interviewing agent**.

I would import its **data requirements upstream**, and activate the actual methodology downstream.

\-------------------------------------------------------------------------------- 

# Minimum Story-Mapping Rules Needed by the Product Harness

1. **Model user work before product features.** Build the map from activities and tasks expressed from the user's perspective.
2. **Organize work hierarchically.**

```
Job
→ Activity
→ Task
→ Product behavior/story

```

1. **Maintain narrative flow.** Arrange activities and tasks so the map can be read as the story of how a user reaches an outcome. Narrative order does not necessarily mean strict technical dependency. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))
2. **Preserve the backbone.** Never flatten the workflow into a context-free list of requirements. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))
3. **Attach every product behavior to user context.** Every specification item should retain actor, goal, parent task, workflow position, and supporting evidence.
4. **Walk the map before scoping.** Check the whole flow for missing steps, actors, handoffs, dependencies, and exceptions. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))
5. **Prioritize depth, not existence of essential workflow stages.** Keep necessary activities represented and vary how richly they are supported. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))
6. **Build the first release as a walking skeleton.** The minimum slice must allow the target user to travel from trigger to meaningful outcome end to end. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))
7. **Slice horizontally across the workflow.** Prefer thin support across necessary activities over deep implementation of isolated feature areas. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fthe-new-backlog%2F))
8. **Layer richness downward.** Common variations, quality improvements, advanced capabilities, and edge cases become progressively deeper release slices.
9. **Separate main flow from variations and exceptions.** Preserve them without turning the story map into a precise workflow engine. ([J Patton Associates](https://www.google.com/url?sa=E&amp;q=https%3A%2F%2Fjpattonassociates.com%2Fqa%5Fbranches%5Fin%5Fmaps%2F))
10. **Maintain evidence traceability.**

```
Interview
→ evidence
→ task
→ opportunity
→ proposed behavior
→ story
→ release

```

1. **Preserve uncertainty.** AI-generated relationships must be identifiable as inferred rather than masquerading as discovered facts.
2. **Use the map as the parent artifact for implementation specifications.** Tickets may become flat once engineers execute them, but the harness should always be able to reconstruct the surrounding user journey.
3. **Do not let story mapping select the market opportunity.** By the time Patton's machinery is activated, the target job/opportunity should already have enough evidence to justify product modeling.

The core rule worth encoding is therefore:

**Don't define the MVP as the smallest pile of important features. Define it as the thinnest evidence-backed version of the product that lets the target user complete the target workflow and achieve the target outcome.**

That is the piece of Patton's methodology most worth preserving in your final discovery-to-product harness.

