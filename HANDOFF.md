# HANDOFF — resume point for second-brain KB

**Read this first each new session.** Live "what to do next"; standing conventions are in the toolkit's skills (`C:/Users/simon/second-brain/.claude/skills/`). Don't re-derive state — run the checker (below) and trust it.

## Current state (as of 2026-07-27)

- The full 2026-07-27 audit is implemented — all 17 findings closed. Details: `outputs/memos/2026-07-27-audit-implementation-report.md`; the audit itself: `second-brain-audit-2026-07-27.html` (repo root). KB commit `ed7470f`+ pushed to `github.com/az9713/second-brain-no-obsidian`; toolkit is now its own git repo pushed to private `github.com/az9713/second-brain`.
- Key new machinery: deterministic invariant checker `python C:/Users/simon/second-brain/scripts/check-invariants.py` (phase 0 of every dream run, read-only, exit 1 on violation); raw/ write-guard hook (`.claude/settings.json`); weekly scheduled task `Claude-Dream-Sequence` (Mon 16:45, logged-on only, log: `.ignore/dream-sequence-task.log`); evidence tiers on all source/concept pages; `Review by:` dates in `stale-claims.md` are machine-enforced (next: 2026-08-03 market, 2026-08-26 capability).
- 14 `.vtt` transcripts registered `unprocessed` (run `20260727-audit-vtt-registration`) — the next dream run folds them. The 2026-07-27 16:45 scheduled run was expected to do this: **check whether it ran** (log above + newest `outputs/briefs/`); if it didn't fire, run the dream sequence manually or wait for Monday.

## Next task — the "optional upgrades" (user-approved 2026-07-27)

1. **Re-ground the 9 `generated-summary` source pages from real transcripts.** The clean transcripts now resolve at `raw/today_MMDDYYYY_brain_dump/today_06082026/video_sources/<id>/transcript.clean.txt` (manifest has exact paths). For each of the 9 pages tiered `generated-summary` (list: grep `Evidence tier: generated-summary` in `wiki/sources/`): re-read claims against the transcript, correct any summary-induced drift, upgrade tier to `transcript` where the page now rests on the transcript, then re-run the tier propagation into concept pages (weakest-tier rule; 9 concepts currently inherit `generated-summary`). Note: `semianalysis-quadruped-market` re-grounds from the HTML article snapshot (→ `primary`), and `gpt55-jay-analysis` stays `generated-summary` (the summary IS the source). Acceptance: checker green + tiers updated consistently on sources and concepts.
2. **OS-level raw/ write guard.** Current hook covers Write/Edit/NotebookEdit only; Bash redirects can still write under `raw/` → `C:\Users\simon\Downloads\projects`. Decide and implement the cheapest real guard (options compared in the audit: NTFS deny-write ACL for the agent context vs extending the hook to Bash). Don't break the user's own normal write access to their projects tree.
3. **Coverage pass.** List top ~10 most recently modified folders under `raw/` that have no manifest records; present as capture candidates (per `docs/two-brain-boundary.md` routing rule — wiki registration is opt-in curation, cerebras brain is the default landing zone). Recommend, don't auto-register.

If the user asks for something else, that takes precedence.

## Where to read things

- `wiki/lint.md` — integrity state (includes folded broken-links/orphans/duplicates trackers).
- `wiki/stale-claims.md` — claim verdicts + machine-checked review dates.
- `docs/two-brain-boundary.md` — wiki vs cerebras-brain routing/tiebreaker policy.
- Dream-sequence skill (`C:/Users/simon/second-brain/.claude/skills/second-brain-dream-sequence/SKILL.md`) — the 7-phase loop + phase-0 checker contract + UTF-8 safety rule.

## Session-transient scratch (already deleted; durable outputs are committed)

One-off Python scripts (provenance relink w/ SHA-256 verify, evidence-tier inserter, .vtt registrar) ran from the session scratchpad and were deleted after use — their effects are fully committed in `ed7470f`. Regenerate similar scripts from the manifest JSONL if ever needed; the checker validates the result.

## How to work

- Phase 0 always: run the checker before and after any wiki-touching work; never fold on a failing ledger.
- Writes: harness Write/Edit tools, or `[IO.File]` BOM-less UTF-8 — never PS5.1 `Set-Content`/`Out-File` defaults.
- Never write under `raw/` (hook enforces the file tools; be careful with Bash).
- Toolkit edits: commit + push in `C:/Users/simon/second-brain` (it's a repo now); stamp dream reports with its hash.
