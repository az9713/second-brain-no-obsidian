# Stale Claims

## Current Status

Re-verified 2026-07-27 (web pass, audit implementation). Both overdue windows (7-day market claims due 2026-06-15; 30-day capability claims due 2026-07-08) are now cleared. Verdicts below use: **confirmed** (fresh sources support it), **moved** (real developments changed the picture), **unverifiable** (no external check possible; keep as attributed claim), **thesis** (framework claim, falsified only by accumulating counter-evidence).

Review-date convention: lines matching `Review by: YYYY-MM-DD` are machine-checked by the phase-0 invariant checker, which fails the run when a date passes.

## Re-Verified 2026-07-27 - Market / finance / structure claims (7-day policy)

Next scheduled check - Review by: 2026-08-03

| Claim | Source | Verdict 2026-07-27 |
|---|---|---|
| AI-infra trades "crowded near a peak"; IPO/index/liquidity mechanics drive violent moves | [Diamandis roundtable](sources/2026-06-08-diamandis-takeoff-singularity.md) | **Confirmed and current**: BofA's July 2026 fund-manager survey found 82% call semiconductors the most crowded trade with zero reported shorts; analysts flag stretched valuations and 30-40% drawdown risk as the cycle matures. |
| Meta's 8,000 cut is capex reallocation, not AI-productivity replacement | [Nate B. Jones](sources/2026-06-08-nate-jones-meta-ai-layoffs.md) | **Confirmed**: reporting shows the restructuring frees $8-10B toward a $145B AI capex budget, cuts hit non-AI teams while AI infra/models were protected, and in July Zuckerberg publicly conceded Meta's AI "hasn't really accelerated" as expected - directly against the AI-productivity-replacement reading. |
| Microsoft and OpenAI shifting from partnership to competition | [Kantrowitz / Roy](sources/2026-06-08-kantrowitz-apple-wwdc-ai.md) | **Moved (direction confirmed)**: the April 2026 amended agreement ended exclusivity - non-exclusive IP license through 2032, capped revenue share through 2030, no right of first refusal on compute, OpenAI now multi-cloud (Oracle, Google Cloud). Formal restructuring, not rupture. |
| "Analytical SaaS is over/dead" in the medium term | [All-In / Arora](sources/2026-06-08-allin-arora-ai-cybersecurity.md) | **Thesis, unresolved**: no decisive July 2026 evidence either way; keep as provocative forecast, not fact. |
| Value accrues to apps/workflows/integration over models/hardware | [AI-Stack Value Migration](concepts/ai-stack-value-migration.md) | **Thesis, unresolved**: July 2026 market evidence is mixed (investors rotating within the AI trade as hyperscaler spending growth slows); revisit as earnings land. |

## Re-Verified 2026-07-27 - Model-capability claims (30-day policy)

Next scheduled check - Review by: 2026-08-26

| Claim | Source | Verdict 2026-07-27 |
|---|---|---|
| "AI found 5 years of bugs in 6 weeks"; ~30% false-positive rate | [All-In / Arora](sources/2026-06-08-allin-arora-ai-cybersecurity.md) | **Unverifiable**: single-account vendor figure, no independent audit found; keep as attributed claim only. |
| Mythos-level capabilities "broadly available soon," including via open/foreign models | [All-In / Arora](sources/2026-06-08-allin-arora-ai-cybersecurity.md) | **Partially confirmed**: Anthropic's Claude 5 family shipped a Mythos-class tier (Fable 5 generally available with added safety measures; Mythos 5 restricted to approved orgs). The open/foreign-model part remains unverified. |
| Recursive self-improvement as a near-term governance issue | [Diamandis roundtable](sources/2026-06-08-diamandis-takeoff-singularity.md); [Kantrowitz / Roy](sources/2026-06-08-kantrowitz-apple-wwdc-ai.md) | **Contested, counter-evidence noted**: Zuckerberg's July admission that Meta's AI "hasn't really accelerated" as expected cuts against near-term takeoff narratives. Keep as contested. |
| Context minimalism has "replaced heavy context engineering" | [Claude Code year](sources/2026-06-08-claude-code-one-year.md) | **Thesis**: workflow claim, no external check; review on usage friction. |
| Coding as the "first undeniable use case"; foundation models may commoditize | [a16z / Evans](sources/2026-06-08-a16z-benedict-evans-coding.md) | **Thesis, still open**: framed by the source itself as unresolved. |
| Naming conventions matter "less with every model release" | [Katie Parrott article](sources/2026-06-08-katie-parrott-draft-review-kit-every.md) | **Thesis**: model-capability-adjacent, no direct evidence found; keep. |

