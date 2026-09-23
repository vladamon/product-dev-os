# Decision — field discovery track from the Unified Discovery Doctrine

**Date:** 2026-09-23
**Status:** implemented (`product:field`, recipes 29 and 30, playbook 20)
**Sources:** `appendix/unified_discovery_doctrine.md` (30 rules, 9 anti-patterns, evidence ladder, 6 gaps), `appendix/canonical_discovery_harness_synthesis.md` (13-book synthesis), `appendix/book-summaries/`

## The gap

The OS assumed an idea already exists: `product:interview` tests assumptions on the map. Nothing covered the founder sitting with a client or a small business *before* any idea, trying to find out whether their operations hide something worth building — and interviewing properly while doing it.

## Decisions

1. **New skill, not an extension of `product:interview`.** Interview is assumption-first; field is operations-first. The artifacts differ (workflow instances, artifact registry, four forces, stakeholder map, opportunity tree). One evidence ladder is shared: recipe 21 now maps its strength labels to L0–L5.
2. **The founder runs the conversation; Claude runs everything around it.** The doctrine specifies an autonomous voice agent. Claude Code can't be that, and the founder learning the domain is itself a doctrine rule (DOC-RULE-29). So every rule got an enforcement point: prep (card), rehearse (practice + lint), live (copilot), debrief, synthesize. Recipe 30 §4 is the traceability table — a rule without an enforcement point is not implemented.
3. **Rule IDs kept verbatim** (`DOC-RULE-nn`, `AP-nn`, `GAP-n`) so artifacts cite the rule they applied or broke, and the appendix stays the reference.
4. **Provenance as IDs**, not a graph database: `S03.E07 → S03.O02 → OPP-4 → A12`. Quotes are re-verified verbatim against the raw file in every debrief and synthesis (GAP-4 guardrail).
5. **Two scopes.** `client` reaches `client-validated` (pilot or custom work); `segment` reaches `market-validated` (product). This makes DOC-RULE-09 enforceable for the consulting case, where the user talks to one client.
6. **Directives map onto OS commands.** `TEST_ASSUMPTION` hands off through `product:discover using <synthesis>`, and discover carries the evidence levels into the assumption map (`Source: field`).

## Where the implementation departs from the doctrine text — and why

| Doctrine | Implementation | Why |
|---|---|---|
| Ladder weights 0.0–1.0 drive "validation confidence" | Weights only rank; status promotions use participant counts and levels (recipe 30 §6) | A sum of LLM-assigned numbers looks precise and isn't. Counts are auditable. |
| DOC-RULE-09 "multiple independent interviews" (undefined) | `pattern` ≥2 participants (segment: ≥2 businesses); `market-validated` ≥3 businesses, ≥1 L4 in two, adversarial pass survived | Needed a testable threshold; 3 matches DOC-RULE-30's trigger. |
| DOC-RULE-28 example calls data access "L4 commitment"; ladder puts internal data access at L5 | Handing over real data files = L5; artifact *shown* (screenshare) = L4 | Resolves the inconsistency: surrendering the data is the scarce resource. |
| DOC-RULE-20 lists 4 directives; DOC-RULE-25 adds a 5th | 5 directives, one per artifact | Union of both rules. |
| GAP-1 voice state machine | Micro-sessions (`part: N`) + resume card per debrief | Same need (continuity across 5-minute calls) without a voice stack. |
| GAP-2 real-time multimodal protocol | Images in intake; `[read-from-image]` / `[uncertain]` tags; said-vs-visible check in debrief | Post-hoc, not real-time; the discrepancy probe survives. |
| GAP-4 real-time epistemic linter | Lint in rehearse/live (on founder questions) and in debrief/synthesis (on Claude's own output) | Linting runs where Claude actually produces text. |
| AP-04 "3 seconds of silence" | On the card as a founder behavior | Only a human can be silent in the room. |
| — (OS addition) | Paraphrased notes cap at L3; an artifact the founder confirms they saw is L4 | The founder's memory of a quote isn't the quote; debrief question 4 is the path to L4. |
| DOC-RULE-24 "extreme non-response" (undefined) | Flag at <10% replies after ≥20 contacts in one segment | Needed a testable threshold. |
| `HALT_INTERVIEWS_FOR_TECHNICAL_SPIKE` | Renamed `HALT_FOR_TECHNICAL_SPIKE` (original name noted in recipe 30 §7) | Shorter frontmatter value; same meaning. |
| DOC-RULE-21 steering vs. synthesis §1.3 "lock scope later" | Will-not-build areas noted-not-excavated from session 1; fit ranking only in synthesis after C1–C7 covered for ≥3 participants | Resolves the tension the synthesis itself names. |

## Fidelity review (2026-09-23)

An independent pass compared the implementation to the doctrine. Fixed: DOC-RULE-28 had been applied to all post-pitch items (now only praise/intent; post-pitch facts are excluded from validation per DOC-RULE-26); DOC-RULE-10/15/22 exceptions restored; switching pressure added to severity and status thresholds; risk-dimension minimums now tagged on bridge rows; `TEST_ASSUMPTION` requires the solution set (lite synthesis can't emit it); observation layer enforced in the pattern matrix; saturation defined (novelty count); typicality, job hierarchy, tech-curiosity tag, bounded pilot, card anchors added; lint field names unified; `demand` exception in live.

## What stays open

- Whether `live` is usable mid-call or only for chat/async interviews — decide from the first 3 real runs.
- The usage-log rule applies: after ~5 load-bearing runs, modes that stay mostly `N` (likely candidates: `rehearse`, `live`) are cut.
- The appendix is the source of the rulebook. Commit it (or move it to `docs/sources/`) so recipe 30's references resolve for anyone cloning the repo.
