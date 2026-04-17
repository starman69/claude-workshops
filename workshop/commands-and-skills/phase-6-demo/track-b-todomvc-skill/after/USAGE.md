# scaffold-feature Skill — Install & Invoke

## Install

In your TodoMVC checkout (not this training repo):

```bash
mkdir -p .claude/skills/scaffold-feature/scripts
cp /path/to/this-workshop/after/SKILL.md .claude/skills/scaffold-feature/
cp /path/to/this-workshop/after/scripts/scaffold-feature.sh.snippet \
   .claude/skills/scaffold-feature/scripts/scaffold-feature.sh
chmod +x .claude/skills/scaffold-feature/scripts/scaffold-feature.sh
```

## Invoke

A Skill is **not** a slash command. Claude reads `SKILL.md`'s `description` and reaches for the Skill when your phrasing matches.

Try:

> Add a `DarkModeToggle` component that cycles between light and dark themes.

Claude should recognize the ask and invoke the `scaffold-feature` Skill.

## Verify

- Three artifacts generated: component, test, wiring edit
- `npm test` passes
- No unexpected dependencies added
- Snapshot tests in the repo aren't modified (unless you explicitly asked)

## Maintain

- When conventions change (e.g., moving to CSS modules), update `SKILL.md` — it's the source of truth
- If Claude stops reaching for the Skill, the `description` probably isn't matching user phrasing; rephrase it
