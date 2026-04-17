# Audit Finding — <route path>

> Filled by the `audit-route` Skill. Description-level only; no working payloads.

## Route

- **Endpoint:** <METHOD> <path>
- **Registered at:** <file:line>
- **Handler at:** <file:line>
- **Sink at:** <file:line> (type: raw SQL / eval / exec / fs / http / other)

## Taint path

- **Source:** `req.body.X` / `req.query.Y` / header `Z`
- **Transformations:** trim, JSON.parse, cast, ...
- **Validator present?:** yes (describe) / no

---

## A01 Broken Access Control

- **File:line:** ___
- **Request shape:** <METHOD> <path> with <payload shape>
- **Severity:** H/M/L — <one-line justification>
- **Confidence:** H/M/L

## A02 Cryptographic Failures

- ...

## A03 Injection

- ...

## A04 Insecure Design

- ...

## A05 Security Misconfiguration

- ...

## A06 Vulnerable and Outdated Components

- ...

## A07 Identification and Authentication Failures

- ...

## A08 Software and Data Integrity Failures

- ...

## A09 Security Logging and Monitoring Failures

- ...

## A10 Server-Side Request Forgery

- ...

---

Categories that don't apply should be marked **"Not applicable — <reason>"** rather than skipped.
