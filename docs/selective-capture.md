# Selective capture policy

The default capture workflow is selective copy, not full folder mirroring.

When the user says:

```text
capture <external-source-folder>
```

the global toolkit copies readable source material into:

```text
<knowledge-base-root>\raw\inbox\YYYY-MM-DD-folder-name\
```

It does not copy every file in the external folder. This keeps the second brain focused on material an agent can read and reduces accidental disk duplication.

## Default behavior

The capture helper scans the external folder and builds a capture plan before copying.

By default, it captures text-like source files such as:

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

## Capture records

Each captured batch includes:

| File | Purpose |
|---|---|
| `capture_manifest.jsonl` | One record per copied file, including relative destination, size, hash, capture mode, and reason. |
| `capture_skipped.jsonl` | One record per skipped file, including relative path, size, skip reason, and capture mode. |

The wiki log records the capture mode, scanned count, captured count, skipped count, and size limit.

## Dry run

Agents should use a dry run when the user wants to preview disk impact:

```text
capture <external-source-folder> dry run
```

The dry run reports:

- Destination batch path.
- Capture mode.
- Files scanned.
- Files that would be captured.
- Files that would be skipped.
- Skip counts by reason.

## Full-copy override

A full mirror is available only when the user explicitly requests it.

The global helper supports an include-all option that restores the older behavior and copies every file found under the external folder. Agents should not use this option by default because it can duplicate large project directories, dependency caches, build outputs, and binary assets.

## Disk-usage implications

Selective capture still copies files into the raw inbox, so it is not zero-copy. It avoids the largest accidental duplication risks by leaving dependency folders, build artifacts, caches, and binary assets outside the second brain.

Existing raw captures are not retroactively deduplicated or cleaned. This policy applies to new captures after the selective helper is installed.

## Remaining gaps

| Gap | Why it matters | Future action |
|---|---|---|
| Binary source extraction is not automatic | PDFs, images, screenshots, and Office files may contain useful source material but are skipped by default. | Add explicit extract-to-text workflows for PDFs, images/OCR, and documents. |
| The allow/deny policy is heuristic | Uncommon text file extensions may be skipped as `unknown_extension`. | Add a user-editable capture policy file for include and exclude rules. |
| No deduplication across batches | The same text file copied from two folders can appear in multiple raw batches. | Add cross-batch hash detection and optional reuse links. |
| Existing captures are unchanged | Older full-folder captures may still occupy disk. | Add an audit/cleanup workflow that reports large raw batches before deleting anything. |
| Skipped generated docs can be missed | Some projects generate useful Markdown or JSON under build-style folders. | Add a per-capture override for selected skipped subfolders. |
