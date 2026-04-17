---
name: audit-route
description: Trace a Juice Shop route from registration → handler → query/sink, and emit a structured OWASP finding. Use when the user asks to "audit", "check", or "trace" a specific route or endpoint for security issues. Report-level only — no exploit payloads.
---

# audit-route

## Framing

**Authorized security training** against an intentionally vulnerable app. No working payloads, no targeting non-local hosts. Cite `file:line` always; do not speculate about code you haven't read in this invocation.

## When to use

- User asks to audit, check, trace, or review a specific route/endpoint for security issues
- Context is the Juice Shop codebase (a file under `routes/` or `lib/` is in scope)

## What it does

For a given route path or file, traces:

1. Route registration — where is `app.METHOD('path', handler)` called?
2. Handler / controller — what does the handler do?
3. Query or sink — `sequelize.query`, `exec`, `eval`, filesystem, HTTP
4. Input taint path — where does user input enter; does a validator exist?
5. Response shape — auth header, sensitive fields

Emits a finding into `.claude/skills/audit-route/FINDINGS_TEMPLATE.md`.

## Steps

1. Grep for the route registration (`(app|router)\.(get|post|put|delete|patch)\(['"]<path>`).
2. Read the handler. Follow imports into `lib/` or helpers.
3. Identify the sink and assess OWASP categories relevant to that sink.
4. Fill `FINDINGS_TEMPLATE.md` one section per applicable category:
   - `file:line`
   - Request shape (verb + path + payload shape — no working payloads)
   - Severity H/M/L with justification
   - Confidence H/M/L
5. Skip categories that don't apply; say "Not applicable — <reason>".

## Guardrails

- No working SQL injection / XSS / command-injection payloads
- No `curl` lines aimed at anything
- No touching or editing files (Read / Grep only; helper script is the only Bash allowed)
- No speculation about code outside files read in this invocation
- No rating severity H without a one-line exploit-path justification

## Supporting files

- `scripts/audit-route.sh` — helper that maps a route path to the file registering it (ripgrep-based)
- `FINDINGS_TEMPLATE.md` — the output schema
