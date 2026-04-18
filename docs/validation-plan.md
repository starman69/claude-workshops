# Workshop Validation Plan — Agent Team

**Status:** planned. Start next session. Read this top to bottom before acting.

## Goal

"Valid guidance" = a newcomer following the workshops against the **current** Claude Code and the **current** TodoMVC / Juice Shop reaches the stated outcome without dead ends, stale references, broken links, or silently-wrong instructions.

The team validates this in two modes:

- **Fast / deterministic** on every commit (seconds, no LLM cost)
- **Full / LLM-backed** periodically and before each live workshop session

## Agent roster

### 1. Structure Linter (deterministic)
Shell-only.

- `README.md` ≤60 lines
- Every phase folder has a `README.md`
- Reference files use `.snippet`/`.example`/`-legacy`/`-modern` suffixes
- Scripts under `after/scripts/` are executable
- No files in repo root except `CLAUDE.md` + `README.md` (directories excluded)
- Hook path in `after/settings.json` is `$CLAUDE_PROJECT_DIR/.claude/hooks/block-secrets.sh`
- No stale refs (e.g., folder-name hardcoding, `todos-react`)

### 2. Cross-Reference Validator (deterministic)
Parses markdown.

- Every `[text](path)` resolves to an existing file
- Plan files' "Module folder" / "Workshop folder" paths exist
- Module README phase tables match real folder names
- `docs/prompts/*-prompt.md` references match what the prompts produce
- `file:line` references at least format-check

### 3. Guardrail Auditor
Primarily for Juice Shop + Commands & Skills. Split across tiers.

**Deterministic (grep):**
- No working exploit payloads (banned-phrase allowlist)
- Repro recipes target `localhost` only
- Sample commands have tight `allowed-tools` (no unscoped `Bash`; no `Edit`/`Write` unless the command writes)
- Sample Skills have "Do not" sections
- Authorized-training preamble present in Juice Shop `CLAUDE.md`

**LLM (semantic):**
- Terms like "credential-stuffing", "mass scan", "exploit payload" only appear in cautionary context
- Exercise instructions don't inadvertently describe how to extend an exploit beyond the authorized scope

### 4. Currency Researcher (LLM + web)
Slow; runs weekly-ish or before each session.

Extracts verifiable claims from plan files (`docs/*-plan.md`) and phase `README.md` — version numbers, install commands, external repo references, feature descriptions — then verifies each against current upstream state. No hardcoded checklist here: the plan files are the source of truth, so a new claim is automatically re-checked on the next run and a removed claim stops being validated.

Implementation: `Agent` tool, `general-purpose` or `researcher` subagent, `WebFetch` / `WebSearch` enabled. Prompt template instructs the agent to extract claims, classify each as still-valid / drifted / unknown, and cite the upstream source.

### 5. Pedagogy Reviewer (LLM, rubric-based)
Reads the workshops against their own rubric.

- Each phase has goal, time, steps, checkpoint, diff instruction (where applicable)
- Prerequisites declared (especially for Commands & Skills)
- Exercises have prompt + "what to watch for" + debrief
- Jargon explained on first use or grounded in earlier phases
- Example prompts pass the workshop's own "prompting craft" rubric (anchors + scope + done condition)
- Difficulty gradient reasonable — no logical jumps between phases

Implementation: `Agent` with `reviewer` subagent; rubric in a prompt template.

### 6. Orchestrator
Runs the specialists and aggregates their findings. Each specialist tags severity; the orchestrator merges, deduplicates, and emits the summary report — it does not reclassify.

Severity tiers (owned by the specialist emitting the finding):

- 🔴 Must fix before next session
- 🟡 Fix soon (currency drift, broken cross-ref)
- 🟢 Polish

Emits a dated report at `docs/validation/<YYYY-MM-DD>.md`.

### Output contract

Every specialist emits:

- Structured findings to stdout as JSON Lines: `{severity, rule, path, line?, message}`
- Nonzero exit on any 🔴 finding; zero otherwise
- Human-readable rendering is the orchestrator's job, not the specialist's

### Waivers

False positives and legitimate exceptions (e.g., a `README.md` that genuinely needs >60 lines) are suppressed with:

- Inline marker in markdown: `<!-- validation:allow <rule> reason="..." -->`
- Or a `.validation-ignore` file listing `<path>:<rule> — <reason>` entries

Waivers require a reason and are surfaced in the dated report under a "Suppressed" section so they don't silently accumulate.

## Orchestration cadences

**Pre-commit / pre-merge (fast):**
Structure Linter + Cross-Reference Validator + Guardrail Auditor. PRs block on 🔴. Zero cost.

