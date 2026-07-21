# Dream Sequence Report - 2026-07-21

## Summary

- New raw files processed: 0 new content; 3 previously processed files reconciled in the registry (herk subagents batch).
- Wiki pages created: 0.
- Wiki pages updated: `index.md`, `processed.md`, `lint.md`, `stale-claims.md`, `broken-links.md`, `log.md`, `source_manifest.jsonl`.
- Lint findings: 0 broken wiki links; 2 index omissions repaired; 28 raw provenance paths no longer resolve; both stale-claim review windows overdue.
- Deferred actions: stale-claim re-verification (needs web checks); decision on dead today_06082026 provenance.

## Raw Ingestion

| Raw file | Status | Notes |
|---|---|---|
| `raw/_CORE/_claude_code/claude_subagents_herk__GOOD_ONE/` (3 files) | reconciled as processed | Wiki pages were created 2026-06-09 (`sources/2026-06-09-nate-herk-claude-subagents.md`, `concepts/subagent-orchestration.md`) but the manifest still said `unprocessed`. Superseding processed records appended; the accidental double registration (runs `063425` and `064602`) deduped. |
| `raw/today_06082026/` (26 records) | MISSING | Folder was moved or deleted from the projects tree after the 2026-06-08 processing. Wiki knowledge remains valid; provenance links are dead. |
| `raw/inbox/2026-06-08-draft-review-kit-every/` (2 records) | moved to local archive | Content exists only in `raw.archive-20260608-184049/` (gitignored, local-only). |
| `raw/graphify_obsidian_chase_ai/` (2 files) | resolves, processed | No action. |

## Wiki Folding

No new folding — no unprocessed content existed; the herk batch had already been folded on 2026-06-09.

## Lint Sequence

- Contradictions: 0 new.
- Stale claims: OVERDUE — 7-day market claims were due 2026-06-15; 30-day model-capability claims were due 2026-07-08. Flagged in `stale-claims.md`; treat those claims as 2026-06-08 snapshots until re-verified.
- Duplicate candidates: 0 new.
- Orphaned pages: 0 by inbound-link check; 2 pages were absent from `index.md` (repaired).
- Broken links: 0 across all 40 wiki pages (scripted check).
- Missing provenance: 28 manifest paths no longer resolve (see Raw Ingestion). Recorded, not resolved, per policy.
- Retrieval defects: `.vtt` subtitle transcripts were being skipped at capture (`unknown_extension`); the capture script allowlist now includes `.vtt`/`.srt` for future captures. Encoding defects (UTF-8 BOMs in 9 files, mojibake dashes) repaired this run.

## Index Repair

- Added "Claude Code Practice (2026-06-09 batch)" section with [Subagent Orchestration](../../wiki/concepts/subagent-orchestration.md).
- Added the Nate Herk source page to Sources.
- Added a query starting point for "When and how should I use Claude Code subagents?"

## Registries

- `wiki/processed.md`: added the herk batch row with reconciliation note.
- `wiki/source_manifest.jsonl`: appended 3 superseding processed records (BOM also stripped; file validates as JSONL).

## Recommended Next Actions

1. **Decide on dead provenance** — either annotate the 13 today_06082026-derived source pages as "raw no longer available" or restore/re-register the folder if it still exists somewhere.
2. **Re-verify overdue stale claims** — a short web pass over the market/capability claims from 2026-06-08; several (Microsoft/OpenAI, Meta layoffs, AI-capex positioning) have likely moved in 6 weeks.
3. **Schedule this loop** — this run happened only because of a manual audit. A weekly scheduled dream sequence (the `schedule-dream-sequence` skill exists) prevents another 6-week sleep.
4. **Version the toolkit** — `C:\Users\simon\second-brain` (skills, commands, capture script) is not a git repo; today's script/command fixes are unversioned there.
