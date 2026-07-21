# LLM-Maintained Wiki

## Summary

An LLM-maintained wiki is a Markdown knowledge base where raw sources are preserved separately and an AI agent compiles durable concepts, links, and summaries into a wiki layer.

## Source-Backed Claims

- Jay's system avoids Obsidian, vector databases, and complex RAG infrastructure.
- The durable state is folders and text files: `raw/`, `wiki/`, `outputs/`, an operating manual, and dream sequence.
- The wiki is the organized layer where raw files become linked, searchable knowledge.

## Interpretation

The wiki is best treated as compiled memory for the agent. It should be queryable by humans, but its main job is to give Claude a compact, navigable representation of what has already been learned.

[Semantic Graph Import](semantic-graph-import.md) is a related but distinct layer: it can create a concept map from a repo or document corpus, but the resulting stubs still need source wiring and curation before they become durable wiki knowledge.

## Contradictions or Tensions

- None currently.

## Open Questions

- At what size does this Markdown wiki need search or retrieval tooling beyond file navigation?
- At what size should graph-derived concept maps become a separate quarantine layer rather than direct wiki pages?

## Sources

- [Jay Second-Brain Video Transcript](../sources/2026-06-08-jay-second-brain-video.md)
- [GPT 5.5 Jay Second-Brain Analysis](../sources/2026-06-08-gpt55-jay-second-brain-analysis.md)
- [Chase AI - Graphify + Obsidian](../sources/2026-06-08-chase-ai-graphify-obsidian.md)

## Last Updated

2026-06-08
