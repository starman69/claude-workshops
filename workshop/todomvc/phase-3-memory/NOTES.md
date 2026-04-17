# Phase 3 — Project Memory

**Time:** 20 min
**Goal:** Give Claude the context it needs so you don't re-explain the project every session.

## Exercise

1. Look at `before/` — empty. No project memory.
2. In a real project, you'd run `/init` to scaffold a `CLAUDE.md`. For this workshop, examine `after/CLAUDE.md` to see what a good one looks like.
3. Edit it to match your project's reality — test command, lint command, known pitfalls, directories to avoid.

## Good `CLAUDE.md` covers

- **Stack:** languages, frameworks, package manager
- **Commands:** how to build/test/lint/run
- **Conventions:** import style, test patterns, naming
- **Gotchas:** generated files, flaky tests, "don't touch" directories
- **Anti-patterns:** things you've seen Claude get wrong before

## Don't include

- Things Claude can derive by reading code (file structure, existing patterns)
- Long prose — bullet points win
- Secrets or credentials — memory files are checked in

## User-scope memory

After your project `CLAUDE.md`, seed `~/.claude/CLAUDE.md` once with things that carry across all your projects:

- Your role (e.g., "senior backend dev, picking up React for this workshop")
- Cross-project preferences ("prefer tests first", "no `any` in new TS")

Verify: in a fresh session on a different project, Claude should reference these without being re-told.

## Compare

```bash
diff -ru before/ after/
```
