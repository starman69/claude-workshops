# Phase 6 — Track A: Modernize Build Tool + React

**Time:** 75–105 min
**Goal:** Two sequential modernizations on the TodoMVC codebase:
1. webpack 5 → Vite 5 (Jest → Vitest comes with it)
2. React 17 → 18

Each is a separate plan-mode pass. **Do not bundle them.** Two low-stakes reps of *plan → review → execute* on related-but-distinct changes are the point.

## Why this order

Vite 5 supports React 17 fine, so migrating the build tool on a known-good React version isolates failure modes. If you bumped React first, a failing test could be either the React change or the toolchain swap — you wouldn't know which.

## Step 1 — webpack → Vite + Jest → Vitest

**Prereq:** Phase 2 scaffold in place — `npm test` and `npm run lint` pass on webpack.

Plan mode, paste:

> Plan mode. Migrate this project from webpack 5 to Vite 5, and from Jest to Vitest (keep React Testing Library). Preserve all app behavior — zero application-code changes except the entry-point `<script>` tag in `index.html`. Move `index.html` to project root with a `<script type="module">` entry. Drop all webpack, babel-loader, html-webpack-plugin, mini-css-extract-plugin, and css-extract deps. Port the existing Phase 2 smoke test to Vitest unchanged. Scripts: `dev`, `build`, `preview`, `test`, `lint`. Also tighten ESLint — add `eslint-plugin-react` and `eslint-plugin-react-hooks` with recommended configs, and keep existing code warning-free (disable or scope out any rule that would fire).
>
> Produce a stepwise plan: files to add / modify / remove, deps to add / drop, script changes. Do not execute.

Review, push back on excess, approve.

**Verify step 1:**
```bash
npm ci
npm run lint     # clean, tighter rules now
npm test         # same tests, on Vitest
npm run build    # Vite build, outputs to dist/
npm run dev      # http://localhost:5173
```
Browser smoke test — visually identical. **Commit before step 2** so you can bisect if step 2 breaks something.

## Step 2 — React 17 → 18

Plan mode, paste:

> Plan mode. Upgrade React from 17 to 18 on this Vite + Vitest codebase. Audit `package.json` for `react`, `react-dom`, `react-router-dom`, `@testing-library/react`, and any `@types/*`. Bump each to a version compatible with React 18. Replace `ReactDOM.render(...)` with `createRoot(...).render(...)`. Wrap the root in `<StrictMode>`. Fix any deprecated APIs flagged by tests or lint. Preserve all app behavior.
>
> Produce a stepwise plan listing exactly which breaking changes from React 18 apply to *this* codebase, and the file changes needed. Do not execute.

Review. Push back on anything excessive.

**Verify step 2:**
```bash
npm run lint
npm test
npm run build
npm run dev
```
Browser smoke test. StrictMode will double-invoke effects in dev — expected, don't "fix" it.

## Files

- `before/package.json.snippet` — deps at end of Phase 2 (webpack + React 17 + Jest + minimal eslint)
- `before/index-legacy.jsx` — pre-upgrade entry with `ReactDOM.render`
- `after/package.json.snippet` — deps after both steps (Vite + React 18 + Vitest + tighter eslint)
- `after/index-modern.jsx` — post-upgrade entry with `createRoot` + `StrictMode`
- `after/UPGRADE_NOTES.md` — breaking changes hit, organized by step

## Compare

```bash
diff before/ after/
```
