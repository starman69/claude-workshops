# Phase 2 — Safety & Permissions (prerequisite check)

**Time:** 5 min
**Goal:** confirm your existing permission hardening is in place. **This phase doesn't configure anything new.**

> **Prerequisite:** Phase 3 of the [TodoMVC workshop](../../todomvc/phase-3-safety/README.md) or [Juice Shop workshop](../../juice-shop/phase-3-safety/README.md) must be complete. Your target repo's `.claude/settings.json` has the allow/deny lists, and `.claude/hooks/block-secrets.sh` is installed and executable.

## Verify (in your target repo)

- [ ] `.claude/settings.json` exists with the hardened allow/deny lists
- [ ] `.claude/hooks/block-secrets.sh` exists and is `chmod +x`
- [ ] `claude` started in the target repo respects the hook (test: ask it to read `.env` — should be blocked)

## What applies automatically

Commands and Skills run with the **same** permissions as your session. The allow/deny lists and the `block-secrets.sh` hook still protect you. Nothing new to configure at the session level.

## What's new

Every command and Skill defines its **own** tool surface:

- **Commands:** `allowed-tools: Read, Grep` is safer than omitting it (omission defaults to session-wide)
- **Skills:** the Skill body should *not* assume access it doesn't need (no `Edit` / `Write` unless the Skill writes files)
- **Never** allow unscoped `Bash(...)` — always scope to specific subcommand patterns

## Audit

Run `/help` from the target repo and inspect any commands already installed. Do their descriptions state the operations they perform? If not, the description is probably too loose and you'll want to tighten it in Phase 7.

## No before/after

This phase is a review.
