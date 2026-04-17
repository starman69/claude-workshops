# Generator Prompts

Spec-driven record of how each workshop module was (or could have been) generated. Treating prompts as durable artifacts lets future authors see the intent at the time a module was created, and lets them regenerate or adapt from a single source of truth.

## Files

- [`new-module-prompt.md`](new-module-prompt.md) — **template** for scaffolding future modules. Fill in the placeholders, paste into a fresh Claude Code session.
- [`todomvc-workshop-prompt.md`](todomvc-workshop-prompt.md) — **retrospective** spec for the TodoMVC module. Reconstructed after the fact from the existing module + plan so both modules have a spec on record. Not guaranteed to be what actually seeded the original, but close enough that rerunning it should reproduce the module in shape.
- [`juice-shop-workshop-prompt.md`](juice-shop-workshop-prompt.md) — **original** spec for the Juice Shop module. The module at `workshop/juice-shop/` was generated from this prompt.

## Adding a new module

1. Copy `new-module-prompt.md` to `<module>-workshop-prompt.md`.
2. Replace the placeholders with your target's specifics.
3. Paste the block from "Paste this:" onward into a fresh Claude Code session inside this repo.
4. Keep the filled prompt file in this directory as the spec of record.
