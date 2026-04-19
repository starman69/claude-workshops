# TodoMVC (React) — Project Memory

## Stack

- React 17 (Phase 6 Track A upgrades to 18+)
- webpack 5 + webpack-dev-server (Phase 6 Track A migrates to Vite 5)
- Jest + React Testing Library, jsdom env (scaffolded in Phase 2; Phase 6 swaps to Vitest)
- ESLint — `eslint:recommended` only in Phase 2 (Phase 6 adds react + react-hooks plugins)

## Commands

- `npm ci` — clean install
- `npm run dev` — start dev server on http://localhost:8080
- `npm test` — run tests (CI mode: `npm test -- --watchAll=false`)
- `npm run lint` — ESLint
- `npm run build` — production build, outputs to `dist/`

## Conventions

- Components in `src/` — one file per component, PascalCase
- Co-located tests as `*.test.jsx`
- State: local `useState` / `useReducer`; no Redux in the base TodoMVC

## Gotchas

- TodoMVC has strict spec compliance tests — don't change user-visible behavior
- Canonical example has **no persistence** — todos are lost on refresh. Adding persistence is a valid Phase 6 Track B feature.
- Router hash fragments (`#/`, `#/active`, `#/completed`) drive filter state

## When upgrading React (Phase 6 Track A, step 2)

- `ReactDOM.render` → `createRoot` (React 18+)
- Strict Mode double-invokes effects in dev — expected, don't "fix" it
- Check `@types/react` and `@types/react-dom` bump together
- Do this *after* the Vite + Vitest migration (step 1), not before — Vite 5 supports React 17 fine, so isolating the toolchain swap first keeps failure modes distinct

## Browser MCPs

- Chrome DevTools MCP and Playwright MCP are expected — use them to verify UI changes when the dev server is running on `http://localhost:8080` (switches to `:5173` after the Phase 6 Vite migration).
- Scope every browser action to `localhost`; do not navigate elsewhere.

## Don't touch

- `node_modules/`
- `dist/` — generated
- `webpack.*.js` configs (Phase 6 step 1 replaces them)
- Snapshot files unless behavior changed intentionally
