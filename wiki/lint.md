# Wiki Lint Report

## Last Lint Run

2026-07-21 (dream sequence - reconciliation and integrity run)

## Summary (2026-07-21 run)

- New raw files processed: 0 new content; 3 registered files from `raw/_CORE/_claude_code/claude_subagents_herk__GOOD_ONE/` reconciled - their wiki pages were created 2026-06-09 but the manifest was never marked processed. Superseding processed records appended; the accidental double registration (runs `063425` and `064602`) deduped in the superseding records.
- Broken links found: 0 across all 40 wiki pages (scripted check of internal Markdown links).
- Orphaned pages found: 0 by inbound-link check, but 2 pages were missing from `index.md` (`sources/2026-06-09-nate-herk-claude-subagents.md`, `concepts/subagent-orchestration.md`) - repaired this run.
- Stale claims: both scheduled review windows are OVERDUE (7-day market claims due 2026-06-15; 30-day model-capability claims due 2026-07-08). Flagged in `stale-claims.md`; claims not re-verified this run - re-verification needs web checks and user attention.
- Contradictions found: 0 new.
- Duplicate candidates found: 0 new.

## Raw Provenance Integrity (2026-07-21 run) - ACTION NEEDED

First integrity check of manifest paths against the linked `raw/` tree:

| Finding | Records affected | Detail |
|---|---|---|
| `raw/today_06082026/` no longer exists | 26 manifest records | The folder was moved or deleted from the user's projects tree after processing. Wiki source pages remain valid (content was synthesized before removal), but provenance paths no longer resolve and sources cannot be re-read or re-verified. |
| `raw/inbox/2026-06-08-draft-review-kit-every/` no longer under `raw/` | 2 manifest records | Content now lives only in the KB-local `raw.archive-20260608-184049/inbox/` snapshot from before the linked-raw migration. |
| Resolving correctly | herk (3 files), graphify (2 files) | No action. |

Recorded, not resolved, per policy. Options for the user: (a) accept that the today_06082026 batch is now wiki-only knowledge with dead provenance links, and annotate the affected source pages; (b) restore or re-link the folder and re-register. Encoding hygiene was also repaired this run: UTF-8 BOMs stripped from 9 wiki files and mojibake em/en dashes fixed (PowerShell 5.1 Set-Content/Out-File encoding trap - future writes should use BOM-less UTF-8).

---

## Previous Run

2026-06-08 (dream sequence - graphify_obsidian_chase_ai batch)

## Summary

- New raw files processed: 2 registered files from linked source `raw/graphify_obsidian_chase_ai/` (1 transcript, 1 generated summary)
- Source pages created: 1
- Concept pages created: 1
- Contradictions found: 0 new cross-source factual contradictions; 1 operational tension recorded inside [Semantic Graph Import](concepts/semantic-graph-import.md)
- Stale claims found: 1 product/workflow watch-item recorded for Graphify/Obsidian export behavior
- Duplicate candidates found: 0; `semantic-graph-import` checked against `llm-maintained-wiki` and `second-brain-operating-model`, kept distinct and cross-linked
- Orphaned pages found: 0; both new pages are linked from `index.md` and cross-link existing pages
- Broken links found: 0 in newly touched Markdown pages after local link check
- Missing provenance found: 0; source-backed claims route through the new source page, and source limitations are stated

## Provenance Note (graphify_obsidian_chase_ai batch)

This batch synthesizes a YouTube transcript plus a generated summary. Claims about Graphify, Obsidian, and Claude Code are preserved as source claims from the video/summary, not independently verified facts.

## Actions Taken (graphify_obsidian_chase_ai batch)

- Folded the linked source into [Chase AI - Graphify + Obsidian](sources/2026-06-08-chase-ai-graphify-obsidian.md).
- Created [Semantic Graph Import](concepts/semantic-graph-import.md) and linked it from core second-brain operating pages.
- Updated `index.md`, `processed.md`, `source_manifest.jsonl`, `stale-claims.md`, `duplicate-candidates.md`, `orphaned-pages.md`, `broken-links.md`, `open-threads.md`, and `log.md`.

## Actions Deferred (graphify_obsidian_chase_ai batch)

- Decide whether this vault should standardize a `graph-imports/` quarantine folder for future Graphify exports.
- Verify current Graphify command behavior before using it for a real repo import.

