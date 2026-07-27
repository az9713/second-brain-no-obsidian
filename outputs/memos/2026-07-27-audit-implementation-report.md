# Audit Implementation Report - 2026-07-27

Implements the findings of `second-brain-audit-2026-07-27.html` (repo root). Constraint honored: **no file was deleted**. Toolkit commits: `e9ae06c` (initial), `a3ea752`. KB changes are left uncommitted for review.

## Done (14 of 17 findings)

| # | Finding | What was done |
|---|---|---|
| 1 | No heartbeat | Discovered the weekly `Claude-Dream-Sequence` Windows task **already exists and is enabled** (created 2026-07-21, Mon 16:45 - the docs claiming "not enabled" were stale). Hardened its runner (`scripts/run-dream-sequence.ps1`): phase-0 checker gate + lint-only fast path when no new content. Docs corrected. |
| 2 | Provenance rot (28/41 dead) | **The folder was never deleted** - `raw/today_06082026/` had been moved to `raw/today_MMDDYYYY_brain_dump/today_06082026/`. All 26 records relinked to the new path; the 2 inbox records relinked to the KB-local `raw.archive-20260608-184049/` snapshot. 27 files re-verified against stored SHA-256 hashes - **all match**. Dead provenance: 28 → 0. |
| 3 | No ledger transactionality | New deterministic checker `C:/Users/simon/second-brain/scripts/check-invariants.py` (read-only, exit 1 on violation): JSONL validity, duplicate registrations, manifest↔processed.md↔pages consistency, provenance resolution, encoding hygiene, broken links, overdue `Review by:` dates, skip-ledger aggregation. Wired in as mandatory phase 0 (start AND end) of the dream-sequence skill. Currently: **all invariants hold**. |
| 4 | Overdue stale claims | Web re-verification pass done; both windows cleared. Highlights: AI-capex "crowded trade" **confirmed** (BofA July survey: 82% call semis most crowded, zero shorts); Meta-capex-reallocation **confirmed** (Zuckerberg's July admission AI "hasn't really accelerated"); Microsoft/OpenAI **moved** (April 2026 non-exclusive restructuring); Apple WWDC pre-event claims **confirmed by the event** (Siri AI on custom Gemini). `stale-claims.md` rewritten with verdicts, source links, and machine-parseable `Review by:` dates (next: 2026-08-03 market, 2026-08-26 capability) that the checker enforces. Notes propagated to 2 concept pages + 1 source page. |
| 5 | raw/ write-protection | PreToolUse hook (`.claude/settings.json` in the KB + `scripts/guard-raw-write.py`): blocks Write/Edit/NotebookEdit whose real path resolves into `raw/` or the projects tree. Tested: raw path blocked (exit 2, symlink resolved), wiki path allowed. |
| 6 | Toolkit unversioned | `git init` done; two commits. Dream reports must now stamp the toolkit commit hash (skill updated). |
| 7 | Encoding corruption | BOM + mojibake + JSONL checks in the checker; `[IO.File]` BOM-less UTF-8 rule added to the skill's Safety section. |
| 8 | Evidence tiers | Tier field added to both templates; all 14 source pages graded (2 primary, 3 transcript, 9 generated-summary); all 16 concept pages carry the inherited weakest tier (4 primary, 3 transcript, 9 generated-summary). |
| 9 | Two-brain boundary | `docs/two-brain-boundary.md`: wiki = curated claims (authoritative for beliefs), cerebras brain = bulk recall (authoritative for existence/location); routing rule, tiebreaker, gbrain declared non-authoritative. |
| 10 | Skip-ledger unaudited | Checker aggregates by reason/extension every run (current: 14 .vtt unknown_extension, 1 .png binary). |
| 11 | Duplicate registries | `processed.md` header now declares the manifest as source of truth; consistency machine-checked. |
| 12 | Dead manifest rows | Resolved by relinking (see #2) - better than pruning; rows carry `relinked_date` + `relink_note`. |
| 14 | Retrieval tripwire | Defined in the architecture doc: >100 pages or >150 index lines or a query-wiki miss → hub pages + template tags first, embeddings last. |
| 17 | README migration table | Replaced with a one-line pointer to `docs/global-toolkit-split.md`. |

## Problems encountered and resolutions

- **Audit premise was partly wrong (good news).** Two "critical" findings were half-solved already: the scheduled task existed (stale docs said otherwise), and the "deleted" folder was actually moved. Resolution: verified reality first (schtasks query; SHA-256 comparison), then relinked instead of tombstoning.
- **Checker false positives on first run.** The processed.md match failed on an em-dash variant of a source name. Fixed by also matching on `raw_file` path.
- **`.vtt` transcripts remain unregistered** (skip ledger). Not silently fixed - surfacing it is the checker's job; registering .vtt is a capture-policy decision for you.
- **Windows terminal renders em-dashes as replacement characters** in checker output - cosmetic console-codepage artifact, not file corruption (files verified clean). (Amusingly, the first draft of this very bullet quoted the replacement character literally and the checker flagged this memo as mojibake - reworded.)

## Follow-up round (2026-07-27, user-approved) - all 17 findings now closed

1. **Finding 15** - DONE: `broken-links.md`, `orphaned-pages.md`, `duplicate-candidates.md` folded into `lint.md` (Integrity Trackers section) and deleted; all references updated (index, concept page, architecture doc, dream-sequence skill).
2. **Finding 16** - DONE: `log.md` compacted to one line per event; full detail remains in git history and `outputs/briefs/`.
3. **Finding 13** - closed by relinking; the 14 `.vtt` skip rows are now marked `superseded_registered`.
4. **.vtt registration** - DONE: 14 files registered (run `20260727-audit-vtt-registration`) with sizes + SHA-256; `processing_status: unprocessed`, so the next dream run folds them (checker fast-path now correctly reports "full run needed").
5. **Toolkit remote** - DONE: pushed to private `github.com/az9713/second-brain`.
6. **KB committed and pushed** to its existing `second-brain-no-obsidian` remote.

## Outstanding issues / known ceilings

- The write guard covers the file tools only; a `Bash` shell redirect could still write under `raw/`. OS-level ACL is the upgrade if that ever matters.
- The scheduled task runs "Interactive only" - it fires only while you're logged on. First scheduled run: **today (Mon) 16:45**; check `.ignore/dream-sequence-task.log` after.
- Herk batch's 6 superseded manifest rows (the 2026-06-09 double registration) remain as history; checker understands last-record-wins semantics.
- The 3 today_ generated-summary source pages could be re-grounded from the now-resolvable clean transcripts (`transcript.clean.txt`) to upgrade their tier - worthwhile, not urgent.
- KB changes are uncommitted; toolkit has no remote (unrecoverable-loss window is only half closed - add a private remote when convenient).

## Verification

- `check-invariants.py`: **OK - all invariants hold** (35 effective manifest records, 0 dead provenance, 0 broken links, 0 encoding violations, 0 overdue reviews).
- Guard hook: block/allow self-test passed.
- 27 relinked files SHA-256-verified against manifest hashes recorded at capture time.
