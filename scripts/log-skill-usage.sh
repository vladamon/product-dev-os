#!/usr/bin/env bash
# Logs product:* skill invocations to docs/os-usage-log.md for later reflection.
#
# Wired as a PostToolUse hook on the Skill tool. Reads the hook JSON payload from
# stdin and appends one markdown table row per product:* skill invocation, across
# whatever project Claude Code is running in.
#
# Why only product:* skills (not every tool): the decision this feeds is "which
# Product OS skills pull weight." Logging every Read/Bash/Edit would bury that
# signal. To broaden later, relax the `case "$skill"` guard below.

set -euo pipefail

LOG_FILE="/Users/vladimir.cutkovic/Documents/code/github-vladamon.com/product-dev-os/docs/os-usage-log.md"

# jq is required; if missing, fail silent so we never block a tool call.
command -v jq >/dev/null 2>&1 || exit 0

input="$(cat)"

tool="$(printf '%s' "$input" | jq -r '.tool_name // empty')"
[ "$tool" = "Skill" ] || exit 0

skill="$(printf '%s' "$input" | jq -r '.tool_input.skill // empty')"
case "$skill" in
  product*) ;;
  *) exit 0 ;;
esac

args="$(printf '%s' "$input" | jq -r '.tool_input.args // ""')"
cwd="$(printf '%s' "$input" | jq -r '.cwd // ""')"
project="$([ -n "$cwd" ] && basename "$cwd" || echo "?")"
ts="$(date '+%Y-%m-%d %H:%M')"

# Escape pipes so freeform args don't break the markdown table.
args="${args//|/\\|}"

# Recreate header if the log file was deleted.
if [ ! -f "$LOG_FILE" ]; then
  {
    printf '# Product OS — usage log\n\n'
    printf '| Date | Project | Skill | Args | Load-bearing? (Y/N) | Note |\n'
    printf '|------|---------|-------|------|---------------------|------|\n'
  } > "$LOG_FILE"
fi

printf '| %s | %s | %s | %s | | |\n' "$ts" "$project" "$skill" "$args" >> "$LOG_FILE"
exit 0
