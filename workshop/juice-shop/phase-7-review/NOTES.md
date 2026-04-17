# Phase 7 — Review & Commit

**Time:** 20 min
**Goal:** Ship Track B's fix with confidence and critique Track A's report for quality.

## Steps

1. **Inspect the diff yourself first** — `git diff` or IDE diff view on the Track B fix. Don't skip this.

2. **Run `/security-review`** on the proposed fix. Read the output critically:
   - Did it catch anything beyond the SQLi (e.g., timing-based user enumeration, missing rate limit)?
   - Did it flag false positives (e.g., "this regex could ReDoS") that aren't actually reachable here?

3. **Critique Track A's findings report** — do a second pass on `findings-report.md` (yours, or the example):
   - Mark **false positives**: candidate paths that look vulnerable in isolation but have a validator/middleware upstream you missed.
   - Mark **missed severity**: findings that are H but you rated M, or vice versa.
   - Mark **missing categories**: OWASP buckets you left empty without confirming absence.
   - Re-rank by `severity × exploitability` (H/H first, then H/M, then M/M).

4. **Remediation memo** — write a short markdown memo (one screen) that ranks findings, links each to a one-line fix direction, and flags which require a fix vs. which are accepted risks for this training context.

5. **Run the full verification suite** on the Track B fix: `npm run lint && npm test && npm run frisby`.

6. **Commit the fix** (Track B only — Track A ships as docs):
   ```
   Fix login SQLi: parameterize query, add input validator

   - Replace string-concat SQL with parameterized Sequelize query
   - Validate email shape/length and reject malformed input early
   - See workshop/juice-shop/phase-6-demo/track-b-sqli-deepdive/ for the trace
   ```

## Git workflow with Claude

- `git diff` each changed file yourself before staging
- `git add -p` to stage hunks piecemeal; reject anything that leaks test data or fake creds
- `git restore <file>` to drop an edit Claude made that you don't want

## No before/after

This is an activity. The deliverables are: a `/security-review` transcript you reviewed, a remediation memo, and (for Track B) a commit / PR.
