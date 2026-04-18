# Exercise 3 — Dangerous Sinks Drill

**Goal:** enumerate the "danger zone" — code patterns that commonly map to injection vulnerabilities.

**Prompt to try:**

> Use `Grep` to find every occurrence of `eval(`, `exec(`, `child_process`, and raw SQL string concatenation (e.g., `sequelize.query(\`...${...}\`)` or `+ req.body.` inside a query) across the Juice Shop source. Group results by category. Do not propose fixes yet.

**What to watch for:**

- Does Claude run **four separate targeted `Grep` calls** (one per pattern) in parallel, or one loose mega-regex?
- Does it filter by `glob: "**/*.ts"` / `"**/*.js"` to skip `node_modules/` and built assets?
- Does it use `output_mode: "content"` with `-n` so each hit is `path:line`?
- Does it acknowledge false positives (e.g., `exec` in a comment, `eval` in a minified vendor file)?

**Debrief questions:**

- Which pattern produced the most noise? Why?
- For the **real** hits, which would you promote to a Phase 6 Track A finding?
- What did Claude miss that a human would catch? (Template literals that *look* safe but aren't; ORM methods that still concatenate.)