## Prior Run - today_06082026 batch (2026-06-08)
- New raw files processed: 26 registered files from linked source `raw/today_06082026/` (1 article + snapshot, 7 video transcript sets, 8 generated summaries, overview/manifest files)
- Source pages created: 8
- Concept pages created: 5
- Contradictions found: 1 new cross-source contradiction recorded (context-layer vs. context-minimalism, C-2026-06-08-002) — recorded, reconciliation proposed, unconfirmed; not silently resolved
- Stale claims found: 12 watch-items recorded (forecast-dense batch: 5 market/finance @ 7-day, 5 model-capability @ 30-day, 2 pre-event/product)
- Duplicate candidates found: 0 (3 candidate pairs checked and kept distinct)
- Orphaned pages found: 0 (all 13 new pages linked from `index.md`)
- Broken links found: 0 (76 internal links checked; 1 typo caught and fixed mid-run)
- Missing provenance found: 0 (every source-backed claim links to a source page; interpretation separated; second-order-summary provenance flagged on each source page)

## Provenance Note (this batch)

These source pages synthesize **generated second-order summaries** of auto-caption transcripts and a partial article body — not the primary transcripts. The "claims, not verified facts" framing is preserved on every source page's Limitations section, and forecast claims are tracked in `stale-claims.md` rather than asserted.

## Actions Taken (today_06082026 batch)

- Folded the linked source into 8 source pages and 5 cross-cutting concept pages (each concept grounded in 2+ sources).
- Recorded the headline cross-source tension (context layer vs. context minimalism) in `contradictions.md` and inside `concepts/ai-native-organization.md`; proposed but did not assert a reconciliation.
- Added an "AI Market & Operating Shifts" concept section, 8 source entries, and 5 query starting points to `index.md`.
- Marked all 26 manifest records processed programmatically with per-file `pages_touched`; added 8 rows to `processed.md`.
- Added 12 stale-claim watch-items with review dates; added batch research questions to `open-threads.md`.
- Corrected the corrupted prior `log.md` capture-folder entry (`$sourceName`/`$runId`/`aw/`) — noted as a provenance-integrity fix, not a silent history rewrite.

## Actions Deferred (today_06082026 batch)

- Confirm the context-layer/minimalism reconciliation against the primary transcripts.
- Re-check pre-event Apple WWDC claims once actual announcements/reporting land.
- Recommended output (not auto-created): a one-page "what changed in AI this week" brief synthesizing the 8 sources — offered in the dream report.

## Prior Run — draft-review-kit batch (2026-06-08)

## Summary

- New raw files processed: 23 (1 captured batch: article + repo)
- Source pages created: 2
- Concept pages created: 4
- Contradictions found: 0 new cross-source contradictions (productive tensions recorded inside concept pages)
- Stale claims found: 2 watch-items recorded
- Duplicate candidates found: 0
- Orphaned pages found: 0
- Broken links found: 0 (32 internal Markdown links checked, all resolve)
- Missing provenance found: 0
- Retrieval defects found: 0

## Contradictions

No new cross-source contradiction in this batch. The Draft Review Kit sources surface productive tensions (system-working vs. writer-losing; "more work" framing of [After Automation](concepts/after-automation.md) vs. this vault's [Capture vs Processing](concepts/capture-vs-processing.md) low-friction bet). These are recorded as "Contradictions or Tensions" sections inside the relevant concept pages rather than as cross-source factual contradictions in [contradictions.md](contradictions.md).

## Stale Claims

See [stale-claims.md](stale-claims.md). Two watch-items added for the Draft Review Kit batch (plugin/install mechanics and model-release-sensitivity of naming conventions).

## Duplicate Candidates

See [duplicate-candidates.md](duplicate-candidates.md). `review-skills` and `ai-writing-tells` were checked for overlap; kept separate (one is the mechanism, one is the catalog of what it catches).

## Orphaned Pages

See [orphaned-pages.md](orphaned-pages.md). All 6 new pages are linked from `wiki/index.md` and cross-link each other.

## Broken Links

See [broken-links.md](broken-links.md). All 32 internal links in the new pages were verified to resolve.

## Missing Provenance

No missing provenance. Every source-backed claim links to one of the two new source pages; interpretation is separated under "Interpretation" sections. SHA-256 hashes for `raw_text.txt` and the repo README are recorded on the source pages.

## Retrieval Problems

None. New query starting points were added to `wiki/index.md` for review skills, the Draft Review Kit, and AI writing tells.

## Actions Taken

- Folded the draft-review-kit capture batch into 2 source pages and 4 concept pages.
- Added an "AI-Assisted Writing" section and 3 query starting points to `wiki/index.md`.
- Verified all internal links resolve.

## Actions Deferred

- Reconcile the "more work" thesis ([After Automation](concepts/after-automation.md)) against the vault's capture-only low-friction bet once more sources accumulate.
- Re-check the repo's "subset of article skills" status and install commands if the upstream repo changes.

## Prior Runs

### 2026-06-08 — initial seed

- New raw files processed: 2; Wiki pages created: 7.
- Contradictions: 1 policy tension recorded. Stale/duplicate/orphan/broken/provenance/retrieval: 0.
- Made lint a first-class dream-sequence phase; created separate lint state files; linked all initial concept pages from `wiki/index.md`.


