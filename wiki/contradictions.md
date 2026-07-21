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

## C-2026-06-08-002 - Rich context layer vs context minimalism

### Claim A: Build a rich, persistent context layer

[Isenberg / Tabah](sources/2026-06-08-isenberg-tabah-become-ai-native.md) prescribe an AI-native operating model built on a living context layer: "capture, curate, store… agents both retrieve from and update this shared memory." More captured context is the moat.

### Claim B: Practice context minimalism

[Reflecting on a Year of Claude Code](sources/2026-06-08-claude-code-one-year.md) prescribes context *minimalism* for newer models: "give the model only what it needs… avoid overloading the prompt… replaced heavy context engineering."

### Current Resolution

Recorded, not silently resolved (per dream-sequence rule). Proposed reconciliation: the two claims describe different objects — the context layer is the **searchable store of record**, while minimalism is **injection discipline at inference time**; tools let an agent *fetch* the needed slice rather than dumping the whole layer into the prompt. This is the same store-vs-inject distinction as [Capture vs Processing](concepts/capture-vs-processing.md). The reconciliation is a hypothesis, not yet confirmed against the primary transcripts.

### Status

Open — reconciliation proposed, unconfirmed. Tracked in [AI-Native Organization](concepts/ai-native-organization.md) "Contradictions or Tensions" and [open-threads.md](open-threads.md).

### Sources

- [Become AI Native (Isenberg / Tabah)](sources/2026-06-08-isenberg-tabah-become-ai-native.md)
- [Reflecting on a Year of Claude Code](sources/2026-06-08-claude-code-one-year.md)
- [AI-Native Organization](concepts/ai-native-organization.md)

