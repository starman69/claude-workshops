# Phase 8 — Reflection

**Time:** 10 min

## Questions for the group

1. **Trust calibration:** Which tool calls did you approve without reading? Which did you scrutinize? Was your trust calibrated to the actual risk?
2. **Prompting quality:** Identify one prompt from today that produced shallow or generic output. Rewrite it with concrete file paths, line numbers, and what specifically should change.
3. **Memory:** What did you tell Claude more than once? That belongs in `CLAUDE.md` or user memory.
4. **Hook hits:** Did the `block-secrets.sh` hook trigger today? If yes, was it a true positive? If no, did you *try* to trigger it to verify?
5. **What's missing:** What would have made this project go faster? (Permissions gap? Missing memory? Unclear commands?) Fix it before the next session.

## Recovery moves — when Claude gets stuck

- **Interrupt** (esc) — stop mid-tool-call if you see it heading the wrong way
- **Rephrase with anchors** — file:line + the change + what not to touch (see `phase-5-workflows/exercises/05-prompting-craft.md`)
- **Plan mode** — force a written plan before more edits
- **`/compact`** — keep the thread, shed noise
- **`/clear`** — fresh context beats arguing with a confused session
- **`git restore .`** — undo all local edits and try again with a better prompt

## Save lessons

Use the `#` shortcut in Claude Code to append useful findings to memory for next time.

## No before/after

This is an activity.
