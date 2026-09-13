---
id: 21-customer-interviews
phase: understand
tier-lite: true
tier-pro: true
produces: docs/research/YYYY-MM-DD-[slug]-interview-kit.md (prep); docs/research/YYYY-MM-DD-[slug]-synthesis.md (synthesize); docs/product/assumptions.md (evidence updates)
skill: product:interview
---

# Recipe: Customer Interviews — Prep and Synthesis

## When to use

**Prep** after `product:discover` or `product:critique`, when high-risk assumptions have no evidence and you need to talk to real target users. **Synthesize** after conversations happen — or after launch, when support tickets, feature requests, reviews, and churn emails pile up.

Recipe `03-discovery.md` defines *what* to ask (The Mom Test: past behavior, not opinions). This recipe covers the parts that usually don't happen: finding people, deciding in advance what would prove you wrong, and turning messy notes into evidence that moves the assumption map.

## Inputs

- `docs/product/assumptions.md` (required for prep)
- `docs/product/product-model.md` — Primary Users
- Latest `docs/specs/*-critique.md` — riskiest assumption
- Synthesize: notes/transcripts in `docs/intake/interviews/` (one file per source) or files passed via `using`

## Prep

### Lite (4 questions)

1. **Which 1–3 assumptions should these conversations inform?** (IDs from the map)
2. **Who qualifies — and who looks similar but doesn't?**
3. **Where will you find 5 of them this week?** Named channels or people.
4. **For each assumption: what would you have to hear about past behavior to believe it's false?**

### Pro (additional)

5. **What screening questions confirm someone qualifies before you book?**
6. **How many from each channel, and by what date?**
7. **Who must you NOT count?** (friends, colleagues, people who already know the idea, existing fans)
8. **What commitment will you ask for at the end?** (intro to a colleague, a follow-up, a pre-order, a pilot)

### Script structure

Tag every question with the assumption it informs.

| Block | Purpose | Example |
|---|---|---|
| Situation | Establish real, recent behavior | "Tell me about the last time you [situation]. Walk me through it." `[A1]` |
| Consequence | Cost of the problem | "What happened as a result? How long did it take?" `[A1]` |
| Workaround & spend | What they already do/pay | "What have you tried? Paid for? Why did you stop?" `[A2]` |
| Priority | Where it ranks | "Where does this sit among the problems you're dealing with this month?" `[A1]` |
| Commitment | Currency, not compliments | "Who else deals with this — could you introduce me?" `[A4]` |

Banned: "Would you use…", "Would you pay…", "Do you like…", "What features…", describing your solution before the last five minutes.

### Outreach message rules

Asks for advice, names the situation, not the product. ≤80 words. Example shape: "I'm researching how [role]s handle [situation]. Not selling anything — would you share 20 minutes on how you deal with it today?"

## Synthesize

### Lite (patterns + mapping)

1. Classify each source (interview, ticket, request, review, churn, sales call).
2. Extract evidence: past behavior, pain with frequency/cost, workaround, spend, trigger, commitment.
3. Filter non-evidence: compliments, hypotheticals, feature requests, generic agreement.
4. Cluster patterns (≥2 independent sources). Single-source findings → Signals.
5. Map patterns to assumption IDs: supports / contradicts, strength.

### Pro (additional)

6. Per-source table.
7. Restate every feature request as the underlying job.
8. Bias check: recruiting skew, leading questions, pitching during the interview.
9. Check the kit's pre-decided change-my-mind signals.
10. Propose risk changes and new assumption rows.

### Evidence strength (strongest first)

1. **Commitment** — gave money, time, a pilot, an intro
2. **Spend** — already pays or pays people to work around it
3. **Past behavior** — did something specific, recently
4. **Stated pain** — described cost or frustration with specifics
5. *Not evidence* — compliments, "I would", feature wishes

## Output structure

### Interview kit — `docs/research/YYYY-MM-DD-[slug]-interview-kit.md`

