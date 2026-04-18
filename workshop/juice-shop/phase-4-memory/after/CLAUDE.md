# OWASP Juice Shop — Project Memory

## Authorized training — read first

This repository is **OWASP Juice Shop**, an intentionally vulnerable app whose maintainers explicitly invite vulnerability discovery for learning and CTF play. Work in this checkout is **authorized defensive security training**. Findings must not be repurposed against systems you don't own or have permission to test.

Do not generate working exploit payloads aimed at third-party services, credential-stuffing scripts, or mass scanners. Stay at the description / repro-recipe / fix level.

## Stack

- Node 20.x / 22.x / 24.x (check `.nvmrc` or `package.json` engines — Node 18 is no longer supported as of Juice Shop v19+)
- TypeScript
- Express (backend, see `routes/` and `lib/`)
- Angular (frontend, see `frontend/src/app/`)
- SQLite via Sequelize (`models/`, seed data in `data/`)
- Frisby + Cypress for API/E2E tests

## Commands

- `npm install` — install dependencies
- `npm start` — run the app on `http://localhost:3000`
- `npm test` — unit tests
- `npm run frisby` — API integration tests
- `npm run cypress:open` — open Cypress runner (E2E)
- `npm run lint` — linter

## Conventions

- HTTP routes registered in `server.ts` and `routes/*.ts`
- Controllers / handlers live alongside routes
- Sequelize models in `models/`
- Challenges register via `data/static/*.yml` and `lib/challengeUtils.ts`
- Score-board UI at `http://localhost:3000/#/score-board`

## Gotchas (intentional!)

- **Intentional vulnerabilities everywhere** — don't "fix" something unless the learner is intentionally patching it
- **Intentional fake secrets** — weak JWT keys, sample `.env`, hardcoded emails. These are training data, not leaks.
- **SQLite DB regenerates** — `data/juicer.sqlite` is rebuilt at startup; don't hand-edit it
- **Score-board is the source of truth** for what challenges exist and which you've completed

## Browser MCPs

- Chrome DevTools MCP and Playwright MCP are expected — use them to inspect the running app and the score-board at `/#/score-board`.
- **Stay on `http://localhost:3000`.** Do not browse to any other host in this session; the `block-secrets.sh` hook does not guard the browser.

## Don't touch

- `node_modules/`
- `build/`, `dist/` — generated
- `data/juicer.sqlite` — regenerated on startup
- `frontend/dist/` — build artifact
