# Exercise 1 — Command vs. Skill

For each scenario, decide: **command**, **Skill**, or **plain prompt**. Justify.

1. "Every morning I want to see pass/fail by test category, formatted the same way."
2. "I want Claude to scaffold a new React component when I describe a feature."
3. "I need to refactor one specific function today. Never doing this again."
4. "Every time someone opens a PR, I want a scoped security review with consistent output."
5. "I want Claude to pick up when I say 'trace the auth path' and do it the same way each time."

## Answers

1. **Command** — recurring, fixed shape, explicit invocation is fine.
2. **Skill** — natural-language invocation ("add feature X"), multi-step, produces artifacts.
3. **Plain prompt** — one-off.
4. **Command** — recurring, explicit invocation (tied to PR template or CI).
5. **Skill** — phrasing-triggered, deterministic process.

## Debrief

Which scenario was ambiguous for you? What extra context would decide it?
