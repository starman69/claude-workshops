# Prompt — Generate TodoMVC Training Module (Retrospective)

> **Retrospective spec.** Reconstructed after the fact from the existing `workshop/todomvc/` module and `docs/todomvc-plan.md`, written in the same shape as `juice-shop-workshop-prompt.md` so both modules have a spec on record. Rerunning this against a clean repo should approximately reproduce today's TodoMVC module; it is not guaranteed to be exactly what seeded the original.

Paste the block below into a fresh Claude Code session at this repo's root to produce the TodoMVC workshop module.

---

## Paste this:

Create a training module inside this repo for teaching **AI-assisted development fundamentals** against the TodoMVC React example (https://github.com/tastejs/todomvc, `examples/react`) — a small, well-known React app whose spec tests make upgrade and feature work verifiable.

### Context

- This repo is workshop scaffolding. Read `CLAUDE.md` and `workshop/README.md` first to understand the conventions before generating anything.
- The module must follow the eight-phase structure (install → safety → memory → workflows → target setup → demo → review → reflection) with `before/after` snapshots where applicable.
- Create the module at `workshop/todomvc/`. Add a row to `workshop/README.md`.

### Deliverables

1. `docs/todomvc-plan.md` — training plan: goal, audience, duration, outcome, "Suggested workspace layout", "Using Codex or Copilot CLI?", then eight phase sections with time estimates + steps, then a Deliverables list.
2. `workshop/todomvc/README.md` — phase index table + "Where to work" note.
3. `workshop/todomvc/` — phase folders:
   - `phase-1-install/NOTES.md` — Claude Code install, `/login`, `/help`, `/model`, UI tour (shift+tab modes, `/`, `#`).
   - `phase-2-safety/` — `before/settings.json` (blank allow/deny), `after/settings.json` (hardened: allow list for `npm`/`git`/read-code globs; deny list for `.env*`, `*.pem`, `id_rsa`, `.ssh/`, `secrets/`, `credentials*`, cloud creds, destructive git, shell exfil), `after/scripts/block-secrets.sh` (PreToolUse hook, `chmod +x`, best-effort regex match on sensitive paths and shell exfil commands). Hook path in `settings.json`: `$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh` so the settings file is portable into the target checkout.
   - `phase-3-memory/after/CLAUDE.md` — stack (React, optional TypeScript, Vite or CRA, Jest + React Testing Library), commands (`npm ci`, `npm run dev`, `npm test`, `npm run lint`, `npm run build`), conventions (components in `src/components/`, hooks in `src/hooks/`, co-located `*.test.tsx`, no Redux in base), gotchas (strict TodoMVC spec tests, no persistence in the canonical example, hash routing), React upgrade tips, don't-touch directories.
   - `phase-4-workflows/NOTES.md` + `exercises/01-find-function.md` + `exercises/02-plan-mode.md` — tool drills emphasizing `Grep` over `Bash(grep)`, Read-before-Edit, plan mode, subagent delegation (`Explore`), slash commands (`/review`, `/security-review`, `/init`).
   - `phase-5-todomvc-setup/` — clone `tastejs/todomvc` **outside this training repo**, `cd` into `examples/react`, `npm ci`, `npm run dev`, run `/init`. Artifacts: `before/baseline.md` (fill-in template — commit hash, React/Node versions, test/lint/build results, dev port, manual smoke test), `after/baseline.md` (example), `after/CLAUDE.md.example` (post-`/init` reference).
   - `phase-6-demo/` — two tracks:
     - **Track A — React Upgrade** (`track-a-react-upgrade/`). Plan → execute migration from React 17 → 18+ (`ReactDOM.render` → `createRoot`, StrictMode, deprecated APIs, matching `@types/react`, `react-router` v5→v6 if needed, `@testing-library/react` v13+). Artifacts: `before/package.json.snippet`, `before/index-legacy.jsx`, `after/package.json.snippet`, `after/index-modern.jsx`, `after/UPGRADE_NOTES.md` (checklist of breaking changes).
     - **Track B — Feature Update (TDD)** (`track-b-feature-update/`). Pick one of: dark mode toggle, due date on todos, IndexedDB persistence. Plan → failing tests → implement → verify spec tests still pass. Artifacts: `before/feature-spec.md` (fill-in template), `after/feature-spec.md` (dark mode example), `after/example-test.test.jsx` (hook test shape with React Testing Library).
   - `phase-7-review/NOTES.md` — `git diff` self-review, `/review`, `/security-review` (especially if Track A touched dependencies), full verification suite, commit with a meaningful message, PR.
   - `phase-8-reflection/NOTES.md` — trust calibration, prompt quality, memory hygiene, hook verification, process gaps. Encourage saving lessons via `#`.

### Style rules (from this repo's `CLAUDE.md` — re-read it)

- No new files in the repo root.
- `NOTES.md` per phase, ≤60 lines each.
- `before/` = starting state for the learner; `after/` = facilitator reference, not editable.
- Use `.example` / `.snippet` / `-legacy` / `-modern` suffixes on reference files so they aren't confused with runnable code.
- Scripts must be `chmod +x`.
- Batch all file creation (single `Bash` for `mkdir`/`chmod`, then `Write` calls).
- The target is cloned into a sibling folder outside this repo — `NOTES.md` files must reflect this.

### Acceptance check

When finished, print a tree of the new `workshop/todomvc/` directory and confirm:

- [ ] `docs/todomvc-plan.md` exists and reads cleanly top to bottom.
- [ ] `workshop/README.md` lists the module.
- [ ] Every phase has a `NOTES.md`, each ≤60 lines.
- [ ] `block-secrets.sh` is present under `phase-2-safety/after/scripts/` and executable; hook path in `settings.json` is `$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh`.
- [ ] Both demo tracks have `before/` (template / starting snippet) and `after/` (filled example / target snippet) artifacts.
- [ ] Phase 5 NOTES tells the learner to clone **outside this training repo**.

---

*End of prompt.*