```markdown
---
type: interview-kit
product: [Product Name]
tier: lite | pro
status: complete
assumptions: [A1, A3]
target_count: 5
due: YYYY-MM-DD
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:interview
related:
  assumptions: docs/product/assumptions.md
  critique: docs/specs/YYYY-MM-DD-[slug]-critique.md
---

# Interview Kit: [Theme]

## Learning goals
| ID | Assumption | What we need to learn | Change-my-mind signal (decided in advance) |
|---|---|---|---|

## Who qualifies
- Qualifies: [criteria]
- Does not qualify: [lookalikes to exclude]
- Screening questions (pro): 1. … 2. …

## Where to find them
| Channel / person | How to reach | Target count |
|---|---|---|

## Outreach message
> [≤80 words, no pitch]

## Script
1. [question] `[A1]`
…
Closing commitment ask: [ask]

## Note-taking template
- Person / role / date:
- Last time it happened (story):
- Workaround & spend:
- Quotes (verbatim):
- Commitment given:
- Non-evidence heard (compliments / hypotheticals / requests):

## Bias guards (pro)
[Who not to count; how to avoid leading]

## Notes
```

### Synthesis — `docs/research/YYYY-MM-DD-[slug]-synthesis.md`

```markdown
---
type: research-synthesis
product: [Product Name]
tier: lite | pro
status: complete
sources_count: [N]
sources: [list of filenames consumed]
source_phase: pre-launch | post-launch   # post-launch when any docs/specs/*-launch.md has status launched or complete; never mix phases in one synthesis
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:interview
related:
  kit: docs/research/YYYY-MM-DD-[slug]-interview-kit.md
  assumptions: docs/product/assumptions.md
---

# Synthesis: [Theme]

## Headline
[2–3 sentences: what the evidence says, including what it contradicts]

## Patterns (≥2 sources)
| Pattern | Sources | Strength | Supports | Contradicts |
|---|---|---|---|---|

## Signals (1 source)
- [finding] — [source]

## Per-source extraction (pro)
| Source | Kind | Past behavior | Workaround / spend | Commitment | Non-evidence count |
|---|---|---|---|---|---|

## Feature requests → underlying jobs
| Request (as asked) | Underlying job | Sources |
|---|---|---|

## Change-my-mind signals
| ID | Signal (from kit) | Fired? | Evidence |
|---|---|---|---|

## Assumption impact
| ID | Evidence added | Proposed risk change | Applied? |
|---|---|---|---|

## New assumptions proposed
| Proposed ID | Assumption | Type | Risk | Added? |
|---|---|---|---|---|

## Bias check (pro)
[Recruiting skew, leading questions, pitching — and how much it discounts the findings]

## Notes
```

## Exit condition

**Prep:** you can send the outreach message today, and you wrote down what would prove you wrong before anyone answered.
**Synthesize:** every high-risk assumption the sources touch has an updated Evidence cell with a citation, and you can say in one sentence what the conversations changed.

## AI review prompt

1. Does any script question or the outreach message ask for opinions about the future or describe the solution?
2. Were change-my-mind signals set before the conversations?
3. Is every "pattern" backed by ≥2 independent sources, with filenames?
4. Were compliments, hypotheticals, or feature requests counted as evidence anywhere?
5. Did the synthesis set a verdict or apply a risk change without confirmation?
6. Is the sample biased (friends, one company, existing fans) — and is that stated?

## Checklist

- [ ] Prep: 1–3 assumption IDs targeted; every question tagged
- [ ] Prep: qualifier and exclusions defined; channels named; target count and date set
- [ ] Prep: change-my-mind signal per assumption, decided in advance
- [ ] Prep: outreach message has no pitch and no solution
- [ ] Synthesize: non-evidence filtered and counted
- [ ] Synthesize: patterns need ≥2 sources; each cites filenames
- [ ] Synthesize: feature requests restated as jobs
- [ ] Synthesize: assumptions.md Evidence and Discovery Evidence updated; no Verdict written
- [ ] Synthesize: risk changes and new rows applied only on confirmation
