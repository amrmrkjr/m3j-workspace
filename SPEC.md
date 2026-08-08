# SPEC: m3j-workspace

## Problem Statement
A single command-driven workspace for running OpenCode on free-tier models, with a fleet of specialist sub-agents, ~94 skills (81 active + 13 archived), a static reference site, and a tested development workflow. Without it, work is ad-hoc: no dispatch structure, no gates, no consistent process. This SPEC stabilizes the repo's purpose and the process it runs on.

## Intended Users
- **Primary agent (me)** — reads AGENTS.md, dispatches m3j-* agents per task.
- **m3j-* sub-agents** — consume docs (layout, skills index, workflow) and skills to do specialized work.
- **Human maintainer** — reads README.md and site/, runs `scripts/validate.sh`, gives the human merge approval at workflow step 10.

## Required Behavior & UX
1. Any task maps to an agent via the AGENTS.md dispatch table — no task is done inline for specialized work.
2. The m3j workflow (docs/WORKFLOW.md) is the development process: SPEC → ROADMAP → TASKS → one phase per session → gates → one small PR.
3. Skills live per-project in `.agents/skills/` — never `~/.agents/skills/` — and are indexed in docs/SKILLS.md.
4. The static site (5 HTML pages, shared nav) documents setup, the config/paths reference, the agent roster, and the workflow. Pages for out-of-scope separate projects are not part of this repo.
5. CI and the local `scripts/validate.sh` gate file presence and nav sync; they stay code-only (no builds, no tests).

## Architecture & Components
- **opencode.json** — model `opencode/deepseek-v4-flash-free`; plan/compact agents `opencode/deepseek-v4-flash-free`; skills path `.agents/skills`; instructions AGENTS.md.
- **.opencode/agents/** — 16 m3j-* specs + `ultra-minimal`. Each: frontmatter (description, model, mode, tools) + prompt body. Free-tier pinned.
- **.opencode/commands/finish.md** — `/finish` 7-step quality gate → `m3j-sentinel`.
- **.agents/skills/** — ~94 skills (81 active + 13 archived); the wiring to workflow steps is in docs/WORKFLOW.md.
- **site/** — static HTML/CSS/JS reference, shared nav partial, "amber signal / carbon" design system, no build step.
- **.github/workflows/validate.yml + scripts/validate.sh** — file-presence CI + local mirror.
- **.rtk/filters.toml** — RTK output prettifying for noisy commands.

## Security & Privacy
- No secrets in code. `.env`, `*.env.*`, `node_modules/`, `site-screenshot.png` are gitignored.
- `/finish` security step (step 2) scans diffs for keys/secrets.
- The repo is public; no personal data beyond the user's own config choices.
- Open risk: a leaked GitHub PAT (see TASKS.md) — rotation is a human action.
- Current open risk: a leaked GitHub PAT referenced in TASKS.md — must be rotated (human action, out of agent scope).

## Supported Versions
- opencode: latest (config `$schema` pins it to opencode.ai)
- Node (for /finish plugin deps): via package-lock (`@opencode-ai/plugin@1.17.15`)
- No other build toolchain for the repo body; site is plain HTML/CSS/JS.

### Pinned model roles (free tier — do not change except per step)

| Role | Model | Used by |
|---|---|---|
| Default | `opencode/big-pickle` | opencode.json root `model` |
| Planning / gates | `opencode/nemotron-3-ultra-free` | m3j-planner, m3j-triage, plan mode |
| Execution | `opencode/deepseek-v4-flash-free` | m3j-executor, m3j-devops, compaction |
| Tests | `opencode/north-mini-code-free` | m3j-tester |

Rules: agent files never override models; a paid-model switch is an opencode.json-only change (ROADMAP Phase 4).

## Non-Goals
- No new overall agent architecture changes this repo; the current m3j-* fleet is the intended set.
- No build step for site/ — static files served as-is.
- No .rtk ignored — filters.toml is committed and useful.
- No manual vendored frameworks.

## Acceptance Criteria
1. `bash -e scripts/validate.sh` prints a PASS summary and exits 0.
2. `.github/workflows/validate.yml` exists and remains code-only (validates file presence).
3. `docs/WORKFLOW.md` documents all 10 steps with agent-per-step mapping and done-criteria.
4. `docs/SKILLS.md` enumerates skill groups (≈94 skills — 81 active + 13 archived).
5. `docs/OPENCODE_LAYOUT.md` tree matches actual repo layout.
6. SPEC/ROADMAP/TASKS exist at root; consistent with each other and with templates/.
7. `.rtk/filters.toml` follows schema_version=1 with [filters.X] blocks.

## Notes
- Vercel deploy of site/ is optional/blocked: requires the user to provide a Vercel token.
- Paid models can later be swapped in only via opencode.json — never via agent files.
- The m3j workflow (docs/OPENCODE_LAYOUT.md) drives development; it runs entirely on free-tier models.