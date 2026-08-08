#!/bin/bash
# scripts/validate.sh — local mirror of .github/workflows/validate.yml (file-presence)
# plus a site nav-sync check (same nav block + page count across all site pages).
#
# Run from the repo root:  bash scripts/validate.sh   (or ./scripts/validate.sh)
# Exit 0 + PASS summary on success; exit 1 listing every failure otherwise.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)" || exit 1
cd "$REPO_ROOT" || exit 1

PASS_COUNT=0
FAIL_COUNT=0
FAILED_MSGS=()

pass()   { PASS_COUNT=$((PASS_COUNT + 1));     printf '  ✅ %s\n' "$1"; }
fail()   { FAIL_COUNT=$((FAIL_COUNT + 1));     FAILED_MSGS+=("$1"); printf '  ❌ %s\n' "$1"; }
section(){ printf '\n== %s ==\n' "$1"; }

check_file() {
  if [ -f "$1" ]; then pass "$1"; else fail "missing file: $1"; fi
}

## 1. Required files (mirror of validate.yml + the new docs/rtk/layout files)
section "required files"
check_file "opencode.json"
check_file "AGENTS.md"
check_file ".agents/skills/titus-workflow/SKILL.md"
check_file ".agents/skills/titus-workflow/templates/SPEC.md"
check_file ".agents/skills/titus-workflow/templates/ROADMAP.md"
check_file ".agents/skills/titus-workflow/templates/TASKS.md"
check_file "docs/OPENCODE_LAYOUT.md"
check_file "docs/SKILLS.md"
check_file "docs/WORKFLOW.md"
check_file "SPEC.md"
check_file "ROADMAP.md"
check_file "TASKS.md"
check_file ".rtk/filters.toml"
check_file ".github/pull_request_template.md"
check_file "scripts/validate.sh"

## 2. Site pages exist (glob, mirroring the CI loop)
section "site pages"
shopt -s nullglob
site_html=( site/*.html )
if [ "${#site_html[@]}" -eq 0 ]; then
  fail "site/: no .html files found"
else
  pass "${#site_html[@]} site/*.html page(s) present"
fi

## 3. Nav sync: every site page must share the identical <nav> block (modulo the
##    page's own `active` class) and the same number of page links.
section "site nav sync"
extract_nav() {
  sed -n '/<nav>/,/<\/nav>/p' "$1" \
    | sed 's/class="active"//g' \
    | tr -d '[:space:]'
}

BASELINE="$(extract_nav site/index.html)"
if [ -z "$BASELINE" ]; then
  fail "site/index.html: no <nav> block found"
else
  for f in "${site_html[@]}"; do
    nav="$(extract_nav "$f")"
    if [ -z "$nav" ]; then
      fail "$f: no <nav> block found"
    elif [ "$nav" = "$BASELINE" ]; then
      pass "$f nav identical to index.html"
    else
      fail "nav out of sync (differs from site/index.html): $f"
    fi
  done

  # same nav page count across every page
  base_count=$(printf '%s' "$BASELINE" | grep -o 'href="[^"]*\.html"' | wc -l | tr -d ' ')
  for f in "${site_html[@]}"; do
    nav="$(extract_nav "$f")"
    c=$(printf '%s' "$nav" | grep -o 'href="[^"]*\.html"' | wc -l | tr -d ' ')
    if [ "$c" = "$base_count" ]; then
      pass "$f nav page count $c == baseline $base_count"
    else
      fail "$f nav has $c page links, expected $base_count (homepage card grid out of sync?)"
    fi
  done

  # homepage card grid should match the nav's page count (AGENTS.md convention)
  grid_count=$(grep -o 'class="card-core"' site/index.html | wc -l | tr -d ' ')
  if [ "$grid_count" = "$base_count" ]; then
    pass "index.html card grid ($grid_count) matches nav page count ($base_count)"
  else
    fail "index.html card grid has $grid_count cards but the nav lists $base_count pages"
  fi
fi

## 4. RTK filters sanity (schema header, no placeholder-only file)
section "rtk filters"
if [ -f ".rtk/filters.toml" ]; then
  if grep -q '^schema_version = 1' .rtk/filters.toml; then
    pass ".rtk/filters.toml declares schema_version = 1"
  else
    fail ".rtk/filters.toml missing 'schema_version = 1'"
  fi
  if grep -q '^\[filters\.' .rtk/filters.toml; then
    pass ".rtk/filters.toml has real [filters.*] blocks"
  else
    fail ".rtk/filters.toml has no [filters.*] definitions"
  fi
fi

## 5. Summary
printf '\n== summary ==\n'
if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '✅ PASS — %d checks green. Validation succeeds locally, mirroring CI.\n' "$PASS_COUNT"
  exit 0
else
  printf '❌ FAIL — %d of %d checks failed:\n' "$FAIL_COUNT" "$((PASS_COUNT + FAIL_COUNT))"
  printf '   - %s\n' "${FAILED_MSGS[@]}"
  exit 1
fi