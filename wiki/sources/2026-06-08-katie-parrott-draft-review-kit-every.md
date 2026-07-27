# Katie Parrott u{2014} "My Editor Caught Me Sounding Like AI. Now AI Catches Me First."

## Metadata

- Source type: Web article (Every, Working Overtime column)
- Evidence tier: primary - the original artifact itself was captured
- URL or origin: https://every.to/working-overtime/my-editor-caught-me-sounding-like-ai-now-ai-catches-me-first
- Author: Katie Parrott (staff writer, Every)
- Publication date: 2026-06-08
- Captured date: 2026-06-08
- Raw file: `raw/inbox/2026-06-08-draft-review-kit-every/raw_text.txt`
- Hash: `5F13771B96534F49EBAEB5CB70C9447C0F222652A13FFCFBCA1ED7930F80D497`

## Summary

Katie Parrott describes how she turned a list of her recurring writing weaknessesu{2014}flagged by Every's editor in chief Kate Leeu{2014}into a reusable Claude Code / Codex skill called `/guardrails`, and a broader set of "review skills" that pressure-test a draft at every stage before it reaches a human editor. The piece argues that review skills act as "another form of editor," catching AI tells and the author's own habitual tics so human editors can spend attention on higher-order problems. It ships alongside a public repo of the reviewer skills.

## Source-Backed Claims

- After a one-on-one with editor in chief Kate Lee, the author found a list of her own writing fails: symmetrical sentence structures, rhetorical throat-clears, phrases that sound profound but contain "nothing but air," and "sets of three."
- She compiled these patterns into a new skill, `/guardrails`, that turns an agent into an "exacting editorial specialist."
- She frames review skills as "another form of editor" that catches weak spots before a human editor has to.
- A skill is described mechanically as "a Markdown file with instructions inside it" and practically as "a way of packaging judgment."
- She uses persona-named reviewers rather than clinical descriptors: Sorkin (momentum), Mom (general-reader accessibility), Asshole (least-charitable attack on the argument), Hitchcock (tension/suspense), Sedaris (humor).
- She invokes reviewers at different stages: outline (attack the argument), section drafts (`/ai-check`, `/guardrails`, Jack Cheng's `/tighten-draft`), full draft (developmental review, column-specific `/working-overtime`, `/panel`), and final pass (`/ai-check`, `/guardrails`, `/tighten-draft`, `/kate-top-edit`).
- `/panel` is an orchestration command: it reads the draft's context, proposes suited reviewers, runs them in parallel, and a synthesizer produces a unified analysis that preserves disagreement rather than smoothing it.
- The author explicitly ties her experience to Every CEO Dan Shipper's "After Automation" argument: AI changes what the human does rather than reducing the workload. (See [After Automation](../concepts/after-automation.md).)
- She pairs the article with a public GitHub repo so readers can install and adapt the reviewer skills. (See [Draft Review Kit repo](2026-06-08-draft-review-kit-repo.md).)
- Her recommended onboarding: download the repo, open in Codex/Claude, have the agent read the README and install skills, run one reviewer on a known draft, then iterate the SKILL.md from what it caught/missed.

## Limitations

- First-person opinion essay, not an empirical study; claims about effectiveness are the author's own experience.
- Several skills named in the article (`/ai-check`, `/tighten-draft`, `/kate-top-edit`, `/working-overtime`) are NOT in the companion repo; the repo is an adapted subset. (See [Draft Review Kit repo](2026-06-08-draft-review-kit-repo.md) limitations.)
- Raw text was captured from a web scrape and contains site navigation/marketing boilerplate around the article body.
- The author acknowledges the process is "ongoing and imperfect" and the system "may look excessive."

## Related Pages

- [Review Skills](../concepts/review-skills.md)
- [AI Writing Tells](../concepts/ai-writing-tells.md)
- [Reviewer Orchestration](../concepts/reviewer-orchestration.md)
- [After Automation](../concepts/after-automation.md)
- [Draft Review Kit repo](2026-06-08-draft-review-kit-repo.md)
