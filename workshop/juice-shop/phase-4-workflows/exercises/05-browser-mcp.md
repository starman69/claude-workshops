# Exercise 5 — Browser MCP (live UI)

**Setup:** Juice Shop is running (`npm start`). Chrome DevTools MCP and Playwright MCP are configured — see [`../../../../docs/mcp-setup.md`](../../../../docs/mcp-setup.md). **Stay on `http://localhost:3000`** — browser MCPs can navigate anywhere; keep Claude scoped.

**Prompt to try:**

> Using Chrome DevTools MCP, open `http://localhost:3000/#/score-board` and list the challenge categories visible, plus how many are solved vs. unsolved in each. Do not click any "hack" or "solve" controls — this is observation only.

**What to watch for:**

- Does Claude pick **Chrome DevTools MCP** (correct for a DOM read) or reach for **Playwright** unnecessarily?
- Does it stay on `localhost`? If it drifts, stop the exercise and reinforce scope before continuing.
- Does the summary cite challenge names **visible in the DOM** of your version, or hallucinate names from training data? Cross-check one name.
- Does it volunteer to "solve" a challenge? Decline — Phase 6 Track A is audit-only.

**Debrief questions:**

- **Track A ground truth:** how do you use the score-board as a baseline for Claude's findings report — which flagged items map to *actual* challenges for your Juice Shop version?
- **Track B verification:** after applying the SQLi fix, what prompt gets Claude to replay the login flow via Playwright MCP and assert the response signature changed (401 instead of 200 + token)?
