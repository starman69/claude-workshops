# Exercise 3 — Browser MCP (live UI)

**Setup:** the TodoMVC dev server is running (`npm run dev`). You have Chrome DevTools MCP and Playwright MCP configured — see [`../../../../docs/mcp-setup.md`](../../../../docs/mcp-setup.md).

**Prompt to try:**

> Open `http://localhost:8080` via Playwright MCP. Add three todos: "write tests", "run tests", "ship it". Toggle the second one as complete. Screenshot the result and describe what you see.

**What to watch for:**

- Does Claude pick **Playwright MCP** (correct for a scripted flow) or **Chrome DevTools MCP** (OK but less structured for multi-step interactions)?
- Does it stay on `localhost:8080`? Push back if it tries to navigate elsewhere.
- Does the screenshot actually show all three todos with the correct one toggled (strikethrough per TodoMVC spec)?
- If Claude struggles, is it because the selector / aria-label guesses are wrong? That's a clue the UI has specific hooks you should feed it.

**Debrief question:** you're reviewing a "dark mode toggle" feature PR. What prompt gets Claude to verify light/dark switching *and* capture before/after screenshots for the PR description?
