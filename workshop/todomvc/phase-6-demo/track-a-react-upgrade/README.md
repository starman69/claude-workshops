# Phase 6 — Track A: React Upgrade

**Time:** 60–90 min
**Goal:** Upgrade TodoMVC React example from its current React version to latest stable.

## Steps

1. **Plan** (plan mode):
   > Audit `package.json` for React, React DOM, and related types. Produce a migration plan to React 18+ listing every breaking change that applies to this codebase.

2. **Review** the plan. Push back on anything that feels excessive.

3. **Execute:**
   - Bump `react`, `react-dom`, `@types/react`, `@types/react-dom` in `package.json`
   - Replace `ReactDOM.render(...)` with `createRoot(...).render(...)`
   - Wrap in `<StrictMode>` (or don't — be intentional)
   - Fix any deprecated APIs flagged by typecheck/tests
   - Update `react-router` / testing libs if they require matching majors

4. **Verify:**
   - `npm ci` clean
   - `npm run typecheck` (if TS)
   - `npm run lint`
   - `npm test`
   - `npm run build`
   - Manual browser smoke test: add / toggle / delete / filter / clear completed

## Files

- `before/package.json.snippet` — example pre-upgrade dependencies
- `before/index-legacy.jsx` — example pre-upgrade entry point
- `after/package.json.snippet` — example post-upgrade dependencies
- `after/index-modern.jsx` — example post-upgrade entry point with `createRoot`
- `after/UPGRADE_NOTES.md` — checklist of breaking changes actually hit

## Compare

```bash
diff before/ after/
```
