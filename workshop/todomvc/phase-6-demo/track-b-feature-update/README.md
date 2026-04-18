# Phase 6 — Track B: Feature Update

**Time:** 60–90 min
**Goal:** Add a scoped feature to TodoMVC using test-first development.

## Pick one feature

- **Dark mode toggle** — header button, persists to localStorage, CSS variable swap
- **Due date** — optional ISO date per todo, shown in item, sorts by due-soonest
- **IndexedDB persistence** — replace localStorage with `idb-keyval` or native IndexedDB

## Workflow

1. **Plan** (plan mode):
   > Plan the "<feature>" change. List files to add/edit, new types, tests to write. Do not write code.

2. **Tests first** — ask Claude to write failing tests based on the plan.
   > Write tests in `<path>` that describe the new behavior. Don't implement the feature yet. Run the tests and confirm they fail for the right reason.

3. **Implement** — let Claude make the tests pass, one at a time.

4. **Verify:**
   - `npm test` all green including existing TodoMVC spec tests
   - `npm run lint`, `npm run build`
   - Browser smoke test — feature works AND nothing regressed

## Files

- `before/feature-spec.md` — blank template: describe the feature, write acceptance criteria
- `after/feature-spec.md` — example filled-in spec (dark mode)
- `after/example-test.test.jsx` — sample failing test shape

## Compare

```bash
diff before/ after/
```
