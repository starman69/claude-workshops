# Phase 6 — Track B: TodoMVC Skill (scaffold-feature)

**Time:** 45–60 min · **Target:** your TodoMVC checkout.
**Goal:** author a **Claude Code Skill** that scaffolds a new TodoMVC feature (component + test + wiring), and understand when a Skill beats a custom command. Recommended after Track A so the command-vs-Skill contrast is fresh.

## Skills vs. commands

- A **command** is a one-shot prompt with tools, invoked explicitly (`/name`). Best for recurring queries.
- A **Skill** is a reusable capability with documented triggers and optional helper scripts. Claude reaches for it based on `description` matching, not explicit invocation. Best for multi-step workflows producing artifacts.

Reference patterns: [`addyosmani/agent-skills`](https://github.com/addyosmani/agent-skills).

## What you'll build

`scaffold-feature` — given a feature name + short description, generates:

- `src/components/<FeatureName>.tsx` (function declaration, typed props, default export)
- `src/components/<FeatureName>.test.tsx` (RTL, render test + one interaction test)
- A wiring edit in the nearest parent (import + mount)

## Workflow

1. **Plan** — minimum shape. What stays in `SKILL.md` vs. a helper script?
2. **Author** `.claude/skills/scaffold-feature/SKILL.md` in your target repo. Optional: `scripts/scaffold-feature.sh` helper.
3. **Test** — invoke for a trivial feature (e.g., a footer link). Check output against the TodoMVC workshop's Phase 4 CLAUDE.md conventions.
4. **Iterate** — if output is non-idiomatic, tighten the Skill body.

## Files

- `before/SKILL.md.template` — blank Skill skeleton
- `after/SKILL.md` — filled example
- `after/scripts/scaffold-feature.sh.snippet` — helper script reference
- `after/USAGE.md` — install + invoke steps

## Debrief

- Where did you over-specify the Skill body? (Too rigid = can't generalize.)
- Where did you under-specify? (Too loose = non-idiomatic output.)
- Bad candidates for a Skill? (One-offs, anything tightly coupled to one live session.)
