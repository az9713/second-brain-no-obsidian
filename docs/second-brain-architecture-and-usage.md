# Second brain architecture and usage guide

This second brain is a local Markdown knowledge base rooted at `<second-brain-root>`. It is designed so you can tell an agent to capture new sources, then tell it to run dream sequence, while the agent manages `raw/`, `wiki/`, `outputs/`, lint state, logs, and registries.

The implementation is grounded in Jay's second-brain transcript, especially the five building blocks he describes: `raw/`, `wiki/`, `outputs/`, an operating manual, and dream sequence. It also includes hardening that Jay's video implies but does not fully specify, such as explicit lint files, a machine-readable source manifest, scoped skills, Git rollback, and cross-agent startup instructions.

## Source grounding

The primary source for Jay's workflow is:

- [Jay second-brain video transcript source page](../wiki/sources/2026-06-08-jay-second-brain-video.md)
- Raw transcript: excluded from this public snapshot; see the source page summary.

The implementation analysis source is:

- [GPT 5.5 Jay second-brain analysis source page](../wiki/sources/2026-06-08-gpt55-jay-second-brain-analysis.md)
- Raw analysis note: excluded from this public snapshot; see the source page summary.

Treat the transcript as evidence for what Jay said. Treat GPT 5.5's analysis and this implementation as recommendations and local design choices unless they are explicitly tied back to the transcript.

## Mental model

Jay's system is not a vector database, Obsidian vault, or generic "chat with files" setup. It is a folder-based Markdown knowledge base maintained by an agent.

The durable state lives on disk:

```text
<second-brain-root>
  raw/
  wiki/
  outputs/
  CLAUDE.md
  AGENTS.md
  .claude/
  scripts/
  templates/
  docs/
```

The operating loop is:

```text
capture -> synthesize -> lint -> repair -> query -> output
```

In day-to-day use, that becomes:

```text
capture <external-source-folder>
run dream sequence
```

The first command captures sources into `raw/` without wiki synthesis. The second command processes captured sources, updates the wiki, runs lint, repairs retrieval surfaces, updates registries, appends logs, and writes a report.

## Architecture

```text
External sources
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
  | create-output / query-wiki
  v
outputs/
```

### Component breakdown

| Component | Path | Purpose |
|---|---|---|
| Root operating manual | `CLAUDE.md` | Claude Code-facing rules and trigger routing. |
| Cross-agent operating manual | `AGENTS.md` | Codex-style and general agent routing rules. |
| Raw evidence layer | `raw/` | Append-mostly captured source material. |
| Raw inbox | `raw/inbox/` | Capture destination for external folders and unclear source types. |
| Wiki layer | `wiki/` | Synthesized source pages, concept pages, index, registries, and lint state. |
| Outputs layer | `outputs/` | Generated briefs, memos, reports, and future artifacts. |
| Skills | `.claude/skills/second-brain-*/SKILL.md` | Claude-style scoped workflows for capture, processing, dream sequence, scheduling, query, and output creation. |
| Commands | `.claude/commands/*.md` | Short slash-command wrappers that point to the scoped skills. |
| Helper scripts | `scripts/` | Concrete automation helpers, currently external folder capture. |
| Templates | `templates/` | Page and report templates for source pages, concept pages, and dream reports. |
| Documentation | `docs/` | Human-facing explanation of architecture and usage. |

## Raw layer

`raw/` is the evidence layer. It should preserve source material with minimal transformation.

Current raw subfolders:

| Folder | Use |
|---|---|
| `raw/inbox/` | Default batch destination for external folders and unclear source types. |
| `raw/transcripts/` | Video or audio transcripts. |
| `raw/notes/` | Analysis notes, rough captures, and non-primary-source commentary. |

External folders are captured as dated batches:

```text
raw/inbox/YYYY-MM-DD-folder-name/
```

Each captured batch can include a `capture_manifest.jsonl` created by `scripts/capture-folder.ps1`. The manifest records source paths, captured paths, sizes, hashes, capture timestamps, and capture status.

### Raw layer rules

- Do not delete raw sources.
- Do not rewrite raw sources except with explicit approval.
- Preserve relative paths inside captured external folders when possible.
- Do not treat captured files as processed until dream sequence runs.

## Wiki layer

`wiki/` is the compiled knowledge layer. It gives agents a compact way to retrieve and reason over what has already been captured.

Core files:

| File | Purpose |
|---|---|
| `wiki/index.md` | Query entrypoint and navigation map. |
| `wiki/log.md` | Append-only maintenance history. |
| `wiki/processed.md` | Human-readable registry of processed raw files. |
| `wiki/source_manifest.jsonl` | Machine-readable source registry. |

Wiki content:

