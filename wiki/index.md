# Wiki Index

## Core Concepts

- [LLM-Maintained Wiki](concepts/llm-maintained-wiki.md) - A Markdown knowledge base maintained by an LLM rather than a vector database or Obsidian-style app.
- [Dream Sequence](concepts/dream-sequence.md) - The scheduled or manual maintenance loop that ingests, synthesizes, lints, repairs, logs, and reports.
- [Knowledge-Base Lint](concepts/knowledge-base-lint.md) - A quality-control pass for contradictions, stale claims, duplicates, orphaned pages, broken links, missing provenance, and retrieval defects.
- [Capture vs Processing](concepts/capture-vs-processing.md) - The operating distinction between fast source capture and deliberate wiki synthesis.
- [Second-Brain Operating Model](concepts/second-brain-operating-model.md) - The local policy for this vault.
- [Semantic Graph Import](concepts/semantic-graph-import.md) - Using Graphify-like tools to generate source-linked concept maps before folding them into durable wiki pages.

## AI-Assisted Writing

- [Review Skills](concepts/review-skills.md) - Reusable Markdown skills that package editorial judgment as agent personas to critique a draft before a human editor sees it.
- [AI Writing Tells](concepts/ai-writing-tells.md) - Recurring patterns that mark text as model-generated or model-smoothed, and how a guardrails skill flags them.
- [Reviewer Orchestration](concepts/reviewer-orchestration.md) - Threading multiple reviewers into a synthesized panel that preserves disagreement.
- [After Automation](concepts/after-automation.md) - Dan Shipper's thesis that AI changes what the human does rather than reducing the workload.

## AI Market & Operating Shifts (2026-06-08 batch)

- [AI-Stack Value Migration](concepts/ai-stack-value-migration.md) - As one layer (hardware, foundation models) commoditizes, value migrates to applications, workflows, integration, and distribution.
- [AI-Native Organization](concepts/ai-native-organization.md) - People manage agents, agents read/write a context layer, the company compounds via skills and evals; carries the context-layer vs. context-minimalism tension.
- [Verification as Bottleneck](concepts/verification-as-bottleneck.md) - As generation gets cheap, verification (and false-positive rate) becomes the scarce, human-anchored constraint.
- [Layoffs as Strategy Signals](concepts/layoffs-as-strategy-signals.md) - "AI layoffs" are five different things; classify the constraint a company is revealing instead of assuming AI replaced workers.
- [AI Capex and Market Volatility](concepts/ai-capex-and-market-volatility.md) - Why AI-infrastructure news moves markets violently, against the financial-gravity ceiling on capex.

## Claude Code Practice (2026-06-09 batch)

- [Subagent Orchestration](concepts/subagent-orchestration.md) - One smart orchestrator delegating bounded work to isolated, often read-only specialist subagents; description fields as routing predicates.

## Sources

- [Jay Second-Brain Video Transcript](sources/2026-06-08-jay-second-brain-video.md)
- [GPT 5.5 Jay Second-Brain Analysis](sources/2026-06-08-gpt55-jay-second-brain-analysis.md)
- [Katie Parrott — Draft Review Kit (Every article)](sources/2026-06-08-katie-parrott-draft-review-kit-every.md)
- [Draft Review Kit repo (EveryInc)](sources/2026-06-08-draft-review-kit-repo.md)
- [SemiAnalysis — Quadruped State of the Market](sources/2026-06-08-semianalysis-quadruped-market.md)
- [Takeoff to Singularity (Diamandis roundtable)](sources/2026-06-08-diamandis-takeoff-singularity.md)
- [Become AI Native in <60 Minutes (Isenberg / Tabah)](sources/2026-06-08-isenberg-tabah-become-ai-native.md)
- [Reflecting on a Year of Claude Code (Cherny / Wu)](sources/2026-06-08-claude-code-one-year.md)
- [Chase AI - Graphify + Obsidian for Claude Code](sources/2026-06-08-chase-ai-graphify-obsidian.md)
- [Meta Cut 8,000 People — AI Layoffs (Nate B. Jones)](sources/2026-06-08-nate-jones-meta-ai-layoffs.md)
- [Palo Alto Networks CEO on AI Cybersecurity (All-In / Arora)](sources/2026-06-08-allin-arora-ai-cybersecurity.md)
- [Apple at WWDC, Anthropic, Microsoft vs. OpenAI (Kantrowitz / Roy)](sources/2026-06-08-kantrowitz-apple-wwdc-ai.md)
- [Why Coding Is the First Undeniable AI Use Case (a16z / Evans)](sources/2026-06-08-a16z-benedict-evans-coding.md)
- [How to Build Claude Subagents (Nate Herk)](sources/2026-06-09-nate-herk-claude-subagents.md)

## Maintenance

- [Processed Registry](processed.md)
- [Source Manifest](source_manifest.jsonl)
- [Maintenance Log](log.md)
- [Lint Report](lint.md)
- [Contradictions](contradictions.md)
- [Stale Claims](stale-claims.md)
- [Open Threads](open-threads.md)

(Broken links, orphaned pages, and duplicate candidates were folded into the [Lint Report](lint.md) on 2026-07-27.)

## Query Starting Points

- For "What does Jay's second-brain system require?", start with [Second-Brain Operating Model](concepts/second-brain-operating-model.md), then verify against [Jay Second-Brain Video Transcript](sources/2026-06-08-jay-second-brain-video.md).
- For "How should Graphify output fit into this second brain?", start with [Semantic Graph Import](concepts/semantic-graph-import.md), then read [Chase AI - Graphify + Obsidian](sources/2026-06-08-chase-ai-graphify-obsidian.md).
- For "What is the dream sequence?", start with [Dream Sequence](concepts/dream-sequence.md) and [Knowledge-Base Lint](concepts/knowledge-base-lint.md).
- For "How do AI review skills work / what is the Draft Review Kit?", start with [Review Skills](concepts/review-skills.md), then [Reviewer Orchestration](concepts/reviewer-orchestration.md) and the [Draft Review Kit repo](sources/2026-06-08-draft-review-kit-repo.md).
- For "What are AI writing tells and how are they caught?", start with [AI Writing Tells](concepts/ai-writing-tells.md).
- For "Where does value go as AI commoditizes a layer?", start with [AI-Stack Value Migration](concepts/ai-stack-value-migration.md), grounded in the quadruped, Arora, Evans, and Apple sources.
- For "What does it mean to be AI-native, and should context be rich or minimal?", start with [AI-Native Organization](concepts/ai-native-organization.md) and read its context-layer vs. context-minimalism tension.
- For "Why is coding the use case that works / what gates AI automation?", start with [Verification as Bottleneck](concepts/verification-as-bottleneck.md).
- For "How should I read an 'AI layoff' headline?", start with [Layoffs as Strategy Signals](concepts/layoffs-as-strategy-signals.md).
- For "Why does the AI trade swing so hard?", start with [AI Capex and Market Volatility](concepts/ai-capex-and-market-volatility.md).
- For "When and how should I use Claude Code subagents?", start with [Subagent Orchestration](concepts/subagent-orchestration.md), then verify details against the [Nate Herk source page](sources/2026-06-09-nate-herk-claude-subagents.md), which separates transcript claims from unverified doc-attributed claims.
