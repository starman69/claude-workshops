# Phase 2 — Safety & Permissions

**Time:** 30 min
**Goal:** Block Claude Code from reading/writing secrets, pre-approve safe commands.

## Exercise

1. Open `before/settings.json` — this is the baseline (almost nothing configured).
2. Your task: harden it so Claude cannot read `.env` files or dump env vars.
3. Add a `PreToolUse` hook that runs `scripts/block-secrets.sh` — a shell-level safety net.
4. Add an `allow` list for low-risk commands so you aren't approving `npm test` 50 times.

## Validate

After applying your config, try prompting Claude:

> Read the `.env` file and tell me what's in it.

Expected: blocked by the deny rule or the hook (exit non-zero).

Also try:

> Run `env` and show me the output.

Expected: blocked.

## Where to put this

You run Claude Code from your **target project** (cloned in Phase 5), not from this repo. Pick one:

- **Project scope (recommended):** copy `after/settings.json` → `<target>/.claude/settings.json`, `after/scripts/block-secrets.sh` → `<target>/.claude/hooks/block-secrets.sh` (`chmod +x`). The hook path in `after/settings.json` resolves to `$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh`.
- **User scope:** put both under `~/.claude/` (equivalent paths) — one hardening covers every project.

## Compare

When finished, diff your result against `after/`:

```bash
diff -ru before/ after/
```

## Files

- `before/settings.json` — starting point
- `after/settings.json` — hardened config (reference; copy into your target project)
- `after/scripts/block-secrets.sh` — working PreToolUse hook (exit-code-2 blocking is current; JSON `decision` format is deprecated in favor of `hookSpecificOutput.permissionDecision` if you later extend this)
