#!/usr/bin/env bash
# Conformance check for Product OS: every skill is wired everywhere docs/conventions.md §2 says it
# must be, and every recipe's frontmatter points at things that exist.
#
# Why a script and not a rule: the rule ("adding a skill also requires a stage row, a §6 row, a
# playbook entry, a CLAUDE.md row, a README entry") has existed since the companion map and has
# been checked by eye. A skill that is missing from one of those places is invisible to
# product:next or to the reader, and nothing told us. This makes the omission fail loudly.
#
# Usage: scripts/check-conformance.sh   (from the repo root; exit 1 on any failure)
# Needs only bash, grep, sed, awk.

set -uo pipefail
cd "$(dirname "$0")/.."

fail=0
say_fail() { printf '✗ %s\n' "$*"; fail=1; }
say_ok()   { printf '✓ %s\n' "$*"; }

# Frontmatter value for a key, from the first --- block of a file.
fm() { awk -v key="$2" 'NR==1&&$0!="---"{exit} NR>1&&$0=="---"{exit} NR>1{ if (index($0, key":")==1) { sub("^"key":[ ]*", ""); print; exit } }' "$1"; }

conv=docs/conventions.md
stage_table="$(sed -n '/^## 1\./,/^## 2\./p' "$conv")"
artifact_map="$(sed -n '/^## 6\./,/^## 7\./p' "$conv")"
phase_slugs="$(printf '%s\n' "$stage_table" | awk -F'|' '/^\| *[0-9∞]+ *\|/{gsub(/[ `]/,"",$4); print $4}')"

# ---- Skills -----------------------------------------------------------------
skills=()
for dir in skills/*/; do
  name="${dir#skills/}"; name="${name%/}"
  f="$dir/SKILL.md"
  skills+=("$name")
  [ -f "$f" ] || { say_fail "skills/$name has no SKILL.md"; continue; }

  fm_name="$(fm "$f" name)"
  [ "$fm_name" = "$name" ] || say_fail "skills/$name/SKILL.md: frontmatter name is '$fm_name', must be '$name' (short, no product: prefix)"
  [ -n "$(fm "$f" description)" ] || say_fail "skills/$name/SKILL.md: frontmatter description missing"

  grep -q '^## Contract' "$f" || say_fail "skills/$name/SKILL.md: no '## Contract' section"
  grep -q '^## Rules' "$f"    || say_fail "skills/$name/SKILL.md: no '## Rules' section"

  printf '%s\n' "$stage_table" | grep -q "\`$name\`" || say_fail "skill '$name' has no stage in conventions §1 table"
  printf '%s\n' "$artifact_map" | grep -qw -- "$name" || say_fail "skill '$name' appears nowhere in conventions §6 artifact map"
  grep -q "product:$name\b" docs/playbooks.md || say_fail "skill '$name' has no playbook entry in docs/playbooks.md"
  grep -q "^| .*\`product:$name\`" CLAUDE.md || say_fail "skill '$name' has no row in the CLAUDE.md skill table"
  grep -q "product:$name\b" README.md || say_fail "skill '$name' is not mentioned in README.md"

  # A recipe names it, unless the skill declares itself recipe-less.
  if ! grep -lq "^skill:.*product:$name\b" recipes/*.md; then
    grep -qi 'no recipe' "$f" || say_fail "skill '$name': no recipe lists it in 'skill:' and SKILL.md does not say 'no recipe'"
  fi
done
say_ok "${#skills[@]} skills checked"

# ---- Recipes ----------------------------------------------------------------
count=0
for f in recipes/*.md; do
  count=$((count+1))
  stem="$(basename "$f" .md)"
  id="$(fm "$f" id)"
  [ "$id" = "$stem" ] || say_fail "$f: frontmatter id '$id' must equal filename stem '$stem'"
  phase="$(fm "$f" phase)"
  if [ -z "$phase" ]; then
    say_fail "$f: frontmatter phase missing"
  elif ! printf '%s\n' "$phase_slugs" | grep -qx -- "$phase"; then
    say_fail "$f: phase '$phase' is not a phase slug in conventions §1"
  fi
  for key in tier-lite tier-pro produces skill; do
    [ -n "$(fm "$f" "$key")" ] || say_fail "$f: frontmatter '$key' missing"
  done
  for sk in $(fm "$f" skill | grep -o 'product:[a-z-]*' | sed 's/product://'); do
    [ -d "skills/$sk" ] || say_fail "$f: skill 'product:$sk' has no skills/$sk/"
  done
  for sec in 'When to use' 'Output structure' 'Exit condition' 'Checklist'; do
    grep -q "^## $sec" "$f" || say_fail "$f: no '## $sec' section"
  done
done
say_ok "$count recipes checked"

# ---- Templates referenced by recipes exist ----------------------------------
for t in $(grep -oh 'templates/[a-z-]*\.md' recipes/*.md skills/*/SKILL.md | sort -u); do
  [ -f "$t" ] || say_fail "$t is referenced but does not exist"
done

# ---- Skill table in CLAUDE.md has no stale rows -----------------------------
for sk in $(grep -o '^| [^|]*| `product:[a-z-]*`' CLAUDE.md | grep -o 'product:[a-z-]*' | sed 's/product://'); do
  [ -d "skills/$sk" ] || say_fail "CLAUDE.md skill table names product:$sk but skills/$sk/ does not exist"
done

if [ "$fail" -eq 0 ]; then say_ok "conformance: clean"; else printf '\nconformance: FAILED\n'; fi
exit "$fail"
