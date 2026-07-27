# Two-Brain Boundary Policy

Adopted 2026-07-27 (audit implementation). One page, on purpose.

Two systems claim recall over the same material (`C:\Users\simon\Downloads\projects`, which `raw/` points at):

| System | What it is | What it is FOR |
|---|---|---|
| **This wiki** (Downloads/second-brain) | ~40 curated Markdown pages with provenance, evidence tiers, and lint | **Authoritative for synthesized claims.** "What do I believe about X and why" - answers carry source links, evidence tiers, and staleness state. Small by design. |
| **Cerebras brain** (`kb` MCP, 632k rows over ~/Downloads/projects) | Bulk local embedding index of everything | **Authoritative for raw recall.** "Where did I see X / which project touched Y" - broad, uncurated, no claim of verification. |

## Routing rule for a new source

1. Everything under `~/Downloads/projects` is (or can be) fed to the cerebras brain. That is the default landing zone; it requires no judgment.
2. A source is *additionally* registered into this wiki (`capture <path>` → dream sequence) only when it should produce durable, citable claims - roughly: "will I want to act on or cite this in a month?"
3. Never register into the wiki *instead of* the cerebras brain; the wiki is a curation layer on top, not a parallel store.

## Tiebreaker

If the two disagree, the wiki wins for claims (it has provenance and lint); the cerebras brain wins for existence/location questions (it has coverage). A wiki claim contradicted by a raw source found via the cerebras brain is a lint finding - record it in `wiki/contradictions.md`.

## Dream reports

Dream reports live in `outputs/briefs/` and are inside `~/Downloads/second-brain`, not the projects tree, so they are NOT auto-covered by the cerebras brain. Feeding them to it is optional and low-value (the wiki already indexes them); skip by default.

The `gbrain` MCP server (pages/links/jobs) is a third, experimental surface. Until a deliberate decision says otherwise: it is not authoritative for anything in this vault, and nothing here routes to it.
