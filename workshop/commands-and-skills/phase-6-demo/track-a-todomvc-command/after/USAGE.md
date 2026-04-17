# /todomvc-spec-check — Install & Run

## Install

In your TodoMVC checkout (not this training repo):

```bash
mkdir -p .claude/commands
cp /path/to/this-workshop/after/todomvc-spec-check.md .claude/commands/
```

## Run

```
/todomvc-spec-check
/todomvc-spec-check src/components/Header.test.tsx
```

## Verify

- `/help` lists it
- It runs in under a minute on a green repo
- Output is scannable — if you have to squint, iterate the prompt body

## Maintain

- Keep `allowed-tools` minimal. Add `Edit`/`Write` only if the command actually writes files.
- Filename = command name. Rename the file to rename the command.
- If the output shape drifts, edit the prompt body; don't work around it downstream.
