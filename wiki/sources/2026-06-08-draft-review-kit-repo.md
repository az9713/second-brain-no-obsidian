# Draft Review Kit (EveryInc) u{2014} Repo

## Metadata

- Source type: Code/skills repository (Claude Code + Codex plugin)
- URL or origin: https://github.com/EveryInc/draft-review-kit
- Captured date: 2026-06-08
- Raw files: `raw/inbox/2026-06-08-draft-review-kit-every/draft-review-kit-main/`
- README hash: `38722CE7675F11CA5E4853A61A0CD56E1B7DBE675622A33699095A884A6FA010`
- Companion to: [Katie Parrott article](2026-06-08-katie-parrott-draft-review-kit-every.md)

## Summary

A small, installable kit of reusable "reviewer" skills for stress-testing drafts from an agentic writing environment (Claude Code, Codex, or any agent that supports reusable Markdown instructions). Each reviewer is a persona with one job. The kit is intentionally feedback-only: it does not generate ideas, hooks, outlines, or first draftsu{2014}it is used once prose exists.

## Source-Backed Claims

- The kit ships as a plugin installable via `/plugin marketplace add EveryInc/draft-review-kit` (Claude Code) or `codex plugin marketplace add EveryInc/draft-review-kit` (Codex).
- Each skill is plain Markdown (`SKILL.md`) and can be copied into any agent's skills directory.
- The repo contains 13 reviewer skills grouped by function:
  - **Big-picture review:** `dev-edit` (argument, structure, stakes, payoff), `guardrails` (evidence gaps, argument failures, AI-shaped rhetoric, mechanics, voice tics), `panel` (convene + synthesize multiple reviewers), `debate` (reviewers argue until tensions resolve).
  - **Pressure & reader response:** `asshole` (least-charitable read), `mom` (loving non-expert general reader), `eli5` (jargon/hand-waving/skipped steps).
  - **Craft lenses:** `hitchcock` (suspense/"bomb under the table"), `sorkin` (pacing/momentum), `vonnegut` (story rules), `sedaris` (humor/specificity), `hemingway` (cut adjectives/adverbs/qualifiers).
  - **Final editing:** `line-edit` (sentence-level edit + change summary).
- Suggested workflow: `dev-edit` while structure can move ? a reader-risk reviewer (`asshole`/`mom`/`eli5`) ? one or two craft lenses ? `guardrails` before publication ? `panel`/`debate` for high-stakes ? `line-edit` last.
- The `guardrails` skill has six detection categories; the first four apply to any Every draft, while categories 5u{2013}6 (voice tics, structural throat-clearing) are Working Overtime-specific. It produces a tiered findings report and does not rewrite the draft.
- `guardrails` includes a self-updating catalog: new patterns are logged as "watch-items," promoted to the catalog after repeat appearances.
- `panel` proposes 4u{2013}6 reviewers by piece context, runs them in parallel via the Task tool, then runs a synthesizer that surfaces consensus findings, productive tensions, unique insights, priorities, and "the hard question."
- The README's thesis: "The best reviewer is not the most universal one. It is the one that remembers the standard you keep forgetting at exactly the moment you are tempted to call the draft done."

## Limitations

- The repo is an adapted/public subset. Skills referenced in the article but absent here include `ai-check`, `tighten-draft`, `kate-top-edit`, and the `working-overtime` column skill.
- `guardrails` is tuned to Every's house style and Katie Parrott's specific tics; the README explicitly invites forking, renaming, and deleting reviewers that are "pure Katie pathology."
- `panel`'s spawning instructions reference `compound-writing:review:*` subagent types, implying a fuller internal toolchain than the public repo ships.

## Related Pages

- [Katie Parrott article](2026-06-08-katie-parrott-draft-review-kit-every.md)
- [Review Skills](../concepts/review-skills.md)
- [AI Writing Tells](../concepts/ai-writing-tells.md)
- [Reviewer Orchestration](../concepts/reviewer-orchestration.md)
