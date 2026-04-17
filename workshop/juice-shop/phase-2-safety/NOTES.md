# Phase 2 — Safety & Permissions

**Time:** 30 min
**Goal:** Block Claude Code from reading/writing secrets on **your machine**, pre-approve safe commands.

⚠️ **Juice Shop contains intentional dummy secrets** — weak JWT keys, sample `.env` files, hardcoded credentials. These are training targets, not leaks. The hook here protects **your real credentials outside the Juice Shop repo**. Do not disable it because the target is a training app.

## Exercise

1. Open `before/settings.json` — baseline (almost nothing configured).
2. Harden it so Claude cannot read `.env` files or dump env vars.
3. Add a `PreToolUse` hook running `scripts/block-secrets.sh` — shell-level safety net.
4. Add an `allow` list for low-risk commands so you aren't approving `npm test` 50 times.

## Validate

After applying your config, try prompting Claude:

> Read the `.env` file and tell me what's in it.

Expected: blocked by the deny rule or the hook (exit non-zero).

Also try:

> Run `env` and show me the output.

Expected: blocked.

## Where to put this

You run Claude Code from your **target project** (Juice Shop, cloned in Phase 5), not from this repo. Pick one:

- **Project scope (recommended):** copy `after/settings.json` → `<target>/.claude/settings.json`, `after/scripts/block-secrets.sh` → `<target>/.claude/hooks/block-secrets.sh` (`chmod +x`). Hook path in `after/settings.json` resolves to `$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh`.
- **User scope:** put both under `~/.claude/` — one hardening covers every project (useful if you spin up more targets later).

## Compare

```bash
diff -ru before/ after/
```

## Files

- `before/settings.json` — starting point
- `after/settings.json` — hardened config (copy into your target project)
- `after/scripts/block-secrets.sh` — verbatim copy of the TodoMVC module's hook; do **not** weaken it just because Juice Shop's fake secrets are training targets. (Exit-code-2 blocking is current; JSON `decision` format is deprecated in favor of `hookSpecificOutput.permissionDecision`.)
