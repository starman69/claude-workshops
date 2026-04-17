# Exercise 2 — Plan Mode

**Setup:** press `shift+tab` until you see `plan mode` in the UI.

**Prompt to try:**

> Plan how we'd add rate limiting to the `/rest/user/login` endpoint, including storage, middleware, and tests. Do not write any code yet.

**What to watch for:**

- Claude should produce a written plan and stop — no edits.
- Plan should reference specific files (e.g., `routes/login.ts`, `server.ts`, a new middleware module).
- You should be able to redirect ("use an in-memory store, not Redis") before executing.

**Debrief question:** when is plan mode overkill? (Hint: single-line config tweaks.)
