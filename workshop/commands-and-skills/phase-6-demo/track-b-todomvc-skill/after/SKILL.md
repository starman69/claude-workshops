---
name: scaffold-feature
description: Scaffold a new TodoMVC feature — component file, test file, and wiring — from a short description. Use when the user asks to "add feature X" and an existing file/component doesn't already own it.
---

# scaffold-feature

## When to use

- User asks to add a new feature to TodoMVC (e.g., "add a dark mode toggle", "add a due-date field")
- No existing component owns the feature already (check `src/components/` first)

## What it does

Generates three artifacts in the TodoMVC checkout:

1. `src/components/<FeatureName>.tsx` — React component, function declaration, typed props, default export
2. `src/components/<FeatureName>.test.tsx` — React Testing Library tests (render + one primary interaction)
3. Wiring — import + mount in the nearest parent (`src/App.tsx` or closest container) at an appropriate slot

## Steps

1. Read `CLAUDE.md` for stack + convention details.
2. Parse the user's feature request into: `FeatureName` (PascalCase), one-line purpose, visible affordance.
3. Generate the component — idiomatic React per the project's conventions.
4. Generate tests — render without crashing + primary interaction works.
5. Edit the nearest parent to import + mount the component.
6. Run `npm test -- --watchAll=false`. Report pass/fail.

## Conventions (TodoMVC-specific)

- Components: PascalCase, `.tsx`, function declaration (not arrow), default export
- Tests: co-located, `*.test.tsx`, React Testing Library
- State: local `useState` / `useReducer`; do not introduce Redux
- No new dependencies without asking
- Do not modify the spec-test suite

## Supporting files

- `scripts/scaffold-feature.sh` — optional helper that creates empty file skeletons before Claude fills them. Safe to skip; Skill can generate files directly.

## Do not

- Touch `node_modules/`, `build/`, `dist/`, snapshot files
- Rename anything outside the new component's scope
- Add router routes unless explicitly asked
