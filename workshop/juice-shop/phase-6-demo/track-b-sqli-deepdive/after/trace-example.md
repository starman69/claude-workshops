# Vulnerability Trace — Example (login SQLi)

> Paths are illustrative — confirm against your local Juice Shop version.

- **Endpoint:** `POST /rest/user/login`
- **Route registration:** `server.ts:~200` — `app.post('/rest/user/login', login())`
- **Handler / controller:** `routes/login.ts:~15` — exported `login()` factory returns the Express handler
- **Query / sink:** `routes/login.ts:~30` — `models.sequelize.query("SELECT * FROM Users WHERE email = '" + req.body.email + "' AND password = '" + security.hash(req.body.password) + "' AND deletedAt IS NULL")`
- **Sink type:** ☑ raw SQL concat
- **Input taint path:**
  - Source: `req.body.email` (string) and `req.body.password` (string)
  - Transformations: `password` goes through `security.hash`; `email` is used raw
  - Validator encountered? ☐ no — there is no type/length/format check on `email` before the concat
- **Why it is exploitable:** `email` is interpolated into a string-literal SQL context with no escaping, so meta-characters terminate the literal and the remainder of the query can be rewritten — the `password` check can be short-circuited.
- **Suggested fix category:** ☑ parameterized query   ☑ input validator
