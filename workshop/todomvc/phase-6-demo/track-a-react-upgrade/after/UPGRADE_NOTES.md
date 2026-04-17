# React 17 → 18+ Upgrade Checklist

Things you are likely to hit:

- [ ] `ReactDOM.render` → `createRoot(container).render(...)`
- [ ] `ReactDOM.hydrate` → `hydrateRoot(container, element)`
- [ ] `ReactDOM.unmountComponentAtNode` → `root.unmount()`
- [ ] StrictMode double-invokes effects in dev — expected, not a bug
- [ ] Automatic batching — state updates in promises/timeouts now batch; verify no code relied on un-batched behavior
- [ ] `react-router-dom` v5 → v6 is a separate migration (API surface changes: `<Switch>` → `<Routes>`, `component=` → `element=`, nested routes)
- [ ] `@testing-library/react` v13+ required for React 18
- [ ] TypeScript: children prop no longer implicit — use `PropsWithChildren` or type explicitly
- [ ] `ReactDOM.findDOMNode` fully removed — refactor to refs

## Verification

- `npm test` green
- `npm run build` green
- Manual smoke test in browser: add / toggle / delete / filter (all/active/completed) / clear completed / URL hash routing
