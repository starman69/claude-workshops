# Phase 1 — Install & Authenticate

**Time:** 15 min
**Goal:** Claude Code installed, authenticated, and you know the main UI affordances.

## Steps

1. **Install** (pick your platform):
   - macOS/Linux: `curl -fsSL https://claude.ai/install.sh | sh` (or follow official docs)
   - Windows: Claude Code desktop app, or WSL + install script
   - VS Code / JetBrains extension (optional)
2. **Authenticate:** run `claude` in a terminal, then `/login`.
3. **Verify:** run `/help` and `/model`. Confirm you can reach the latest Claude model.
4. **Tour the UI:**
   - `shift+tab` → toggle between default / accept-edits / plan modes
   - Approve/deny prompts for tool calls
   - `/` → slash commands
   - `#` → quick-append memory
   - Claude's task list (`TodoWrite`) — watch it in long sessions; if it drifts, the session probably needs `/compact` or `/clear` (see Phase 5)

## Checkpoint

You can start a `claude` session, see the model name, and toggle plan mode.

## No before/after

This phase is an activity — nothing to diff.
