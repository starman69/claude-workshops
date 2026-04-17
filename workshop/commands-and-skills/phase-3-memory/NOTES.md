# Phase 3 — Memory Interaction (prerequisite check)

**Time:** 5 min
**Goal:** confirm project memory exists and is accurate. **This phase doesn't author a new `CLAUDE.md`.**

> **Prerequisite:** Phase 3 of the primary workshop ([TodoMVC](../../todomvc/phase-3-memory/NOTES.md) or [Juice Shop](../../juice-shop/phase-3-memory/NOTES.md)) must be complete. Your target repo has a `CLAUDE.md` at its root describing stack, commands, conventions, and gotchas.

## Verify (in your target repo)

- [ ] `CLAUDE.md` exists at the repo root
- [ ] Commands listed there still work (`npm test`, `npm start`, etc. as applicable)
- [ ] Conventions are still accurate — skim it, flag anything stale before authoring commands/Skills on top

## How memory flows in

Commands and Skills inherit `CLAUDE.md` (project) and `~/.claude/CLAUDE.md` (user scope). Everything there is available during each invocation.

## Implication 1: commands can be terse

If `CLAUDE.md` declares stack and conventions, a command body can say "scaffold a new component idiomatically" without repeating the conventions each time.

## Implication 2: Skills are more reliable

A Skill's body doesn't need to respecify file paths or naming if `CLAUDE.md` already does. Fewer things for the body to get wrong at invocation time.

## Implication 3: stale memory breaks both at scale

If `CLAUDE.md` is wrong (e.g., says the project uses Enzyme but it's moved to RTL), every invocation of every command and Skill produces stale output. Audit project memory **before** you ship custom commands to teammates.

## No before/after

This phase is a review.
