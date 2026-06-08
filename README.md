# Second Brain, No Obsidian

A local Markdown second-brain scaffold inspired by Jay's YouTube walkthrough of a Claude Code-maintained knowledge base: capture raw sources, fold them into a wiki, lint the knowledge base, and write outputs without Obsidian, vector databases, or a RAG stack.

Jay's video: [Second Brain Setup](https://www.youtube.com/watch?v=K2BpNt3UBOQ&t=36s)

## Development journey

This project started as a transcript-grounded reconstruction of Jay's second-brain workflow. The transcript describes five building blocks: `raw/`, `wiki/`, `outputs/`, an operating manual, and a recurring "dream sequence" that keeps the knowledge base clean and up to date.

The first pass captured the broad architecture. The important correction came later: Jay's dream sequence is not just source ingestion and summarization. It includes a named lint sequence that checks contradictions, stale claims, duplicate pages, orphaned pages, and other retrieval-quality defects.

The implementation then hardened the idea into a reusable project scaffold:

- `CLAUDE.md` for Claude Code instructions.
- `AGENTS.md` for Codex-style and general agent routing.
- Scoped Claude skills under `.claude/skills/second-brain-*/SKILL.md`.
- Short command wrappers under `.claude/commands/`.
- A `raw/` evidence layer.
- A `wiki/` synthesis and lint layer.
- An `outputs/` artifact layer.
- A folder-capture helper script.
- Documentation that compares this implementation with Jay's transcript.

The grounding transcript and working analysis files are not included in this public snapshot. The wiki keeps source pages and summaries so the architecture remains understandable without shipping local working files.

## Architecture

```text
external sources
  |
  | capture <path>
  v
raw/
  |
  | run dream sequence
  v
wiki/
  |-- source pages
  |-- concept pages
  |-- index
  |-- processed registry
  |-- source manifest
  |-- lint state
  |
  | query / create output
  v
outputs/
```

## Repository layout

| Path | Purpose |
|---|---|
| `CLAUDE.md` | Claude Code operating manual. |
| `AGENTS.md` | Cross-agent routing and trigger instructions. |
| `.claude/skills/second-brain-*/SKILL.md` | Scoped skills for capture, processing, dream sequence, scheduling, queries, and output creation. |
| `.claude/commands/*.md` | Short command wrappers. |
| `raw/` | Append-mostly source capture layer. |
| `wiki/` | Synthesized source pages, concept pages, registries, log, and lint state. |
| `outputs/` | Generated briefs, memos, reports, and other artifacts. |
| `scripts/capture-folder.ps1` | Helper script for capture-only external folder intake. |
| `templates/` | Source, concept, and dream-report templates. |
| `docs/` | Architecture and usage documentation. |

## Minimal workflow

Start an agent in the repository root. Then use short commands:

```text
capture <external-source-folder>
run dream sequence
```

`capture <external-source-folder>` copies a source folder into `raw/inbox/YYYY-MM-DD-folder-name/` without wiki synthesis.

`run dream sequence` performs the seven-phase maintenance loop:

1. Raw ingestion.
2. Wiki folding.
3. Lint sequence.
4. Index repair.
5. Processed registry update.
6. Log update.
7. Dream report.

## Scheduling

Jay's transcript mentions scheduled dream sequence. This repository includes `second-brain-schedule-dream-sequence`, but scheduling is not enabled by default.

Enable scheduling only after choosing a cadence and execution surface. The safest rollout is manual first, then a local scheduled task, then a remote routine only if the vault is backed by a repository and the privacy boundary is clear.

## Documentation

- [Architecture and usage guide](docs/second-brain-architecture-and-usage.md)
- [Docs index](docs/index.md)

## Public snapshot note

This repository is a project-level snapshot of the second-brain setup. It is intended to share the scaffold, documentation, and operating model, not private source captures.
