# Phase 3 — Safety & Permissions

**Time:** 30 min
**Goal:** Block Claude Code from reading/writing secrets, pre-approve safe commands.

## Exercise

1. Open `before/settings.json` — this is the baseline (almost nothing configured).
2. Your task: harden it so Claude cannot read `.env` files or dump env vars.
3. Add a `PreToolUse` hook that runs `scripts/block-secrets.sh` — a shell-level safety net.
4. Add an `allow` list for low-risk commands so you aren't approving `npm test` 50 times.

## Where to put this

You run Claude Code from your **target project** (set up in Phase 2), not from this repo. Pick one:

- **Project scope (recommended):** copy `after/settings.json` → `<target>/.claude/settings.json`, `after/scripts/block-secrets.sh` → `<target>/.claude/hooks/block-secrets.sh`. The hook path in `after/settings.json` resolves to `$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh`.
- **User scope:** put both under `~/.claude/` (equivalent paths) — one hardening covers every project.

⚠️ **`chmod +x` the hook after copying.** If `block-secrets.sh` isn't executable, Claude Code treats the exec failure as *allow* and the hook is a silent no-op. Commit the bit with `git update-index --chmod=+x .claude/hooks/block-secrets.sh` so it sticks on other machines.

## Plant a decoy

The validation tests below need an env file for Claude to try to read. At the target project root, check first:

```bash
ls -la .env .env.local 2>/dev/null
```

If neither exists, drop a dummy (this is a decoy, not a real secret):

```bash
echo "EXAMPLEKEY=12345" > .env.local
```

Use whichever file you have in the tests below — the deny patterns (`**/.env`, `**/.env.*`) and the hook regex match both.

## Validate

Modern Claude will often refuse a request like "read `.env`" at the model layer — which **doesn't test your guards** because the tool call never fires. You need prompts that actually attempt the call so each layer can catch it.

Ask Claude to run each of these verbatim (it has to invoke the tool for the test to mean anything):

| Test | Layer that should catch it |
|---|---|
| `Bash(env)` | `permissions.deny` |
| `Bash(cat .env)` | `permissions.deny` |
| `Read(.env)` | `permissions.deny` |
| `Bash(bash -c 'cat .env')` | hook — permissions prefix-matches on `bash`, not `cat`, so this slips past |

All four should be blocked. If the fourth one executes, your hook isn't running — re-check `chmod +x` first.

### What this hook doesn't catch (on purpose)

The hook is a blocklist, not a sandbox. Indirect reads like `grep . .env`, `xxd .env`, or `python -c "print(open('.env').read())"` slip past it. The right guard for those is `permissions.deny` on `Read` and on `Bash(grep/xxd/python)` prefixes in `settings.json` — not more regex in the hook. This is the teaching point: enumerating every possible `.env` reader is a losing game; restrict the tool, then use the hook as a safety net.

## Compare

When finished, diff your result against `after/`:

```bash
diff -ru before/ after/
```

## Files

- `before/settings.json` — starting point
- `after/settings.json` — hardened config (reference; copy into your target project)
- `after/scripts/block-secrets.sh` — working PreToolUse hook (exit-code-2 blocking is current; JSON `decision` format is deprecated in favor of `hookSpecificOutput.permissionDecision` if you later extend this)
