# Second-Brain Operating Model

## Summary

This vault is a local AI research second brain. It keeps raw evidence separate from synthesized wiki knowledge and uses a dream sequence with lint as the maintenance loop.

## Minimum Architecture

- `CLAUDE.md`: concise operating manual.
- `raw/`: append-mostly source capture.
- `wiki/`: source pages, concept pages, index, logs, registries, and lint state.
- `outputs/`: generated briefs, memos, reports, and artifacts.
- `.claude/skills/`: reusable workflow runbooks.
- `.claude/commands/`: project slash-command wrappers.

## Source-Backed Facts

- Jay's video identifies `raw/`, `wiki/`, `outputs/`, operating manual, and dream sequence as the system's building blocks.
- Jay's wiki includes index, log, and processed files.
- Jay's dream sequence includes lint.

## Local Implementation Choices

- Root directory: `<second-brain-root>`.
- Capture-only by default.
- Manual dream sequence first; scheduling is deferred.
- Git initialized for rollback, but commits require user approval.
- Lint state is inspectable through dedicated Markdown files.

## Sources

- [Jay Second-Brain Video Transcript](../sources/2026-06-08-jay-second-brain-video.md)
- [GPT 5.5 Jay Second-Brain Analysis](../sources/2026-06-08-gpt55-jay-second-brain-analysis.md)

## Last Updated

2026-06-08
