# Phase 7 — Review & Iterate

**Time:** 20 min
**Goal:** iterate your new command / Skill on fresh inputs until it's durable, then commit.

## Steps

1. **Run on a fresh input.** For commands: a test file or route you haven't exercised yet. For Skills: a feature description or audit target you haven't scaffolded.
2. **Note drift.** Where did output differ from expectation? Was the fix in the prompt body, `allowed-tools`, or the `description`?
3. **Tighten.** Edit the `.md` file. Do **not** add workarounds downstream — they rot.
4. **Run `/security-review`** on the committed command/Skill file. Does it flag `allowed-tools` that are too loose? Does it hint at tools that should be scoped tighter?
5. **Commit** to `.claude/commands/*.md` or `.claude/skills/**/SKILL.md`. These belong in version control so teammates benefit.

## Anti-patterns to catch in review

- `allowed-tools` too permissive (unscoped `Bash`, unnecessary `Edit`)
- `description` too narrow — Claude won't reach for the Skill when you expected it to
- `description` too broad — Skill triggers on unrelated asks
- Command/Skill body references files or conventions **not** in `CLAUDE.md` — brittle; either move them to memory or inline them

## No before/after

Iterative activity. Deliverable is a committed file under `.claude/` in your target repo.
