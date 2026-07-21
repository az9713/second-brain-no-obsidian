# Knowledge Base Log

## 2026-06-08 - scaffold and initial seed

- Created local second-brain scaffold at `<second-brain-root>`.
- Initialized Git for rollback.
- Added raw seed source: `raw/transcripts/2026-06-08-jay-second-brain-transcript.md`.
- Added raw seed source: `raw/notes/2026-06-08-gpt55-jay-second-brain-analysis.md`.
- Created source pages for Jay's transcript and GPT 5.5's analysis.
- Created initial concept pages for the LLM-maintained wiki, dream sequence, lint, capture policy, and operating model.
- Added first-class lint files and initial dream-sequence report.

## 2026-06-08 - automation upgrade

- Added `AGENTS.md` natural-language trigger routing for Codex-style agents.
- Added `/capture-folder` command and `.claude/skills/second-brain-capture-folder/SKILL.md` runbook.
- Added `scripts/capture-folder.ps1` to copy external source folders into `raw/inbox/YYYY-MM-DD-folder-name/` without manual copying.
- Updated `/dream-sequence` to explicitly process captured batches from `raw/inbox/`.
- Added `/schedule-dream-sequence` command and scheduling runbook.
- Updated `README.md`, `CLAUDE.md`, and `AGENTS.md` so normal use can be reduced to `capture <path>` and `run dream sequence`.

## 2026-06-08 - scoped skill directories

- Moved second-brain skills from loose `.claude/skills/*.md` files into scoped skill directories.
- New pattern: `.claude/skills/second-brain-*/SKILL.md`.
- Updated command wrappers and root instructions to reference the scoped skill paths.

## 2026-06-08 - documentation

- Added `docs/index.md`.
- Added `docs/second-brain-architecture-and-usage.md`.
- Documented architecture, components, usage, Jay transcript comparison, differences, and remaining gaps.
- Linked the guide from `README.md`.

## 2026-06-08 - split global toolkit from knowledge base

- Moved reusable operating files out of the knowledge base.
- Knowledge base remains at `<knowledge-base-root>`.
- Global toolkit now lives at `<global-toolkit-root>`.
- Claude-discoverable skill and command copies are installed under `<claude-config-root>`.
- Skills resolve `SECOND_BRAIN_ROOT` first, then default to `<knowledge-base-root>`.
- Knowledge-base docs were updated to describe the data-plane/control-plane split.

## 2026-06-08 - capture-folder

- Captured external folder: `<external-source-folder>`
- Destination batch: `raw/inbox/2026-06-08-draft-review-kit-every`
- Contents: Katie Parrott "draft review kit" Every article (`raw_text.txt`) plus companion repo `draft-review-kit-main` (reviewer skills).
- Files captured: 23
- Status: capture-only; wiki synthesis deferred until dream sequence.

## 2026-06-08 - dream sequence (draft-review-kit batch)

- Processed captured batch `raw/inbox/2026-06-08-draft-review-kit-every/` (article + repo); raw files retained in inbox.
- Created source pages: `wiki/sources/2026-06-08-katie-parrott-draft-review-kit-every.md`, `wiki/sources/2026-06-08-draft-review-kit-repo.md`.
- Created concept pages: `wiki/concepts/review-skills.md`, `wiki/concepts/ai-writing-tells.md`, `wiki/concepts/reviewer-orchestration.md`, `wiki/concepts/after-automation.md`.
- Updated `wiki/index.md` (new "AI-Assisted Writing" section + 3 query starting points), `wiki/processed.md`, `wiki/source_manifest.jsonl`.
- Lint: 0 broken links (32 checked), 0 new contradictions (tensions recorded in concept pages), 0 duplicates/orphans, 2 stale-claim watch-items added.
- Wrote dream report: `outputs/briefs/2026-06-08-dream-sequence.md`.


## 2026-06-08 - capture-folder

- Registered linked raw source: 
aw/today_06082026
- Source label: today_06082026
- Registration run: 20260608-193548-today-06082026
- Note: original auto-generated entry had corrupted PowerShell-template values ($sourceName, $runId, aw/); corrected during the today_06082026 dream sequence as a provenance-integrity fix.
- Mode: linked_raw_register_text_like
- Files scanned: 41
- Files registered: 26
- Files skipped: 15
- Files copied: 0
- Max file size: 2097152 bytes
- Status: registered only; wiki synthesis deferred until dream sequence.


## 2026-06-08 - dream sequence (today_06082026 batch)

