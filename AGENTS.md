# AGENTS.md - AI Research Second Brain

This repository is a local Markdown second brain.

Root:

```text
<second-brain-root>
```

## Agent Routing

When an agent is started in this folder, treat this repository as the active second brain.

- Save raw source captures under `raw/`.
- Use `raw/inbox/` when the source type is unclear.
- Use `raw/transcripts/` for transcripts.
- Use `raw/notes/` for analysis notes and rough captures.
- Start wiki queries from `wiki/index.md`.
- Update wiki pages only during `/dream-sequence` or when the user says `process now`.
- Preserve raw sources; do not delete or rewrite them without explicit approval.
- Keep source-backed facts separate from interpretation and local recommendations.

## Natural Language Triggers

- `capture <path>`, `import <path>`, `save this folder`, or `add this folder to my second brain`: run the capture-folder workflow.
- `save this`, `capture this`, or `add this source`: run the capture-source workflow.
- `run dream sequence`, `dream sequence`, or `/dream-sequence`: run the seven-phase dream sequence.
- `schedule dream sequence`: use the scheduling workflow and ask before enabling autonomous writes.

## Main Files

- `CLAUDE.md`: concise operating manual.
- `wiki/index.md`: query entrypoint.
- `wiki/processed.md`: human-readable processed registry.
- `wiki/source_manifest.jsonl`: machine-readable source registry.
- `wiki/lint.md`: current lint state.
- `.claude/skills/second-brain-capture-folder/SKILL.md`: external folder intake skill.
- `.claude/skills/second-brain-dream-sequence/SKILL.md`: full maintenance skill.
- `.claude/skills/second-brain-schedule-dream-sequence/SKILL.md`: scheduled maintenance skill.

## Default Workflow

1. Capture sources into `raw/`.
2. Process sources only on explicit request or during `/dream-sequence`.
3. During dream sequence, run:
   - raw ingestion
   - wiki folding
   - lint sequence
   - index repair
   - processed registry update
   - log update
   - dream report
4. Write dream-sequence reports to `outputs/briefs/`.

## External Folder Intake

For a folder such as `<external-source-folder>`, the user should only need to say:

```text
capture <external-source-folder>
```

Capture the folder as a batch under:

```text
raw/inbox/YYYY-MM-DD-folder-name/
```

Use `scripts/capture-folder.ps1` when available. Do not synthesize the wiki until dream sequence.
