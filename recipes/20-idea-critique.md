---
id: 20-idea-critique
phase: challenge
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[idea-slug]-critique.md
skill: product:critique
---

# Recipe: Idea Critique (Red Team)

## When to use

Use this when someone asks "is this idea any good?" — before investing weeks. Run it on your own idea after `product:discover`, or cold on an idea someone handed you.

Most ideas don't fail on execution. They fail because the problem is mild, the user is vague, the alternative is good enough, nobody pays, or nobody hears about it. Founders are structurally unable to see these in their own idea. This recipe replaces the co-founder who would have said so.

The output is a decision, not a vibe: **Pursue / Sharpen / Park / Kill**, with the one assumption most likely to kill the idea, the cheapest way to test it, and a dated point at which to stop.

## Inputs

- Warm: `docs/product/assumptions.md`, `docs/product/product-model.md` (seed), any `docs/research/*-synthesis.md`
- Cold: a description of the idea (text, brief, deck, chat transcript)
- Web search if available (see `docs/conventions.md` §7)

## Lite version (~15 min)

1. **Restate.** "[specific user] in [situation] struggles with [problem]; today they [workaround]; [product] does [core thing]." — Is this the idea?
2. **Research (light):** 3–5 searches — competitors, substitutes, pricing of alternatives, one community where the users talk.
3. **Name three real people who have this problem. What did each do about it last time?**
4. **What do they use instead today, and what would make them switch?**
5. **Who pays, how much, from which budget?**
6. **How do the first 100 users hear about this — which place or person?**
7. **Why now, and why you?**
8. **Pre-mortem:** It's 12 months later and this failed. Three most likely reasons?

Score 7 lenses: Problem reality, User specificity, Why now, Why you, Alternatives & switching cost, Willingness to pay, Distribution. Then verdict.

## Pro version (~30–40 min)

Lite 1–8, with full research (competitors direct and indirect, substitutes, prior failed attempts and post-mortems, pricing pages, community threads, search/demand signals), then:

9. **How much can you realistically build in your available hours, and does the core thing fit?**
10. **What stops an incumbent or a model provider from shipping this as a feature?**
11. **What data or trust does the user hand over, and what goes wrong if you mishandle it?**
12. **What does one user cost you to serve (infra, AI/API calls, support), against a plausible price?**
13. **Steelman:** the strongest honest case for pursuing it.
14. **Risk re-rating (warm):** independent rating of each assumption row; disagreements confirmed per row.

Score all 11 lenses, then verdict.

## Lens scoring

| Score | Meaning |
|---|---|
| `fatal` | If true, no execution fixes it. One fatal lens is enough for Kill unless the reframe removes it (→ Sharpen). |
| `serious` | Likely to kill it unless tested and resolved early. Becomes a high-risk assumption. |
| `fixable` | Real weakness with a known remedy that fits the founder's capacity. |
| `fine` | Evidence (not hope) says this is not the problem. |

## The four verdicts

| Verdict | Use when | Must state |
|---|---|---|
| **Pursue** | No fatal lens; serious lenses are testable cheaply | The test to run next |
| **Sharpen** | Promising only with a narrower user, different problem, or different model | The reframe, in one sentence |
| **Park** | Plausible but wrong time, wrong founder capacity, or blocked | What would have to change to revisit |
| **Kill** | A fatal lens with no credible reframe | The fatal flaw |

## Output structure

`docs/specs/YYYY-MM-DD-[idea-slug]-critique.md`:

```markdown
---
type: idea-critique
product: [Product or working name]
mode: warm | cold
tier: lite | pro
research: web | checklist-only
verdict: pursue | sharpen | park | kill
kill_criterion: "[observable that means stop]"
kill_date: YYYY-MM-DD
status: complete
created: YYYY-MM-DD
updated: YYYY-MM-DD
skill: product:critique
related:
  assumptions: docs/product/assumptions.md
  prior_critique: docs/specs/YYYY-MM-DD-[slug]-critique.md
---

# Critique: [Idea name]

## The idea (restated)
[specific user] in [situation] struggles with [problem]; today they [workaround]; [product] does [core thing].
Unfilled or vague slots: [list, or "none"]

## Verdict
**[PURSUE | SHARPEN | PARK | KILL]** — [the one reason that decided it]
[Sharpen: the reframe] [Park: what would change it] [Kill: the fatal flaw] [Pursue: the test]

## Riskiest assumption, cheapest test, kill criterion
- **Riskiest assumption:** [falsifiable statement] ([assumption ID if warm])
- **Cheapest test:** [method] — [audience] — [≤ N days] — success = [threshold]
- **Kill criterion:** If [observable] by [YYYY-MM-DD], stop.

## Research findings
[Each bullet labeled [sourced: url, accessed YYYY-MM-DD] / [estimate: method] / [founder-stated]]

### Competitive landscape
| Alternative | Kind (direct / substitute / do-nothing) | Price | Why users pick it | Weakness | Source |
|---|---|---|---|---|---|

### Prior attempts
[Who tried, what happened, why — sourced. Or: "none found — interpretation: …"]

### Research checklist (only if research: checklist-only)
| Query / page | What it would decide |
|---|---|

## Lens scorecard
| Lens | Score | Reasoning | Evidence label |
|---|---|---|---|
| Problem reality | | | |
| User specificity | | | |
| Why now | | | |
| Why you | | | |
| Alternatives & switching cost | | | |
| Willingness to pay | | | |
| Distribution | | | |
| Build scope vs capacity (pro) | | | |
| Platform / commoditization (pro) | | | |
| Trust, legal, data (pro) | | | |
| Unit economics sanity (pro) | | | |

Fatal: [N] · Serious: [N] · Fixable: [N] · Fine: [N]

## Pre-mortem
**Founder's reasons:** 1. … 2. … 3. …
**Critic's reasons:** 1. … 2. … 3. …

## Steelman (pro)
[3–5 sentences]

## Risk re-rating (warm, pro)
| ID | Assumption | Founder | Critic | Reason | Outcome (changed / kept) |
|---|---|---|---|---|---|

## Assumptions added (warm)
[IDs and one-line text of rows appended with Source: critique, or "none"]

## Questions only the originator can answer
[If the idea was handed over: what the framing is missing]

## Sources
[Numbered list of URLs with access dates]
```

## Exit condition

The critique is done when a stranger reading only the Verdict and Riskiest-assumption sections knows what to do next, by when, and at what point to walk away.

## AI review prompt

1. Did the critique open with praise or soften any score after the founder pushed back? If so, re-score from evidence.
2. Are there at least 3 serious/fatal findings — or an explicit, reasoned statement that fewer exist?
3. Is every number, competitor, and quote labeled? Is any of it plausibly invented?
4. Does the verdict follow from the scorecard (e.g. a fatal lens with a Pursue verdict needs an explanation)?
5. Is the cheapest test actually cheap (days, not weeks), and is the kill criterion observable and dated?
6. Is Distribution scored on a concrete answer, or on "social media / SEO / word of mouth"?

## Checklist

- [ ] Idea restated in the one-sentence form and confirmed
- [ ] Research done with labeled claims, or checklist emitted with "no web access" stated
- [ ] All tier lenses scored with reasoning
- [ ] ≥3 serious/fatal weaknesses, or explicit reasoned statement otherwise
- [ ] Pre-mortem includes the critic's own reasons
- [ ] Verdict from the fixed set with its required statement
- [ ] Riskiest assumption, cheapest test, and dated kill criterion present
- [ ] Warm: new rows appended with next free IDs; risk changes confirmed per row; disagreements recorded
