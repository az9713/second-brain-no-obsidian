---
name: second-brain-schedule-dream-sequence
description: Prepare scheduled dream-sequence maintenance for this second brain with approval safeguards.
---

# schedule-dream-sequence

Use this workflow when the user asks to schedule dream sequence.

## Policy

Scheduling is allowed, but autonomous writes need explicit user approval before activation.

Default recommendation:

1. Manual dream sequence first.
2. Local scheduled task second for private local files.
3. Claude remote routine only for a GitHub-backed vault with clear privacy boundaries.

## Local Scheduled Task Shape

The scheduled task should run from this root:

```text
<second-brain-root>
```

It should ask an agent to run:

```text
run dream sequence
```

The agent must read `AGENTS.md` and `CLAUDE.md` first, then run the seven-phase protocol in `.claude/skills/second-brain-dream-sequence/SKILL.md`.

## Required Safeguards

- Run only inside this repository root.
- Check Git status before writing.
- Write a dream report to `outputs/briefs/`.
- Do not delete raw files.
- Recommend merges/deletions instead of performing them unless pre-approved.
- Keep scheduling disabled until the user approves cadence and tool surface.

## Cadence Options

- Weekly: good default for light capture.
- Daily: useful during active research sprints.
- Manual only: safest when sources are sensitive or high-stakes.
