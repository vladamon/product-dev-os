---
id: 18-triage
phase: portfolio
tier-lite: true
tier-pro: true
produces: docs/triage/YYYY-MM-DD-triage.md (in the directory where invoked)
skill: product:triage
---

# Recipe: Project Triage

## When to use

Use this when you have multiple in-flight projects and feel scattered. The goal is to choose what to work on this week — not what to build inside one product. This is the portfolio layer above the per-product lifecycle.

The diagnosis this recipe addresses: solo builders rarely fail from a shortage of ideas. They fail by spreading attention too thinly across too many semi-valid ideas, none of which gets enough sustained effort to ship.

## Inputs

- A directory (typically a parent folder) containing multiple project repos as subdirectories — or an explicit list of project paths passed at invocation
- Optional: prior triage files in `docs/triage/` for trend tracking

## The six scoring dimensions

For each project, score 1–5 on each dimension. Higher is better unless noted.

| Dimension | Question |
|---|---|
| Money potential | If this works, what's the realistic 12-month revenue or comparable value? |
| Learning value | What skill, audience, or insight does this give me that compounds elsewhere? |
| Urgency | Is there a real external deadline, opportunity window, or competitive pressure? |
| Strategic fit | Does this reinforce my current positioning / long-term direction? |
| Energy required | How much focused effort to ship the next milestone? (Inverted: lower energy → higher score) |
| Blocker status | What's actually preventing progress right now? (Inverted: fewer blockers → higher score) |

The total is a sort key, not a decision. The decision is qualitative — informed by the scores.

## Lite version (4 questions per project)

For each project found, ask:

1. **One sentence: what is this project, and what's the next concrete milestone?**
2. **Money potential — 1 (zero/unknown) to 5 (clear paying customers or revenue path)?**
3. **Energy to next milestone — 1 (months of focused work) to 5 (a few sessions)?**
4. **What's blocking progress right now? (If nothing: "ready to work on.")**

Auto-score Learning, Urgency, Strategic fit from the project's README + last commit date + your stated positioning.

## Pro version (full 6 questions per project)

Ask all six dimensions explicitly. Also ask:

7. **Honest question: should this be killed?** If the project has been "almost shipped" for 60+ days, push hard on this.
8. **What's the smallest scope cut that would unblock this within a week?** Often the right answer is not "work on it more" but "cut more from it."

## Output structure

`docs/triage/YYYY-MM-DD-triage.md`:

```markdown
---
type: triage
tier: [lite|pro]
status: complete
created: YYYY-MM-DD
skill: product:triage
projects_scanned: [N]
---

# Triage — [YYYY-MM-DD]

## Portfolio snapshot

| Project | Next milestone | Money | Learn | Urgency | Strategic | Energy | Blockers | Total |
|---|---|---|---|---|---|---|---|---|
| [name] | [milestone] | [1-5] | [1-5] | [1-5] | [1-5] | [1-5] | [1-5] | [sum] |

## Focus — this week

**[Project name]**
Why: [1–2 sentences]
Next concrete action: [specific task — not a category]
Time budget: [hours or days]

## Secondary — touch if focus is blocked or done

**[Project name]**
Why: [1 sentence]
Maximum time before refocusing: [hours]

## Do not touch — this week

- **[Project]** — [reason: not yet ready / blocked on external / lower priority]

## Kill candidates

[Projects that should be retired. Empty if none — but be honest.]

- **[Project]** — last commit [N days ago]. Has been "almost shipped" for [N days]. Kill criteria: [what would make you actually walk away].

## Notes / signals
[Anything observed across the portfolio — e.g., "5 of 6 projects are pre-shape; my bottleneck is finishing, not starting."]
```

## Exit condition

The triage is done when you can answer: "What am I working on tomorrow morning, and what am I not going to look at this week?" If you can't answer the second half, the triage hasn't done its job.

## AI review prompt

1. Is the focus project actually the highest-leverage one, or the one the user emotionally likes most?
2. Is the do-not-touch list honest, or does it secretly include projects the user will work on anyway?
3. Are there kill candidates that the user is avoiding naming? Look for projects last touched >60 days ago with no clear next milestone.
4. Is the focus project's next action specific enough to start tomorrow without further planning?

## Checklist

- [ ] Every project found has been scored on all six dimensions
- [ ] Exactly one focus project named (not two; not "depending on mood")
- [ ] Do-not-touch list is non-empty unless portfolio has ≤2 projects
- [ ] Kill candidates have been considered (empty section is allowed, but must be deliberate)
- [ ] The focus project's next action is concrete enough to start immediately
