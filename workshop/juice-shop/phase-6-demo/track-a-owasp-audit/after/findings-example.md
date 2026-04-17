# OWASP 2021 Audit — Findings (Example)

> Authorized training, report only. Paths below are illustrative and may differ by Juice Shop version — verify against your local checkout. **No working exploit payloads included.**

---

## A01 — Broken Access Control

- **Description:** Several admin-adjacent endpoints gate on the presence of a JWT but not on role claims, allowing a regular user's token to access resources intended for administrators.
- **Candidate paths (`file:line`):**
  - `routes/basket.ts:~20` — basket retrieval accepts a basket id from the URL and may not verify the id belongs to the caller
  - `routes/userProfile.ts:~15` — profile update uses the request body's user id instead of the JWT subject
- **Request-level PoC sketch:** `GET /rest/basket/{other-user-id}` with your own bearer token; expect the other user's basket to come back instead of 403.
- **Severity:** H    **Confidence:** M (verified path, not verified runtime)
- **Notes:** Standard IDOR shape. Compare with the "Access Basket" challenge on the score-board.

---

## A02 — Cryptographic Failures

- **Description:** JWT signing uses a weak, hardcoded secret checked into source. Tokens can be re-signed offline once the secret is known, which makes every authenticated endpoint reachable as any user.
- **Candidate paths:**
  - `lib/insecurity.ts:~10` — exported `privateKey`/`publicKey` or HMAC secret constant
  - `routes/login.ts:~50` — where the token is issued using the weak secret
- **Request-level PoC sketch:** *description only* — forge a JWT locally with the known secret, replace `sub` with the target user id, send as `Authorization: Bearer …` to any authenticated endpoint. Do not encode a working token here.
- **Severity:** H    **Confidence:** H
- **Notes:** Paired with A07 (weak authentication), this is the most leveraged finding — fixing the secret source materially reduces blast radius.

---

## A03 — Injection

- **Description:** The login endpoint concatenates `email` and `password` from the request body directly into a Sequelize raw query, producing a classic SQL injection.
- **Candidate paths:**
  - `routes/login.ts:~30` — `sequelize.query("... WHERE email = '" + req.body.email + "' AND password = '" + ... + "'")`
  - `models/user.ts:~40` — no input validation or parameterized query layer between the route and the ORM
- **Request-level PoC sketch:** `POST /rest/user/login` with a JSON body whose `email` contains SQL meta-characters terminating the string literal and commenting out the password check. Expected response: a token for the first matching row. Do not paste a working payload here — see Track B for a contained repro recipe.
- **Severity:** H    **Confidence:** H
- **Notes:** Track B deep-dives this endpoint and proposes a parameterized-query fix.

---

## A04–A10

Not yet audited in this example. The facilitator fills these in during a live session, or the learner completes them as homework using the same shape above.
