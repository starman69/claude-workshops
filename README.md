# Claude Code Workshops

Workshop scaffolding for teaching AI-assisted development with [Claude Code](https://claude.ai/code). This repo is **not** an application — it holds training plans, facilitator notes, and `before/after` reference snapshots that learners diff against their own work in a **separate** target checkout.

## Workshops

Each module is a self-contained 8-phase workshop (install → target setup → safety → memory → workflows → demo → review → reflection). Phase 6 splits into two tracks so facilitators can match the learner's goal.

| Module | Target | Phase 6 tracks | Plan |
|--------|--------|----------------|------|
| [`workshop/todomvc/`](workshop/todomvc/) | [TodoMVC (React)](https://github.com/tastejs/todomvc) — small, spec-tested React app · *onboarding* | **A.** React upgrade  ·  **B.** Test-first feature | [`docs/todomvc-plan.md`](docs/todomvc-plan.md) |
| [`workshop/juice-shop/`](workshop/juice-shop/) | [OWASP Juice Shop](https://github.com/juice-shop/juice-shop) — intentionally vulnerable Node/Angular app · **authorized** security training · *onboarding* | **A.** OWASP Top 10 audit  ·  **B.** SQLi deep dive | [`docs/juice-shop-plan.md`](docs/juice-shop-plan.md) |
| [`workshop/commands-and-skills/`](workshop/commands-and-skills/) | Claude Code extensibility — targets your TodoMVC or Juice Shop checkout · *intermediate* | **A.** TodoMVC command  ·  **B.** TodoMVC Skill  ·  **C.** Juice Shop command  ·  **D.** Juice Shop Skill | [`docs/commands-and-skills-plan.md`](docs/commands-and-skills-plan.md) |

## How to use

1. Read the module's plan under `docs/` — it's the facilitator-facing overview and single source of truth for the module.
2. Clone the target project into a **sibling folder outside this repo** (e.g., `~/projects/todomvc/`). Run Claude Code from there, not from this scaffolding.
3. Port `after/` artifacts (`settings.json`, `block-secrets.sh` hook, `CLAUDE.md`) into your target's `.claude/` (project scope) or `~/.claude/` (user scope). Each plan has a "Suggested workspace layout" diagram.
4. Work through each phase's `README.md` in order. For phases with `before/after`: copy `before/` into your working area, do the exercise, then `diff` against `after/`.
5. Keep `after/` untouched — it's the facilitator's reference, not an editable template.

Each plan also notes what changes if the learner uses **Codex** or **GitHub Copilot CLI** instead of Claude Code (memory file rename, hook model, slash-command equivalents).

## Structure

```
docs/
  <module>-plan.md      training plans (one per module)
  prompts/              generator prompts + README (spec-of-record for each module)
workshop/
  README.md             module index
  <module>/
    README.md           phase index
    phase-N-<name>/     README.md + before/after snapshots
CLAUDE.md               repo conventions (read first if contributing)
```

## Adding a new workshop

See [`docs/prompts/`](docs/prompts/) — a reusable template plus two worked examples (TodoMVC retrospective, Juice Shop original) showing how a module's spec gets filled in before it's generated.

## Contributing

Read [`CLAUDE.md`](CLAUDE.md) first — it's the style guide and the guardrail list (`README.md` ≤60 lines, no working files in the repo root, `before/after` file naming conventions, etc.). `CLAUDE.md` targets Claude Code but applies to human contributors too.
