---
id: 17-retrospective
phase: learning
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-retro.md
skill: product:reflect
---

# Recipe: Retrospective

## When to use

Use this after every shipped feature, without exception. This is the loop-closer. Without it, you are not learning from what you build — you are just shipping and moving on.

The retrospective forces one decision: what do you do next with this feature? You must choose one of: continue / improve / simplify / pivot / kill. No option to "keep building indefinitely" without re-scoping.

## Lite version (3 questions)

1. **What shipped?** One sentence — what is now in the product that wasn't before?
2. **Did it work?** What evidence do you have (observations, user reactions, metrics)?
3. **Decision:** Continue (it worked, build on it) / Improve (it works but has problems) / Simplify (too complex, cut it back) / Pivot (different approach needed) / Kill (doesn't work, remove it)?

Produce: What shipped + decision.

## Pro version (5 questions)

Ask lite questions 1–3, then:

4. **What problems did you find?** What didn't work as expected? What confused users?
5. **What is the next slice?** Given what you learned, what should you shape next?

Produce: Full retrospective with evidence, problem list, decision, and next slice definition.

## The five decisions

| Decision | Meaning |
|----------|---------|
| **Continue** | The feature worked as intended. Keep building in this direction. |
| **Improve** | The feature works but has specific problems. Fix them in the next slice. |
| **Simplify** | The feature is too complex. Identify what to cut in the next slice. |
| **Pivot** | The approach is wrong. Define a different approach in a new pitch. |
| **Kill** | The feature doesn't serve a real need. Remove it (or plan to). |

"Kill" feels harsh. It is. It's also the most valuable decision you can make — because it frees time for something better. A product that never kills features becomes a junkyard.

## Output structure

`docs/specs/YYYY-MM-DD-[feature]-retro.md`:

```markdown
---
type: retro
product: [Product Name]
feature: [Feature Name]
tier: [lite|pro]
status: complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:reflect
related:
  pitch: docs/specs/YYYY-MM-DD-[feature]-pitch.md
  build: docs/specs/YYYY-MM-DD-[feature]-build.md
---

# Retrospective: [Feature Name]

## What Shipped

[One sentence]

## What We Expected

[What did the shaped pitch predict?]

## What Happened

[What actually occurred — user behavior, metrics, feedback]

## Evidence

[Quantitative and qualitative evidence]

## Problems Found

[Issues discovered post-ship]

## Decision

**[Continue / Improve / Simplify / Pivot / Kill]**

[Rationale for the decision]

## Next Slice

[If continue/improve/simplify: what to shape next]
[If pivot: what different approach to try]
[If kill: what to remove and when]
```

## AI review prompt

1. Is the decision supported by the evidence, or is it wishful thinking?
2. If the decision is "continue" — is there actually evidence it worked, or just absence of evidence it failed?
3. If the decision is "kill" — is there a plan to remove it?
4. Is the next slice specific enough to be shaped immediately?

## Checklist

- [ ] What shipped is one specific sentence
- [ ] Evidence section has at least one data point (not just vibes)
- [ ] A decision is made — no "TBD" or "need more time to evaluate"
- [ ] If decision is not "kill," next slice is defined