| Folder | Purpose |
|---|---|
| `wiki/sources/` | One page per important source or source batch. |
| `wiki/concepts/` | Durable concepts synthesized from sources. |

Current seed concept pages:

| Concept | Path |
|---|---|
| LLM-maintained wiki | `wiki/concepts/llm-maintained-wiki.md` |
| Dream sequence | `wiki/concepts/dream-sequence.md` |
| Knowledge-base lint | `wiki/concepts/knowledge-base-lint.md` |
| Capture vs processing | `wiki/concepts/capture-vs-processing.md` |
| Second-brain operating model | `wiki/concepts/second-brain-operating-model.md` |

## Lint layer

Lint is a first-class part of this implementation because Jay explicitly mentions a lint sequence inside dream sequence.

In software, lint checks code for defects. In this second brain, lint checks knowledge structure and retrieval quality.

Lint state files:

| File | Checks |
|---|---|
| `wiki/lint.md` | Summary of the latest lint pass. |
| `wiki/contradictions.md` | Conflicting claims and current resolutions. |
| `wiki/stale-claims.md` | Claims that may need refresh. |
| `wiki/duplicate-candidates.md` | Pages or concepts that may overlap. |
| `wiki/orphaned-pages.md` | Pages with no useful inbound links or index entries. |
| `wiki/broken-links.md` | Markdown links that point to missing or unclear targets. |
| `wiki/open-threads.md` | Open research and maintenance questions. |

Lint should also flag missing provenance and retrieval defects such as vague page names, missing aliases, weak summaries, overlong pages, and pages that should be split or merged.

## Agent instructions

Agents know how to operate this second brain when they are started in the vault root:

```text
<second-brain-root>
```

Claude Code should read:

```text
CLAUDE.md
```

Codex-style agents should read:

```text
AGENTS.md
```

If an agent starts outside the vault, tell it:

```text
Use <second-brain-root> as my second-brain root. Read AGENTS.md and CLAUDE.md before capturing sources, querying, or updating the wiki.
```

## Skills and commands

Skills use the scoped Claude-style directory pattern:

```text
.claude/skills/second-brain-capture-folder/SKILL.md
.claude/skills/second-brain-capture-source/SKILL.md
.claude/skills/second-brain-create-output/SKILL.md
.claude/skills/second-brain-dream-sequence/SKILL.md
.claude/skills/second-brain-process-source/SKILL.md
.claude/skills/second-brain-query-wiki/SKILL.md
.claude/skills/second-brain-schedule-dream-sequence/SKILL.md
```

Commands remain short:

```text
.claude/commands/capture-folder.md
.claude/commands/capture-source.md
.claude/commands/create-output.md
.claude/commands/dream-sequence.md
.claude/commands/process-source.md
.claude/commands/query-wiki.md
.claude/commands/schedule-dream-sequence.md
```

### Trigger map

| User phrase | Agent behavior | Skill |
|---|---|---|
| `capture <path>` | Capture an external folder into `raw/inbox/` without wiki synthesis. | `second-brain-capture-folder` |
| `import <path>` | Same as capture folder. | `second-brain-capture-folder` |
| `save this folder` | Same as capture folder. | `second-brain-capture-folder` |
| `save this` | Capture a source into `raw/` without wiki synthesis. | `second-brain-capture-source` |
| `process now` | Process a source immediately into the wiki. | `second-brain-process-source` |
| `run dream sequence` | Run the seven-phase maintenance loop. | `second-brain-dream-sequence` |
| `schedule dream sequence` | Prepare scheduling, but do not enable autonomous writes without approval. | `second-brain-schedule-dream-sequence` |

## How to use it

### Capture a new external source folder

Start an agent in the vault root and say:

```text
capture <external-source-folder>
```

Expected behavior:

1. The agent reads `AGENTS.md` and `CLAUDE.md`.
2. The agent maps `capture <path>` to `second-brain-capture-folder`.
3. The agent uses `scripts/capture-folder.ps1` if available.
4. The external folder is copied into `raw/inbox/YYYY-MM-DD-example-source-folder/`.
5. A `capture_manifest.jsonl` is written inside the captured batch.
6. `wiki/log.md` receives a capture-only entry.
7. The wiki is not synthesized yet.

The external source folder stays where it is. The second brain works from the captured copy in `raw/`.

### Run dream sequence

After captures accumulate, say:

```text
run dream sequence
```

Expected behavior:

1. Scan `raw/`, including captured batches in `raw/inbox/`.
2. Detect new or changed files.
3. Create or update source pages under `wiki/sources/`.
4. Create or update concept pages under `wiki/concepts/`.
5. Run lint.
6. Repair `wiki/index.md`.
7. Update `wiki/processed.md` and `wiki/source_manifest.jsonl`.
8. Append to `wiki/log.md`.
9. Write `outputs/briefs/YYYY-MM-DD-dream-sequence.md`.

