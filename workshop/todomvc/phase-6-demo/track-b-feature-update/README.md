# Phase 6 — Track B: Feature Update

**Time:** 60–90 min
**Goal:** Add a scoped feature to TodoMVC using test-first development.

## Pick one feature

- **Dark mode toggle** — header button, persists to localStorage, CSS variable swap
- **Persistence** — canonical TodoMVC resets on refresh. Wire the reducer to localStorage (simplest) or IndexedDB via `idb-keyval` (async-safe).
- **Due date** — optional ISO date per todo, shown in item, sorts by due-soonest

## Workflow

1. **Plan** (plan mode):
   > Plan the "<feature>" change. List files to add/edit, any new action types for the reducer (in `src/todo/constants.js` and `src/todo/reducer.js`), and tests to write. Do not write code.

2. **Tests first** — ask Claude to write failing tests based on the plan.
   > Write tests in `<path>` that describe the new behavior. Don't implement the feature yet. Run the tests and confirm they fail for the right reason.

3. **Implement** — let Claude make the tests pass, one at a time.

4. **Verify:**
   - `npm test` all green including existing TodoMVC spec tests
   - `npm run lint`, `npm run build`
   - Browser smoke test — feature works AND nothing regressed
   - **Dark mode only:** add a Playwright test that reads computed styles (`getComputedStyle(body).backgroundColor` / `.color`) before and after toggling, and after a reload. Unit tests prove the class/attribute flips; Playwright proves the pixels actually change. Ask Claude: *"Add a Playwright spec in `e2e/` that loads the app, snapshots computed `background-color` and `color` on `body` and `.todoapp`, clicks the toggle, asserts both values changed, reloads, and asserts the dark values persisted."*

## Files

- `before/feature-spec.md` — blank template: describe the feature, write acceptance criteria
- `after/feature-spec.md` — example filled-in spec (dark mode)
- `after/example-test.test.jsx` — sample failing test shape

## Compare

```bash
diff before/ after/
```
