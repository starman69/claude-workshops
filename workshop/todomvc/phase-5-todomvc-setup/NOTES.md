# Phase 5 — TodoMVC Setup

**Time:** 20 min
**Goal:** Working TodoMVC React clone with baseline green tests and a `CLAUDE.md`.

## Steps

1. Clone the TodoMVC React example **outside this training repo** (so Claude Code runs against *your* checkout, not this scaffolding):
   ```bash
   cd ~/projects   # or wherever you keep checkouts — NOT inside this scaffolding repo
   git clone https://github.com/tastejs/todomvc.git
   cd todomvc/examples/react
   ```
   (Or use a maintained fork if the canonical example is stale.) From here on, run `claude` inside this directory.

2. Install and run:
   ```bash
   npm ci
   npm run dev
   ```
   Open the browser, add a todo, toggle it, filter — confirm it works.

3. Note the baseline in `before/baseline.md` (see template).

4. In a fresh Claude Code session inside the repo: run `/init`. Review the generated `CLAUDE.md`, compare with `after/CLAUDE.md.example`.

## Compare

```bash
diff before/baseline.md after/baseline.md
```

## Files

- `before/baseline.md` — template to fill in during setup
- `after/baseline.md` — example filled-in baseline
- `after/CLAUDE.md.example` — example of a good post-`/init` project memory
