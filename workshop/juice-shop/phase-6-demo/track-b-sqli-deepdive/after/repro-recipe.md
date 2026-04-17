# Repro Recipe — Login SQLi (LOCAL ONLY)

> Run this **only** against your own `http://localhost:3000` Juice Shop instance. Juice Shop's score-board explicitly invites you to solve this challenge on a local copy. Do **not** point this request at any other host.

## Setup

- Juice Shop running on `http://localhost:3000`
- Score-board reachable at `/#/score-board`
- Challenge of interest: "Login Admin" (or the equivalent challenge for your version)

## The request

Send a standard `POST /rest/user/login` with a JSON body. The `email` field contains **SQL meta-characters** that close the string literal and cause the `password` check to short-circuit. Do not paste the exact payload verbatim into shared notes — read the Juice Shop score-board hint, construct it on your local box, and observe the response.

```text
POST /rest/user/login HTTP/1.1
Host: localhost:3000
Content-Type: application/json

{"email":"<SQL-meta-characters that terminate the email literal and comment out the password predicate>","password":"anything"}
```

## Expected response signature (successful bug)

- HTTP **200 OK** (not 401)
- JSON body contains an `authentication` object with a `token` (JWT)
- The `umail` field is the email of the **first user row** — often the admin account

If you get **401**, the injection did not rewrite the query. That is also a useful datapoint: re-read the handler and refine.

## What this confirms

- `req.body.email` flows into a string-concatenated SQL statement at `routes/login.ts`
- No input validation or parameterization is in place
- The `password` predicate can be neutralized at the SQL level

## Do not

- Aim this at any non-local host
- Extend this into a credential-stuffing loop or a user-enumeration tool
- Ship the payload alongside reusable attack tooling

Move on to `after/login.ts.snippet` for the fix shape and `after/FIX_NOTES.md` for the checklist.
