# How to Build Claude Subagents Better Than 99% of People (Nate Herk)

## Metadata

- Source type: YouTube transcript (auto-captions) + companion artifacts
- URL: https://www.youtube.com/watch?v=e18sdZLwP7o
- Channel: Nate Herk
- Duration: ~26:40
- Upload date: unknown (not stated in transcript)
- Captured date: 2026-06-09
- Raw source key: `raw/_CORE/_claude_code/claude_subagents_herk__GOOD_ONE`
- Raw files excluded from this public snapshot; SHA-256 recorded in `wiki/source_manifest.jsonl`.

### Files in this source

| File | What it is | Tier |
|---|---|---|
| `transcript.txt` | Auto-caption transcript of Nate Herk's video | Primary source |
| `gpt5.5_summary.md` | A GPT-5.5 distillation/operationalization of the video for "Simon" | Generated second-order artifact |
| `README.txt` | The original demo prompt + two persona system prompts (Linda the beginner, David the COO) | Primary source (verbatim prompts) |

## Summary

Nate Herk's video is a practical walkthrough of Claude Code **subagents**: what they are, when to use them, and how to write good ones. The governing metaphor is **"one smart boss, many cheap workers"** — the main session is an orchestrator that delegates bounded work to isolated specialist subagents and receives only the compressed result. The video covers built-in vs. custom agents, the YAML-frontmatter file format, `description` as a routing trigger ("progressive disclosure"), project vs. global scope, building one live with `/agents`, read-only tool restriction as a real guardrail, cost savings via cheap models, when *not* to use subagents, and dynamic workflows ("ultracode"). The companion `gpt5.5_summary.md` reorganizes this into an operating playbook plus six ready-made agent templates and repeatedly cross-references Anthropic's subagent docs.

## Source-Backed Claims (Nate's transcript — primary)

