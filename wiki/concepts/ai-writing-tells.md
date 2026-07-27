# AI Writing Tells

## Summary

"AI tells" are recurring stylistic patterns that mark text as model-generated or model-smoothed—surface fluency standing in for thought. The Draft Review Kit's `guardrails` skill catalogs them so an agent can flag them before a human editor does.

## Source-Backed Claims

- The author's editor flagged: symmetrical sentence structures, rhetorical throat-clears, phrases that "sound profound on first pass but on closer inspection contain nothing but air," and "sets of three."
- The danger named is "writing that sounds profound at first glance but is, in fact, just AI being pleased with itself."
- `guardrails` Category 4 ("AI tells beyond the standard lexicon") names: aphoristic balance closes, "I don't mean X. I mean Y" redirects, pseudo-Q&A bridges, and reader-projection "Maybe" anaphora.
- `guardrails` Category 3 (mechanics) names: hedges, correlative constructions, rhetorical questions as filler, meandering intros, sentimental conclusions, metaphors without payoff, unexplained technical terms.
- The standard lexical AI-tell pass (delve, leverage, "in today's fast-paced world") is handled by a separate `ai-check` skill, complementary to `guardrails`.
- The skill distinguishes tells from signature moves: intentional parallel cascades, weighty parenthetical asides, and vernacular gut-checks are NOT flagged.
- Diagnostic heuristic: "does this passage sound like [the writer] thinking out loud, or like a model that found a satisfying rhythm? The first stays. The second flags."

## Interpretation

The list is partly universal (model habits) and partly personal (author tics)—the article splits them as "model habits" vs. "Katie habits." Detection is necessary but insufficient: a strong passage can still be "pattern-detectable," so the skill flags rather than auto-cuts, leaving the editorial call to the human. The catalog is explicitly a moving target ("there will always be new quirks to banish"), which is why `guardrails` is self-updating.

## Open Questions

- How much of the AI-tell catalog stays valid as models improve? The article notes naming conventions matter "less true with every model release."
- Can a tell catalog be shared across writers, or does the personal half dominate?

## Sources

Evidence tier: **primary** - inherited from the weakest underlying source. Grounded in captured original artifacts.

- [Katie Parrott article](../sources/2026-06-08-katie-parrott-draft-review-kit-every.md)
- [Draft Review Kit repo](../sources/2026-06-08-draft-review-kit-repo.md)
- [Review Skills](review-skills.md)

## Last Updated

2026-06-08