Dream sequence should not delete raw files. It should recommend merges or deletions rather than performing them unless the user approves.

### Query the second brain

Ask a direct question:

```text
Using my second brain, what does Jay's second-brain workflow require?
```

Expected behavior:

1. Start from `wiki/index.md`.
2. Read relevant concept pages.
3. Read source pages.
4. Read raw sources only when exact detail or verification is needed.
5. Separate source-backed facts from implementation recommendations.

### Create an output

Ask for a concrete artifact:

```text
Create a brief explaining Jay's dream sequence and how our implementation differs.
```

Expected behavior:

1. Start from `wiki/index.md`.
2. Read relevant wiki pages and source pages.
3. Verify critical claims against raw sources.
4. Save the artifact under `outputs/briefs/`, `outputs/memos/`, or `outputs/reports/`.
5. Append the output creation to `wiki/log.md`.

## Scheduled dream sequence

Jay mentions a scheduled routine or task for dream sequence. This implementation supports scheduling through the `second-brain-schedule-dream-sequence` skill, but scheduling is not currently enabled.

That is deliberate. Autonomous scheduled writes can modify `wiki/` and `outputs/`, so they should be enabled only after you approve cadence and execution surface.

Recommended rollout:

| Stage | Behavior | Why |
|---|---|---|
| Manual first | You say `run dream sequence`. | Safest while validating the workflow. |
| Local scheduled task | A local task runs dream sequence on a schedule. | Better for private local files than cloud routines. |
| Claude remote routine | A cloud routine runs against a GitHub-backed vault. | Useful later, but privacy and connector scope need review. |

Recommended cadence:

| Usage pattern | Cadence |
|---|---|
| Light capture | Weekly |
| Active research sprint | Daily |
| Sensitive or high-stakes sources | Manual only |

## Comparison with Jay's transcript

### Common elements

| Jay transcript | This implementation |
|---|---|
| `raw/` as the source dump. | `raw/` exists with `inbox/`, `transcripts/`, and `notes/`. |
| `wiki/` as the organized knowledge layer. | `wiki/` exists with source pages, concept pages, index, registries, and lint state. |
| `outputs/` for generated artifacts. | `outputs/briefs/`, `outputs/memos/`, and `outputs/reports/` exist. |
| Operating manual described as `claw.md` in transcript. | Uses `CLAUDE.md`, the Claude Code project memory filename. |
| `wiki/index.md` as navigation map. | `wiki/index.md` is the query entrypoint. |
| `wiki/log.md` as operation log. | `wiki/log.md` records scaffold, automation, and skill-structure changes. |
| `wiki/processed.md` as processed registry. | `wiki/processed.md` records processed raw files and hashes. |
| Dream sequence can run manually or on a schedule. | Manual dream sequence is implemented; scheduling support exists but is not enabled. |
| Dream sequence ingests raw files. | Dream sequence scans `raw/`, including captured batches under `raw/inbox/`. |
| Dream sequence runs lint. | Lint is first-class through `wiki/lint.md` and related ledgers. |
| New raw files can wait for dream sequence instead of immediate wiki updates. | Capture-only is the default operating policy. |

### Differences

| Area | Jay transcript | This implementation |
|---|---|---|
| Scope | Demo knowledge base. | Local AI research vault under `<second-brain-root>`. |
| Operating manual | Transcript says `claw.md`, likely transcription noise. | Uses `CLAUDE.md` plus `AGENTS.md` for cross-agent behavior. |
| Agent portability | Focuses on Claude Code and Claude Desktop. | Adds Codex-style routing through `AGENTS.md`. |
| Skills | Jay describes commands and operating behavior, not a scoped skill tree. | Uses `.claude/skills/second-brain-*/SKILL.md` and `.claude/commands/*.md`. |
| Folder capture | Jay shows source capture by sharing links or asking Claude to research. | Adds `scripts/capture-folder.ps1` and `/capture-folder` for external local folders. |
| Lint state | Jay mentions lint checks. | Makes lint inspectable with dedicated Markdown files. |
| Registry | Jay shows `processed.md`. | Adds `source_manifest.jsonl` with machine-readable metadata. |
| Rollback | Not emphasized in the transcript. | Git is initialized for rollback, but commits require approval. |
| Scheduling | Jay shows a routine/scheduled task. | Scheduling runbook exists, but no schedule is active yet. |

## What is missing compared to Jay

These gaps are the remaining places where this implementation is less automatic than Jay's demo.

