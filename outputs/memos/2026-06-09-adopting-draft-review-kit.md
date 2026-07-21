# Memo: Adopting the Draft Review Kit for Your Own Writing

- Date: 2026-06-09
- Type: Implementation memo (interpretation + recommendation)
- Grounded in: [Draft Review Kit repo](../../wiki/sources/2026-06-08-draft-review-kit-repo.md), [Katie Parrott article](../../wiki/sources/2026-06-08-katie-parrott-draft-review-kit-every.md), [Review Skills](../../wiki/concepts/review-skills.md), [Reviewer Orchestration](../../wiki/concepts/reviewer-orchestration.md), [AI Writing Tells](../../wiki/concepts/ai-writing-tells.md)

> **How to read this.** Lines under "What's true" are source-backed (see linked pages). Lines under "Recommendation" are my judgment for your setup, not source claims. The kit is tuned to one author (Katie Parrott) and Every's house style; the value comes from adapting it to *your* tics, not running it as-is.

## TL;DR

Install a **3-skill starter set** (`guardrails` adapted, `asshole`, `line-edit`), run it on one real draft, then grow the kit only as you discover your own recurring weaknesses. Don't install all 13 on day one — most of the value is in the act of encoding *your* standards, not in collecting reviewers.

## What's true (from the sources)

- The kit is a plugin of **13 reviewer skills**, each a plain-Markdown `SKILL.md` you can copy into any agent's skills directory.
- Install in Claude Code: `/plugin marketplace add EveryInc/draft-review-kit` then `/plugin install draft-review-kit@draft-review-kit-local`; restart after. Codex has an equivalent `codex plugin marketplace add` flow.
- The skills are **feedback-only** — they critique existing prose; they do not draft.
- The reviewers group into: big-picture (`dev-edit`, `guardrails`, `panel`, `debate`), reader-response (`asshole`, `mom`, `eli5`), craft lenses (`hitchcock`, `sorkin`, `vonnegut`, `sedaris`, `hemingway`), and final editing (`line-edit`).
- `guardrails` is the centerpiece: built from a real list of the author's flagged failures, with a self-updating catalog (watch-item → promoted rule), producing a tiered findings report rather than a rewrite.
- The repo is a **public subset**: skills named in the article but *not* shipped include `ai-check`, `tighten-draft`, `kate-top-edit`, and the `working-overtime` column skill. `guardrails` categories 5–6 are Working Overtime-specific and won't apply to your writing.

## Recommendation: a phased rollout

### Phase 0 — Install, don't adopt yet

Pull the repo into Claude Code and install the plugin. Read the README and skim `skills/guardrails/SKILL.md` and `skills/panel/SKILL.md` so you know the shape of a reviewer before you change one.

### Phase 1 — Starter set (install + actually use these three)

| Skill | Why it's first | Adapt before use? |
|---|---|---|
| `guardrails` | The highest-leverage reviewer and the one most worth personalizing. | **Yes — heavily.** Strip Categories 5–6 (Working Overtime tics) and the Katie-specific fingerprint phrases. Keep Categories 1–4 (clarity/evidence, argument, mechanics, AI tells), which are genuinely universal. |
| `asshole` | Cheapest way to find unearned claims; attacks the weakest version of your argument. | No — works out of the box. |
| `line-edit` | Sentence-level polish once the big calls are made. | No. |

Run all three on **one draft you know well**. Per the article's loop: note what each caught, what it got wrong, what it missed, then have the agent update that skill's `SKILL.md` with the feedback. Repeat until the output is useful. This iteration *is* the product.

### Phase 2 — Add by symptom, not by collection

Add a reviewer only when you notice the matching weakness in your own drafts:

- Reader loses the thread / too much jargon → `mom`, then `eli5`
- Drafts feel slow or bloated → `sorkin` (pace), `hemingway` (cut)
- Argument/narrative needs tension → `hitchcock`; story logic → `vonnegut`
- Writing feels flat / humorless → `sedaris`
- Structure still moving early on → `dev-edit` (run before line-level reviewers)

### Phase 3 — Orchestrate only for high-stakes drafts

`panel` convenes 4–6 reviewers and a synthesizer that **preserves disagreement** rather than smoothing it (see [Reviewer Orchestration](../../wiki/concepts/reviewer-orchestration.md)). Worth it before publishing something that matters; overkill for routine drafts. Note: `panel`'s `SKILL.md` references `compound-writing:review:*` subagent types and a `.status.yaml`, so expect to adjust its spawn wiring to your setup before it runs cleanly.

## Suggested per-stage workflow (steal and trim)

1. **Outline:** `asshole` (and `hitchcock` if it's a tension piece) — beat up the argument before you have prose to defend.
2. **Section drafts:** `guardrails` after each section, while smoothing is still local.
3. **Full draft:** `dev-edit` for structure, then `panel` for high-stakes pieces.
4. **Final pass:** rerun `guardrails` (revisions reintroduce tells), then `line-edit`.

## Caveats to plan around

- **Personalization is the work.** A reviewer tuned to someone else's "pathology" isn't portable; the README explicitly invites deleting reviewers and renaming the rest. Budget time to encode *your* standards.
- **Subset risk.** If you want `ai-check`/`tighten-draft`-style passes, you'll build them yourself — they're not in this repo. (Tracked as a watch-item in [stale-claims.md](../../wiki/stale-claims.md).)
- **Naming matters less over time.** The article notes sticky skill names matter "less true with every model release" as models get better at tool selection — don't over-invest in clever names.
- **More setup, not less work.** Per [After Automation](../../wiki/concepts/after-automation.md), this shifts effort from drafting to standard-setting and adjudicating feedback. The payoff is cleaner drafts *and* clearer self-knowledge of your own preferences — but it is added work up front.

## Next actions

- [ ] Install the plugin and read `guardrails`/`panel` SKILL.md.
- [ ] Fork `guardrails`, strip Working Overtime categories, keep Categories 1–4.
- [ ] Run the 3-skill starter set on one known draft; iterate each SKILL.md once.
- [ ] Decide whether to build a personal `ai-check` equivalent.

## Related pages

- [Review Skills](../../wiki/concepts/review-skills.md)
- [AI Writing Tells](../../wiki/concepts/ai-writing-tells.md)
- [Reviewer Orchestration](../../wiki/concepts/reviewer-orchestration.md)
- [After Automation](../../wiki/concepts/after-automation.md)
