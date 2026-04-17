---
description: Run TodoMVC spec tests and summarize pass/fail by category
argument-hint: [optional test file pattern]
allowed-tools: Bash(npm test*), Read, Grep
---

# /todomvc-spec-check

Run the TodoMVC spec test suite and produce a grouped pass/fail summary.

## Steps

1. Run `npm test -- --watchAll=false $ARGUMENTS` and capture output.
2. Parse the results. Group by TodoMVC spec category:
   - **Add** — tests covering todo creation
   - **Toggle** — tests covering completion state
   - **Edit** — tests covering in-place editing
   - **Delete** — tests covering removal
   - **Filter** — tests covering `#/all`, `#/active`, `#/completed`
   - **Clear completed** — tests covering bulk clearing
   - **Routing** — tests covering URL fragment behavior
   - **Other** — anything that doesn't fit; surface it so we can categorize later
3. If any test fails, summarize the first 3 failures with `file:line` and the assertion message.

## Output format

```
TodoMVC spec — <N> passed, <M> failed

Add:             ✅ 4/4
Toggle:          ❌ 2/3 (one fail)
Filter:          ✅ 3/3
...

Failures:
- <file:line>: <assertion message>
```

## Do not

- Propose fixes — this command is for situational awareness, not repair.
- Re-run the suite if the first run failed with a compilation/config error; surface the error verbatim.
