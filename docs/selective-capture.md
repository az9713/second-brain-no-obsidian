# Linked raw registration policy

The default capture workflow is registration, not copying.

`raw/` is a local-only pointer to the user's projects/source tree. Source files stay where they already live. The second brain reads them through `raw/` and writes only metadata, synthesis, and outputs under the knowledge-base root.

When the user says:

```text
capture <project-folder-name>
```

the global toolkit resolves the folder under:

```text
<knowledge-base-root>\raw\
```

For example, `capture example-project` resolves to:

```text
<knowledge-base-root>\raw\example-project\
```

The user can also provide an explicit path if it resolves inside the raw source tree.

## Folder lookup rule

Capture folder lookup is exact and shallow.

When the user gives a folder name, agents should check only:

1. The explicit path, if the user provided one.
2. `<knowledge-base-root>\raw\<folder-name>`.

Agents should not recursively search the projects tree to find a capture folder. Recursive discovery across a large projects folder can walk dependency folders, build outputs, caches, and Git internals before the registration script even runs.

If the exact folder is not found, the agent should stop and report that it was not found under `raw/`. If the user asks for suggestions, the agent may use a shallow top-level directory listing under `raw/`, but it must not descend into project folders.

## Default behavior

The capture helper scans the source folder and builds a registration plan.

By default, it registers text-like source files such as:

- Markdown, text, reStructuredText, AsciiDoc, CSV, TSV, JSON, JSONL, YAML, TOML, XML, HTML, CSS, and config files.
- Common source-code files such as JavaScript, TypeScript, Python, Go, Rust, Java, C/C++, C#, Ruby, PHP, Swift, Kotlin, shell scripts, PowerShell, SQL, GraphQL, and protocol buffers.
- Common extensionless project files such as `README`, `LICENSE`, `CHANGELOG`, `CONTRIBUTING`, `Dockerfile`, `Makefile`, `Gemfile`, `Rakefile`, and `Procfile`.

It skips common high-volume or low-signal directories such as:

```text
.git
node_modules
.venv
venv
__pycache__
.cache
.pytest_cache
.mypy_cache
.ruff_cache
.next
.nuxt
dist
build
out
target
coverage
.turbo
.parcel-cache
.gradle
.idea
.vscode
```

It also skips common binary or generated file types, including image, audio, video, archive, executable, font, compiled, and Office/PDF formats.

Files above the default size limit are skipped. The current default is 2 MB per file.

## Registry records

Capture writes registry data under `wiki/`; it does not write under `raw/`.

| File | Purpose |
|---|---|
| `wiki/source_manifest.jsonl` | One record per registered file, including raw path, source id, size, hash, registration run id, status, and processing status. |
| `wiki/source_scan_skipped.jsonl` | One record per skipped file, including raw path, size, skip reason, and registration run id. |
| `wiki/log.md` | Human-readable capture/register event summary. |

Registered files start with `status: registered` and `processing_status: unprocessed`. Dream sequence later reads those records and updates `wiki/` and `outputs/`.

## Dry run

Agents should use a dry run when the user wants to preview indexing impact:

```text
capture <project-folder-name> dry run
```

The dry run reports:

- Source path and raw source key.
- Capture/registration mode.
- Files scanned.
- Files that would be registered.
- Files that would be skipped.
- Directories that would be pruned.
- Files that would be copied, always `0`.
- Skip counts by reason.

## Include-all override

The global helper supports an include-all option to register every file it sees, including binaries and build outputs. It still does not copy files.

Agents should not use include-all by default because it can pollute the registry with dependency caches, build outputs, and binary assets that the second brain cannot directly read.

## Disk-usage implications

This model avoids duplicate raw-source storage. New captures write metadata only.

The `raw/` pointer itself does not make the projects tree read-only at the operating-system level. Read-only behavior is enforced by the agent rules and helper scripts:

- Agents may read from `raw/`.
- Agents must not create, edit, delete, move, or rename anything under `raw/`.
- Dream sequence writes only to `wiki/` and `outputs/`.

Existing archived raw captures are not deleted automatically. They should remain local unless the user explicitly asks for cleanup.

## Remaining gaps

| Gap | Why it matters | Future action |
|---|---|---|
| Raw read-only is policy-enforced | A junction does not prevent writes at the OS level. | Add script-level write guards to all future second-brain writers and avoid destructive operations under `raw/`. |
| Binary source extraction is not automatic | PDFs, images, screenshots, and Office files may contain useful source material but are skipped by default. | Add explicit extract-to-text workflows for PDFs, images/OCR, and documents. |
| The allow/deny policy is heuristic | Uncommon text file extensions may be skipped as `unknown_extension`. | Add a user-editable capture policy file for include and exclude rules. |
| No deduplication across registrations | The same text file can be registered more than once. | Add latest-record wins logic or cross-run hash detection. |
| Existing raw archive is unchanged | Older copied captures may still occupy disk in a local archive. | Add an audit/cleanup workflow that reports large raw archives before deleting anything. |
