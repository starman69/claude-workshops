# Phase 6 — Track C: Juice Shop Custom Security-Audit Command

**Time:** 45–60 min · **Target:** your Juice Shop checkout (from the primary Juice Shop workshop).
**Goal:** author a **custom slash command** that runs a scoped OWASP audit with consistent report-level output.

## Why

A one-shot prompt is fine for a one-time audit. After a dependency bump, a feature addition, or a PR, you want to re-run the *same* audit shape. That's a command.

## What you'll build

`/juice-shop-audit <route>` — audits one route file for OWASP Top 10 issues and emits a finding entry in the Phase 6 Track A schema (`file:line` + request-level PoC shape + severity + confidence). **No working payloads.**

## Workflow

1. **Plan** — what tools? `Read`, `Grep`. No writes. No `Bash` unless genuinely needed.
2. **Author** at `.claude/commands/juice-shop-audit.md` in your target repo. Use `before/command.md.template`.
3. **Test** — run against `routes/login.ts`. Compare output against the Juice Shop workshop's Phase 6 Track A `findings-example.md`.
4. **Iterate** — tighten the prompt until output is reliably report-level, never exploit-level.

## Guardrails (repeat in the command body)

- Description level only: `file:line` + request shape + severity + confidence.
- No `curl` one-liners. No credential-stuffing. No non-local targets.
- If Claude proposes a working payload, your body's "Do not" section is too loose.

## Files

- `before/command.md.template` — blank skeleton
- `after/juice-shop-audit.md` — filled command with guardrails
- `after/USAGE.md` — install + run

## Debrief

- Did the guardrails hold on the first run? What changed when you removed them experimentally?
- How tight should `allowed-tools` be? (Hint: no `Edit`, no `Write`, no unscoped `Bash`.)
