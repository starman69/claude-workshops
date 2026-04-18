# Prompt — Generate a New Workshop Module

Template for scaffolding an additional 8-phase workshop module in this repo. Replace the placeholders below, then paste the block into a fresh Claude Code session at this repo's root.

## Fill in first

- `<module>` — short kebab-case slug (e.g. `rails-upgrade`, `graphql-api`, `juice-shop`).
- `<target>` — human name of the project + repo URL (e.g. "OWASP Juice Shop, https://github.com/juice-shop/juice-shop").
- `<one-line-purpose>` — what this module teaches (e.g. "AI-assisted security vulnerability discovery"; "an incremental framework upgrade under tests").
- `<stack>` — languages / frameworks / package manager.
- `<commands>` — build / test / lint / run (e.g. `npm test`, `npm run lint`, `npm start`).
- `<key-dirs>` — the directories a reader should care about.
- `<track-a>` / `<track-b>` — the two demo exercises for Phase 6 (breadth + depth, upgrade + feature, audit + fix, etc.). Each track should have `before/after` artifacts.
- `<guardrails>` — any target-specific safety framing. For security-training targets, required (see Juice Shop module). For typical refactor / upgrade / feature targets, delete this section.

## Worked examples

Two filled-in specs live alongside this template:

- [`todomvc-workshop-prompt.md`](todomvc-workshop-prompt.md) — retrospective spec for a **typical code-modernization target** (no special guardrails). Produces `workshop/todomvc/`.
- [`juice-shop-workshop-prompt.md`](juice-shop-workshop-prompt.md) — original spec for a **security-training target** (authorized-training guardrails). Produces `workshop/juice-shop/`.

Read both alongside the template to see how the placeholders resolve in practice, and how the `<guardrails>` slot gets filled (or deleted) depending on the target.

---

## Paste this:

Create a new training module inside this repo for teaching **<one-line-purpose>** against **<target>**.

### Context

- This repo already contains workshop modules under `workshop/`. Read `CLAUDE.md`, every existing plan under `docs/*-plan.md`, and `workshop/README.md` first to understand the conventions before generating anything.
- The new module must mirror the eight-phase structure (install → target setup → safety → memory → workflows → demo → review → reflection) with `before/after` snapshots where applicable. The target is cloned in Phase 2 so later phases (safety hook at project scope, memory, workflow drills against real source) have a working checkout.
- Create the new module at `workshop/<module>/` as a sibling to existing modules. Update `workshop/README.md` to add a row for the new module. Leave existing modules untouched.

### Deliverables

1. `docs/<module>-plan.md` — training plan matching the voice/shape of the existing plans. Include the "Suggested workspace layout" and "Using Codex or Copilot CLI?" sections from the existing plans.
2. `workshop/<module>/README.md` — phase index + "Where to work" section mirroring the existing module READMEs.
3. `workshop/<module>/` — phase folders (order matters — setup precedes safety so the hook and memory land in an existing checkout):
   - `phase-1-install/` — verbatim copy of existing `phase-1-install/README.md`.
   - `phase-2-<module>-setup/` — clone, install, run, baseline capture, run `/init` to seed a starter `CLAUDE.md`. `before/baseline.md` is a fill-in template; `after/baseline.md` is an example filled baseline; `after/CLAUDE.md.example` is a post-`/init` memory example.
   - `phase-3-safety/` — verbatim copies of `README.md`, `before/settings.json`, `after/settings.json`, `after/scripts/block-secrets.sh`. The portable hook path (`$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh`) needs no changes. If the target has idiosyncratic secrets handling (e.g., intentional fake secrets like Juice Shop), add a callout paragraph in `README.md`.
   - `phase-4-memory/after/CLAUDE.md` — tailored augmentation of the Phase 2 starter: `<stack>`, `<commands>`, `<key-dirs>`, project-specific gotchas and "don't touch" paths. Include a framing preamble if `<guardrails>` require one.
   - `phase-5-workflows/` — keep `01-find-function.md` and `02-plan-mode.md` (tool-choice drills are target-agnostic, now run against the cloned checkout). Add 1–2 target-specific exercises if useful.
   - `phase-6-demo/` — typically two tracks (can be more if the module warrants it):
     - `track-a-<slug>/` — <track-a>. `before/` has a template; `after/` has a filled reference artifact.
     - `track-b-<slug>/` — <track-b>. Same before/after shape.
     - For intermediate topics like custom slash commands and Skills, consider adding the new module alongside the onboarding modules rather than extending them (see `workshop/commands-and-skills/` for an example).
   - `phase-7-review/README.md` — `/review` (and `/security-review` if applicable), critique, remediation memo, commit.
   - `phase-8-reflection/README.md` — trust-calibration questions appropriate to the target.

### Guardrails (delete if not applicable)

<guardrails>

Example — for security-training targets like Juice Shop:
- Frame every `README.md` as **authorized** training against a project whose maintainers invite vulnerability discovery.
- Do **not** generate working exploit payloads, credential-stuffing scripts, mass scanners, or tooling reusable against non-consenting targets.
- Keep breadth tracks at the description level (file:line + request shape + severity).
- Keep depth tracks at the repro-recipe + fix level, targeting only the learner's local instance.
- `block-secrets.sh` is copied verbatim and never weakened, even when the target contains deliberate fake secrets.

### Style rules (from this repo's `CLAUDE.md` — re-read it)

- No new files in the repo root.
- `README.md` per phase, ≤60 lines each.
- `before/` = starting state for the learner; `after/` = facilitator reference, not editable.
- Use `.example` / `.snippet` suffixes on reference files so they aren't confused with runnable code.
- Scripts must be `chmod +x`.
- Batch file creation: one `Bash` for `mkdir`/`chmod`, then `Write` calls.
- The target project is cloned into a **sibling folder** outside this repo. The module is scaffolding; exercises happen elsewhere. Make sure `README.md` files reflect this (see existing modules for wording).

### Acceptance check

When finished, print a tree of `workshop/<module>/` and confirm:

- [ ] `docs/<module>-plan.md` exists and matches the voice of existing plans.
- [ ] Existing modules' content is unchanged.
- [ ] `workshop/README.md` lists the new module.
- [ ] Every phase has a `README.md`, each ≤60 lines.
- [ ] `phase-3-safety/after/scripts/block-secrets.sh` is present and executable; hook path in `after/settings.json` is `$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh`.
- [ ] Both Phase 6 tracks have `before/` (template) and `after/` (filled reference) artifacts.
- [ ] Phase 4 CLAUDE.md includes `<stack>`, `<commands>`, `<key-dirs>`, and (if applicable) the framing preamble from `<guardrails>`.
- [ ] Phase 2 README.md tells the learner to clone **outside this training repo**.
- [ ] If `<guardrails>` applies: no exploit payloads, no credential-stuffing, no mass-scanning language anywhere in the module.

---

*End of prompt.*
