# Second brain architecture and usage guide

This second brain is now split into a knowledge base and a global toolkit.

The knowledge base stores durable state and a local-only raw source pointer:

```text
<knowledge-base-root>
```

The global toolkit stores reusable agent operations:

```text
<global-toolkit-root>
```

Claude-discoverable copies are installed under:

```text
<claude-config-root>\skills
<claude-config-root>\commands
```

## Source grounding

The design is grounded in Jay's YouTube walkthrough of a Claude Code-maintained second brain. Jay describes five building blocks:

1. `raw/` for source material.
2. `wiki/` for synthesized knowledge.
3. `outputs/` for generated artifacts.
4. An operating manual.
5. A dream sequence that ingests sources and runs a lint sequence.

This implementation keeps Jay's `raw/`, `wiki/`, and `outputs/` shape, but `raw/` is now a linked source mount instead of a copied inbox. The operating manual, skills, commands, and helper scripts live globally so future projects can use the same second-brain workflows.

## Mental model

The system has two planes:

| Plane | Location | Responsibility |
|---|---|---|
| Data plane | `<knowledge-base-root>` | Linked raw source pointer, wiki, lint state, registries, logs, and outputs. |
| Control plane | `<global-toolkit-root>` | Global skills, commands, scripts, and agent routing. |

The operating loop is unchanged:

```text
capture -> synthesize -> lint -> repair -> query -> output
```

From any future project folder, the user-facing workflow should remain:

```text
capture <project-folder-name>
run dream sequence
```

## Knowledge-base layout

| Path | Purpose |
|---|---|
| `raw/` | Local-only read-only source mount pointing at the user's projects/source tree. |
| `wiki/` | Synthesized source pages, concept pages, lint state, and registries. |
| `wiki/index.md` | Query entrypoint. |
| `wiki/log.md` | Append-only maintenance history. |
| `wiki/source_manifest.jsonl` | Machine-readable source registry. |
| `outputs/` | Briefs, memos, reports, and generated artifacts. |
| `templates/` | Page and report templates. |
| `docs/` | Documentation for this setup. |

The knowledge base intentionally no longer contains `.claude/`, `scripts/`, `AGENTS.md`, or `CLAUDE.md`.

## Global toolkit layout

| Path | Purpose |
|---|---|
| `AGENTS.md` | Cross-agent routing and root-resolution instructions. |
| `CLAUDE.md` | Claude Code-facing global second-brain instructions. |
| `.claude/skills/second-brain-*/SKILL.md` | Scoped reusable skills. |
| `.claude/commands/*.md` | Short command wrappers. |
| `scripts/capture-folder.ps1` | Helper for register-only source scanning. |
| `README.md` | Toolkit installation and usage notes. |

Installed copies under `<claude-config-root>` make the skills and commands available beyond a single project folder.

## Root resolution

Every global skill resolves the knowledge-base root in this order:

1. Use `SECOND_BRAIN_ROOT` if the environment variable is set.
2. Otherwise use:

```text
<knowledge-base-root>
```

This prevents project-local folders from becoming accidental second-brain destinations.

## Capture workflow

From any project folder:

```text
capture <project-folder-name>
```

The global capture-folder skill should register text-like files already available under:

```text
<knowledge-base-root>\raw\
```

The capture step should not copy source files, update concept pages, mark files as processed, or synthesize concepts. It should scan readable raw sources, skip dependency folders/build outputs/caches/binaries by default, append metadata to `wiki/source_manifest.jsonl`, and log register-only status.

The helper script supports dry runs:

```powershell
powershell -ExecutionPolicy Bypass -File "<global-toolkit-root>\scripts\capture-folder.ps1" -SourcePath "<external-source-folder>" -DryRun
```

See [Linked raw registration policy](selective-capture.md) for the exact default behavior and known gaps.

## Dream sequence workflow

From any project folder:

```text
run dream sequence
```

The global dream-sequence skill should update only the resolved knowledge-base root.

The seven phases are:

1. Raw ingestion.
2. Wiki folding.
3. Lint sequence.
4. Index repair.
5. Processed registry update.
6. Log update.
7. Dream report.

Dream reports go to:

```text
<knowledge-base-root>\outputs\briefs\
```

## Lint layer

Jay's transcript mentions a lint sequence inside dream sequence. This implementation makes lint explicit through:

| File | Purpose |
|---|---|
| `wiki/lint.md` | Latest lint summary. |
| `wiki/contradictions.md` | Conflicting claims and resolutions. |
| `wiki/stale-claims.md` | Claims needing refresh. |
| `wiki/duplicate-candidates.md` | Potential duplicate pages or concepts. |
| `wiki/orphaned-pages.md` | Pages not reachable through useful links. |
| `wiki/broken-links.md` | Broken Markdown links. |
| `wiki/open-threads.md` | Open maintenance and research questions. |

## Comparison with Jay's setup

| Jay transcript | This implementation |
|---|---|
| `raw/`, `wiki/`, and `outputs/` live in one knowledge-base folder. | Mostly same: `wiki/` and `outputs/` are durable KB folders; `raw/` is a local-only pointer to the user's projects/source tree. |
| Operating manual guides Claude. | The operating manual is global: `<global-toolkit-root>\CLAUDE.md`, with installed skills/commands under `<claude-config-root>`. |
| Dream sequence can be manual or scheduled. | Manual workflow is implemented; scheduling runbook exists but autonomous scheduling is not enabled by default. |
| Lint checks contradictions, stale claims, duplicates, and orphans. | Lint is first-class and inspectable through `wiki/lint.md` and related ledgers. |
| Claude creates and maintains the knowledge base. | Agents can use global skills from any project and still write to the same knowledge-base root. |

## Remaining gaps

| Gap | Current status | Next step |
|---|---|---|
| Active scheduled dream sequence | Not enabled. | Approve cadence and execution surface. |
| Background folder watcher | Not implemented. | Keep using `capture <path>` or add a watched drop folder later. |
| Mobile share flow | Not configured. | Add an inbox integration once a mobile capture surface is chosen. |
| Automatic global Codex discovery | Not guaranteed by `AGENTS.md` alone. | Use global Claude skills/commands, or explicitly point Codex at `<global-toolkit-root>\AGENTS.md`. |

## Troubleshooting

### Captures go to the wrong folder

**Cause:** `SECOND_BRAIN_ROOT` is set incorrectly, or the agent ignored the global root rules.

**Fix:** Check `SECOND_BRAIN_ROOT`; if unset, the destination should be `<knowledge-base-root>`.

### The agent modifies the current project

**Cause:** The agent treated the current project as the second-brain root.

**Fix:** Tell it to use the global toolkit and the default knowledge-base root. Project-local files should not be modified unless explicitly requested.

### Claude Code cannot find the skill

**Cause:** The installed copy under `<claude-config-root>\skills` may be missing or stale.

**Fix:** Reinstall the global toolkit skills from `<global-toolkit-root>\.claude\skills` into `<claude-config-root>\skills`.

