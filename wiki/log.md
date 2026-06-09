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