| Gap | Status | Impact | Next step |
|---|---|---|---|
| Active scheduled dream sequence | Not enabled. | You still need to say `run dream sequence`. | Approve cadence and execution surface, then configure local scheduled task or Claude routine. |
| Claude Desktop routine object | Not created. | The Claude Desktop routine UI will not show a scheduled "knowledgebase dream sequence" yet. | Use `schedule dream sequence` once you want automation enabled. |
| Background folder watcher | Not implemented. | New folders in a local download/source folder are not detected automatically. | Keep using `capture <path>`, or add a watched drop folder later. |
| Mobile share-to-second-brain flow | Not configured. | Sharing links from mobile will not automatically land in `raw/`. | Add an inbox mechanism when a mobile capture surface is chosen. |
| Web/deep-research ingestion | Not configured as an autonomous routine. | The agent will not proactively research topics unless asked. | Add a dedicated research-capture skill if needed. |
| Original Jay/Skool template | Not available in this vault. | The implementation is based on the transcript and analysis, not Jay's exact paid template. | Capture the original prompt/template if you obtain it, then run dream sequence. |
| Fully automatic source classification | Partial. | Folder capture lands under `raw/inbox/`; dream sequence classifies during processing. | Add source-type classifiers only after real capture batches reveal a need. |

The biggest difference is scheduling. Jay shows the dream sequence as scheduled in the app. This implementation supports that idea but keeps it off until you explicitly approve autonomous writes.

## What is missing beyond Jay

Some gaps are not Jay-specific but matter for a mature second brain.

| Gap | Why it matters |
|---|---|
| Automated link-check script | Current link checks were run manually during setup. A script would make lint more repeatable. |
| Staleness policy by domain | AI research, finance, health, and law age differently. This vault only has basic stale-claim guidance. |
| Merge workflow | Duplicate candidates are recorded, but there is no formal approval workflow for merges. |
| Output templates by artifact type | The vault has basic templates, but not specialized templates for investment memos, technical briefs, or implementation plans. |
| Cross-vault routing | `ai-research` is the only vault. No router decides when to create or use another vault under `<second-brain-container>\`. |

## Design decisions

### One vault first

The implementation starts with one vault: `ai-research`. This avoids premature fragmentation while the workflow is still being validated.

Create another vault under `<second-brain-container>\` only when retrieval noise, privacy boundaries, maintenance cadence, or output style clearly diverge.

### Capture-only by default

Capture-only keeps intake fast and prevents shallow one-source summaries from cluttering the wiki.

Immediate wiki updates are still allowed when you say:

```text
process now
```

### Lint is explicit

Jay mentions lint inside dream sequence, so lint is not hidden inside summarization. It has its own files and report surfaces.

This matters because contradiction tracking, stale-claim review, duplicate detection, orphan checks, broken-link checks, and missing-provenance checks are maintenance behaviors, not summary behaviors.

### Scheduling is supported but disabled

Scheduling matches Jay's implementation direction, but it should not be enabled blindly. A scheduled agent can write to `wiki/` and `outputs/`, so the cadence and tool surface need approval.

## Troubleshooting

### The agent does not know where the second brain is

**Cause:** The agent was started outside the vault root.

**Fix:** Start the agent in:

```text
<second-brain-root>
```

Or tell it:

```text
Use <second-brain-root> as my second-brain root. Read AGENTS.md and CLAUDE.md before capturing sources, querying, or updating the wiki.
```

### The agent asks for a long prompt

**Cause:** The agent did not apply the natural-language trigger map.

**Fix:** Use the short command and point at the root if needed:

```text
capture <external-source-folder>
```

The agent should map that to `second-brain-capture-folder`.

### The agent updates the wiki during capture

**Cause:** It confused capture with processing.

**Fix:** Remind it that capture-only is the default:

```text
Capture only. Do not update the wiki until dream sequence.
```

Then inspect `wiki/log.md` and `git status`.

### Dream sequence does not create an output report

**Cause:** The agent skipped phase 7.

**Fix:** Re-run:

```text
run dream sequence
```

Then check:

```text
outputs/briefs/YYYY-MM-DD-dream-sequence.md
```

### Scheduled dream sequence is not running

**Cause:** Scheduling has not been enabled.

**Fix:** Ask:

```text
schedule dream sequence
```

The agent should use `second-brain-schedule-dream-sequence` and ask for approval before enabling autonomous writes.

## Current status

The implementation currently supports the low-friction workflow Jay describes:

```text
capture <path>
run dream sequence
```

It also supports query and output workflows once the wiki has been built:

```text
Using my second brain, answer ...
Create a brief ...
```

The main remaining gap versus Jay is an active scheduled routine. The scheduling runbook exists, but no autonomous schedule is enabled yet.
