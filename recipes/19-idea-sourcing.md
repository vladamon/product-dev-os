---
id: 19-idea-sourcing
phase: choose
tier-lite: true
tier-pro: true
produces: docs/ideas/YYYY-MM-DD-ideation.md (in the directory where invoked)
skill: product:ideate
---

# Recipe: Idea Sourcing

## When to use

Use this before any project exists, when you want to build something but have no idea, or have several vague ideas and can't commit. The goal is one idea worth running `product:discover` on — not a brainstorm.

The diagnosis this recipe addresses: aspiring founders pick ideas by excitement and market size. The ones that survive are picked by **access** (you can reach the users), **evidence of spend** (the problem already costs money or time), and **fit** (you can sustain it on your real hours for a year). Start from the founder, not the market.

## Inputs

- The founder's constraints and background (interview)
- Optional: ideas already listed, pain journals, notes in `docs/intake/`
- Optional: prior `docs/ideas/*-ideation.md` runs

## Lite version (3 constraint questions + scoring)

Ask one at a time:

1. **How many hours a week can you sustain for 12 months, and alongside what?**
2. **What's your runway, and what monthly income makes this worth it — by when?**
3. **What will you refuse to do?** (B2C, sales calls, hardware, regulated industries, being on camera…)

Then list the founder's existing ideas, run the kill filters, score survivors, and force a pick.

## Pro version (constraints + inventory + sourcing)

Ask lite questions 1–3, then the founder inventory:

4. **What skills could you sell tomorrow** — as a freelancer or employee?
5. **Which industries or workflows do you know from the inside?** Where have you seen how the sausage is made?
6. **Which communities are you already a member of** — online or offline — where people trust you?
7. **Which problems have you or your clients personally paid money or lost hours to solve?**
8. **What unfair advantage do you have?** Audience, network, proprietary data, distribution, rare expertise. "None" is an honest answer.

Then walk the sourcing lenses, asking for candidates under each:

| Lens | Prompt |
|---|---|
| Own recurring pain | "What did you work around more than twice this month?" |
| Work/client pain | "What do your clients or colleagues complain about, pay for, or do in spreadsheets?" |
| Community complaints | "What question gets asked again and again in communities you're in?" |
| Boring businesses | "Which unglamorous workflow runs on email and spreadsheets in an industry you know?" |
| Unbundling | "Which bloated tool do people use for just one feature?" |
| Productized service | "Which service you could deliver could become a repeatable product?" |
| Paid-but-hated | "Which tool do people pay for and still hate?" |

Add at most 5 `[AI-proposed]` candidates, each anchored to an inventory answer.

## Kill filters

Every candidate must pass all four. One fail removes it — scores never rescue a failed filter.

| # | Filter | Fail example |
|---|---|---|
| 1 | Can name 20 specific reachable target users without paid ads | "Small businesses everywhere" |
| 2 | The problem already costs them time or money today | "They'd love this" (no current spend) |
| 3 | A first version fits in ≤6 weeks of real founder hours | 5 h/week founder, marketplace with two sides |
| 4 | Founder would still work on it after 12 months of slow growth | Only exciting if it goes viral |

"AI wrapper for X" candidates must name a concrete distribution path to pass filter 1.

## Scoring dimensions (survivors only, 1–5)

| Dimension | 1 | 5 |
|---|---|---|
| Pain | rare, mild | frequent, painful |
| Evidence of spend | none | already paying for workarounds |
| Reachability | cold strangers only | founder is inside the community |
| Founder fit | new domain, no advantage | insider with unfair advantage |
| Build scope (inverted) | months of work | a few weekends |
| Market signals | none found | active complaints, paid alternatives `[sourced]` |

The total is a sort key. The decision is qualitative. If the top two are within 2 points, force the choice.

## Output structure

`docs/ideas/YYYY-MM-DD-ideation.md`:

```markdown
---
type: ideation
tier: [lite|pro]
status: complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:ideate
candidates_considered: [N]
candidates_passed: [N]
pick: [idea name]
---

# Ideation — [YYYY-MM-DD]

## Founder Constraints

- Hours/week (12 months): [N] alongside [job/other]
- Runway: [months] · Income target: [amount/month] by [date]
- Refuses: [list]

## Founder Inventory

[pro — lite: [deferred]]
- Sellable skills: …
- Insider domains: …
- Communities: …
- Problems paid to solve: …
- Unfair advantages: …

## Sourcing Lenses

[pro — lite: [deferred]. One line per lens: what it surfaced]

## Candidates

| # | Idea (one sentence: user + problem) | Source |
|---|---|---|
| 1 | | founder / [AI-proposed] from: [inventory item] |

## Kill Filters

| # | Reachable 20 | Costs today | ≤6 weeks | 12-month stamina | Result |
|---|---|---|---|---|---|
| 1 | ✓ [reason] | ✗ [reason] | | | cut |

## Scores

| # | Pain | Spend | Reach | Fit | Scope | Signals | Total |
|---|---|---|---|---|---|---|---|

Signal notes: [labeled claims per conventions §7]

## Pick

**[Idea]**
Why: [2–3 sentences tied to scores and constraints]

## Runner-up

**[Idea]** — [one line: what would make it the pick instead]

## First 5 Conversations

1. [Named person or exact place] — [why them]

## Next Step

[Create project dir → product:discover using this file → product:critique]
```

## Exit condition

You can say: "I'm going to talk to these 5 people about [problem] this week." If the pick has no named conversations, ideation isn't done.

## AI review prompt

1. Did the pick win on access and evidence of spend, or on excitement and market size?
2. Were kill filters actually applied, or softened for a favorite idea?
3. Are AI-proposed ideas anchored to the founder's inventory, or generic trends?
4. Are the first 5 conversations real names or exact places — or categories?
5. Does the pick fit the founder's stated hours, runway, and refusals?

## Checklist

- [ ] Constraints captured before any idea was scored
- [ ] Every candidate run through all four kill filters with reasons
- [ ] AI-proposed candidates labeled and anchored (max 5)
- [ ] Market-signal claims labeled sourced / estimate / founder-stated
- [ ] Exactly one pick and at most one runner-up
- [ ] First 5 conversations are named people or exact places
