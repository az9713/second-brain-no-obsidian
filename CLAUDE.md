# CLAUDE.md - AI Research Second Brain

You are maintaining a local Markdown second brain rooted at this folder.

## Core Model

- `raw/` is the append-mostly evidence layer.
- `wiki/` is the synthesized, cross-linked knowledge layer.
- `outputs/` stores generated briefs, memos, reports, and other artifacts.
- `wiki/index.md` is the first navigation point for queries.
- `wiki/log.md` is the append-only maintenance log.
- `wiki/processed.md` and `wiki/source_manifest.jsonl` track source processing.

## Operating Rules

1. Preserve raw sources. Do not delete or rewrite files in `raw/` unless the user explicitly approves.
2. Default to capture-only. Save new sources to `raw/`; update the wiki only during `/dream-sequence` or when the user says `process now`.
3. Query through `wiki/index.md` first, then relevant wiki pages, then raw files only when verification or detail is needed.
4. Separate source-backed facts from interpretation, recommendations, and local operating policy.
5. Important durable claims must link back to a source page or raw file.
6. Record contradictions instead of smoothing them away.
7. Run lint as a first-class part of dream sequence: contradictions, stale claims, duplicates, orphans, broken links, missing provenance, and retrieval defects.
8. Append meaningful maintenance work to `wiki/log.md`.
9. Do not merge or delete wiki pages without explicit user approval unless the user directly requested that action.
10. Do not change this `CLAUDE.md` without user approval.

## Natural Language Triggers

- If the user says `capture <path>`, `import <path>`, `save this folder`, or `add this folder to my second brain`, use `.claude/skills/second-brain-capture-folder/SKILL.md`.
- If the user says `save this`, `capture this`, or `add this source`, use `.claude/skills/second-brain-capture-source/SKILL.md`.
- If the user says `run dream sequence`, `dream sequence`, or `/dream-sequence`, use `.claude/skills/second-brain-dream-sequence/SKILL.md`.
- If the user asks to schedule dream sequence, use `.claude/skills/second-brain-schedule-dream-sequence/SKILL.md`.

## Workflows

- Use `.claude/skills/second-brain-capture-source/SKILL.md` for capture-only source intake.
- Use `.claude/skills/second-brain-capture-folder/SKILL.md` for capture-only external folder intake.
- Use `.claude/skills/second-brain-process-source/SKILL.md` for immediate source processing.
- Use `.claude/skills/second-brain-dream-sequence/SKILL.md` for the full seven-phase maintenance loop.
- Use `.claude/skills/second-brain-schedule-dream-sequence/SKILL.md` for scheduled maintenance setup.
- Use `.claude/skills/second-brain-query-wiki/SKILL.md` for answering from the second brain.
- Use `.claude/skills/second-brain-create-output/SKILL.md` for producing artifacts from the wiki.
