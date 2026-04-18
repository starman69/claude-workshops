# Phase 4 — Project Memory

**Time:** 20 min
**Goal:** Give Claude the context it needs so you don't re-explain Juice Shop's layout or the *authorized training* framing every session.

## Exercise

1. Look at `before/` — empty. No project memory.
2. You already ran `/init` in Phase 2 and have a starter `CLAUDE.md`. Compare it against `after/CLAUDE.md` in this folder to see what a good one looks like for Juice Shop — in particular, the authorized-training preamble is mandatory here.
3. Edit your project's `CLAUDE.md` to match your local checkout — pinned Juice Shop version, Node version, test command flavor, and add the preamble.

## Good `CLAUDE.md` covers

- **Preamble:** this is authorized security training against an intentionally vulnerable app
- **Stack:** Node / Express / Angular / SQLite via Sequelize
- **Commands:** how to start, test, run Frisby/Cypress suites
- **Conventions:** route → controller → model layering, where challenges register
- **Gotchas:** intentional vulns, intentional fake secrets, regenerated SQLite DB
- **Anti-patterns:** things you've seen Claude get wrong before

## Don't include

- Things Claude can derive by reading code (full file tree, imports)
- Long prose — bullet points win
- **Your** real secrets or credentials (Juice Shop's fake ones are fine as training context)

## User-scope memory

After your project `CLAUDE.md`, seed `~/.claude/CLAUDE.md` with cross-project preferences:

- Your role (e.g., "developer doing authorized security training")
- Preferences Claude should carry across projects ("describe, don't weaponize", "cite file:line always")

Verify: the authorized-training framing should apply to Juice Shop specifically via project memory, but cross-project preferences like "cite file:line" stay with you.

## Compare

```bash
diff -ru before/ after/
```
