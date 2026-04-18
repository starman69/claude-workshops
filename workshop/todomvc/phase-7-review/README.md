# Phase 7 — Review & Commit

**Time:** 20 min
**Goal:** Ship the change with confidence.

## Steps

1. **Inspect the diff yourself first** — `git diff` or IDE diff view. Don't skip this.
2. Run `/review` — Claude reviews your pending changes. Read the output critically; accept good catches, push back on noise.
3. If Track A (dep upgrade): run `/security-review` — focus on supply-chain concerns.
4. Run the full verification suite one more time: `npm run lint && npm test && npm run build`.
5. Commit with a meaningful message. Example:
   ```
   Upgrade React 17 → 18
   - createRoot replaces ReactDOM.render
   - Bump @types/react and testing-library
   - Manual smoke test: all TodoMVC spec flows pass
   ```
6. Push a branch and open a PR.

## Git workflow with Claude

When Claude edits multiple files you often want to ship only some:

- `git diff <file>` — inspect each change yourself; don't skip any
- `git add -p` — stage hunks piecemeal; reject the ones that shouldn't ship
- `git restore <file>` — drop an unstaged edit Claude made that you don't want
- `git restore --staged <file>` — unstage if you already added it
- Branch names matter — Claude can't guess what `feature-x` meant in three weeks

## No before/after

This is an activity. The deliverable is a merged PR.
