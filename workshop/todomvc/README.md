# TodoMVC (React) — Training Module

Hands-on materials for the training plan in [`../../docs/todomvc-plan.md`](../../docs/todomvc-plan.md).

Each phase folder contains `before/` and `after/` snapshots (where applicable) so participants can diff their work against a known-good end state.

## Where to work

This folder is reference material. Clone TodoMVC into a sibling folder **outside this repo** (e.g., `~/projects/todomvc/`) and run Claude Code from there. Port `after/` artifacts (settings, hook, memory) into your target checkout's `.claude/` folder, or into `~/.claude/` for user scope. See [`../../docs/todomvc-plan.md`](../../docs/todomvc-plan.md) for the full layout and notes for Codex / Copilot CLI users.

## Phase Index

| Phase | Folder | Has before/after? |
|-------|--------|-------------------|
| 1. Install & Authenticate | `phase-1-install/` | — (activity) |
| 2. Safety & Permissions | `phase-2-safety/` | ✅ |
| 3. Project Memory | `phase-3-memory/` | ✅ |
| 4. Core Workflows | `phase-4-workflows/` | — (exercises) |
| 5. TodoMVC Setup | `phase-5-todomvc-setup/` | ✅ |
| 6a. React Upgrade | `phase-6-demo/track-a-react-upgrade/` | ✅ |
| 6b. Feature Update | `phase-6-demo/track-b-feature-update/` | ✅ |
| 7. Review & Commit | `phase-7-review/` | — (activity) |
| 8. Reflection | `phase-8-reflection/` | — (activity) |

## How to Use

1. Work through each phase in order. Instructions live in each phase's `NOTES.md`.
2. For phases with `before/` and `after/`: start by copying `before/` into your working area, complete the exercise, then `diff` against `after/` to check your work.
3. Keep the facilitator's copy of `after/` untouched — it's the reference.
