---
id: 09-shaped-pitch
phase: design
tier-lite: true
tier-pro: true
produces: docs/specs/YYYY-MM-DD-[feature]-pitch.md
skill: product:shape
---

# Recipe: Shaped Pitch

## When to use

Use this before building any feature — always. This is the gate between "thinking about it" and "building it." The shaped pitch defines appetite, solution outline, what's explicitly in and out, risks, and done criteria.

Based on Ryan Singer's Shape Up (Basecamp). The key insight: instead of asking "how long will this take?", ask "how much time is this worth?" Appetite is a time budget, not an estimate. Working within appetite forces you to descope rather than overrun.

## Inputs

- Product model (so the pitch is grounded in the domain)
- Any context from `docs/intake/`, Linear issues, Slack threads, or specified files
- Journey maps if the feature touches a known journey

## Lite version (5 questions)

1. **What problem does this solve?** One sentence. What's happening today that shouldn't be?
2. **How much time is this worth?** Not an estimate — a maximum. Would you cut scope to ship in that time?
3. **What's the core solution?** Describe the approach in 2–3 sentences.
4. **What is explicitly excluded?** Name at least 3 things you won't build.
5. **How will you know it's done?** Name 3 specific, testable done criteria.

Produce: Problem + appetite + solution + no-gos + done criteria.

## Pro version (8 questions)

Ask lite questions 1–5, then:

6. **Walk me through how it works.** Step by step from the user's perspective.
7. **What could derail this?** Technical, UX, or dependency risks.
8. **Where could we overbuild?** What rabbit holes should we deliberately avoid?

Produce: Full pitch with all sections.

## Output structure

`docs/specs/YYYY-MM-DD-[feature]-pitch.md` — use `templates/shaped-pitch.md`.

Date prefix format: `2026-05-09-connection-library-pitch.md`

## Exit condition

You could hand this pitch to someone else and they could build the right thing without asking you to define scope. The no-gos are specific enough to reject scope creep. The done criteria are specific enough to pass/fail.

## AI review prompt

1. Is the appetite realistic given the solution? If the solution sounds like 6 months of work and the appetite is 1 week, one of them is wrong.
2. Are the no-gos specific enough to actually prevent scope creep? "No advanced features" is not a no-go. "No bulk import, no connection versioning, no secret rotation" is.
3. Are the done criteria verifiable? Each one should pass a yes/no test.
4. Are the rabbit holes things that would genuinely tempt the implementer? If not, they're not real rabbit holes.
5. Is the problem statement describing a situation, not a missing feature?

## Checklist

- [ ] Problem is a situation, not a missing feature
- [ ] Appetite is stated and would actually constrain scope
- [ ] Solution outline is rough enough to leave room for implementation decisions
- [ ] At least 3 specific no-gos are listed
- [ ] Risks are specific and actionable
- [ ] Done criteria are verifiable (yes/no tests, not vibes)
