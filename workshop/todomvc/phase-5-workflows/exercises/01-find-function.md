# Exercise 1 — Find a Function

**Prompt to try:**

> Where is the `toggleTodo` function defined and called?

**What to watch for:**

- Does Claude reach for `Grep` (correct) or `Bash(grep ...)` (wrong — slower, no syntax benefits)?
- Does it use `output_mode: "content"` with `-n` to show line numbers?
- Does it follow up by reading the file for context?

**Debrief question:** what's the prompt you'd use if you wanted Claude to not just find it but also tell you whether it handles optimistic updates?
