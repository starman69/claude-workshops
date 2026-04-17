# Phase 4 — Command vs. Skill vs. Prompt

**Time:** 30 min
**Goal:** develop the decision intuition for when each is the right tool.

> **Prerequisite:** Phase 4 of the primary workshop complete. You've used `Grep`, `Read`, plan mode, subagents, and slash commands against a real codebase. If those aren't second nature yet, do that first — this phase assumes tool fluency.

## Decision framework

| Situation | Reach for |
|-----------|-----------|
| One-off task, context-specific | Plain prompt |
| Recurring query, same shape every time | Custom slash command |
| Multi-step workflow with natural-language invocation, produces artifacts | Skill |
| Anything with interactive decisions or tradeoffs | Plain prompt (commands/Skills lose nuance) |

## Exercises (in `exercises/`)

1. **Command vs. Skill** — decide which fits a given scenario. See `01-command-vs-skill.md`.
2. **Command vs. plain prompt** — when is a command overkill? See `02-command-vs-plain-prompt.md`.

## Anti-patterns

- A command with no arguments that always does the same thing → could be a Skill
- A Skill whose body mostly says "ask the user" → could be a prompt
- A command that calls ten other commands → you're reinventing Skills
- A Skill with a vague `description` → Claude won't reach for it at the right times

## No before/after

Exercises are live.
