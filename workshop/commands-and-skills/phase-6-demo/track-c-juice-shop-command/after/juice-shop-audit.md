---
description: Run a scoped OWASP Top 10 audit against one Juice Shop route. Report-level output only — no exploit payloads.
argument-hint: <path to a route file under routes/>
allowed-tools: Read, Grep
---

# /juice-shop-audit

Audit a single Juice Shop route file for OWASP Top 10 issues. Output is **description level only**.

## Framing

This is **authorized defensive security training** against an intentionally vulnerable app whose maintainers invite vulnerability discovery. Findings must not be repurposed against systems you don't own.

## Steps

1. Read the target file: `$ARGUMENTS`
2. Trace imports: read any helper modules referenced (validators, query helpers, auth middleware).
3. For each OWASP 2021 category (A01–A10), assess whether the route exhibits the weakness:
   - Cite `file:line`
   - Describe the request shape (verb + path + payload *shape* — no working payloads)
   - Rate severity H/M/L with a one-line justification
   - Rate confidence H/M/L
4. Skip categories that don't apply — say so explicitly ("A10 SSRF: no outbound HTTP in this file").
5. Do not open the app or run requests — this is static analysis only.

## Output format

```
Audit: <filename>

A01 Broken Access Control
  - file:line
  - Request shape: <verb> <path> with <payload shape>
  - Severity: H/M/L — <one line>
  - Confidence: H/M/L

A02 Cryptographic Failures
  ...
```

## Do not

- Generate working SQL injection / XSS / command-injection payloads
- Write `curl` commands aimed at anything
- Touch any files (no `Edit`, no `Write`)
- Speculate about code outside the file(s) you read in this invocation
- Rate severity H without a one-line exploit-path justification
