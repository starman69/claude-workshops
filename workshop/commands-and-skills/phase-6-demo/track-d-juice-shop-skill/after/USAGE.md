# audit-route Skill — Install & Invoke

## Install

In your Juice Shop checkout:

```bash
mkdir -p .claude/skills/audit-route/scripts
cp /path/to/this-workshop/after/SKILL.md              .claude/skills/audit-route/
cp /path/to/this-workshop/after/FINDINGS_TEMPLATE.md  .claude/skills/audit-route/
cp /path/to/this-workshop/after/scripts/audit-route.sh.snippet \
   .claude/skills/audit-route/scripts/audit-route.sh
chmod +x .claude/skills/audit-route/scripts/audit-route.sh
```

## Invoke

The Skill is matched via `description`, not invoked as `/command`. Try:

> Trace the `/rest/user/login` endpoint for authorization and injection issues.

## Verify

- Claude uses only `Read`, `Grep`, and the helper script — no `Edit`, no unscoped `Bash`
- Output populates the `FINDINGS_TEMPLATE.md` schema
- No working payloads anywhere in the output
- Non-applicable categories are explicitly marked, not silently skipped

## Maintain

- If severity drifts upward, re-tighten the "don't rate H without justification" clause in `SKILL.md`
- Add helper scripts sparingly — only for reproducible analysis that's awkward in prompt form
- Update the Skill's `description` field if Claude stops reaching for it (phrasing drift in user requests)