**Weekly or before each workshop session (full):**
All five specialists. Currency Researcher last. Dated report emitted.

**Ad-hoc:**
Any specialist can be invoked directly when you change a focused area.

## Implementation staging

### Phase A — Quick wins (~half-day)
Three shell scripts under `scripts/validation/`:

- `structure.sh` — line counts, file existence, exec bits, stale refs
- `xref.sh` — markdown link resolution
- `guardrails.sh` — banned-phrase grep, `allowed-tools` audit

Cost: ~zero. Wire into a pre-commit hook or GitHub Actions.

### Phase B — LLM specialists (~1–2 days)
Currency Researcher and Pedagogy Reviewer as prompt templates + `Agent` tool invocations. Each produces a structured report under `docs/validation/agents/<name>-<date>.md`.

Templates live at `scripts/validation/prompts/`:
- `currency.md`
- `pedagogy.md`

### Phase C — Orchestrator (~half-day)
A bash or tiny Python wrapper that runs A + B in sequence, merges outputs into one dated report, and emits a one-line CI summary (pass/fail + count of 🔴/🟡/🟢).

Optional: `.github/workflows/validation.yml` — A on every PR, B weekly via cron.

### Phase D — Prompt-quality regression (later, ambitious)
Harness that runs each exercise's sample prompt via `claude --print` against a hardened fixture and scores output against expected shape. Validates "the prompts in `README.md` still produce reasonable output" — *not* "the learner's interactive flow still works." End-to-end session fidelity stays a human-review task.

Requires a sandbox, prompt-execution budget, and an evaluator (rule-based or LLM). Defer until A–C catch the cheap bugs, and run its own design review first.

## Deliverables

- `scripts/validation/{structure,xref,guardrails}.sh` — three shell validators (Phase A)
- `scripts/validation/prompts/{currency,pedagogy}.md` — LLM prompt templates (Phase B)
- `scripts/validation/orchestrate.sh` — runner + merger (Phase C)
- `docs/validation/` — dated reports + a short README
- (Optional) `.github/workflows/validation.yml` — CI integration

## Recommendation

Start with **Phase A** next session. Deterministic, immediate signal, no recurring cost. Catches the 90% of issues I currently fix by hand at the end of each work session (line budgets, stale refs, missing exec bits, broken cross-refs).

Then **Phase B**. The Currency Researcher is essentially reusable from the review run earlier in development — the prompt template is most of the work. Pedagogy Reviewer needs a rubric draft.

**Phase D** (dry-run) is worth a separate design review before building.

## Next session — resume checklist

1. Read this file top to bottom.
2. Skim the most recent run of the existing ad-hoc verification in bash (`find workshop -name README.md -exec wc -l {} \;`, etc.) to remember what's currently being checked manually.
3. Decide: Phase A all three scripts, or start with just `structure.sh` to feel out the shape?
4. If Phase A: create `scripts/validation/` and write one script at a time. Test against the current repo state — should produce zero findings (the repo is currently clean).
5. If wiring CI: ensure the repo has a git remote + actions configured. Current repo state (per environment info) is not a git repo — so CI is deferred.

## Open questions for next session

- Where does `docs/validation/` live in the index — add a row to `workshop/README.md`, or keep validation reports separate from workshop content?
- Does Phase D justify a third target repo (e.g., a fresh copy of the primary workshops' target projects held under `workshop/<module>/fixtures/`)? Or always clone fresh per run?
- **What other recent Claude Code features should the workshops train on, beyond commands and skills?** Inventory candidates and decide which justify their own module, which fold into existing phases, and which are out of scope. Starter list:
  - **Subagents & the `Agent` tool** — when to delegate vs. stay in main context; parallel agents; isolation via worktrees
  - **Plan mode** — `EnterPlanMode` / `ExitPlanMode` flow; when to require it
  - **Hooks** — beyond the safety hook in Phase 2: `PostToolUse`, `Stop`, `SessionStart`, `UserPromptSubmit`
  - **Memory system** — CLAUDE.md hierarchy, project vs. user memory, the auto-memory file store
  - **MCP servers** — building one, not just consuming (Chrome DevTools / Playwright are already in scope)
  - **Permission modes & settings** — `acceptEdits`, `plan`, `bypassPermissions`; `allowed-tools` scoping
  - **Background tasks & monitoring** — `run_in_background`, polling vs. notifications
  - **Scheduled / autonomous loops** — `/loop`, `/schedule`, cron-mode agents
  - **Claude Agent SDK** — building custom agents outside the CLI
  - **IDE integrations** — VS Code / JetBrains extensions, web app at claude.ai/code
  - Decide per candidate: standalone module, new phase in an existing module, or single exercise.
