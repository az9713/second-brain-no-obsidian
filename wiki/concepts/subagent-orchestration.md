# Subagent Orchestration

## Summary

In Claude Code, a **subagent** is an isolated worker with its own context window, model, tool/permission set, and system prompt, defined as a single Markdown file with YAML frontmatter. The main session acts as an **orchestrator** that delegates bounded work to subagents and receives only their compressed result. The governing slogan is **"one smart boss, many cheap workers"**: keep the expensive, context-rich main session as the architect, and push high-volume or specialized work down to cheaper, narrow, often read-only specialists. The value is not "more agents" — it is **division of cognitive labor**: clean context, narrow expertise, explicit permissions, cheap workers, and unbiased review.

## Source-Backed Claims

- The main session is the orchestrator; subagents talk only to it, never to each other or directly to the user. (A group of agents that *do* coordinate and share a task list is an agent *team* — a distinct, more expensive construct.)
- Four primary reasons to delegate: **clean context** (don't pollute the main window with output you'll re-read once), **cost** (Opus boss + Haiku/Sonnet workers), **parallelism** (independent jobs run at once), and **fresh unbiased review** (a zero-memory agent resists sycophancy).
- A custom subagent is the same tangible artifact as a skill `.md` file — YAML frontmatter plus an instruction body — just named differently. Built-in/general-purpose agents are the ones Claude invokes automatically (and what a "spin up five personas" demo actually uses unless you author custom files).
- **Progressive disclosure / routing:** Claude reads only the `name` + `description` to decide whether to load and run an agent, so the `description` functions as a routing predicate, not documentation. Precise descriptions (ideally with both positive and negative triggers) reduce **misfires** in both directions.
- Tuning descriptions is empirical: when routing fails, have Claude compare the prompt against the description and explain the failure, then revise. Misfires also come from mechanical YAML errors (e.g., an unclosed quote) and from **collisions** with similarly-described skills/agents.
- **Scope:** project-level (`.claude/agents/`, shareable via Git) vs. global/user-level (personal, not shared with a repo) — the same split as skills, hooks, and MCP servers.
- **Invocation** has three levels: natural language (Claude decides), explicit name/`@`-mention (force a specific agent), or launching a whole session as an agent via a CLI flag.
- **Skills vs. subagents:** both encode "do X, Y, Z," but a subagent adds a clean context window, parallel execution, and an independent model choice; skills typically run inside the main session. They compose bidirectionally.
- Don't force delegation: skip subagents for one-line edits, tightly sequential reasoning, peer-to-peer coordination needs, or when the worker needs the full conversation or to ask the user a question.

## Read-Only by Default (permission layers beat prompts)

*A folded-in principle from the same source; promote to its own page if a second source corroborates it.*

- Tool restriction is a **real guardrail**; a prompt is not. Telling an agent "don't edit files" is weaker than removing its edit tools.
- Operating assumption: **"if my AI *could* read or touch data, I have to assume it *will*"** — even unprompted. So encode capability, not etiquette: explicit allowed tools, `disallowedTools` (e.g., `Edit, Write`), and explicit allowed MCP servers.
- Role-based default policy: research, reviewer, and writer agents → read-only; test agents → Bash allowed, no edits; implementers → edit tools with narrow scope.
- Borrowed open-source agents are Markdown and can carry **prompt injection**; a read-only verifier agent that can never send data can vet downloaded files.

## Interpretation

The orchestrator/specialist split is the Claude Code expression of a pattern this vault already records at higher altitudes. [Reviewer Orchestration](reviewer-orchestration.md) is a **specialized, editorial instance** of subagent orchestration — a `/panel` command that fans out reviewer subagents and synthesizes their (deliberately un-smoothed) feedback. This page is the **general** mechanism; reviewer-orchestration is one application of it. At the organizational altitude, [AI-Native Organization](ai-native-organization.md) frames the same move as "everyone becomes a manager of agents" — subagents are the concrete unit of that management inside a coding session. The read-only-by-default principle also rhymes with [Verification as Bottleneck](verification-as-bottleneck.md): as generation gets cheap, the scarce, human-anchored work is constraint design (permissions) and adjudication (reviewing the compressed result), not production.

## Contradictions or Tensions

- **More agents ≠ better.** The source insists forcing too many subagents produces *worse* results, and dynamic workflows ("ultracode", since Opus 4.8) that spin up 40–200+ agents burn session limits fast. The leverage is selective delegation, not maximal fan-out — which sits in tension with the "spin up five/forty agents" demos that make the feature look impressive.
- **Routing reliability vs. authoring effort.** Progressive disclosure makes agents cheap to ignore but means a weak `description` silently fails to fire; getting reliable routing is an iterative, testing-heavy cost the demos understate.

## Open Questions

- What exactly are the supported frontmatter fields and scopes? The companion summary's list (`permissionMode`, `maxTurns`, `skills`, `mcpServers`, `memory`, `background`, `effort`, etc.) is **attributed to Anthropic's docs but unverified here** — confirm against primary documentation before relying on field names.
- When is a synthesized multi-agent panel (or a dynamic workflow) worth the cost vs. one targeted subagent? (Shared with [Reviewer Orchestration](reviewer-orchestration.md).)
- How does the no-peer-communication constraint interact with genuinely interdependent subtasks — where is the boundary between subagents and an agent team?

## Sources

Evidence tier: **transcript** - inherited from the weakest underlying source. Claims rest on talk transcripts; first-hand but not independently verified.

- [How to Build Claude Subagents Better Than 99% of People (Nate Herk)](../sources/2026-06-09-nate-herk-claude-subagents.md)

## Last Updated

2026-06-09
