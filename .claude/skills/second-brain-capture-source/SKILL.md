---
name: second-brain-capture-source
description: Capture a source into this second brain's raw folder without wiki synthesis.
---

# capture-source

Use this workflow when the user wants to save a source without updating the wiki.

## Protocol

1. Save the source under the most appropriate `raw/` subfolder.
2. Prefer `raw/inbox/` when the source type is unclear.
3. Preserve source text as-is when possible.
4. Add light metadata only if it does not distort the source.
5. Do not create concept pages.
6. Do not update `wiki/index.md` unless the user explicitly asks.
7. If logging the capture, record it as `captured`, not `processed`.

## Output

Tell the user the saved raw path and whether any wiki files were intentionally left unchanged.
