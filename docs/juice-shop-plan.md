# Claude Code Onboarding — OWASP Juice Shop Module

> **Authorized training only.** Juice Shop is an intentionally vulnerable app whose maintainers invite vulnerability discovery for learning. Findings here must never be repurposed against systems you don't own or have explicit permission to test.

**Goal:** Teach AI-assisted **security vulnerability discovery** against OWASP Juice Shop, landing on a written findings report and one concrete code-level fix.

**Audience:** Developers new to AI-assisted security review. Prior security experience helpful but not required.
**Duration:** ~4 hours (can be split across sessions).
**Outcome:** Hardened Claude Code config, project `CLAUDE.md` for Juice Shop, an OWASP Top 10 findings report, and a repro recipe + fix snippet for one vulnerability.

> Next step after this module: the **[Commands & Skills workshop](../docs/commands-and-skills-plan.md)** uses this Juice Shop checkout as a target for intermediate Claude Code extensibility (custom audit commands, Skills).

**Module folder:** [`workshop/juice-shop/`](../workshop/juice-shop/)

---

## Suggested workspace layout

This repo is **scaffolding** — plans, `before/after` snapshots, reference scripts. You do **not** do workshop exercises inside it.

Clone Juice Shop into a **sibling folder** and run Claude Code from *there*. `after/` artifacts are portable templates — copy them into your target checkout's `.claude/` (project scope), or into `~/.claude/` (user scope):

```
~/projects/
├── <this-repo>/                 <-- this repo (reference only)
└── juice-shop/                  <-- your working checkout (cloned in Phase 5)
    └── .claude/
        ├── settings.json        <-- from workshop/juice-shop/phase-2-safety/after/
        └── hooks/
            └── block-secrets.sh <-- from workshop/juice-shop/phase-2-safety/after/scripts/
```

## Using Codex or Copilot CLI?

Phases 1, 5, 8 transfer. Phases 2–4, 6–7 use Claude-specific mechanics:

- **Memory file:** `CLAUDE.md` → `AGENTS.md` (Codex) / `.github/copilot-instructions.md` (Copilot). The authorized-training preamble from Phase 3 still belongs at the top of whichever file.
- **Hooks:** PreToolUse is Claude-only. Other CLIs rely on their sandbox/approval model plus deny-lists in native config; the `block-secrets.sh` pattern still works as a shell-level guard.
- **Plan mode / subagents:** Claude UX. Emulate by prompting explicitly — "don't modify anything, just plan", "use ripgrep to enumerate X".
- **Slash commands:** `/security-review`, `/init` are Claude-only. Write equivalent prompts (for security review: "audit this diff for OWASP Top 10 issues; flag file:line + severity; no exploit payloads").

Learning goals (trust calibration, over-claim vs. miss detection, memory hygiene, safety guards) transfer; mechanics do not.

## Browser MCPs

