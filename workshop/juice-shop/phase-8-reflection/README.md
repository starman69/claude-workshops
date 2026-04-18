# Phase 8 — Reflection

**Time:** 10 min

Security work lives or dies on trust calibration. These questions are deliberately harder than the TodoMVC reflection.

## Questions for the group

1. **Over-claiming.** Name one finding Claude flagged that turned out to be **not actually exploitable** (validator upstream, framework auto-escape, unreachable branch). How did you catch it? What prompt would have caused Claude to rule it out earlier?

2. **Missing.** Was there a vulnerability **the score-board knew existed** that Claude did *not* surface? (Skim the score-board categories against your findings report.) What category of bug does Claude seem blind to? Why?

3. **Severity drift.** Did Claude's severity ratings track your remediation memo's? If they diverged, in which direction — did Claude over-rate or under-rate?

4. **Hook interaction.** Did `block-secrets.sh` fire at any point on Juice Shop's deliberate fake `.env` / JWT secret / hardcoded creds? Treat each firing as:
   - **True positive** (the hook is doing its job protecting *your* machine — good)
   - **False positive from the audit's POV** (you were trying to read a training target) — but is it really an FP, given the hook's actual goal? Did you ever feel the pull to weaken the hook "just for this"?

5. **Trust ceiling.** At what severity or confidence level did you stop accepting Claude's assessment without independent verification? Write that threshold down — it's your calibration for next time.

## Recovery moves — when Claude gets stuck

In a security audit, a stuck session costs accuracy (over-claims, severity drift). Break out with:

- **Interrupt** (esc) if Claude is scoring everything H/H without justification
- **Rephrase with anchors + humility clause** — "only assess code you've read; don't speculate"
- **Plan mode** — force the next audit pass to start from a written scope
- **`/compact`** mid-audit; **`/clear`** between categories (move durable findings to the report first)
- **`git restore .`** to drop any code edits Claude made that you didn't intend (Track B)

## Save lessons

Use `#` to append durable findings to memory (e.g., "Claude under-rates IDOR severity when the endpoint also has auth — remember to re-rate").

## No before/after

This is an activity.
