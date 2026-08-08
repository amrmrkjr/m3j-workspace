# Security Policy

## Reporting a vulnerability

**Please do not open a public issue for security problems.** Use GitHub's private vulnerability reporting instead:

1. Go to **Security** → **Report a vulnerability** (or use the direct link: `https://github.com/amrmrkjr/m3j-workspace/security/advisories/new`)
2. Describe the issue — what it is, how to reproduce it, and the impact
3. Add any supporting files (proof of concept, logs) — keep it focused

Reports are acknowledged within a few days. You'll be kept in the loop on triage and any fix.

## Scope

This repository contains OpenCode workspace configuration: agent definitions, skills, workflows, and reference documentation (see `site/`). Security-relevant items include:

- Anything that executes code from the repo: `scripts/validate.sh`, GitHub Actions workflows (`.github/workflows/`), skill instructions that an agent might run
- Leaked secrets or tokens (see secret scanning — enabled on this repo)
- Compromised dependencies, once any are tracked at the root (currently there is no root lockfile; the only lockfile is `.opencode/package-lock.json`, which is not a runtime dependency)

## Supported versions

There are no release versions. `main` is the only supported branch — fixes land there directly.

## Security features in place

- Secret scanning with push protection (pushes containing known secrets are blocked)
- Dependabot alerts + security updates for GitHub Actions
- CodeQL analysis on every push
- Private vulnerability reporting (this policy)
- Branch protection: force-push and branch deletion are blocked on `main`
