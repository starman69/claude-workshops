# Browser MCPs — Setup & Usage

Both workshop modules run their target app as a local web UI on `http://localhost:3000`. Two MCP servers give Claude Code the ability to **see and drive that UI** during Phase 4 drills, Phase 6 demo tracks, and Phase 7 review:

- [**Chrome DevTools MCP**](https://github.com/ChromeDevTools/chrome-devtools-mcp) — ad-hoc inspection: DOM, console messages, network requests, performance. Good for "what's on the page right now?" and "did that click fire the expected request?".
- [**Playwright MCP**](https://github.com/microsoft/playwright-mcp) — scripted flows, screenshots, accessibility tree. Good for "walk through the add → toggle → delete flow and capture a screenshot at each step".

Both are optional but recommended — once configured, Claude can verify a UI change end-to-end without you switching to the browser.

## Install

Follow each project's README for the canonical command; the Claude Code pattern is:

```bash
claude mcp add chrome-devtools -- npx chrome-devtools-mcp@latest
claude mcp add playwright       -- npx @playwright/mcp@latest
```

Verify with `claude mcp list` — both servers should appear active in a fresh session.

## When to use which

| Situation | Tool |
|-----------|------|
| "Is the dev server even rendering?" | Chrome DevTools MCP (quick snapshot) |
| "Walk through the add-todo flow and screenshot each step" | Playwright MCP |
| "Inspect the DOM after this state change" | Chrome DevTools MCP |
| "Reproduce login → cart → checkout as a scripted path" | Playwright MCP |
| "Show me the network requests this click fires" | Chrome DevTools MCP |
| "Record an E2E that asserts the fix" | Playwright MCP |

## Safety

Browser MCPs can navigate **anywhere**, not just `localhost`. For these workshops:

- Keep Claude scoped to `http://localhost:3000` — say so in your prompts ("stay on localhost").
- Do not point them at production sites in the same session, especially during the Juice Shop module. The `block-secrets.sh` hook does not guard the browser.
- Clear browser state between phases if you've logged into a seeded account (relevant in Juice Shop).

## Usage patterns

**TodoMVC Phase 4 drill** — `exercises/03-browser-mcp.md` walks through reproducing a user flow via Playwright MCP.

**TodoMVC Track B (feature work):** after Claude implements a feature to satisfy a failing test, ask it to open the app via Playwright MCP, reproduce the user flow, and screenshot the result alongside the green test.

**Juice Shop Phase 4 drill** — `exercises/05-browser-mcp.md` uses Chrome DevTools MCP to read the score-board DOM without clicking any challenge-triggering controls.

**Juice Shop Track A (OWASP audit):** use Chrome DevTools MCP on `/#/score-board` to ground-truth Claude's findings report — which flagged items map to real challenges for your version?

**Juice Shop Track B (SQLi fix):** after the parameterized-query fix, use Playwright MCP to replay a login attempt against the fixed app and confirm the response signature changed (no more 200 + token on malformed input).

**Phase 7 review:** before committing, have Claude screenshot the affected UI areas so the PR description carries a visual diff, not just a code diff.
