# Exercise 4 — Map the Auth Surface

**Goal:** use the `Explore` subagent to produce a short written map of Juice Shop's authentication and authorization surface — the kind of map you'd want before a Phase 6 audit.

**Prompt to try:**

> Spawn an `Explore` subagent with a "medium" thoroughness pass. Have it map:
> 1. Where login happens (route, controller, password check)
> 2. How sessions / JWTs are issued and verified
> 3. Every middleware that gates routes based on role or identity
> 4. Every route that looks authenticated but may not actually check identity
>
> Report file:line for each, with one-sentence descriptions.

**What to watch for:**

- Does Claude actually delegate to `Explore` (not just run `Grep` in the main context)?
- Does the subagent return a **structured** map (route → middleware → identity check), not raw grep output?
- Does it flag **missing** checks (routes that should require auth but don't)?
- Does the final report include enough `file:line` anchors to go straight to Phase 6?

**Debrief questions:**

- Where did the subagent stop short? (E.g., "found JWT creation, did not trace how the secret is sourced.")
- Which finding was surprising? Which was obvious?
- Save this map — you'll reuse it in Phase 6.
