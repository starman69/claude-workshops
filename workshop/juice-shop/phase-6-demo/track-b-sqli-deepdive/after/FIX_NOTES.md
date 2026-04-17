# Login SQLi Fix — Checklist

What the fix in `after/login.ts.snippet` actually covers:

- [ ] **Parameterized query** — `sequelize.query(..., { replacements: [...] })` instead of string concatenation. User input is bound as a parameter, never as SQL syntax.
- [ ] **Input validator** — reject inputs that are the wrong type, missing, empty, or not email-shaped before they reach the query layer.
- [ ] **Length cap** — cap email length (≤254 per RFC 5321) to prevent degenerate inputs.
- [ ] **Trim whitespace** — normalize before validation.
- [ ] **Uniform error** — return the same generic error for "bad format" and "bad credentials" to avoid user enumeration.

## Defense in depth

- [ ] Prefer Sequelize's model-level `User.findOne({ where: { email, password } })` over raw queries.
- [ ] Add a regression test that asserts an email containing SQL meta-characters returns 400 (validation) or 401 (no match), never 200.
- [ ] Audit sibling routes in `routes/` for the same raw-query pattern — fix in one place does not fix them all.

## Out of scope for this exercise

- Rate limiting, account lockout, CAPTCHA (useful but separate concerns)
- JWT secret rotation (see Phase 6 Track A, finding A02)
- Password hashing review (`security.hash` implementation)

## Regression test idea (describe, do not write an exploit)

> Add a Jest / Frisby test that posts an email field containing a single quote to `/rest/user/login`, asserts status ∈ {400, 401}, and asserts the response body does not contain a `token`.
