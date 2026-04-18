# Exercise 5 — Prompting Craft

**Goal:** rewrite vague prompts so Claude produces usable output on the first try.

## The anti-pattern (try this first)

> Make the code better.

Observe: Claude either asks a lot of clarifying questions or guesses at changes. Note what it guessed — that's the vacuum your prompt didn't fill.

## The pattern (rewrite)

> In `src/components/TodoItem.tsx`, the item re-renders whenever any todo in the list toggles. Wrap `TodoItem` in `React.memo` with a shallow-equal comparison so only the changed item re-renders. Don't touch the reducer or the routing. Keep existing tests green.

What changed vs. the anti-pattern:

- **Anchors** — file path + specific component
- **The change** — "wrap in `React.memo` with shallow-equal"
- **Scope** — "don't touch the reducer or the routing"
- **Done condition** — "existing tests green"

## Try it on your own

1. Pick something mildly wrong in the running app (a misaligned element, a stale caption, the clear-completed button enabled with zero todos, etc.).
2. Write the vague version first.
3. Rewrite it with anchors + change + scope + done condition.
4. Run both on separate turns. Keep the diff that came from the specific version.

**Debrief question:** which ingredient does Claude *most* often need when you forget it — anchors, scope, or the done condition?
