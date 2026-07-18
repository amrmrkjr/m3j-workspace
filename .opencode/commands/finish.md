---
description: 7-step quality gate before merge — integrity, security, style, quality, diff, verify, ship
agent: m3j-sentinel
subtask: true
---

Run the 7-step finish loop on the current branch. Execute each step in order. Do not skip a step if the previous one failed — report all findings.

## Step 1 — Sanity
Check file integrity. Run `git status` and `git diff --stat`. Verify:
- No empty files, broken symlinks, or binary artifacts committed unintentionally
- No `console.log`, `debugger`, `TODO`, `FIXME`, or `XXX` left in changed files
- No large files (>1MB) staged
- No node_modules, .env, or secrets in the diff

## Step 2 — Security
Scan the diff for security issues:
- Hardcoded API keys, tokens, passwords, or secrets
- SQL injection, command injection, or path traversal patterns
- Exposed internal URLs, credentials, or sensitive paths
- Unsafe file permissions
Run `rg -n "api._?key|secret|token|password|auth_token" --include '*.{js,ts,py,go,rb,rs,sh}'` on the changed files to look for secrets.

## Step 3 — Style
Check code style consistency:
- Naming conventions match the project's existing style
- No mixed tabs/spaces, no trailing whitespace, no missing newline at EOF
- Imports are clean (no unused imports, no wildcard imports where ugly)
- No commented-out code blocks
- Banned fonts (Inter, Roboto, Arial) if it's a design change in site/

## Step 4 — Quality
Web quality audit if the change touches site/ files:
- Check against the existing design system (bento grid, double-bezel cards, glass nav)
- Verify responsive breakpoints are handled (mobile collapse)
- All transitions use custom cubic-bezier, not linear/ease-in-out
- No banned shadows, borders, or layout patterns from the design guidelines

For non-web changes: skip this step and report "N/A — not a web change."

## Step 5 — Diff
Review the diff against the original task intent:
- `git diff main...HEAD` to see everything changed
- Does every change serve the original goal? Flag scope creep, unrelated refactors, or half-finished sections
- Are there files changed that shouldn't be? (config files, lock files, unrelated formatting)

## Step 6 — Verify
Load `finishing-a-development-branch` skill and run a completion check:
- Are there any uncommitted changes? (`git status --short`)
- Has the remote been updated? (`git log --oneline origin/main..HEAD`)
- Run any available tests or type checks
- If the project has a build step, run it

## Step 7 — Ship
Based on the diff and branch state, decide the right integration strategy:
- **Merge** — straight to main if it's a small, safe change
- **PR** — needs review for larger or riskier changes
- **Cleanup** — squash commits, rebase, or split into smaller PRs

Recommend one and show the exact command to execute it.

## Output format

Return a final summary like this:

```
╔══════════════════════════════════╗
║  7-Step Finish Report           ║
╚══════════════════════════════════╝

Step 1  Sanity      ✅ / ❌ / ⚠️   details
Step 2  Security    ✅ / ❌ / ⚠️   details
Step 3  Style       ✅ / ❌ / ⚠️   details
Step 4  Quality     ✅ / ❌ / ⚠️   details
Step 5  Diff        ✅ / ❌ / ⚠️   details
Step 6  Verify      ✅ / ❌ / ⚠️   details
Step 7  Ship        ─────────────   recommendation

Recommendation: [merge | pr | cleanup]
Command: [exact git command to execute]
```
