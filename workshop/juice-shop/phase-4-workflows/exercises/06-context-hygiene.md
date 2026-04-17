# Exercise 6 — Context & Session Hygiene

**Goal:** know when to clear, compact, or restart a session. In a security audit, stale context produces confident nonsense — severity inflation, false correlation between unrelated findings.

## Symptoms (audit-specific)

- Claude cites `file:line` references from a different module or from an earlier scan
- Severity ratings drift upward as the session grows ("just to be safe, let's call it H")
- Findings start blending ("this is kind of A01 and A03 and A05")
- The task list (`TodoWrite`) still shows completed audit steps as in-progress

## The drill

1. `/compact` — preserves the findings sheet structure while freeing noise. Use mid-audit.
2. `/clear` — reset for a fresh audit pass (e.g., between OWASP categories). Rebuild context from Phase 3 memory + the findings template.
3. Restart `claude` if the session is genuinely wedged.

## Security-specific rules

- Move durable findings into the report **before** `/clear`. In-thread findings vanish on clear; `#`-appended memory persists.
- `/clear` does **not** reset browser MCP state. If you logged into Juice Shop with seeded accounts, close the browser session explicitly or restart the MCP server.
- If Claude has been speculating, `/clear` + a humility-clause prompt ("only assess code you read in this session") is often cleaner than trying to redirect mid-thread.

**Debrief question:** in an audit context, is a false-positive rate more damaging than a false-negative rate? How should that influence when you compact vs. clear?
