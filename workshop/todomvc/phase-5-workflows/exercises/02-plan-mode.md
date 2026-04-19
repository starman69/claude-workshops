# Exercise 2 — Plan Mode

**Setup:** press `shift+tab` until you see `plan mode` in the UI.

**Prompt to try:**

> Plan how we'd add a "due date" field to each todo, including storage, UI, and tests. Do not write any code yet.
>
> UI guidance: show the due date in the **right column of the todo row** (aligned with the destroy button, not on a new line under the label) so rows stay single-height. Keep the input compact — a small `<input type="date">` that appears on edit, and a muted date badge in the row when set. Match the existing item layout in `src/todo/components/item.jsx`.

**What to watch for:**

- Claude should produce a written plan and stop — no edits.
- Plan should reference specific files (e.g., `src/todo/components/item.jsx`, `src/todo/reducer.js`).
- Plan should respect the project-local `CLAUDE.md` (tests co-locate in `src/`). If it cites a convention from a parent `CLAUDE.md` that contradicts the project, push back.
- You should be able to redirect ("no, store it as ISO string not Date object") before executing.

**If the plan comes back with open questions** (common — this is plan mode working):

Reply with bounded answers, not a blanket "go":

1. Pick one of the proposed options and say which.
2. Name what's **out of scope** (e.g., "no new filters, no persistence in this pass").
3. Reinforce the format choice (e.g., "date-only, `YYYY-MM-DD`").
4. Tell Claude to execute **one step at a time** and stop for review: *"Proceed with step 1 only, then stop so I can diff."*

The last one is the habit worth building — plan mode loses its value if you approve the whole plan in one shot.

**Debrief question:** when is plan mode overkill? (Hint: single-file tweaks.)
