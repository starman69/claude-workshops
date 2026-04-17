# TodoMVC (React) — Project Memory

## Stack

- React (see `package.json` for version — upgrade target: latest stable)
- TypeScript (if the example variant uses it — confirm before assuming)
- Vite or Create React App depending on variant
- Jest + React Testing Library for tests

## Commands

- `npm ci` — clean install
- `npm run dev` — start dev server
- `npm test` — run tests (watch mode off: `npm test -- --watchAll=false`)
- `npm run lint` — ESLint
- `npm run build` — production build

## Conventions

- Components in `src/components/` — one file per component, PascalCase
- Hooks in `src/hooks/` — camelCase with `use` prefix
- Test files co-located as `*.test.tsx`
- State: local `useState` / `useReducer`; no Redux in the base TodoMVC

## Gotchas

- TodoMVC has strict spec compliance tests — don't change user-visible behavior
- Current canonical example has **no persistence** — todos are lost on refresh. Adding persistence is a valid Phase 6 Track B feature.
- Router hash fragments (`#/`, `#/active`, `#/completed`) drive filter state

## When upgrading React

- `ReactDOM.render` → `createRoot` (React 18+)
- Strict Mode double-invokes effects in dev — expected, don't "fix" it
- Check `@types/react` and `@types/react-dom` bump together

## Browser MCPs

- Chrome DevTools MCP and Playwright MCP are expected — use them to verify UI changes when the dev server is running on `http://localhost:3000`.
- Scope every browser action to `localhost`; do not navigate elsewhere.

## Don't touch

- `node_modules/`
- `build/`, `dist/` — generated
- Snapshot files unless behavior changed intentionally
