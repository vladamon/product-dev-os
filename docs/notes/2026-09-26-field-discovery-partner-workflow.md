# Decision — field discovery workflow for a non-coding partner

**Date:** 2026-09-26
**Status:** decided; step 0 documented, steps 1–2 deferred
**Guide:** `docs/guides/field-discovery-setup-guide.pdf` (source: `field-discovery-setup-guide.html`, regeneration command in its header comment)
**Shared doc:** https://claude.ai/code/artifact/50d4775e-01c2-4acb-b572-977555208ae7 (short version of the guide)

## The question

A business-side partner (engineer by training, doesn't code much) wants to run discovery interviews with small businesses in his network. Handing him `product:field` as-is felt cumbersome: a voice tool running in the background, pasting each answer into Claude, getting the next question back. Should SpecSmith grow a lightweight interview module (session management, recording, transcription, model calls), possibly on the OpenAI API, or connected to his local Claude Code via MCP?

## Decision

No new app. Use the existing `product:field` loop with off-the-shelf recording:

1. `prep` produces `card.md`; print it.
2. Record the conversation (phone voice memo, meeting-tool transcript, Granola).
3. Drop the transcript into `docs/intake/interviews/<engagement>/`, run `debrief` the same day.
4. `synthesize` every 3–5 sessions; follow the directive.

`live` (question-by-question copilot) stays available for video calls, not for in-person talks.

## Clarification recorded

"Static vs dynamic" was a misunderstanding. `product:field` adapts at two speeds:

- **Per question** — `live` mode: paste the participant's words, get signal + next probe + coverage in ≤3 lines.
- **Per session** — each debrief writes Unknowns and a resume card; the next `prep` regenerates the card around the gaps.

The card itself is a coverage map with "when you hear → say" follow-ups, not a script.

## Why not a SpecSmith module / OpenAI / MCP

- The value (30-rule doctrine, evidence ladder, verbatim quote audit) lives in the skill and needs a harness that reads recipes and writes files. Porting it to a raw API means rebuilding it worse. It also contradicts the 2026-04 decision to keep SpecSmith as a showcase only.
- The model isn't the bottleneck. Only speech-to-text benefits from another provider, and that's a commodity.
- MCP points the wrong way: it gives Claude tools to pull from; this needs events pushed into a session. The real bridges are `claude -p` (headless, on the user's own auth), the Agent SDK, or Claude Code channels (early; don't build on them yet).
- Reading a laptop during an in-person SMB interview costs rapport. Most value is in the card (before) and the debrief (after).
- The partner's bottleneck is the number of conversations, not tooling.

## Deferred, with triggers

| Step | Build | Trigger |
|---|---|---|
| 1 | `field-session` script in this repo: `ffmpeg` record → `whisper.cpp` or STT API → intake folder → `claude -p "/product:field debrief <file>"`. About a day. | Step 0 still painful after ~5 real interviews |
| 2 | Local page streaming STT, feeding a rolling transcript to `live` mode via `claude -p --resume` or the Agent SDK; glanceable on phone/tablet. | Partner shows he actually wants live prompts |

Both stay thin clients over `product:field`, never a reimplementation.
