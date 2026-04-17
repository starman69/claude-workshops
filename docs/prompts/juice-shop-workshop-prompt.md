# Prompt — Generate OWASP Juice Shop Security Training Module

Paste the block below into a fresh Claude Code session at this repo's root to produce a second workshop module, parallel in structure to the TodoMVC one but focused on finding security vulnerabilities in OWASP Juice Shop.

---

## Paste this:

Create a new training module inside this repo for teaching AI-assisted **security vulnerability discovery** against OWASP Juice Shop (https://github.com/juice-shop/juice-shop) — an intentionally vulnerable Node.js/Angular app designed for authorized security training and CTF-style exercises.

### Context

- This repo already contains a TodoMVC module at `workshop/todomvc/`. Read `CLAUDE.md`, `docs/todomvc-plan.md`, and `workshop/README.md` first to understand the conventions before generating anything.
- The new module must mirror the eight-phase structure (install → safety → memory → workflows → target setup → demo → review → reflection) with `before/after` snapshots where applicable.
- Create the new module at `workshop/juice-shop/` as a sibling to `workshop/todomvc/`. Update `workshop/README.md` to add a row for the new module. Leave the TodoMVC content untouched.

### Deliverables

1. `docs/juice-shop-plan.md` — full training plan, same voice/shape as `docs/todomvc-plan.md`.
2. `workshop/juice-shop/` — phase folders mirroring the TodoMVC module:
   - `phase-1-install/` — identical to TodoMVC (Claude Code install is module-agnostic).
   - `phase-2-safety/` — same hook and deny-list pattern, but call out that Juice Shop **intentionally** contains dummy secrets, weak JWTs, and sample `.env` files. The `block-secrets.sh` hook still protects the *user's* real credentials; it must not be disabled "because the target is a training app."
   - `phase-3-memory/after/CLAUDE.md` — tailored to Juice Shop: stack (Node/Express/Angular/SQLite+Sequelize), commands (`npm start`, `npm test`, `npm run frisby`), key directories, and an **important preamble stating this is authorized security training against an intentionally vulnerable app**.
   - `phase-4-workflows/` — same tool drills, plus two security-specific exercises: (a) use `Grep` to find all `eval(`, `exec(`, `child_process`, and raw SQL string concatenations; (b) use the `Explore` subagent to map authentication and authorization surfaces.
   - `phase-5-juice-shop-setup/` — clone, `npm install`, run locally on port 3000, confirm the app loads and the built-in challenge tracker (`/#/score-board`) is reachable. Baseline template captures version, Node version, and challenge count.
   - `phase-6-demo/` — two tracks:
     - **Track A — OWASP Top 10 Audit (breadth).** Ask Claude to produce a written findings report covering each OWASP 2021 category. For each category: locate candidate code paths (file:line), propose a proof-of-concept *at the request level* (e.g., HTTP verb + path + payload), and rate severity. **Do not exploit or run attacks — this track produces a written report only.** Artifacts: `before/findings-template.md` (blank), `after/findings-example.md` (filled for 2–3 categories like Injection, Broken Access Control, Cryptographic Failures).
     - **Track B — Deep Dive on One Category.** Pick one category (default: SQL Injection). Use Claude to trace a specific vulnerable endpoint from route → controller → query, write a minimal repro recipe in markdown (curl command + expected response signature), and propose a concrete code-level fix (parameterized query, input validator, etc.) with a patch-style `after/` snippet. Still no live exploitation beyond what the Juice Shop project itself invites during normal challenge play.
   - `phase-7-review/` — run `/security-review` on any proposed fixes; critique Claude's findings report for false positives and missed severity; produce a short remediation memo.
   - `phase-8-reflection/` — prompts focused on security-specific trust calibration: when did Claude over-claim a vulnerability? When did it miss one? How did the `block-secrets.sh` hook interact with a codebase that contains deliberate fake secrets?

### Guardrails — very important

- This is **authorized defensive security training** against a project whose maintainers explicitly invite vulnerability discovery. Keep that framing in every `NOTES.md`.
- **Do not** generate working exploit payloads targeting third-party services, credential-stuffing scripts, mass scanners, or anything that could be repurposed against non-consenting targets.
- Keep Track A at the *description* level (file:line + request shape + severity). Keep Track B at the *repro recipe + fix* level. Neither track should produce a turn-key exploit binary.
- The `block-secrets.sh` hook from the TodoMVC module applies unchanged — copy it, don't weaken it. A training app doesn't justify relaxing user-machine protections.

### Style rules (pulled from this repo's `CLAUDE.md` — re-read it)

- No new files in the repo root.
- `NOTES.md` per phase, ≤60 lines each.
- `before/` = starting state for the learner; `after/` = facilitator reference, not editable.
- Use `.example` / `.snippet` suffixes on reference files so they aren't confused with runnable code.
- Scripts must be `chmod +x`.
- Batch all file creation in one message (single `Write` batch + one `Bash` for `mkdir`/`chmod`).

### Acceptance check

When finished, print a tree of the new `workshop/juice-shop/` directory and confirm:
- [ ] `docs/juice-shop-plan.md` exists and matches the voice of `docs/todomvc-plan.md`.
- [ ] TodoMVC content under `workshop/todomvc/` is unchanged.
- [ ] `workshop/README.md` lists both modules.
- [ ] Every phase has a `NOTES.md`.
- [ ] `block-secrets.sh` is present under `phase-2-safety/after/scripts/` and executable, and its path is reflected in the new module's `settings.json` hook (`$CLAUDE_PROJECT_DIR/workshop/juice-shop/phase-2-safety/after/scripts/block-secrets.sh`).
- [ ] Track A has a blank findings template and a filled example.
- [ ] Track B has a repro recipe and a fix snippet for at least one endpoint.
- [ ] Nothing in the module encourages attacking systems you don't own.

---

*End of prompt.*
