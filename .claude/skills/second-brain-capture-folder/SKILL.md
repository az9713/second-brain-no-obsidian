---
name: second-brain-capture-folder
description: Capture an external folder into this second brain's raw inbox without wiki synthesis.
---

# capture-folder

Use this workflow when the user points at an external folder and wants it added to the second brain.

Trigger phrases include:

- `capture <path>`
- `import <path>`
- `save this folder`
- `add this folder to my second brain`

## Goal

Copy the external folder into `raw/inbox/` as a dated batch without synthesizing the wiki.

## Destination

For an external folder named `example-source-folder`, capture to:

```text
raw/inbox/YYYY-MM-DD-example-source-folder/
```

Preserve the folder's internal relative paths where possible.

## Protocol

1. Confirm this repository root is the second-brain root.
2. Verify the external path exists and is a directory.
3. Use `scripts/capture-folder.ps1` when available:

   ```powershell
   powershell -ExecutionPolicy Bypass -File .\scripts\capture-folder.ps1 -SourcePath "C:\path\to\folder"
   ```

4. If the script is unavailable, manually copy files into `raw/inbox/YYYY-MM-DD-folder-name/` while preserving relative paths.
5. Do not update concept pages.
6. Do not update `wiki/index.md`.
7. Do not mark files as processed.
8. Append a capture-only entry to `wiki/log.md`.
9. Tell the user the batch folder and number of files captured.

## Safety

- Do not delete or move the external source folder.
- Do not delete raw files.
- Do not synthesize until `process now` or dream sequence.
