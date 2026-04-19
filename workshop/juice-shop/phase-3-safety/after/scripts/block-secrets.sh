#!/usr/bin/env bash
# PreToolUse hook: block any tool call that touches secrets.
#
# Claude Code invokes PreToolUse hooks with a JSON payload on stdin describing
# the tool call. We inspect it and exit non-zero (with reason on stderr) to
# veto the call. Exit 0 to allow.
#
# Defense in depth: the permissions.deny list in settings.json is the primary
# guard; this hook is a belt for that suspender.
#
# Known limits (intentional): this is a blocklist, not a sandbox. Indirect reads
# like `grep . .env`, `xxd .env`, or `python -c "print(open('.env').read())"`
# are not caught here — the right guard for those is permissions.deny on Read
# and Bash(grep/xxd/python) prefixes, not more regex.

set -euo pipefail

payload="$(cat)"

# Extract likely-sensitive fields without requiring jq (best-effort grep).
# Matches: "file_path": "...", "command": "...", "pattern": "..."
needles='(\.env($|\.|/)|\.envrc|\.pem($|")|\.key($|")|id_rsa|\.ssh/|secrets/|credentials\.|\.aws/|\.gcp/|\.netrc)'
# \benv\b catches `env` as a shell token — including wrappers like
# `bash -c env` or `sh -c 'env'` that slip past a whole-string anchor.
shell_needles='(cat[[:space:]]+[^|;&]*\.env|\benv\b|printenv|export[[:space:]]+[A-Z_]+=)'

if echo "$payload" | grep -qE "\"(file_path|path|pattern)\"[[:space:]]*:[[:space:]]*\"[^\"]*${needles}" ; then
  echo "[block-secrets] Refusing tool call: path matches a sensitive pattern." >&2
  exit 2
fi

if echo "$payload" | grep -qE "\"command\"[[:space:]]*:[[:space:]]*\"[^\"]*${shell_needles}" ; then
  echo "[block-secrets] Refusing shell command: appears to read environment/secrets." >&2
  exit 2
fi

exit 0