## Resolved 2026-07-27 - Pre-event claims

| Claim | Source | Resolution |
|---|---|---|
| Apple WWDC OS-level AI / Siri plans and Apple-Google Gemini dependency | [Kantrowitz / Roy](sources/2026-06-08-kantrowitz-apple-wwdc-ai.md) | **Confirmed by the event**: WWDC (2026-06-08) announced "Siri AI" powered by a custom Google Gemini model running in Apple's data centers, with Private Cloud Compute; the Apple-Google partnership is official (reported ~$1B/yr). The captured pre-event claim was accurate. |

## Watch-Items (event-triggered, no date)

| Claim | Source | Risk | Review after |
|---|---|---|---|
| Graphify's Obsidian export creates concept stubs/backlinks; wire back to source docs before Claude Code use | [Chase AI - Graphify + Obsidian](sources/2026-06-08-chase-ai-graphify-obsidian.md); [Semantic Graph Import](concepts/semantic-graph-import.md) | Product behavior may change; demo not reproduced here | When planning a real Graphify import |
| Draft Review Kit plugin install mechanics and 13-skill set | [Draft Review Kit repo](sources/2026-06-08-draft-review-kit-repo.md) | Upstream repo may change | When making an install/adaptation decision |
| Quadrupeds as near-term general-purpose platform; Unitree cost advantage | [SemiAnalysis quadruped](sources/2026-06-08-semianalysis-quadruped-market.md) | Market estimate; subscriber data unavailable | When acting on robotics exposure |

## Default Review Policy

- AI model capability claims: review after 30 days.
- Market, finance, or investment claims: review after 7 days.
- Product or documentation claims: review when making an implementation decision.
- Conceptual workflow claims: review when contradicted by new sources or repeated usage friction.
- Date every scheduled check with a `Review by: YYYY-MM-DD` line so the invariant checker can flag it.

## Re-verification sources (2026-07-27 pass)

- [CNBC: Meta's layoffs underscore Zuckerberg's AI reality](https://www.cnbc.com/2026/05/18/metas-layoffs-starting-this-week-underscore-zuckerbergs-ai-reality-.html)
- [24/7 Wall St: Zuckerberg admits Meta's AI "hasn't really accelerated"](https://247wallst.com/investing/2026/07/07/after-laying-off-8000-employees-zuckerberg-admits-metas-ai-hasnt-really-accelerated-as-expected/)
- [Microsoft blog: The next phase of the Microsoft-OpenAI partnership](https://blogs.microsoft.com/blog/2026/04/27/the-next-phase-of-the-microsoft-openai-partnership/)
- [CNBC: OpenAI shakes up partnership with Microsoft](https://www.cnbc.com/2026/04/27/openai-microsoft-partnership-revenue-cap.html)
- [Mac Observer: Apple calls its new assistant "Siri AI" at WWDC 2026](https://www.macobserver.com/news/apple-calls-its-new-assistant-siri-ai-at-wwdc-2026-gemini-partnership-now-official/)
- [Business Standard: WWDC 2026 - Apple unveils Siri AI](https://www.business-standard.com/technology/tech-news/wwdc-2026-apple-unveils-siri-ai-gemini-powered-apple-intelligence-more-126060900042_1.html)
- [Yahoo Finance: "The AI trade is still on" - crowded semis](https://finance.yahoo.com/markets/article/the-ai-trade-is-still-on-wall-street-sees-big-techs-spending-as-positive-for-semiconductor-stocks-121056519.html)
- [Investors rotate within AI trade as hyperscaler spending slows](https://finance.yahoo.com/technology/ai/articles/investors-rotate-within-ai-trade-102131863.html)
