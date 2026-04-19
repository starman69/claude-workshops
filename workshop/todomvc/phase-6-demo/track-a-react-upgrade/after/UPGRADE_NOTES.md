# Track A Upgrade Notes

Breaking changes you are likely to hit, split by step.

## Step 1 — webpack → Vite + Jest → Vitest

- [ ] `index.html` moves to project root; inject `<script type="module" src="/src/index.jsx">` (or your entry)
- [ ] Rename `src/index.js` → `src/index.jsx` if it contains JSX (Vite is strict about extensions)
- [ ] Delete `webpack.common.js`, `webpack.dev.js`, `webpack.prod.js`, `babel.config.*` if only used by webpack/jest, and `public/index.html` (replaced by the root `index.html`)
- [ ] CSS imports: Vite handles them out of the box — drop `css-loader`, `style-loader`, `mini-css-extract-plugin`, `css-minimizer-webpack-plugin`
- [ ] **Static asset copy:** webpack's `CopyWebpackPlugin` step (e.g. shipping `node_modules/todomvc-common/base.js` into the build) has no built-in Vite equivalent — add `vite-plugin-static-copy` and configure a target, or learners' `<script src="./base.js">` will 404
- [ ] `import.meta.env` replaces `process.env` in client code
- [ ] Vitest config can live inside `vite.config.*` under a `test` block — `environment: 'jsdom'`, `globals: true`, an `include` glob, and a setup file that imports `@testing-library/jest-dom`
- [ ] Replace `jest.fn()`, `jest.mock()` with `vi.fn()`, `vi.mock()` — or rely on `globals: true` for compat
- [ ] `package.json` scripts: `dev`, `build`, `preview`, `test`, `lint`
- [ ] ESLint tightened: add `eslint-plugin-react` + `eslint-plugin-react-hooks`. Expect to also touch `env`, `parserOptions`, and `globals` (Vitest globals like `describe`/`test`/`vi`) so the existing code stays warning-free

## Step 2 — React 17 → 18

- [ ] `ReactDOM.render` → `createRoot(container).render(...)`
- [ ] Wrap the root in `<StrictMode>` — double-invokes effects in dev, expected, not a bug
- [ ] Automatic batching — state updates in promises/timeouts now batch; verify no code relied on un-batched behavior
- [ ] `@testing-library/react` v13+ required for React 18 (v15+ for the latest APIs)

> Items below typically don't apply to this codebase — keep in mind for other React 17 projects:
> `ReactDOM.hydrate` / `hydrateRoot`, `ReactDOM.unmountComponentAtNode` / `root.unmount()`,
> `react-router-dom` v5 → v6 migration, `ReactDOM.findDOMNode` removal, TypeScript implicit `children`.

## Verification

After each step:
- `npm run lint` clean
- `npm test` green
- `npm run build` green
- Manual smoke test in browser: add / toggle / delete / filter (all/active/completed) / clear completed / URL hash routing
