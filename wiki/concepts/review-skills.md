# Review Skills

## Summary

A review skill is a reusable Markdown instruction file that packages editorial judgment into an agent persona with one job. Run against a finished-enough draft, a review skill acts as "another form of editor"—catching AI tells, weak arguments, and the author's own recurring tics before a human editor sees them.

## Source-Backed Claims

- A skill is mechanically "a Markdown file with instructions inside it" and practically "a way of packaging judgment."
- Review skills are feedback-only: they critique existing prose; they do not generate ideas, outlines, or first drafts.
- Reviewers are given personas (Sorkin, Mom, Asshole, Hitchcock, Sedaris, Hemingway, Vonnegut, Eli5) so the names are sticky and each asks a different question.
- The Draft Review Kit groups reviewers into big-picture review, reader-response/pressure, craft lenses, and final editing.
- `guardrails` is built from a real list of an author's flagged failures and maintains a self-updating catalog (watch-item → promoted rule).
- The author argues editorial taste "becomes something you can share": a workflow can carry the author's standards, an editor's feedback, a senior editor's rules, and house style at once.

## Interpretation

Review skills externalize tacit editorial standards into inspectable, versionable artifacts. The value is two-sided: the draft gets cleaner, and the act of writing the skill forces the author to articulate standards they previously held only implicitly ("my own preferences are less of a mystery to myself"). This mirrors how this vault itself is operated through skills (see [Second-Brain Operating Model](second-brain-operating-model.md))—judgment encoded as Markdown the agent reads on demand. The risk is over-fitting: a reviewer tuned to one author's "pathology" is not portable, which the repo acknowledges by inviting forking and deletion.

## Contradictions or Tensions

- The system "may look excessive" (12+ reviewers on one draft) vs. the stated principle that the point is to run the right reviewer at the right time, not all of them every time.

## Open Questions

- At what point does maintaining a reviewer suite cost more attention than it saves? (See [After Automation](after-automation.md).)
- Which review skills generalize across authors vs. which are irreducibly personal?

## Sources

Evidence tier: **primary** - inherited from the weakest underlying source. Grounded in captured original artifacts.

- [Katie Parrott article](../sources/2026-06-08-katie-parrott-draft-review-kit-every.md)
- [Draft Review Kit repo](../sources/2026-06-08-draft-review-kit-repo.md)

## Last Updated

2026-06-08
