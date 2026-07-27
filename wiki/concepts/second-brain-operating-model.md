# Second-Brain Operating Model

## Summary

This second brain now separates durable knowledge from reusable agent operations.

## Data Plane

The knowledge base lives at:

```text
<knowledge-base-root>
```

It contains:

- `raw/`: append-mostly source capture.
- `wiki/`: source pages, concept pages, index, logs, registries, and lint state.
- `outputs/`: generated briefs, memos, reports, and artifacts.
- `templates/`: reusable source, concept, and report templates.
- `docs/`: documentation for this setup.

## Control Plane

The global toolkit lives at:

```text
<global-toolkit-root>
```

It contains:

- `AGENTS.md`: cross-agent routing and root-resolution instructions.
- `CLAUDE.md`: Claude Code-facing global second-brain instructions.
- `.claude/skills/second-brain-*/SKILL.md`: reusable skills.
- `.claude/commands/*.md`: short command wrappers.
- `scripts/capture-folder.ps1`: capture-only folder intake helper.

Claude-discoverable copies are installed under:

```text
<claude-config-root>\skills
<claude-config-root>\commands
```

## Root Resolution

Global skills resolve the knowledge-base root in this order:

1. `SECOND_BRAIN_ROOT` environment variable.
2. `<knowledge-base-root>`.

## Source-Backed Facts

- Jay's video identifies `raw/`, `wiki/`, `outputs/`, operating manual, and dream sequence as the system's building blocks.
- Jay's wiki includes index, log, and processed files.
- Jay's dream sequence includes lint.

## Local Implementation Choices

- Capture-only by default.
- Manual dream sequence first; scheduling is deferred.
- Git initialized for rollback, but commits require user approval.
- Lint state is inspectable through dedicated Markdown files.
- Skills and commands are global so future project folders can use the same second brain.
- Graph-derived imports should be quarantined or selectively folded before promotion into durable wiki pages; see [Semantic Graph Import](semantic-graph-import.md).

## Sources

Evidence tier: **generated-summary** - inherited from the weakest underlying source. Claims here rest at least partly on LLM summaries of auto-caption transcripts; treat as leads, not verified facts.

- [Jay Second-Brain Video Transcript](../sources/2026-06-08-jay-second-brain-video.md)
- [GPT 5.5 Jay Second-Brain Analysis](../sources/2026-06-08-gpt55-jay-second-brain-analysis.md)
- [Chase AI - Graphify + Obsidian](../sources/2026-06-08-chase-ai-graphify-obsidian.md)

## Last Updated

2026-06-08

