# Exercise 7 — Prompting Craft (Security Audit)

**Goal:** rewrite vague audit prompts so Claude produces calibrated, verifiable findings instead of plausible-sounding speculation.

## The anti-pattern

> Find security problems in this app.

Observe: Claude lists things that *could* be issues — some real, some not, all at "High". No file:line. No confidence rating. Unusable for a real report.

## The pattern (rewrite)

> Audit `routes/login.ts` and `routes/userProfile.ts` for OWASP **A01 (Broken Access Control)** only. For each candidate, output:
> - `file:line`
> - request-level PoC shape (verb + path + payload shape — **no working payloads**)
> - severity H/M/L with a one-line justification
> - your confidence H/M/L
>
> Do not speculate about code you haven't read in this session.

What changed:

- **Scoped files** — not the whole app
- **Scoped category** — A01 only
- **Output schema** — file:line + PoC shape + severity + confidence
- **Guardrail** — "no working payloads"
- **Humility clause** — "don't speculate about code you haven't read"

## Try it on your own

1. Pick a different OWASP category (e.g., A03 Injection).
2. Scope to 2–3 specific files from your Phase 4 auth-surface map.
3. Ask for the same output schema.
4. Compare the result to the quality of "find injection bugs in this app".

**Debrief questions:**

- Which ingredient does Claude most often drop when you forget it — scope, output schema, or the humility clause?
- When the humility clause is missing, how does severity calibration drift?
