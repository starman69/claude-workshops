# Phase 2 — TodoMVC Setup

**Time:** 25 min
**Goal:** Working TodoMVC React clone with Jest + minimal ESLint scaffolded on, baseline-green, with a `CLAUDE.md`. Later phases run against *this* checkout.

The stock repo's `"test": "jest"` script has no jest installed and there's no `lint` script. We have Claude scaffold both now, so every later phase has a real test + lint harness to confirm against as it goes — especially Phase 6, where we migrate the build tool and upgrade React. The build-tool migration (webpack → Vite) and the React upgrade both live in Phase 6 — Phase 2 stays on webpack 5 + React 17.

## Steps

1. **Clone** TodoMVC React **outside this training repo**:
   ```bash
   cd ~/projects   # NOT inside this scaffolding repo
   git clone https://github.com/tastejs/todomvc.git
   cd todomvc/examples/react
   ```
   Run `claude` inside this directory from here on.

2. **Confirm stock state:**
   ```bash
   npm ci
   npm run dev      # http://localhost:8080
   ```
   Smoke test in the browser: add / toggle / filter / clear completed. Ctrl+C. Confirm `npm test` and `npm run lint` both fail.

3. Fill in `before/baseline.md` with what you observed.

4. **Scaffold Jest + ESLint.** Enter plan mode and paste:

   > Plan mode. Scaffold Jest + React Testing Library and a minimal ESLint (`eslint:recommended` only; no react/react-hooks plugins) so `npm test` and `npm run lint` both work on this webpack 5 / React 17 codebase.
   >
   > **Hard constraints:** zero changes to application code; zero errors or warnings on the existing codebase (disable or scope out any rule that would fire); do not touch webpack configs; add exactly one smoke test under `src/` that renders `<App />` and asserts the header text, so `npm test` shows `1 passed`.
   >
   > Produce a stepwise plan — files to add, dependencies to add, `package.json` script changes. Do not execute yet.

   Review the plan. Push back on anything that modifies app code, adds more than the one smoke test, or changes the build tool. Approve when satisfied.

5. **Verify:**
   ```bash
   npm run lint     # clean
   npm test         # 1 passed
   npm run build    # unchanged
   npm run dev      # still http://localhost:8080
   ```

6. In a fresh Claude Code session inside the repo, run `/init`. Compare the generated `CLAUDE.md` with `after/CLAUDE.md.example`.

## Compare

```bash
diff before/baseline.md after/baseline.md
```

The diff should show `npm test` and `npm run lint` moving from fail to green — everything else stays the same.

## Files

- `before/baseline.md` — template for the stock state
- `after/baseline.md` — expected state after scaffolding
- `after/CLAUDE.md.example` — example `/init` output
