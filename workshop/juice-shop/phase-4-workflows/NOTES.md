# Phase 4 — Core Workflows

**Time:** 45 min
**Goal:** Fluency with the tools you'll use every day, plus two security-specific drills.

## Exercises (in `exercises/`)

Work through each with Claude. For each, note **which tool Claude chose** and **why**.

1. **Find a function** — `Grep`, not `Bash(grep)`. See `01-find-function.md`.
2. **Plan a change** — enter plan mode, review, exit to execute. See `02-plan-mode.md`.
3. **Dangerous sinks drill** — `Grep` for `eval(`, `exec(`, `child_process`, raw SQL string concatenations. See `03-grep-dangerous-sinks.md`.
4. **Auth-surface map** — spawn an `Explore` subagent to map authentication and authorization. See `04-explore-auth-surface.md`.
5. **Live UI inspection** — observe the running app + score-board via Chrome DevTools / Playwright MCP (stay on `localhost`). See `05-browser-mcp.md` and `../../../docs/mcp-setup.md`.
6. **Context & session hygiene** — `/clear`, `/compact`, and session-reset after a long audit pass. See `06-context-hygiene.md`.
7. **Prompting craft (security)** — rewriting vague audit prompts for calibrated findings. See `07-prompting-craft.md`.

## Run these slash commands live

Don't just read about them — actually run each:

- `/help` — what's available
- `/model` — confirm active model
- `/init` — on a tiny throwaway repo
- `/review` — on a one-file edit, read output critically
- `/security-review` — Phase 7 leans on this heavily; get comfortable now

## No before/after

These are live exercises. The "after" is fluency, not a file.
