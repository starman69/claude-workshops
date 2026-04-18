# Phase 6 — Track D: Juice Shop Audit Skill (audit-route)

**Time:** 60–75 min · **Target:** your Juice Shop checkout.
**Goal:** author a **Skill** that audits a route end-to-end (route → controller → sink) and emits a structured finding. Recommended after Track C so the command-vs-Skill contrast is fresh.

## Skills vs. commands (security flavor)

- A **command** like `/juice-shop-audit` is invoked explicitly, same prompt each time.
- A **Skill** (`audit-route`) is one Claude reaches for when your phrasing matches — "trace the userProfile endpoint for authz issues" → Claude picks the Skill because the `description` matches.

Reference patterns: [`addyosmani/agent-skills`](https://github.com/addyosmani/agent-skills).

## What you'll build

`audit-route` — for a given route, traces registration → handler → query/sink → response shape, and emits a finding into `FINDINGS_TEMPLATE.md`. Still description-level; still no payloads.

## Workflow

1. **Plan** — minimum shape. What stays in `SKILL.md` vs. a helper script?
2. **Author** `.claude/skills/audit-route/SKILL.md` in your target repo. Optional helper at `scripts/audit-route.sh` (grep-based route → handler mapping).
3. **Test** — invoke on a route you've already audited manually. Does the Skill surface the same findings at comparable severity?
4. **Iterate** — if severity drifts upward, tighten the humility + scope clauses.

## Guardrails (repeat in SKILL.md)

- Authorized training framing at the top
- "Describe, don't weaponize" — no working payloads
- "Cite file:line always" — no speculation about unread code
- "Local target only" — never reach beyond the learner's local Juice Shop

## Files

- `before/SKILL.md.template` — blank skeleton
- `after/SKILL.md` — filled `audit-route`
- `after/scripts/audit-route.sh.snippet` — helper for route → handler mapping
- `after/FINDINGS_TEMPLATE.md` — the schema the Skill emits into
- `after/USAGE.md` — install + invoke

## Debrief

- Where does the Skill beat Track C's command? (Natural phrasing, less ceremony.)
- Where does the command beat the Skill? (Explicit invocation = explicit intent.)
- How did you prevent severity drift in Skill output?
