# 2026-07-27 Optional Upgrades — Implementation Report

Session-after-the-audit work. The 2026-07-27 audit (see `2026-07-27-audit-implementation-report.md` and `second-brain-audit-2026-07-27.html`) closed all 17 findings and queued three user-approved "optional upgrades" in `HANDOFF.md`. This memo documents the implementation of all three, plus the session's verification steps, per item: motivation, implementation, problems encountered, and solutions.

**Commits produced this session:**

| Repo | Commit | Content |
|---|---|---|
| KB (`az9713/second-brain-no-obsidian`) | `aaaccb1` | Re-grounding: 13 wiki files (8 sources + 5 concepts) |
| Toolkit (`az9713/second-brain`) | `e1e7855` | `scripts/guard-raw-write.py` Bash/PowerShell extension |
| KB | `7520900` | `.claude/settings.json` matcher + HANDOFF.md refresh |
| KB | (this memo's commit) | This report + memo index update if any |

Invariant checker (`python C:/Users/simon/second-brain/scripts/check-invariants.py`) was run before starting, after the re-grounding, and after the final commit — green every time (49 effective manifest records, 15 skip records, 14 `.vtt` still `unprocessed` awaiting the scheduled dream run).

---

## Item 1 — Re-ground the 9 `generated-summary` source pages

### Motivation

The audit introduced evidence tiers on every source/concept page. Nine source pages from the 2026-06-08 batch carried the weakest tier, `generated-summary` — meaning their claims were paraphrases of an LLM summary of an auto-caption transcript, two removes from the source. The clean transcripts existed all along at `raw/today_MMDDYYYY_brain_dump/today_06082026/video_sources/<id>/transcript.clean.txt` (relinked during the audit), so the pages could be re-grounded against first-hand text: verify every claim, correct summary-induced drift, and upgrade the tier honestly.

### Implementation

1. **Mapping.** `wiki/source_manifest.jsonl` records with `raw_file` ending in `transcript.clean.txt` carry a `pages_touched` field; this gave an exact video-ID → wiki-page map for 7 pages:

   | Video ID | Page |
   |---|---|
   | `ain0OoBx74A` | `2026-06-08-kantrowitz-apple-wwdc-ai.md` |
   | `hObRMv6qCi0` | `2026-06-08-allin-arora-ai-cybersecurity.md` |
   | `Hth_tLaC2j8` | `2026-06-08-claude-code-one-year.md` |
   | `hzAcDU1FYDo` | `2026-06-08-nate-jones-meta-ai-layoffs.md` |
   | `ktl8mNiWqMM` | `2026-06-08-a16z-benedict-evans-coding.md` |
   | `LztPaNmcWGU` | `2026-06-08-isenberg-tabah-become-ai-native.md` |
   | `P2HJEz3oqLs` | `2026-06-08-diamandis-takeoff-singularity.md` |

   The two exceptions, per the handoff spec: `2026-06-08-semianalysis-quadruped-market.md` re-grounds from the captured HTML article snapshot (`raw/.../source_snapshots/01_quadruped_state_of_the_market_unitree.html`) and upgrades to `primary`; `2026-06-08-gpt55-jay-second-brain-analysis.md` stays `generated-summary` because the summary IS the source artifact.

2. **Execution: 8 parallel subagents**, one per page, each given: the page path, the source-of-truth path, instructions to check every factual claim line-by-line, correct misstatements/exaggerations/misattributions with minimal edits (preserving structure, wiki-links, voice; author synthesis clearly framed as such may stay), and to replace the tier line with the exact canonical wording already used elsewhere in the KB:
   - `- Evidence tier: transcript - a transcript of the talk; content is first-hand but transcription-noisy and not independently verified`
   - `- Evidence tier: primary - the original artifact itself was captured`

   Hard constraints in every agent prompt: never write under `raw/`, use the Edit tool only (no shell redirects) so UTF-8 encoding is preserved. Parallelism kept ~350 KB of transcripts out of the orchestrating context; each agent cost 30–47k tokens and 70–175 s.

3. **Verification.** Post-hoc grep confirmed exactly one source (`gpt55-jay`) still carries `generated-summary`; checker green.

### Problems encountered and solutions — the drift findings

This is the substantive payoff. **5 of 9 pages had real drift**; two findings were outright fabrications, not paraphrase noise.

- **`diamandis-takeoff-singularity` (worst page — two fabrications):**
  1. Page claimed a five-motive layoff taxonomy ("capex tradeoffs, visionary redesign, productivity metrics, narrative/hope, non-AI business problems") attributed to the panel. The transcript contains exactly one layoff statement (Salem): a ton of white-collar layoffs are coming, driven by redesign, "not around cost cutting." The taxonomy was invented — almost certainly cross-contamination from the Nate Jones video (which genuinely has a five-category framework) during batch summarization. **Fix:** bullet rewritten to the redesign-not-cost-cutting claim only.
  2. Page claimed "seven mechanisms" make AI-infra news move markets "violently", with an itemized list. The word "violently" never appears in the transcript and no seven-way framing exists. What is actually said: Peter names **three factors** behind the market drop (strong jobs report cutting rate-cut odds; Broadcom's lower AI-chip guidance raising the capex-peaking question; profit-taking as "innermost loop" infra/chip/energy companies peak), and Dave separately raises S&P 500 index-inclusion ineligibility for mega-IPOs (SpaceX, Anthropic), underwriting-liquidity limits, and a decade-long volatility rise amplified by quant traders. **Fix:** bullet rewritten to the grounded content.
- **`nate-jones-meta-ai-layoffs`:** (a) category-5 parenthetical inflated to "(overhiring, margin pressure, weak demand, debt, management failure)" when the transcript names only business distress and overhiring → corrected; (b) the Dorsey/Block critique was misdescribed as "incomplete without operational detail and metrics" when the transcript's critique is about not thinking through human/change-management implications → corrected; (c) a leftover Limitations line still described the page as "a generated second-order summary," contradicting the new tier → updated to say the page synthesizes directly from the transcript.
- **`a16z-benedict-evans-coding`:** (a) page framed "whether AI makes software more or less consolidated" as unresolved, but Evans answered directly — more competition ("way cheaper and quicker to build software"), hedging only on margin/pricing structure → reframed; (b) "Anthropic focused heavily on coding and enterprise developer workflows" — "enterprise" is unsupported; the transcript's contrast is Anthropic (less capital, focused, "got coding working") vs OpenAI (everything at once) → qualifier removed, contrast tightened.
- **`claude-code-one-year`:** Summary listed "operations" among domains discussed; the only "ops" hits in the transcript are substrings of "loops". Actual domains: engineering, product/PM, design, data science, finance → corrected.
- **`isenberg-tabah-become-ai-native`:** speed claim had wrong timescale and wrong artifact — page said "same-day prototype + usability test beats a static strategy memo"; transcript says a prototype in **under 10 minutes** vs **weeks/months writing a PRD** → corrected. Stale Limitations provenance line replaced with a concrete note on auto-caption noise, citing observed glitches ("Peter Teal" for Peter Thiel, "Commodore Amigga" for Amiga).
- **Clean pages (no drift):** `kantrowitz-apple-wwdc-ai` (7/7 claims verified, including the garbled-names caveat already on the page), `allin-arora-ai-cybersecurity` (all claims verified, including the nuance that Arora's worry targets small offices/legacy/OT rather than large enterprises), `semianalysis-quadruped-market` (all claims match the pre-paywall article body; four-layer market split, vendor positioning, Unitree cost/flywheel, security-risk framing, 2025-10-20 publish date all confirmed).

**Lesson recorded:** generated summaries did not just lose fidelity — they *invented structure* (taxonomies, enumerated mechanism lists, punchy quote-words like "violently") that reads as more authoritative than the grounded content. Structure-shaped claims from summaries deserve the most suspicion.

---

## Item 1b — Tier propagation into concept pages (weakest-tier rule)

### Motivation

Nine concept pages inherited `generated-summary` from their weakest underlying source. With sources upgraded, concepts had to be recomputed — and, it turned out, content-checked.

### Implementation

Citation map built by grepping each tainted concept for `2026-06-08-*` source references, then applying weakest-tier over the post-upgrade source tiers:

- **Upgraded to `transcript` (5):** `ai-capex-and-market-volatility`, `ai-native-organization`, `ai-stack-value-migration` (cites `primary` semianalysis + three transcripts → weakest is transcript), `layoffs-as-strategy-signals`, `verification-as-bottleneck`. Canonical concept tier line used: `Evidence tier: **transcript** - inherited from the weakest underlying source. Claims rest on talk transcripts; first-hand but not independently verified.`
- **Stay `generated-summary` (4):** `dream-sequence`, `knowledge-base-lint`, `llm-maintained-wiki`, `second-brain-operating-model` — all cite `gpt55-jay-second-brain-analysis`, which stays at the weakest tier by design.

Tier flips were applied with a small Python `str.replace` over the exact old line (UTF-8 explicit read/write, per the PS5.1 encoding rule), asserting the old line existed in each file before replacing.

### Problem encountered and solution — fabrications had propagated into concepts

A tier flip alone would have left corrected sources contradicted by their own concept pages. Grepping the concepts for the fabricated framings found two contaminated pages:

- **`ai-capex-and-market-volatility.md`:** its second Source-Backed Claim repeated the entire fabricated "seven mechanisms … 'violently'" list, cited to the Diamandis page. Three edits: (1) bullet rewritten to the grounded three-factors + index-inclusion/liquidity/quant content; (2) the Interpretation's parenthetical "(liquidity, crowding, momentum)" — which summarized the fabricated list — rewritten to "(rate expectations, profit-taking, index-inclusion mechanics, quant amplification)"; (3) an Open Question attributing a "crowded trade" description to the Diamandis panel reattributed to the July 2026 BofA fund-manager survey already cited in the page's Re-Verification section (which is where that claim is actually grounded).
- **`layoffs-as-strategy-signals.md`:** (1) bullet claiming the Diamandis roundtable "independently makes the same distinction" across five motives rewritten — the roundtable corroborates only the redesign-vs-cost-cutting move and offers no taxonomy; (2) the Interpretation's lead sentence "Two independent sources converging on the same five-way taxonomy is the strongest signal in this pairing" was now factually false — rewritten to state the taxonomy is Jones's alone, with Diamandis corroborating only its central move. Note this *weakened* the concept's headline evidence claim, deliberately: the apparent two-source convergence was an artifact of summary cross-contamination.

**Lesson recorded:** when a source page's claims change, grep downstream concept pages for the *removed claim's distinctive phrases*, not just for tier lines. Tier propagation is mechanical; claim propagation is not.

---

## Item 2 — raw/ write guard extended to Bash/PowerShell

### Motivation

Audit finding: the PreToolUse hook (`guard-raw-write.py`) guarded only `Write|Edit|NotebookEdit` via their `file_path`/`notebook_path` inputs. Shell redirects (`echo x > raw/...`) and shell file verbs (`rm`, `mv`, `Set-Content`, …) could still write under `raw/` — which is a symlink into `C:\Users\simon\Downloads\projects`, the user's live projects tree, outside the vault's git. The audit compared two options: an NTFS deny-write ACL for the agent context vs extending the hook to shell tools.

### Decision

**Hook extension**, for three reasons: (1) zero risk to the user's own normal write access (an ACL scoped wrongly could lock the user out of their projects tree); (2) no OS-level state to remember/undo; (3) same enforcement point and error-message style as the existing guard. The ACL remains the documented upgrade path if the hook's ceiling ever matters.

### Implementation

Toolkit commit `e1e7855`, KB commit `7520900`.

- `scripts/guard-raw-write.py` refactored: the path-prefix check (unchanged: `os.path.realpath` then prefix-compare against `PROTECTED = [KB raw/, Downloads/projects]`) and a new command-text check now live in a `check(payload) -> Optional[str]` function; the `__main__` block reads the hook JSON from stdin and exits 2 with the message on a block.
- Command-text heuristic — blocks when BOTH patterns match the `tool_input.command` string:
  - `PATH_PAT`: protected-path spellings — `second-brain[/\\]raw`, `Downloads[/\\]projects`, or a standalone `raw/`/`raw\` token (negative lookbehind so e.g. `foo-raw/` or `.raw/` inside other names don't match).
  - `WRITE_PAT`: write-capable constructs — `>`/`>>`, `tee`, `rm|mv|cp|touch|mkdir|ln|rsync|dd|unzip|truncate`, `sed -i`, tar-extract, and PowerShell `Out-File|Set-Content|Add-Content|New-Item|Copy-Item|Move-Item|Remove-Item`.
- `.claude/settings.json` matcher extended: `"Write|Edit|NotebookEdit|Bash|PowerShell"` — same script serves both shapes (it branches on whether `file_path`/`notebook_path` or `command` is present).
- A `--selftest` mode runs assert-based block/allow cases (file write into raw, redirect into raw, `rm -rf` on projects, `Set-Content` into raw, `mv` into raw must block; wiki writes, `grep`/`ls`/`cat` over raw, redirects to /tmp, unrelated git commands must pass). Verified passing, plus one live stdin invocation confirming exit code 2 and the block message.

### Problems encountered and solutions

1. **Refactor bug caught on read-back:** the original script did `json.load(sys.stdin)` at module top-level. After the refactor moved input handling into `__main__`, the old top-level read was still present — it would have consumed stdin at import time and hung/short-circuited `--selftest` (and made `check` unreachable in the malformed-input path). Removed the stray block; selftest passed afterward. (General reminder: after editing around module-level side effects, re-read the whole file top to bottom.)
2. **Known false positives, accepted deliberately:** the heuristic blocks any command *mentioning* a protected path that also *contains* a write construct — including reads-from-raw that write elsewhere, e.g. `cp raw/x scratch/` or `grep foo raw/x > /tmp/out`. Workaround is always available: use the Read/Grep tools for raw content, or split into a read step and a separate write step that doesn't mention raw/. Chosen over target-parsing because shell strings can't be reliably parsed by regex and the failure mode (an occasional blocked command with a clear message) is cheap.
3. **Known ceiling, documented in-script:** writes hidden inside interpreters (`python -c "open('raw/x','w')..."`, `node -e ...`) are invisible to the text heuristic. The in-script ponytail comment names the upgrade path: NTFS deny-write ACL on the projects tree for the agent context. Not implemented today by explicit choice (risk asymmetry above).

---

## Item 3 — Coverage pass over raw/

### Motivation

`raw/` (→ `Downloads/projects`) is the user's whole projects tree; the wiki's manifest covers only what was deliberately registered. Per `docs/two-brain-boundary.md`, wiki registration is **opt-in curation** (the cerebras brain is the default landing zone), so the task was to *surface* recent uncovered material as candidates — recommend, never auto-register.

### Implementation

Single Python scan (no per-file shelling, per the Git-Bash-spawn-cost rule): parse `wiki/source_manifest.jsonl`, take the first path segment under `raw/` of every `raw_file`/`source_root` as the covered set; list `raw/`'s top-level directories with mtimes; sort descending; report coverage.

### Findings

- **4,163** top-level directories under `raw/`; only **3** have any manifest coverage: `_CORE`, `graphify_obsidian_chase_ai`, `today_MMDDYYYY_brain_dump`.
- Top 10 uncovered by recency (2026-07-23 → 07-26): `compound_engineering_every`, `today_07262026`, `hmm_regime_app_base44`, `gemini_cli_rename_blandford_thorne`, `documentary_elevenlabs`, `tokenized_stocks_a16z`, `startup_durable_YC`, `agent_dreams_me`, `my-career-board`, `today_07242026`. (Next after those: `agent_weeklong_fareed_khan__SKIP` — explicitly suffixed `__SKIP`, so not recommended; then `eve_agent_cole_medin`, `google_information`, `ai_micro_drama_a16z`, `mongo_db_molly`.)
- Nothing registered. Candidates listed in HANDOFF.md; user picks.

### Problems encountered

None. Note for interpretation: top-level mtime on Windows reflects direct-child changes, not deep-tree changes, so this is a "recently active at the top level" heuristic — good enough for a candidate list, not an audit.

---

## Session verification context (not a change, but load-bearing)

- The Mon 16:45 scheduled task `Claude-Dream-Sequence` had **not yet fired** when the session ran (11:28 PDT; `schtasks` showed Status Ready, next run 7/27 16:45; newest brief was 2026-07-21; the toolkit log `.ignore/dream-sequence-task.log` did not exist yet — expected, since the task had never fired since creation). The 14 registered-`unprocessed` `.vtt` files therefore remain for that run to fold. Next session must confirm it fired (log + newest `outputs/briefs/`) and run the dream sequence manually if not.
- All shell writes this session avoided PS5.1 `Set-Content`/`Out-File` defaults (UTF-8 rule); wiki edits used harness Edit/Write tools or explicit-UTF-8 Python.

## Methodology note (for future re-grounding passes)

The 8-parallel-subagent pattern worked well and is worth reusing: one agent per page, each prompt carrying (a) exact source-of-truth path from the manifest, (b) the canonical tier-line strings verbatim so wording stays uniform across the KB, (c) the never-write-raw/ and Edit-tool-only constraints, (d) an explicit "return a terse drift list" contract so the orchestrator gets structured findings without transcript bulk. Total cost ~310k subagent tokens for 9 pages including two full ~50 KB transcript reads each. The orchestrator's job is then only: mapping, propagation, contamination-grep, checker, commits.
