# Jay Second-Brain Video Transcript

## Metadata

- Source type: YouTube transcript
- Evidence tier: transcript - a transcript of the talk; content is first-hand but transcription-noisy and not independently verified
- URL: https://www.youtube.com/watch?v=K2BpNt3UBOQ&t=36s
- Captured date: 2026-06-08
- Raw file: excluded from this public snapshot.
- Hash: retained in the private working copy, not published here.

## Summary

Jay presents a simple Claude Code-based second brain that avoids Obsidian, vector databases, and complex RAG infrastructure. The system uses folders and Markdown files: a raw input layer, a wiki synthesis layer, an outputs layer, an operating manual, and a dream sequence that keeps the system updated.

## Source-Backed Claims

- The system is intended to be created by a prompt that asks Claude Code to scaffold the folders and operating files.
- The core folders are `raw/`, `wiki/`, and `outputs/`.
- The wiki has at least three key files: `index.md`, `log.md`, and `processed.md`.
- The operating manual is described in the transcript as `claw.md`; for Claude Code implementation, this vault uses `CLAUDE.md`.
- The dream sequence can be scheduled or invoked manually.
- The dream sequence ingests new raw files and runs a lint sequence for contradictions, stale claims, duplicates, and orphans.
- Jay demonstrates changing the system so raw captures do not immediately update the wiki; the dream sequence can handle updates later.

## Limitations

- The transcript is a video transcript and may contain transcription errors such as `claw.md`.
- The transcript describes a demo, not a complete production-grade implementation.

## Related Pages

- [LLM-Maintained Wiki](../concepts/llm-maintained-wiki.md)
- [Dream Sequence](../concepts/dream-sequence.md)
- [Knowledge-Base Lint](../concepts/knowledge-base-lint.md)
- [Capture vs Processing](../concepts/capture-vs-processing.md)