- A subagent is an isolated worker the main session delegates to; subagents talk only to the main session, never to each other or the user.
- The main session is the **orchestrator** ("I am the one talking to Nate"); it assigns work and relays a report back.
- Core benefit #1: **keeps the main context clean** — delegate anything that would dump output you'll never re-read.
- Core benefit #2: **cost** — the main session can run Opus while subagents do research/reading on Haiku or Sonnet ("smart boss + little Haiku agents").
- Core benefit #3: **parallelism** — independent jobs (e.g., reviewing 15 book chapters out of order) can run at once.
- Core benefit #4: **fresh, unbiased review** — a subagent wakes with no context/memory, useful against sycophancy ("roast my plan").
- **Built-in vs. custom:** the five-persona demo used *general-purpose* built-in agents prompted differently, not true custom agents. A custom agent is a single Markdown file (same tangible thing as a `skill.md`, just named differently).
- The file is YAML frontmatter (name, description, model, color, tools, etc.) plus an instruction body.
- **`description` is the trigger**, read during "progressive disclosure": Claude reads only name+description to decide whether to pull in the full agent, avoiding wasted tokens. Precise descriptions reduce **misfires** (firing when it shouldn't, or not firing when it should).
- Iterating descriptions is empirical: when routing fails, ask Claude to compare your prompt against the description and explain why, then update it. (Nate's live demo misfired partly due to an **unclosed quote** in the frontmatter — a mechanical YAML error, not a judgment error — and partly due to **collision** with an existing `roast` skill.)
- **Skills vs. subagents:** both define "do X, Y, Z," but a subagent has its own clean context window, can run in parallel, and can use a different model; a skill typically runs inside the main session. They compose — a skill can spawn subagents, and a subagent can use a skill.
- **Project vs. global scope:** `.claude/agents/` (project, shareable via Git) vs. user/home (global, personal, not shared when you share the repo). Same model as skills/hooks/MCP.
- Invocation has three levels: natural language (Claude decides), explicit `@`-mention/name, or launching a whole session as an agent via a CLI flag (Nate says he rarely does the last).
- **Read-only by default / tool restriction is a real guardrail:** "if my AI *could* read data, I have to assume it *will*." A permission layer (explicit allowed tools / disallowed tools / allowed MCP servers) is stronger than prompting "please don't." Reviewers and research agents should be read-only; only implementers get edit tools.
- `maxTurns` caps runaway research/review loops (Nate says he rarely needs it).
- You can borrow subject-matter expertise from open-source agent collections (e.g., an "awesome claude code subagents" repo), but downloaded Markdown can carry **prompt injection** — he suggests a read-only verifier subagent that can never send data and only checks files for malicious content.
- **Dynamic workflows** (since Opus 4.8) spin up many subagents in parallel (his examples: 41 agents on video; ~210 in private testing). They burn session limits fast. The trigger word was changed from "workflow" to **"ultracode"** so Claude doesn't fire one when you merely mention a workflow.
- Don't force subagents: skip them for quick one-line edits, tightly sequential steps, agents that must talk to each other (that's an agent *team*, more expensive, shares a task list), or when the worker needs full conversation context or to ask you a question.

## Distillation Claims (`gpt5.5_summary.md` — generated, attributed)

These are the GPT-5.5 artifact's own framing/recommendations, not Nate's words:

- Recommends a six-agent starter stack for solo AI work: `repo-cartographer`, `test-runner`, `security-auditor`, `docs-writer`, `plan-roaster`, `research-distiller` (full template bodies provided in the file).
- Proposes a default operating loop: explore in parallel (cartographer + security + test) → synthesize centrally → edit narrowly → review independently → repeat; `plan-roaster` before major direction changes; `research-distiller` on Haiku/Sonnet for long sources.
- Frames the `description` field as a **routing predicate** that should carry both positive triggers ("use when…") and negative triggers ("do not use for…") to cut misfires.
- Tags default permission policy by role: research/reviewer/writer agents read-only; test agents get Bash but no edits; implementers get narrow edit scope.

## Doc-Attributed Claims (in `gpt5.5_summary.md` — NOT independently verified)

The summary repeatedly cites Anthropic's subagent docs (`code.claude.com/docs/en/sub-agents`). The following are **the summary's representations of those docs** and have not been checked against the live documentation in this pass:

- That `name` and `description` are required frontmatter fields, with optional `tools`, `disallowedTools`, `model`, `permissionMode`, `maxTurns`, `skills`, `mcpServers`, `memory`, `background`, and `effort`.
- That `.claude/agents/` is project scope and `~/.claude/agents/` is user/global scope.
- That `/agents` is the recommended management interface (create/edit/delete, tools, model, color, memory).
- That subagents support scoped tool access and disallowed tools, and that a session can be launched as an agent via `--agent`.

Treat these as leads to confirm against primary docs before relying on exact field names.

## Limitations

- `gpt5.5_summary.md` is a **generated second-order artifact**; its doc-attributed field list may be confabulated or stale and is recorded above as attribution, not fact.
- The transcript is auto-captioned (e.g., "sub aent", "cloud code", "plan roster" = plan-roaster, "rose/roast skill") — quotes are cleaned for sense.
- The live demo was admittedly "a little sloppy" (misfire from an unclosed YAML quote + a skill/agent collision); it illustrates the debugging loop more than a clean success path.
- README persona prompts reference Nate's own machine paths (`C:\Users\Nate\...\Book\drafts\...`) for the book *Becoming AI Native*; they are example prompts, not a general workflow.

## Related Pages

- [Subagent Orchestration](../concepts/subagent-orchestration.md) — the durable concept distilled from this source (orchestrator + isolated specialists, progressive-disclosure routing, read-only-by-default).
- [Reviewer Orchestration](../concepts/reviewer-orchestration.md) — a specialized, editorial instance of the same delegate-and-synthesize pattern.
- [AI-Native Organization](../concepts/ai-native-organization.md) — "everyone becomes a manager of agents"; subagents are the mechanism at the Claude Code level.
- [Verification as Bottleneck](../concepts/verification-as-bottleneck.md) — fresh, unbiased reviewer subagents as a check against cheap, sycophantic generation.
