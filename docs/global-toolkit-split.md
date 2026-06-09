# Global toolkit split

The second-brain system now separates durable knowledge from reusable agent operations.

## Current architecture

| Layer | Placeholder | Contents |
|---|---|---|
| Knowledge base | `<knowledge-base-root>` | `raw/`, `wiki/`, `outputs/`, `templates/`, and `docs/`. |
| Global toolkit | `<global-toolkit-root>` | `AGENTS.md`, `CLAUDE.md`, `.claude/skills/`, `.claude/commands/`, and scripts. |
| Claude install | `<claude-config-root>` | Installed skill and command copies for Claude discovery. |

The knowledge base is the only default write destination for second-brain data. Global skills resolve the destination root in this order:

1. `SECOND_BRAIN_ROOT`, when set.
2. The default local knowledge-base root.

Agents should not write second-brain outputs into the current project folder unless the user explicitly sets a different root.

## User-facing workflow

The target interaction remains short:

```text
capture <external-source-folder>
run dream sequence
```

`capture <external-source-folder>` selectively copies text-like source material into the knowledge base under `raw/inbox/`.

`run dream sequence` updates the knowledge base under `wiki/` and `outputs/`.

## What changed

- The local `.claude/` skills and commands were moved out of the knowledge base.
- The helper script moved out of the knowledge base.
- `AGENTS.md` and `CLAUDE.md` moved out of the knowledge base.
- Global skills and commands were installed for Claude discovery.
- Knowledge-base documentation was updated to describe the data-plane/control-plane split.
- The capture helper now supports a dry run, respects `SECOND_BRAIN_ROOT`, and skips build artifacts, caches, dependency folders, binaries, and oversized files by default.

## Remaining gaps

| Gap | Why it matters | Future action |
|---|---|---|
| Scheduled dream sequence is not active | Jay's transcript mentions scheduling, but autonomous writes still need explicit approval. | Choose cadence and execution surface, then enable a local scheduled task or Claude routine. |
| Codex global discovery is not guaranteed | Claude has a global skill install location; Codex-style agents may need explicit routing. | Add or document a Codex global instruction mechanism that points to `<global-toolkit-root>/AGENTS.md`. |
| Background folder watcher is not implemented | New source folders are not captured unless the user says `capture <path>`. | Add a watched inbox/drop folder if capture should become passive. |
| Mobile/share capture is not configured | Jay demonstrates low-friction link sharing; this setup currently focuses on local folders. | Add a mobile/share inbox workflow when the capture surface is chosen. |
| Public/private split needs ongoing hygiene | Raw capture manifests can contain local source paths in a private knowledge base. | Keep raw captures out of public commits; publish only sanitized scaffold/docs. |
| Drift between toolkit and installed copies is possible | Updating `<global-toolkit-root>` does not automatically prove `<claude-config-root>` is current. | Add a sync script and verification check for installed skills/commands. |
| Selective capture is heuristic | Uncommon text formats may be skipped and useful binary material such as PDFs or images is not extracted automatically. | Add configurable include/exclude policy and optional extraction/OCR workflows. |

## Verification checklist

Use this checklist after changes to the split:

- `capture <path> -DryRun` resolves to the knowledge-base `raw/inbox/` and reports captured/skipped counts.
- The knowledge base does not contain local `.claude/`, scripts, `AGENTS.md`, or `CLAUDE.md`.
- Global skills mention `SECOND_BRAIN_ROOT` and the default knowledge-base root.
- Installed Claude skills mirror the global toolkit skills.
- Documentation uses placeholders, not personal filesystem paths.
- Public commits exclude raw source captures and capture manifests unless intentionally sanitized.
