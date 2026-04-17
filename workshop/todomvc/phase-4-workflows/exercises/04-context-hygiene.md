# Exercise 4 — Context & Session Hygiene

**Goal:** know when to clear, compact, or start a fresh session — the #1 fix for "why is Claude acting weird today".

**Setup:** do this mid-session, after you've already done 5+ tasks in the current `claude` session. If you're just starting out, do Exercise 1–3 first, then come back.

## Symptoms you're watching for

- Claude references decisions from a task you finished ("as we discussed earlier...") that don't apply anymore
- It re-runs searches you already told it the answer to
- Approval prompts show paths from a previous task
- Its task list (`TodoWrite`) has stale items
- Responses start drifting generic

## The drill

1. **Try `/compact` first** — Claude summarizes the session so far and frees tokens while keeping the thread going. Good when the current task continues but history is noisy.
2. **`/clear`** — resets context entirely. Use when the next task is genuinely separate.
3. **Restart the `claude` CLI** — nuclear option. Use if the session is genuinely unrecoverable or the model itself seems wedged.

## What to watch for

- After `/clear`, does Claude re-read `CLAUDE.md` (Phase 3)? It should — that's why memory matters.
- Your shell state (`cd`, `npm run dev` process) persists across `/clear`. Only Claude's context resets.
- Quick-appended `#` memories survive `/clear`; in-thread chat does not.

**Debrief question:** what's a heuristic for compact vs. clear? (Hint: compact when the current task continues but history is noisy; clear when the next task is genuinely separate.)
