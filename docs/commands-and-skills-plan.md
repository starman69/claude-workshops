# Claude Code Workshop — Commands & Skills

**Goal:** author a reusable custom slash command and a reusable Skill against a target you've worked with before (TodoMVC or Juice Shop). Build a durable sense of when to reach for a command, a Skill, or just a plain prompt.

**Audience:** developers who've completed the TodoMVC or Juice Shop workshop (or are otherwise comfortable with Claude Code basics). This is an **intermediate** module — it assumes you already have install + safety + memory + workflows in muscle memory.

**Duration:** ~3 hours if you do one target; ~4 hours if you do both (the second command/Skill reuses structure from the first).
**Outcome:** one custom slash command + one Skill committed to your target repo's `.claude/`, and working intuition for the command / Skill / prompt decision.

**Module folder:** [`workshop/commands-and-skills/`](../workshop/commands-and-skills/)

**Prerequisites — not optional:**

- **Phases 1–5 of the TodoMVC or Juice Shop workshop must be complete** for whichever target(s) you plan to work against. That means: Claude Code installed and authenticated, the target repo cloned and running locally, `CLAUDE.md` at the repo root, `.claude/settings.json` with the hardened allow/deny lists, `.claude/hooks/block-secrets.sh` installed and executable, and a baseline recorded.
- **You must be comfortable with Phase 5 of the primary workshop:** `Grep`, `Read`, plan mode, subagents, slash commands.
- Phases 1–5 of this workshop are **prerequisite checks** (~25 minutes total), not setup walkthroughs. If a check fails, you go back to the primary workshop — not forward.

---

## Suggested workspace layout

Targets the **same** repos you used for TodoMVC or Juice Shop. No new clones unless you skipped those modules.

```
~/projects/
├── <this-repo>/                 <-- this repo (reference only)
├── todomvc/                     <-- your existing checkout (Tracks A, B)
└── juice-shop/                  <-- your existing checkout (Tracks C, D)
```

---

## Phase 1 — Confirm Setup (5 min)

Prerequisite check — no install walkthrough here.

- `claude` runs, `/login` works, `/help` lists commands
- One of `~/projects/todomvc/` or `~/projects/juice-shop/` exists and runs locally

**Workshop folder:** `workshop/commands-and-skills/phase-1-install/`

---

## Phase 2 — Safety & Permissions (5 min)

Commands and Skills run against your existing permission surface. No new `settings.json` needed. But each command and Skill defines its own tool allow-list — keep them tight.

**Workshop folder:** `workshop/commands-and-skills/phase-2-safety/`

---

## Phase 3 — Memory Interaction (5 min)

Commands and Skills inherit `CLAUDE.md` (project) and `~/.claude/CLAUDE.md` (user scope). Good project memory makes commands terse and makes Skills more reliable. Stale memory makes both fragile at scale.

**Workshop folder:** `workshop/commands-and-skills/phase-3-memory/`

---

## Phase 4 — Command vs. Skill vs. Prompt (30 min)

The decision framework. Two drills in `exercises/`:

1. Command vs. Skill — when does each fit?
2. Command vs. plain prompt — when is a command overkill?

**Workshop folder:** `workshop/commands-and-skills/phase-4-workflows/`

---

## Phase 5 — Target Setup (10 min)

Pick one or both targets:

- **TodoMVC only** → Track A + Track B in Phase 6
- **Juice Shop only** → Track C + Track D
- **Both** → all four

Confirm the target repo runs, `.claude/` exists, `/help` shows no stale experiments.

**Workshop folder:** `workshop/commands-and-skills/phase-5-target-setup/`

---

## Phase 6 — Demo Tracks (30–60 min per track)

### Track A — TodoMVC Custom Slash Command
`/todomvc-spec-check` — runs spec tests, groups by TodoMVC category.

**Workshop folder:** `workshop/commands-and-skills/phase-6-demo/track-a-todomvc-command/`

### Track B — TodoMVC Skill (`scaffold-feature`)
Skill that scaffolds a new component + test + wiring.

**Workshop folder:** `workshop/commands-and-skills/phase-6-demo/track-b-todomvc-skill/`

### Track C — Juice Shop Audit Command
`/juice-shop-audit <route>` — scoped OWASP audit, report-level output only.

**Workshop folder:** `workshop/commands-and-skills/phase-6-demo/track-c-juice-shop-command/`

### Track D — Juice Shop Audit Skill (`audit-route`)
Skill that traces route → sink and emits into a structured findings template.

**Workshop folder:** `workshop/commands-and-skills/phase-6-demo/track-d-juice-shop-skill/`

---

## Phase 7 — Review & Iterate (20 min)

Run your new command / Skill on a fresh input. Note drift. Tighten the prompt body or `allowed-tools`. Commit to `.claude/`.

**Workshop folder:** `workshop/commands-and-skills/phase-7-review/`

---

## Phase 8 — Reflection (10 min)

- When did a plain prompt win?
- Where did a Skill's `description` match phrasing you didn't expect? Where did it miss?
- What patterns from [`addyosmani/agent-skills`](https://github.com/addyosmani/agent-skills) did you borrow?

**Workshop folder:** `workshop/commands-and-skills/phase-8-reflection/`

---

## Deliverables at End of Training

- One custom slash command committed to `.claude/commands/<name>.md` in your target repo
- One Skill under `.claude/skills/<name>/SKILL.md` (plus any helper scripts)
- A clear mental model: plain prompt vs. command vs. Skill