Juice Shop runs as a local web UI with a score-board at `/#/score-board`. Install [Chrome DevTools MCP](https://github.com/ChromeDevTools/chrome-devtools-mcp) and [Playwright MCP](https://github.com/microsoft/playwright-mcp) alongside Claude Code to ground-truth Track A findings against the score-board and to verify Track B fixes. Setup + safety (stay on `localhost`) in [`docs/mcp-setup.md`](mcp-setup.md).

---

## Phase 1 — Install & Authenticate (15 min)

- Install Claude Code CLI; run `/login`.
- Verify model, plan mode toggle (shift+tab), and `/help`.
- Tour the UI: tool-call approvals, permission modes (shift+tab cycles default → accept-edits → plan; `bypass` is launched separately via `--dangerously-skip-permissions` or `permissions.defaultMode` in settings).

**Workshop folder:** `workshop/juice-shop/phase-1-install/`

---

## Phase 2 — Safety & Permissions (30 min) ⚠️ *critical for new users*

Configure `~/.claude/settings.json` (user scope) and `.claude/settings.json` (project scope).

1. **Deny list for secrets** — block reads/edits of `.env*`, `*.pem`, `id_rsa`, `secrets/**`, `credentials.json`, and shell exfil paths (`cat .env*`, `env`, `printenv`).
2. **PreToolUse hook** — shell-level guard (defense in depth) that exits non-zero when a tool tries to touch sensitive paths.
3. **Allow list** — pre-approve safe commands (`npm test`, `npm run lint`, `git status`, `git diff`).
4. **Validate** — ask Claude to read `.env`, must be blocked.

⚠️ Juice Shop ships with intentional dummy secrets, weak JWT keys, and sample `.env` files *as part of the training target*. The hook still protects **your real credentials** on **your machine**. Do not disable it because the target is a training app.

**Workshop folder:** `workshop/juice-shop/phase-2-safety/`
- `before/` — minimal/default settings
- `after/` — hardened `settings.json` + working `block-secrets.sh` hook

---

## Phase 3 — Project Memory (20 min)

- Add a project `CLAUDE.md` for Juice Shop: stack (Node/Express/Angular/SQLite+Sequelize), commands (`npm start`, `npm test`, `npm run frisby`), key directories, "don't touch" paths.
- Preamble must frame the work as authorized security training against an intentionally vulnerable app.
- Seed user memory with role/preferences; use `#` to append quick facts.

**Workshop folder:** `workshop/juice-shop/phase-3-memory/`
- `before/` — empty (no project memory)
- `after/` — example project `CLAUDE.md` with training preamble

---

## Phase 4 — Core Workflows (45 min)

Hands-on with Claude Code tools, plus two security-specific drills:

- **Explore**: `Glob`, `Grep`, `Read` (vs. `find`/`cat`).
- **Edit**: `Edit` vs. `Write`; always Read-before-Edit.
- **Plan mode**: design before executing.
- **Dangerous sinks drill**: `Grep` for `eval(`, `exec(`, `child_process`, raw SQL string concatenations.
- **Auth-surface map**: `Explore` subagent to map login, JWT middleware, role checks.
- **Slash commands**: `/review`, `/security-review`, `/init`.

**Workshop folder:** `workshop/juice-shop/phase-4-workflows/exercises/`

---

## Phase 5 — Target Setup: OWASP Juice Shop (20 min)

- Clone `juice-shop/juice-shop`, `npm install`, `npm start`.
- Open `http://localhost:3000`, confirm app loads and `/#/score-board` is reachable.
- Baseline: Juice Shop version, Node version, challenge count, smoke test of login + product listing.
- Generate `CLAUDE.md` via `/init`.

**Workshop folder:** `workshop/juice-shop/phase-5-juice-shop-setup/`
- `before/` — baseline template to fill in
- `after/` — example filled baseline + post-`/init` `CLAUDE.md`

---

## Phase 6 — Demo Track (pick ONE or do both) (60–90 min)

### Track A — OWASP Top 10 Audit (breadth, report-only)

1. In plan mode, ask Claude to audit each OWASP 2021 category against the Juice Shop source.
2. For each category, locate candidate code paths (`file:line`), describe a request-level PoC (HTTP verb + path + payload shape), rate severity.
3. **Do not run exploits.** This track produces a **written report only**.

**Workshop folder:** `workshop/juice-shop/phase-6-demo/track-a-owasp-audit/`

### Track B — SQL Injection Deep Dive (depth, one endpoint)

1. Pick the login endpoint (`POST /rest/user/login`).
2. Trace route → controller → query using `Grep`/`Read`/`Explore`.
3. Write a minimal repro recipe (`curl` against your **local** Juice Shop) and expected response signature.
4. Propose a concrete fix: parameterized query + input validator. Capture as a `.snippet` patch.

**Workshop folder:** `workshop/juice-shop/phase-6-demo/track-b-sqli-deepdive/`

---

## Phase 7 — Review & Commit (20 min)

- Run `/security-review` on any proposed fix.
- Critique Track A's findings report: mark false positives, note missed severity, re-rank.
- Write a short remediation memo prioritizing findings by severity × exploitability.
- Commit the fix (if Track B); the findings report ships as a doc, not code.

**Workshop folder:** `workshop/juice-shop/phase-7-review/`

---

## Phase 8 — Reflection (10 min)

- When did Claude over-claim a vulnerability that wasn't actually exploitable?
- When did it miss a real vuln you (or the score-board) knew existed?
- How did `block-secrets.sh` interact with Juice Shop's deliberate fake secrets?
- At what severity did you stop trusting Claude's assessment without verification?

**Workshop folder:** `workshop/juice-shop/phase-8-reflection/`

---

## Deliverables at End of Training

- Hardened `settings.json` + `block-secrets.sh` hook (user-machine protection, unchanged from TodoMVC module)
- Project `CLAUDE.md` for Juice Shop with authorized-training preamble
- Track A: OWASP 2021 findings report (markdown) covering candidate code paths + severities
- Track B: Repro recipe + parameterized-query fix snippet for one endpoint
