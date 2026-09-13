---
id: 28-weekly-checkin
phase: always
tier-lite: true
tier-pro: true
produces: docs/checkins/YYYY-MM-DD-checkin.md
skill: product:checkin
---

# Recipe: Weekly Founder Check-in

## When to use

Every week, same day, ten minutes — and any time you feel stuck, scattered, or unmotivated. A team has standups, managers, and co-founders who notice drift. A solo founder has none of that. This recipe replaces them with a written record that notices for you.

The diagnosis this recipe addresses: solo projects rarely die from one bad decision. They die from weeks of quiet avoidance — building instead of selling, polishing instead of launching, starting a new idea instead of finishing — that nobody names until months are gone.

## Inputs

- Previous check-ins in `docs/checkins/` (last week's commitments; last 4 for patterns)
- Latest triage (`docs/triage/` in the cwd or parent) — the focus decision
- Active `docs/specs/*-plan.md` — checkbox progress and appetite
- One-number sources: telemetry, `business-model.md`, research syntheses, experiments
- Kill criteria from critique, experiment, pmf, and triage files
- `git log --since='7 days ago' --oneline`

## Lite version (5 questions)

Ask one at a time. Pre-fill from evidence and confirm.

1. **For each commitment from last week: done, partial, or not done — and what's the evidence?** If not done: what got in the way, in one line?
2. **What actually moved this week?** Shipped, users talked to, signups, revenue.
3. **What's the one number now?** Pre-launch: conversations held or experiment signups. Post-launch: activated users or MRR.
4. **Energy this week, 1–5, and one line on why?**
5. **What are next week's commitments?** Max 3, each verifiable. Once an MVP exists, at least one touches users or distribution.

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **Hours this week on building / distribution & user contact / admin & learning?**
7. **Pattern review:** show the detected patterns with counts. "Is this real? What's behind it?"
8. **Kill criteria due:** "The criterion was [X] by [date]. Did it trip?"

## Pattern rules (pro)

Computed from the frontmatter of the last 4 check-ins plus the current one.

| Pattern | Trigger |
|---|---|
| Building instead of selling | `mvp_exists: true` and `user_contacts: 0` for ≥3 consecutive check-ins |
| Polishing without users | No launch file; plan fully checked ≥2 check-ins ago; commits continue |
| New-idea itch | New sibling project or ideation file within 14 days while the plan is incomplete |
| Appetite overrun | Days since plan created > pitch appetite, plan incomplete |
| Repeat miss | The same commitment not done in ≥2 check-ins |
| Low energy | `energy ≤ 2` in this and the previous check-in |

A week is **missed** when fewer than half of its commitments were done.

## Escalations

| Condition | Recommendation |
|---|---|
| 3 consecutive missed weeks | `product:triage` (possibly the wrong project) or halve commitment size |
| Energy ≤2 for 2+ weeks | Reduce scope or take a deliberate break — never "push harder" |
| Kill criterion tripped | `product:pmf` if live with users, otherwise `product:triage` |

## Output structure

`docs/checkins/YYYY-MM-DD-checkin.md`:

```markdown
---
type: checkin
product: [Product Name]
tier: [lite|pro]
status: complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:checkin
commitments_total: [N]
commitments_done: [N]
missed_week: [true|false]
missed_streak: [N]
one_number_metric: [name]
one_number_value: [value]
energy: [1-5]
user_contacts: [N]
hours_build: [N or blank in lite]
hours_distribution: [N or blank in lite]
hours_admin: [N or blank in lite]
mvp_exists: [true|false]
plan_tasks_done: [N or blank]
plan_tasks_total: [N or blank]
related:
  previous: docs/checkins/YYYY-MM-DD-checkin.md
  plan: docs/specs/YYYY-MM-DD-[slug]-plan.md
  triage: [path]
---

# Check-in — [YYYY-MM-DD]

## Last Week's Commitments

| # | Commitment | Result | Evidence / what got in the way |
|---|---|---|---|
| 1 | | done / partial / not done | |

## What Moved

- [Shipped / users contacted / signups / revenue — with evidence]

## One Number

**[Metric]:** [value] ([↑/↓/→] vs [last value])

## Time Split

[pro — lite: [deferred]]
Build [N] h · Distribution & users [N] h · Admin & learning [N] h

## Energy

[N]/5 — [one line]

## Patterns

[pro — lite: [deferred]]
- **[Pattern]** — [count and blunt statement]. Founder's read: [answer]

## Kill Criteria

[pro — lite: [deferred]]
- [Criterion] from [file] — due [date] — [tripped / not tripped / not yet due]

## Next Week's Commitments

1. [ ] [Specific, verifiable commitment]
2. [ ] [...]
3. [ ] [...]

## Escalation

[None — or the escalation, its trigger, and the recommended skill. Founder signals quoted here.]
```

## Exit condition

You can answer: "What exactly will I have done by next check-in, and how will I prove it?" If a commitment can't be proven done or not done, the check-in isn't finished.

## AI review prompt

1. Were last week's results based on evidence (commits, messages, numbers), or on the founder's recollection?
2. Are next week's commitments verifiable, and is one of them user-facing once an MVP exists?
3. Was a pattern softened or skipped because the founder seemed discouraged?
4. Does the escalation follow the rules, or was it negotiated away?
5. Are the frontmatter metrics filled so next week's pattern detection works?

## Checklist

- [ ] Every previous commitment has a result and evidence
- [ ] One number recorded with trend (or defined for the first time)
- [ ] Energy recorded
- [ ] Max 3 next commitments, each verifiable; ≥1 user-facing if MVP exists
- [ ] Patterns checked against the last 4 check-ins (pro)
- [ ] Kill criteria due were checked (pro)
- [ ] Escalation stated when a trigger fired
- [ ] Frontmatter metrics complete
