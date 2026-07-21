# Reviewer Orchestration

## Summary

Orchestration threads multiple reviewer skills together into a single higher-order review. Rather than summoning agents one by one, a command like `/panel` selects suited reviewers, runs them in parallel, and a synthesizer combines their feedback—deliberately preserving disagreement instead of smoothing it.

## Source-Backed Claims

- `/panel` reads the draft's context (piece type, audience, stage, goals) and proposes 4–6 reviewers suited to the problem, or lets the user pick.
- Reviewers run in parallel (via the Task tool, spawning `compound-writing:review:*` subagents); a synthesizer then reads all outputs together.
- The synthesis surfaces consensus findings, productive tensions, unique insights, recommended priorities, and "the single hard question the draft keeps circling."
- Disagreement is kept intact on purpose: "the tension tells me what decision the piece is asking me to make. Then I, the human, have to figure out how to make it."
- `debate` is a related/future mode where reviewers argue with each other until tensions resolve or become clear.
- For the article's own draft, the panel ran Mom (accessibility), Hitchcock (tension), Sorkin (momentum), and Sedaris (humor).

## Interpretation

This is multi-agent synthesis applied to editorial judgment, and it echoes a pattern this vault uses elsewhere: the [Dream Sequence](dream-sequence.md) and [Knowledge-Base Lint](knowledge-base-lint.md) likewise refuse to "smooth away" contradictions, recording them instead (see [Contradictions](../contradictions.md)). In both systems the synthesizer's job is not to resolve tension but to make the human's decision legible. The orchestration value over single reviewers is that the output is a reconciliation, not a checklist of independent flags. Mechanically, this is a **specialized, editorial instance** of the general [Subagent Orchestration](subagent-orchestration.md) pattern — fan out isolated specialist subagents, then synthesize their compressed results centrally; here the specialists are reviewer personas rather than security/test/docs workers.

## Contradictions or Tensions

- Parallel independent reviewers can produce direct conflicts (one wants a section cut, another calls it the most alive part). The design treats this as a feature; the cost is that the human must adjudicate.

## Open Questions

- When is a synthesized panel worth the extra cost vs. running one targeted reviewer?
- Does preserving tension scale, or does a large panel produce more conflict than a writer can adjudicate?

## Sources

- [Katie Parrott article](../sources/2026-06-08-katie-parrott-draft-review-kit-every.md)
- [Draft Review Kit repo](../sources/2026-06-08-draft-review-kit-repo.md)
- [Review Skills](review-skills.md)

## Last Updated

2026-06-08
