#!/usr/bin/env bash
# PreToolUse hook: block any tool call that touches secrets.
#
# Claude Code invokes PreToolUse hooks with a JSON payload on stdin describing
# the tool call. We inspect it and exit non-zero (with reason on stderr) to
# veto the call. Exit 0 to allow.
#
# Defense in depth: the permissions.deny list in settings.json is the primary
# guard; this hook is a belt for that suspender.

set -euo pipefail

payload="$(cat)"

# Extract likely-sensitive fields without requiring jq (best-effort grep).
# Matches: "file_path": "...", "command": "...", "pattern": "..."
needles='(\.env($|\.|/)|\.envrc|\.pem($|")|\.key($|")|id_rsa|\.ssh/|secrets/|credentials\.|\.aws/|\.gcp/|\.netrc)'
shell_needles='(cat[[:space:]]+[^|;&]*\.env|^[[:space:]]*env[[:space:]]*$|printenv|export[[:space:]]+[A-Z_]+=)'

if echo "$payload" | grep -qE "\"(file_path|path|pattern)\"[[:space:]]*:[[:space:]]*\"[^\"]*${needles}" ; then
  echo "[block-secrets] Refusing tool call: path matches a sensitive pattern." >&2
  exit 2
fi

if echo "$payload" | grep -qE "\"command\"[[:space:]]*:[[:space:]]*\"[^\"]*${shell_needles}" ; then
  echo "[block-secrets] Refusing shell command: appears to read environment/secrets." >&2
  exit 2
fi

exit 0
