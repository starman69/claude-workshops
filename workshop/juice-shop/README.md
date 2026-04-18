# OWASP Juice Shop — Training Module

Hands-on materials for the training plan in [`../../docs/juice-shop-plan.md`](../../docs/juice-shop-plan.md).

> **Authorized training only.** OWASP Juice Shop is an intentionally vulnerable app whose maintainers invite vulnerability discovery for learning. Do not repurpose findings from this workshop against systems you don't own.

Each phase folder contains `before/` and `after/` snapshots (where applicable) so participants can diff their work against a known-good end state.

## Where to work

This folder is reference material. Clone Juice Shop into a sibling folder **outside this repo** (e.g., `~/projects/juice-shop/`) and run Claude Code from there. Port `after/` artifacts (settings, hook, memory) into your target checkout's `.claude/` folder, or into `~/.claude/` for user scope. See [`../../docs/juice-shop-plan.md`](../../docs/juice-shop-plan.md) for the full layout and notes for Codex / Copilot CLI users.

## Phase Index

| Phase | Folder | Has before/after? |
|-------|--------|-------------------|
| 1. Install & Authenticate | `phase-1-install/` | — (activity) |
| 2. Juice Shop Setup | `phase-2-juice-shop-setup/` | ✅ |
| 3. Safety & Permissions | `phase-3-safety/` | ✅ |
| 4. Project Memory | `phase-4-memory/` | ✅ |
| 5. Core Workflows | `phase-5-workflows/` | — (exercises) |
| 6a. OWASP Top 10 Audit | `phase-6-demo/track-a-owasp-audit/` | ✅ |
| 6b. SQLi Deep Dive | `phase-6-demo/track-b-sqli-deepdive/` | ✅ |
| 7. Review & Commit | `phase-7-review/` | — (activity) |
| 8. Reflection | `phase-8-reflection/` | — (activity) |

## How to Use

1. Work through each phase in order. Instructions live in each phase's `README.md`.
2. For phases with `before/` and `after/`: copy `before/` into your working area, complete the exercise, then `diff` against `after/` to check your work.
3. Keep the facilitator's copy of `after/` untouched — it's the reference.
