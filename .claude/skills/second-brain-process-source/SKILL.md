---
name: second-brain-process-source
description: Process a specific raw source into this second brain's wiki immediately.
---

# process-source

Use this workflow when the user says `process now` or asks to process a specific raw source immediately.

## Protocol

1. Read the raw source.
2. Create or update a source page under `wiki/sources/`.
3. Extract durable concepts, entities, claims, contradictions, and open questions.
4. Create or update relevant concept pages under `wiki/concepts/`.
5. Keep source-backed facts separate from interpretation.
6. Update `wiki/index.md`.
7. Update `wiki/processed.md` and `wiki/source_manifest.jsonl`.
8. Append an entry to `wiki/log.md`.

## Safety

Do not delete raw files. Do not merge or delete wiki pages without user approval.
