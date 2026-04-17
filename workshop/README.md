# Claude Code Training Workshop

This directory hosts hands-on training modules. Each module is a self-contained 8-phase workshop.

## Modules

| Module | Target | Plan |
|--------|--------|------|
| [`todomvc/`](todomvc/) | TodoMVC (React) — upgrade or feature demo (onboarding) | [`../docs/todomvc-plan.md`](../docs/todomvc-plan.md) |
| [`juice-shop/`](juice-shop/) | OWASP Juice Shop (Node/Angular) — authorized security training (onboarding) | [`../docs/juice-shop-plan.md`](../docs/juice-shop-plan.md) |
| [`commands-and-skills/`](commands-and-skills/) | Claude Code extensibility — custom slash commands + Skills (intermediate; targets TodoMVC and/or Juice Shop) | [`../docs/commands-and-skills-plan.md`](../docs/commands-and-skills-plan.md) |

## Phase Model

Every module uses the same eight-phase spine:

1. **Install & Authenticate** — activity
2. **Safety & Permissions** — `before/after`
3. **Project Memory** — `before/after`
4. **Core Workflows** — exercises
5. **Target Setup** — `before/after`
6. **Demo** — one or more tracks, each with `before/after`
7. **Review & Commit** — activity
8. **Reflection** — activity

Phases 1–4 are nearly identical across modules (Claude Code setup is target-agnostic). Phases 5–8 are customized per target.

## How to Use

1. Read the module's `NOTES.md` files from this repo as reference.
2. Clone the target project (TodoMVC, Juice Shop, ...) into a **sibling folder outside this repo** — that's where Claude Code runs and where you edit code.
3. Port `after/` artifacts (e.g., `settings.json`, `block-secrets.sh`, `CLAUDE.md`) into your target checkout's `.claude/` folder, or into `~/.claude/` for user scope.
4. For phases with `before/after`: copy `before/` into your working area, do the exercise there, then `diff` against `after/` in this repo.
5. Keep `after/` untouched — it's the facilitator's reference.

See each module's plan (under `docs/`) for the full suggested workspace layout and alt-CLI notes (Codex, Copilot).
