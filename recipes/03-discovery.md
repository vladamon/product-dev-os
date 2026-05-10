---
id: 03-discovery
phase: discovery
tier-lite: false
tier-pro: true
produces: docs/product/assumptions.md (updated with evidence)
skill: product:discover
---

# Recipe: Customer Discovery

## When to use

Use this when you have real or potential users to talk to, and you want to validate (or invalidate) your assumptions before building.

This recipe is based on The Mom Test principle: do not ask people if your idea is good. Ask about their actual past behavior, current problems, and existing workarounds. Opinions about future hypotheticals are worthless. Past behavior is evidence.

**Lite tier:** This recipe is pro-only. For lite projects, skip to Opportunity Map (recipe 04) using whatever evidence you have.

## Inputs

- Assumption map (recipe 02)
- Access to potential users (even 3–5 conversations is enough)

## The Interview Structure

### What to ask

Focus on these question types:

**Situation questions (what is true now):**
- Tell me about the last time [situation] happened.
- How often does this come up?
- What did you do when it happened?
- What tools do you use for this?
- What's annoying about how you do it now?

**Consequence questions (what it costs them):**
- What happens if you don't solve this?
- How much time does this take?
- Have you paid to solve this? What did you try?

**Priority questions (how important it is):**
- Where does this fit in your list of problems?
- What would make this urgent?
- Who else is affected by this?

### What NOT to ask

These produce fake validation:
- Would you use this?
- Would you pay for this?
- Do you like this idea?
- Would AI help you here?
- What features would you want?

## Output structure

Update `docs/product/assumptions.md` with a new section:

```markdown
## Discovery Evidence

### Conversations

| Date | Person | Key insight | Assumption affected |
|------|--------|-------------|---------------------|
| | | | |

### Patterns Found

[What appeared in 2+ conversations]

### Assumptions Validated

[Assumptions that now have positive evidence]

### Assumptions Invalidated

[Assumptions that turned out to be false]

### New Assumptions Surfaced

[Things you didn't expect to find]
```

## Exit condition

After 3–5 conversations you have evidence for:
- Real pain (not just agreement that the problem exists)
- Repeated behavior (they already do something related)
- Current workaround (they solve it somehow today)
- Clear target user (you can name the specific person, not the category)
- Specific trigger moment (when the pain occurs)

If you cannot find these after 5 conversations, the idea is weak.

## AI review prompt

Review the discovery findings against:
1. Is the evidence based on past behavior, or on opinions about hypotheticals?
2. Is there a single clear pattern, or are different users describing different problems?
3. Was a current workaround identified? If not, is the problem real enough?
4. Did any conversation invalidate a core assumption? If so, is that reflected?

## Checklist

- [ ] At least 3 conversations completed
- [ ] Evidence is based on past behavior, not opinions
- [ ] A repeated pattern was found
- [ ] Current workaround is documented
- [ ] At least one assumption was either validated or invalidated