- Processed linked source `raw/today_06082026/` (26 registered files); raw left untouched in the user's projects folder.
- Created 8 source pages: SemiAnalysis quadruped, Diamandis roundtable, Isenberg/Tabah AI-native, A Year of Claude Code, Nate Jones AI layoffs, All-In/Arora cybersecurity, Kantrowitz Apple WWDC, a16z/Benedict Evans coding.
- Created 5 concept pages (each grounded in 2+ sources): `ai-stack-value-migration`, `ai-native-organization`, `verification-as-bottleneck`, `layoffs-as-strategy-signals`, `ai-capex-and-market-volatility`.
- Updated `index.md` (new "AI Market & Operating Shifts" section + 8 sources + 5 query starting points), `processed.md` (8 rows), `source_manifest.jsonl` (26 records marked processed programmatically with per-file pages_touched).
- Lint: 0 broken links (76 checked; 1 typo fixed mid-run), 1 new cross-source contradiction recorded (context-layer vs context-minimalism, C-2026-06-08-002, reconciliation proposed/unconfirmed), 0 duplicates (3 pairs checked, kept distinct), 0 orphans, 12 stale-claim watch-items (forecast-dense batch).
- Provenance: source pages synthesize generated second-order summaries of auto-caption transcripts; flagged on each page; transcripts not published in this snapshot.
- Corrected the corrupted prior capture-folder log entry as a provenance-integrity fix (noted above).
- Wrote dream report: `outputs/briefs/2026-06-08-dream-sequence-today-06082026.md`.

## 2026-06-08 - capture-folder

- Registered linked raw source: `raw/graphify_obsidian_chase_ai`
- Source label: `graphify_obsidian_chase_ai`
- Registration run: `20260608-213340-graphify-obsidian-chase-ai`
- Mode: linked_raw_register_text_like
- Files scanned: 2
- Files registered: 2
- Files skipped: 0
- Directories pruned: 0
- Files copied: 0
- Max file size: 2097152 bytes
- Status: registered only; wiki synthesis deferred until dream sequence.

## 2026-06-08 - dream-sequence

- Processed linked raw source: `raw/graphify_obsidian_chase_ai`
- Registered files processed: 2 (`transcript.txt`, `gpt5.5_summary.txt`)
- Created source page: `wiki/sources/2026-06-08-chase-ai-graphify-obsidian.md`
- Created concept page: `wiki/concepts/semantic-graph-import.md`
- Updated concept pages: `llm-maintained-wiki`, `second-brain-operating-model`, `capture-vs-processing`
- Updated maintenance files: `index.md`, `processed.md`, `source_manifest.jsonl`, lint state files, `open-threads.md`
- Lint: 0 broken links, 0 new contradictions, 0 duplicate pages, 0 orphaned pages, 1 stale/product-workflow watch-item
- Provenance: video transcript and generated summary claims treated as source claims; Graphify behavior not independently reproduced.
- Wrote dream report: `outputs/briefs/2026-06-08-dream-sequence-graphify-obsidian.md`


## 2026-06-09 - capture-folder

- Registered linked raw source: `raw/_CORE/_claude_code/claude_subagents_herk__GOOD_ONE`
- Source label: `claude_subagents_herk__GOOD_ONE`
- Registration run: `20260609-063425-claude-subagents-herk-good-one`
- Mode: linked_raw_register_text_like
- Files scanned: 3
- Files registered: 3
- Files skipped: 0
- Directories pruned: 0
- Files copied: 0
- Max file size: 2097152 bytes
- Status: registered only; wiki synthesis deferred until dream sequence.

## 2026-06-09 - capture-folder

- Registered linked raw source: `raw/_CORE/_claude_code/claude_subagents_herk__GOOD_ONE`
- Source label: `claude_subagents_herk__GOOD_ONE`
- Registration run: `20260609-064602-claude-subagents-herk-good-one`
- Mode: linked_raw_register_text_like
- Files scanned: 3
- Files registered: 3
- Files skipped: 0
- Directories pruned: 0
- Files copied: 0
- Max file size: 2097152 bytes
- Status: registered only; wiki synthesis deferred until dream sequence.

## 2026-07-21 - dream-sequence

- Run type: reconciliation and integrity run (first run since 2026-06-08/09; ~6 weeks idle).
- Raw ingestion: no new registered sources; herk subagents batch (3 files) reconciled - wiki pages existed since 2026-06-09 but manifest was never marked processed. Superseding processed records appended; double registration (runs 063425/064602) deduped.
- Integrity check (new): `raw/today_06082026/` no longer resolves (26 records); `raw/inbox/2026-06-08-draft-review-kit-every/` paths now only in local archive (2 records). Recorded in lint.md; not resolved.
- Lint: 40 pages checked; 0 broken wiki links; 0 orphans by inbound links; 2 pages missing from index repaired (herk source, subagent-orchestration concept).
- Stale claims: both review windows flagged OVERDUE (due 2026-06-15 and 2026-07-08); not re-verified this run.
- Encoding: UTF-8 BOMs stripped from 9 wiki files; mojibake dashes fixed.
- Report: `outputs/briefs/2026-07-21-dream-sequence.md`.
