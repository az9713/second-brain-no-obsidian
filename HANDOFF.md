# HANDOFF — resume point for second-brain KB

**Read this first each new session.** Live "what to do next"; standing conventions are in the toolkit's skills (`C:/Users/simon/second-brain/.claude/skills/`). Don't re-derive state — run the checker (below) and trust it.

## Current state (as of 2026-07-27)

- The full 2026-07-27 audit is implemented — all 17 findings closed. Details: `outputs/memos/2026-07-27-audit-implementation-report.md`; the audit itself: `second-brain-audit-2026-07-27.html` (repo root). KB commit `ed7470f`+ pushed to `github.com/az9713/second-brain-no-obsidian`; toolkit is now its own git repo pushed to private `github.com/az9713/second-brain`.
- Key new machinery: deterministic invariant checker `python C:/Users/simon/second-brain/scripts/check-invariants.py` (phase 0 of every dream run, read-only, exit 1 on violation); raw/ write-guard hook (`.claude/settings.json`); weekly scheduled task `Claude-Dream-Sequence` (Mon 16:45, logged-on only, log: `.ignore/dream-sequence-task.log`); evidence tiers on all source/concept pages; `Review by:` dates in `stale-claims.md` are machine-enforced (next: 2026-08-03 market, 2026-08-26 capability).
- 14 `.vtt` transcripts registered `unprocessed` (run `20260727-audit-vtt-registration`) — the next dream run folds them. The 2026-07-27 16:45 scheduled run was expected to do this: **check whether it ran** (log above + newest `outputs/briefs/`); if it didn't fire, run the dream sequence manually or wait for Monday.

## Optional upgrades — DONE 2026-07-27 (session after the audit)

1. **Re-grounding — done.** All 9 pages re-verified against real sources: 7 → `transcript`, `semianalysis-quadruped-market` → `primary`, `gpt55-jay` stays `generated-summary`. Real drift found and corrected in 5 pages — worst was `diamandis-takeoff-singularity` (a fabricated five-motive layoff taxonomy and an invented "seven mechanisms"/"violently" market framing, both of which had propagated into `ai-capex-and-market-volatility` and `layoffs-as-strategy-signals`; scrubbed there too). Concept propagation: 5 concepts → `transcript`, 4 citing `gpt55-jay` stay. Checker green.
2. **raw/ Bash write guard — done.** `guard-raw-write.py` now also inspects Bash/PowerShell command text (write-verb/redirect + protected-path heuristic, selftest via `--selftest`); `.claude/settings.json` matcher extended to `Bash|PowerShell`. Known ceiling (in-script comment): writes hidden inside `python -c` etc.; upgrade path is an NTFS deny-write ACL.
3. **Coverage pass — done.** ~4,160 top-level `raw/` folders, only 3 have manifest records. Top capture candidates (by mtime, 2026-07-23..26): `compound_engineering_every`, `today_07262026`, `hmm_regime_app_base44`, `gemini_cli_rename_blandford_thorne`, `documentary_elevenlabs`, `tokenized_stocks_a16z`, `startup_durable_YC`, `agent_dreams_me`, `my-career-board`, `today_07242026`. Not registered — wiki registration stays opt-in per `docs/two-brain-boundary.md`; user picks.

## Next task

- Confirm the Mon 16:45 `Claude-Dream-Sequence` run fired (log + newest `outputs/briefs/`) and folded the 14 `.vtt` transcripts; if it failed, run the dream sequence manually.
- If the user wants any coverage candidates above registered, run the capture flow on their picks.

If the user asks for something else, that takes precedence.

## Where to read things

- `wiki/lint.md` — integrity state (includes folded broken-links/orphans/duplicates trackers).
- `wiki/stale-claims.md` — claim verdicts + machine-checked review dates.
- `docs/two-brain-boundary.md` — wiki vs cerebras-brain routing/tiebreaker policy.
- Dream-sequence skill (`C:/Users/simon/second-brain/.claude/skills/second-brain-dream-sequence/SKILL.md`) — the 7-phase loop + phase-0 checker contract + UTF-8 safety rule.

## Session-transient scratch (already deleted; durable outputs are committed)

One-off Python scripts (provenance relink w/ SHA-256 verify, evidence-tier inserter, .vtt registrar) ran from the session scratchpad and were deleted after use — their effects are fully committed in `ed7470f`. Regenerate similar scripts from the manifest JSONL if ever needed; the checker validates the result.

## How to work

- Phase 0 always: run the checker before and after any wiki-touching work; never fold on a failing ledger.
- Writes: harness Write/Edit tools, or `[IO.File]` BOM-less UTF-8 — never PS5.1 `Set-Content`/`Out-File` defaults.
- Never write under `raw/` (hook enforces the file tools; be careful with Bash).
- Toolkit edits: commit + push in `C:/Users/simon/second-brain` (it's a repo now); stamp dream reports with its hash.
