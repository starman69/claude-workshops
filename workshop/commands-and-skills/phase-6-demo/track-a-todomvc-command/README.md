# Phase 6 — Track A: TodoMVC Custom Slash Command

**Time:** 30–45 min · **Target:** your TodoMVC checkout (from the primary TodoMVC workshop).
**Goal:** author a **custom slash command** specific to TodoMVC workflows, and understand when a custom command beats a plain prompt.

## Why custom commands

A custom command is a reusable prompt with guardrails. If you find yourself typing "run tests, filter for spec failures only, summarize by TodoMVC category" every day, make it a command.

## What you'll build

`/todomvc-spec-check` — runs `npm test`, extracts spec-test results, and produces a pass/fail summary grouped by TodoMVC category (add, toggle, filter, clear completed, routing).

## Workflow

1. **Plan** (plan mode): what tools does the command need? (`Bash(npm test*)`, `Read`, maybe `Grep`.) What's the structured output shape?
2. **Author** the command at `.claude/commands/todomvc-spec-check.md` in your target repo (not this one). Use `before/command.md.template` as the skeleton.
3. **Test** — run `/todomvc-spec-check` in Claude Code. Iterate on the prompt body until output is clean and consistent.
4. **Install** — commit `.claude/commands/todomvc-spec-check.md` to the project so the team benefits.

## Files

- `before/command.md.template` — blank command skeleton (YAML frontmatter + body placeholders)
- `after/todomvc-spec-check.md` — filled example
- `after/USAGE.md` — install + run steps

## Debrief

- When did a plain prompt do just as well? When did the command save real time?
- Did you widen `allowed-tools` during authoring, then tighten it before shipping?
