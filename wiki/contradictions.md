# Contradictions

## C-2026-06-08-001 - Auto-update on ingest vs batch processing

### Claim A: Immediate wiki updates are useful

Jay's demo shows that when a source is saved, the system can update the wiki so retrieval becomes easier later.

### Claim B: Batch processing is the better default for this vault

Jay also shows customizing the policy so new raw files do not auto-update the wiki and instead wait for the dream sequence.

### Current Resolution

This vault uses capture-only by default. Immediate processing happens only when the user explicitly says `process now`.

### Status

Resolved as local operating policy.

### Sources

- [Jay Second-Brain Video Transcript](sources/2026-06-08-jay-second-brain-video.md)
- [Capture vs Processing](concepts/capture-vs-processing.md)

