# /juice-shop-audit — Install & Run

## Install

In your Juice Shop checkout:

```bash
mkdir -p .claude/commands
cp /path/to/this-workshop/after/juice-shop-audit.md .claude/commands/
```

## Run

```
/juice-shop-audit routes/login.ts
/juice-shop-audit routes/userProfile.ts
/juice-shop-audit routes/basket.ts
```

## Verify

- Output matches the Phase 6 Track A findings schema (file:line + request shape + severity + confidence)
- No working payloads in the output
- No `curl` lines or exploit code
- `/help` lists the command

## Maintain

- Keep `allowed-tools` at `Read, Grep`. Adding `Edit` or unscoped `Bash` weakens the guardrails.
- When you cover a new route type (GraphQL resolver, WebSocket handler), add a note to the command body; don't duplicate the command.
- Tag your command version in the frontmatter `description` if you iterate — makes it obvious when the prompt has drifted.
