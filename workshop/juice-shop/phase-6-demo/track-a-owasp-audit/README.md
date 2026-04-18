# Phase 6 — Track A: OWASP Top 10 Audit

**Time:** 60–90 min
**Goal:** Produce a written OWASP 2021 findings report covering candidate code paths in Juice Shop. **Report only — do not run exploits.**

> Framing: this is authorized security training. The Juice Shop score-board is the project's *own* invitation to find and verify vulnerabilities; our deliverable here is a **written audit**, not a working attack.

## Workflow

1. **Plan mode:** ask Claude to outline an audit plan — one pass per OWASP 2021 category (A01–A10). Get the list of file areas it plans to inspect before executing.
2. **Breadth pass:** for each category, spawn an `Explore` subagent (or use `Grep`/`Read` inline) to locate **candidate** code paths. Reuse the auth map from Phase 5 Exercise 4.
3. **Describe, don't weaponize.** For each finding record:
   - Category (A01 … A10)
   - Description (one sentence)
   - Candidate path(s): `file:line`
   - Request-level PoC **sketch**: HTTP verb + path + payload *shape* (e.g., `POST /rest/user/login` with `email` containing SQL meta-characters) — **not** a working payload
   - Severity (H/M/L) and confidence (H/M/L)
4. **Rate severity** based on likely impact (auth bypass > disclosure > DoS), not just the OWASP category weight.

## Guardrails (repeat to Claude in the prompt)

- No exploit payloads, no curl one-liners that pop an account, no credential-stuffing scripts.
- No tooling that could be repurposed against third-party hosts.
- Describe the vuln at the request shape + code location level. Stop there.

## Files

- `before/findings-template.md` — blank template, all 10 categories
- `after/findings-example.md` — filled example for 3 categories (A01, A02, A03) — realistic shape, no working payloads

## Compare

```bash
diff before/ after/
```
