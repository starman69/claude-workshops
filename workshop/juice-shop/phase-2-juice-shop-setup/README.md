# Phase 2 — Juice Shop Setup

**Time:** 20 min
**Goal:** Working local Juice Shop with the score-board reachable, plus a `CLAUDE.md`. Later phases (safety, memory, workflow drills, audit) all run against *this* checkout.

## Steps

1. Clone Juice Shop **outside this training repo** (so Claude Code runs against the target, not this scaffolding):
   ```bash
   cd ~/projects   # or wherever you keep checkouts — NOT inside this scaffolding repo
   git clone https://github.com/juice-shop/juice-shop.git
   cd juice-shop
   ```
   From here on, run `claude` inside this directory.

2. Install and run (check `.nvmrc` first):
   ```bash
   npm install
   npm start
   ```
   Open `http://localhost:3000` — app loads, product listing shows, register/login flows work.

3. Confirm the **score-board** is reachable: navigate to `http://localhost:3000/#/score-board`. Note the challenge count.

4. Record the baseline in `before/baseline.md` (template provided).

5. In a fresh Claude Code session inside the repo: run `/init`. Review the generated `CLAUDE.md`, compare with `after/CLAUDE.md.example`. You'll add the authorized-training preamble and the rest of the project details in Phase 4 (Memory).

## Compare

```bash
diff before/baseline.md after/baseline.md
```

## Files

- `before/baseline.md` — template to fill in during setup
- `after/baseline.md` — example filled-in baseline
- `after/CLAUDE.md.example` — example of a good post-`/init` project memory for Juice Shop
