# Dream Sequence - graphify_obsidian_chase_ai

## Run Metadata

- Date: 2026-06-08
- Source batch: `raw/graphify_obsidian_chase_ai`
- Mode: linked raw processing; raw files preserved in place

## What Changed

- Processed 2 registered files:
  - `raw/graphify_obsidian_chase_ai/transcript.txt`
  - `raw/graphify_obsidian_chase_ai/gpt5.5_summary.txt`
- Created 1 source page:
  - `wiki/sources/2026-06-08-chase-ai-graphify-obsidian.md`
- Created 1 concept page:
  - `wiki/concepts/semantic-graph-import.md`
- Updated 3 existing concept pages:
  - `wiki/concepts/llm-maintained-wiki.md`
  - `wiki/concepts/second-brain-operating-model.md`
  - `wiki/concepts/capture-vs-processing.md`

## Main Synthesis

The batch adds a new operating pattern: use Graphify-like semantic extraction to create a concept map from a repo or document corpus, then import that map into a Markdown/Obsidian environment only after source wiring and quarantine. This strengthens the vault's existing distinction between raw capture and deliberate processing.

The local rule implied by the source is conservative: Graphify output should not be treated as durable wiki truth just because it is Markdown. It should be quarantined, linked back to source documents, and then folded into `wiki/concepts/` through dream sequence or explicit processing.

## Lint Results

- Broken links: 0 in newly touched pages after local link check.
- Contradictions: 0 new factual contradictions.
- Duplicates: 0; `semantic-graph-import` checked against `llm-maintained-wiki` and `second-brain-operating-model`, kept distinct.
- Orphans: 0; the new source and concept pages are linked from `index.md`.
- Stale claims: 1 product/workflow watch-item added for Graphify/Obsidian export behavior.
- Missing provenance: 0; source claims are routed through the Chase AI source page and limitations are stated.

## Deferred

- Decide whether future Graphify exports should use a standard `graph-imports/` quarantine folder.
- Verify current Graphify command behavior before running a real repo import.

## Files Updated

- `wiki/index.md`
- `wiki/processed.md`
- `wiki/source_manifest.jsonl`
- `wiki/lint.md`
- `wiki/stale-claims.md`
- `wiki/duplicate-candidates.md`
- `wiki/orphaned-pages.md`
- `wiki/broken-links.md`
- `wiki/open-threads.md`
- `wiki/log.md`
