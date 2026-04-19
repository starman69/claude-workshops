# Exercise 5 — Prompting Craft

**Goal:** rewrite vague prompts so Claude produces usable output on the first try.

## The anti-pattern (try this first)

> Make the code better.

Observe: Claude either asks a lot of clarifying questions or guesses at changes. Note what it guessed — that's the vacuum your prompt didn't fill.

## The pattern (rewrite)

> In `src/todo/components/footer.jsx`, add a confirmation step before the "Clear completed" action fires — use `window.confirm("Remove all completed todos?")` and only dispatch when the user confirms. Don't change the reducer's action shape or the routing. Keep existing tests green.

What changed vs. the anti-pattern:

- **Anchors** — file path + specific component
- **The change** — "wrap the dispatch in a `window.confirm` check"
- **Scope** — "don't change the reducer's action shape or the routing"
- **Done condition** — "existing tests green"

## Try it on your own

1. Pick something mildly wrong in the running app (a misaligned element, a stale caption, the clear-completed button enabled with zero todos, etc.).
2. Write the vague version first.
3. Rewrite it with anchors + change + scope + done condition.
4. Run both on separate turns. Keep the diff that came from the specific version.

**Debrief question:** which ingredient does Claude *most* often need when you forget it — anchors, scope, or the done condition?

## Phase 2 — revise to an in-page modal

The `window.confirm` solution works, but it has real problems: the native browser chrome ignores your app's theme (this will matter the moment you add dark mode in Track B), the call is synchronous and blocking, and you can't test it without mocking `window.confirm`. Use the same prompting discipline to revise.

The new lesson: when iterating on existing work, anchors must include **what to replace**, not just what to add — otherwise Claude leaves both implementations in place.

Plan mode, paste:

> Plan mode. In `src/todo/components/footer.jsx`, replace the `window.confirm` call with an in-page modal dialog. **Remove the `window.confirm` line entirely** — don't leave it as a fallback. The modal renders inline in the component (no portal), shows a backdrop mask over the page, and exposes "Cancel" and "Remove" buttons. Dispatch `REMOVE_COMPLETED_ITEMS` only on "Remove"; "Cancel", backdrop click, and Esc all close without dispatching. Open state lives in `useState` inside `Footer`.
>
> Use CSS classes (`.modal-backdrop`, `.modal`, `.modal-actions`) — no inline colors — so theming hooks in via CSS variables later. Put styles in `src/todo/components/modal.css` and import it from `footer.jsx`. Accessibility: `role="dialog"`, `aria-modal="true"`, focus the Cancel button on open.
>
> Update the existing footer test (or add `footer.test.jsx`) to drive the modal — no `window.confirm` mocking. Keep all other tests green.
>
> Do not execute. List files to add/modify and the test changes.

Review the plan. Watch for:

- Does it actually delete the `window.confirm` line, or just add the modal alongside it?
- Did it pull in a modal library? Push back — we want plain React + CSS for this exercise.
- Did it propose a portal? For one modal in this app, that's overkill; keep it inline unless Claude justifies the portal.

**Verify after execute:**

```bash
npm test         # green, including the new modal test
npm run lint
npm run dev      # click "Clear completed" — modal appears with mask, Esc closes, Cancel closes, Remove clears
```

**Debrief question:** Phase 1 prompts mostly add behavior; Phase 2 prompts mostly *replace* it. Which of your Phase 1 anchors had to get sharper to make the replacement unambiguous?
