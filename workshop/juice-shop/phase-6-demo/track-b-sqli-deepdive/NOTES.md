# Phase 6 — Track B: SQL Injection Deep Dive

**Time:** 60–90 min
**Goal:** Trace **one** vulnerable endpoint from route → controller → query, write a minimal repro recipe, and propose a concrete parameterized-query fix.

> Default target: `POST /rest/user/login` (Juice Shop's login SQLi — a classic score-board challenge). Any repro here runs only against **your local** Juice Shop, as that project's own challenge play invites.

## Workflow

1. **Trace** (use `Grep` → `Read`; `Explore` if the call chain is long):
   - Route registration → handler → query construction
   - Fill in `before/trace-template.md`. Compare against `after/trace-example.md`.

2. **Write the repro recipe** in `after/repro-recipe.md` shape: one `curl` against `http://localhost:3000`, and the response signature that confirms the bug (e.g., a JSON token when the password field was never supplied correctly). Do **not** include credential-stuffing logic or any target other than localhost.

3. **Propose the fix** — capture as a `.snippet` patch:
   - Replace string concatenation with a parameterized query / ORM `where` clause
   - Add an input validator (length, allowed character class, or Joi/zod schema)
   - Note one regression test idea — *describe* it, don't generate a working attack test

4. **Verify the fix conceptually:** read through the diff and confirm the tainted input can no longer reach the SQL sink.

## Guardrails

- Local target only. Never aim the `curl` at anything you don't own.
- No turn-key exploit script. The recipe is one request + expected response signature.
- Fix snippet must be minimal and readable — it's a teaching artifact, not a production patch.

## Files

- `before/trace-template.md` — blank trace sheet
- `after/trace-example.md` — filled trace for the login endpoint
- `before/login.ts.snippet` — vulnerable shape (for reading/diffing)
- `after/login.ts.snippet` — fixed shape
- `after/repro-recipe.md` — repro command + expected response signature
- `after/FIX_NOTES.md` — checklist of what the fix covers
