---
name: second-brain-dream-sequence
description: Run the seven-phase dream sequence for this second brain, including lint and reporting.
---

# dream-sequence

Use this workflow for the full seven-phase maintenance loop.

## Seven Phases

1. Raw ingestion: scan `raw/`, including captured batches under `raw/inbox/`, detect new or changed files, and extract source metadata.
2. Wiki folding: create or update source pages and concept pages while preserving provenance. Move nothing; raw files remain where captured.
3. Lint sequence: check contradictions, stale claims, duplicates, orphans, broken links, missing provenance, and retrieval defects.
4. Index repair: update `wiki/index.md` so important pages are discoverable.
5. Processed registry update: update `wiki/processed.md` and `wiki/source_manifest.jsonl`.
6. Log update: append to `wiki/log.md`.
7. Dream report: write `outputs/briefs/YYYY-MM-DD-dream-sequence.md`.

## Captured Batch Handling

When `raw/inbox/YYYY-MM-DD-folder-name/` contains a `capture_manifest.jsonl`, treat it as a source batch:

- Read the manifest first.
- Group related files into one or more source pages under `wiki/sources/`.
- Create or update concept pages as needed.
- Mark each processed captured file in `wiki/source_manifest.jsonl`.
- Leave the captured batch in `raw/inbox/`; do not reorganize it unless the user approves.

## Output Autonomy

Every dream sequence should produce `outputs/briefs/YYYY-MM-DD-dream-sequence.md` without asking for additional instructions.

If the new sources clearly imply an output that would help the user, recommend it in the dream report rather than creating extra artifacts automatically.

## Lint Files

Update these files as appropriate:

- `wiki/lint.md`
- `wiki/contradictions.md`
- `wiki/stale-claims.md`
- `wiki/duplicate-candidates.md`
- `wiki/orphaned-pages.md`
- `wiki/broken-links.md`

## Safety

- Do not delete raw sources.
- Do not silently resolve contradictions.
- Recommend merges/deletions instead of performing them unless approved.
- Keep source-backed claims separate from interpretation.
