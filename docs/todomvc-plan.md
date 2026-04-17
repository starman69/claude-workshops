# Claude Code Onboarding — TodoMVC Module

**Goal:** Ramp a new user on AI-assisted development using Claude Code, landing on a working demo against TodoMVC (React stack).

**Audience:** Developers new to AI-assisted development.
**Duration:** ~4 hours (can be split across sessions).
**Outcome:** Hardened Claude Code config, project `CLAUDE.md`, and a merged PR against TodoMVC.

> Next step after this module: the **[Commands & Skills workshop](../docs/commands-and-skills-plan.md)** uses this TodoMVC checkout as a target for intermediate Claude Code extensibility (custom slash commands, Skills).

**Module folder:** [`workshop/todomvc/`](../workshop/todomvc/)

---

## Suggested workspace layout

This repo is **scaffolding** — plans, `before/after` snapshots, reference scripts. You do **not** do workshop exercises inside it.

Clone the target project into a **sibling folder** and run Claude Code from *there*. `after/` artifacts are portable templates — copy them into your target checkout's `.claude/` (project scope), or into `~/.claude/` (user scope):

```
~/projects/
├── <this-repo>/                 <-- this repo (reference only)
└── todomvc/                     <-- your working checkout (cloned in Phase 5)
    └── .claude/
        ├── settings.json        <-- from workshop/todomvc/phase-2-safety/after/
        └── hooks/
            └── block-secrets.sh <-- from workshop/todomvc/phase-2-safety/after/scripts/
```

## Using Codex or Copilot CLI?

Phases 1, 5, 8 transfer. Phases 2–4, 6–7 use Claude-specific mechanics:

- **Memory file:** `CLAUDE.md` → `AGENTS.md` (Codex) / `.github/copilot-instructions.md` (Copilot).
- **Hooks:** PreToolUse is Claude-only. Other CLIs rely on their sandbox/approval model plus deny-lists in native config; the `block-secrets.sh` pattern still works as a shell-level guard if you want defense in depth.
- **Plan mode / subagents:** Claude UX. Emulate by prompting explicitly — "don't modify anything, just plan", "use ripgrep to enumerate X".
- **Slash commands:** `/review`, `/security-review`, `/init` are Claude-only. Write equivalent prompts.

Learning goals (tool choice, trust calibration, memory hygiene, safety guards) transfer; the mechanics do not.

## Browser MCPs

TodoMVC runs as a local web UI. Install [Chrome DevTools MCP](https://github.com/ChromeDevTools/chrome-devtools-mcp) and [Playwright MCP](https://github.com/microsoft/playwright-mcp) alongside Claude Code so it can verify UI changes live during Phase 4 drills, Phase 6 Track B feature work, and Phase 7 review. Setup + when-to-use-which in [`docs/mcp-setup.md`](mcp-setup.md).

---

## Phase 1 — Install & Authenticate (15 min)

- Install Claude Code CLI; run `/login`.
- Verify model, plan mode toggle (shift+tab), and `/help`.
- Tour the UI: tool-call approvals, permission modes (shift+tab cycles default → accept-edits → plan; `bypass` is launched separately via `--dangerously-skip-permissions` or `permissions.defaultMode` in settings).

**Workshop folder:** `workshop/todomvc/phase-1-install/`

---

## Phase 2 — Safety & Permissions (30 min) ⚠️ *critical for new users*

Configure `~/.claude/settings.json` (user scope) and `.claude/settings.json` (project scope).

1. **Deny list for secrets** — block reads/edits of `.env*`, `*.pem`, `id_rsa`, `secrets/**`, `credentials.json`, and shell exfil paths (`cat .env*`, `env`, `printenv`).
2. **PreToolUse hook** — shell-level guard (defense in depth) that exits non-zero when a tool tries to touch sensitive paths.
3. **Allow list** — pre-approve safe commands (`npm test`, `npm run lint`, `git status`, `git diff`) to cut approval friction.
4. **Validate** by asking Claude to read `.env` — must be blocked.

**Workshop folder:** `workshop/todomvc/phase-2-safety/`
- `before/` — minimal/default settings
- `after/` — hardened `settings.json` + working `block-secrets.sh` hook

---

## Phase 3 — Project Memory (20 min)

- Add a project `CLAUDE.md` with: stack, test command, lint command, conventions, "don't touch" directories.
- Seed user memory (`~/.claude/`) with role/preferences.
- Demonstrate `#` shortcut to append quick facts.

**Workshop folder:** `workshop/todomvc/phase-3-memory/`
- `before/` — empty (no project memory)
- `after/` — example project `CLAUDE.md`

---

## Phase 4 — Core Workflows (45 min)

Hands-on with throwaway files:

- **Explore**: `Glob`, `Grep`, `Read` (vs. `find`/`cat` — why the dedicated tools win).
- **Edit**: `Edit` vs. `Write`; always Read-before-Edit.
- **Plan mode**: design a change before executing.
- **Subagents**: `Explore` for open-ended searches; `Plan` for multi-file changes.
- **Slash commands & skills**: `/review`, `/security-review`, `/init`.

**Workshop folder:** `workshop/todomvc/phase-4-workflows/exercises/`

---

## Phase 5 — Target Setup: TodoMVC React (20 min)

- Clone `tastejs/todomvc` (or the canonical React example), `cd` in, run locally.
- Generate `CLAUDE.md` via `/init`.
- Baseline: tests pass, dev server runs, note React version + dependencies.

**Workshop folder:** `workshop/todomvc/phase-5-todomvc-setup/`
- `before/` — clone instructions, expected baseline
- `after/` — post-`/init` `CLAUDE.md`

---

## Phase 6 — Demo Track (pick ONE or do both) (60–90 min)

### Track A — React Upgrade

1. In plan mode, ask Claude to audit React version and produce a migration plan to latest stable.
2. Review plan → accept.
3. Execute: update `package.json`, address breaking changes (`ReactDOM.render` → `createRoot`, Strict Mode, deprecated lifecycles), fix types.
4. Verify: install, typecheck, lint, tests, manual browser smoke test of add/toggle/delete/filter/clear-completed.

**Workshop folder:** `workshop/todomvc/phase-6-demo/track-a-react-upgrade/`

### Track B — Feature Update

1. Pick a scoped feature — e.g., "persist todos to IndexedDB", "add due-date field", or "add dark mode toggle".
2. Write failing test(s) first (TDD).
3. Implement; verify in browser.

**Workshop folder:** `workshop/todomvc/phase-6-demo/track-b-feature-update/`

---

## Phase 7 — Review & Commit (20 min)

- Run `/review` on the diff.
- Run `/security-review` (especially if Track A touched deps).
- Stage & commit with a clear message; push a PR branch.

**Workshop folder:** `workshop/todomvc/phase-7-review/`

---

## Phase 8 — Reflection (10 min)

- Which tool calls were approved blindly vs. scrutinized?
- Which prompts produced shallow output? Rewrite them with file paths + line numbers.
- Save useful lessons to memory.

**Workshop folder:** `workshop/todomvc/phase-8-reflection/`

---

## Deliverables at End of Training

- Hardened `settings.json` + `block-secrets.sh` hook
- Project `CLAUDE.md` for TodoMVC
- Working PR (upgrade or feature) with green tests
