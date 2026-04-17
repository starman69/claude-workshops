# Claude Code Training Workshop — Repo Conventions

## What this repo is

Workshop scaffolding for teaching developers AI-assisted development with Claude Code. The first module targets **TodoMVC (React)**. Additional modules (e.g., OWASP Juice Shop for security training) may be added.

This is **not** an application. It holds plans, notes, and before/after reference snapshots that learners diff against their own work.

## Structure

```
docs/                    — training plans and prompts
  <module>-plan.md       — one plan per module (e.g. todomvc-plan.md)
  prompts/               — pastable prompts to generate new modules
workshop/                — hands-on materials, one subfolder per module
  README.md              — module index
  <module>/              — e.g. todomvc/, juice-shop/
    README.md            — phase index for this module
    phase-N-<name>/
      NOTES.md           — facilitator/learner instructions for the phase
      before/            — starting snapshot (when applicable)
      after/             — reference end state (when applicable)
```

Not every phase has before/after — install, live workflow drills, review, and reflection are activities, not file diffs.

## Conventions

- Each phase folder has a `NOTES.md`. Keep it short: goal, steps, checkpoint, and how to diff.
- `before/` is what a learner starts with. `after/` is the facilitator's reference. Learners diff their work against `after/` — they don't edit it.
- Reference snippets use suffixes like `.snippet`, `.example`, or `-legacy`/`-modern` so they aren't mistaken for runnable project files.
- Shell hooks go in `scripts/` inside the relevant phase's `after/` folder and must be `chmod +x`.

## What to avoid

- **Don't bloat.** A workshop phase is 15–90 minutes of content, not a tutorial series. If a `NOTES.md` is over ~60 lines, trim it.
- **Don't add new phases proactively.** Eight is the spine. Tracks inside a phase are fine (see `phase-6-demo/track-a-*` vs `track-b-*`).
- **Don't put working files in the repo root.** Only `CLAUDE.md` lives there. Everything else goes under `docs/` or `workshop/`.
- **Don't generate new docs unless asked.** The user explicitly approves each new plan or prompt.
- **Don't turn reference files into real code.** `after/` snippets are for *reading and diffing*, not for `npm install`-ing. Use filename markers (`.example`, `.snippet`) to make that obvious.

## When adding a new training module

1. Write its plan at `docs/<module>-plan.md`.
2. Scaffold `workshop/<module>/phase-N-*/` mirroring the existing structure.
3. Keep Phase 1 (install) and Phase 2 (safety/hooks) nearly identical across modules — the Claude Code setup doesn't change per target. Copy `block-secrets.sh` verbatim; update the `settings.json` hook path to reference the new module's folder.
4. Customize phases 5–8 to the target project.
5. Add an entry to the table in `workshop/README.md`.

## Workshop modules

- **TodoMVC (React)** — [`docs/todomvc-plan.md`](docs/todomvc-plan.md), [`workshop/todomvc/`](workshop/todomvc/).
