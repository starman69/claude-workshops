# Phase 5 — Target Setup (prerequisite check)

**Time:** 10 min
**Goal:** confirm your target repo(s) and prior workshop artifacts are in place. **No cloning or install here** — if those aren't done, go back to the primary workshop's Phase 2.

> **Prerequisite:** Phase 2 of the primary workshop complete. Your target repo is cloned, dependencies installed, dev/test server runs, and you've captured the baseline.

## Pick your target(s)

- **TodoMVC only** → Track A (command) + Track B (Skill) in Phase 6
- **Juice Shop only** → Track C (command) + Track D (Skill)
- **Both** → all four

## Verify (per target)

- Repo cloned at `~/projects/<target>/` (done in that module's Phase 2)
- Dev/test server runs (`npm run dev` for TodoMVC, `npm start` for Juice Shop)
- `.claude/settings.json` in place (ported during the primary module's Phase 3)
- `.claude/hooks/block-secrets.sh` executable
- `CLAUDE.md` at the repo root
- `/help` works when run from the target directory and is free of stale experiments

## Baseline

Fill `before/baseline.md` — which target(s), what versions, anything already under `.claude/commands/` or `.claude/skills/`.

## Compare

```bash
diff before/baseline.md after/baseline.md
```

## Files

- `before/baseline.md` — fill-in template
- `after/baseline.md` — example filled baseline
