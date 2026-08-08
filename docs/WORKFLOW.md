# Workflow

Source of truth: the 10-step Titus-workflow pipeline, ported for OpenCode free-tier models. Full skill: `.agents/skills/m3j-workflow/SKILL.md`. Working files live at the **project root** — `SPEC.md`, `ROADMAP.md`, `TASKS.md` — generated from `templates/` (`templates/SPEC.md`, `templates/ROADMAP.md`, `templates/TASKS.md` under `.agents/skills/m3j-workflow/`). Run steps in order; each step's done-criterion gates the next.

## The pipeline

| # | Step | Agent | Done-criterion |
|---|---|---|---|
| 0 | Inventory — which of AGENTS.md / SPEC.md / ROADMAP.md / TASKS.md already exist | primary agent | all four present, or a deliberate, recorded skip |
| 1 | SPEC — problem, users, required behavior, architecture, security, PINNED versions, non-goals, acceptance | `m3j-planner` | every acceptance criterion testable (command or human action); risky deps exact-pinned, no `^` |
| 2 | ROADMAP — phases with exit criteria + dependencies, ≤3 tasks per phase | `m3j-planner` | every phase has a checkable exit criterion, deps explicit |
| 3 | TASKS — vertical slices; acceptance command + expected output per task; TDD checkboxes | `m3j-planner` | every task has an observable acceptance command |
| 4 | Test scaffolding FIRST — runner, lint, format, typecheck before any feature code | `m3j-tester` | harness green on trivial baseline; TASKS.md acceptance commands runnable |
| 5 | Execute ONE phase, TDD — never the whole roadmap in one session | `m3j-executor` | phase's tasks pass acceptance; phase exit criterion met |
| 6 | Local gate — `/finish` (7-step quality gate) | `m3j-sentinel` | all 7 steps reported pass/fail; failures fixed and re-verified |
| 7 | One small PR — phase only, description names phase + acceptance criteria | `m3j-devops` | PR contains only this phase's change |
| 8 | Independent review, fresh context — NEW session, no memory of implementation | `m3j-triage` / `m3j-sentinel` | verdict with specific findings; never the implementing session |
| 9 | Fix/retest loop — verify each finding is sound before fixing (route via `m3j-triage`, load `receiving-code-review`); re-run acceptance + `/finish` | `m3j-executor` + `m3j-triage` | findings resolved or rejected with reasons; all gates re-pass |
| 10 | Human merge gate — checklist: intended diff only, tests + CI pass, threads resolved, docs match, manual check | human | human approval. Nothing merges without it. |

## Dispatch map (reuse, don't duplicate)

Each step maps to an existing agent that already covers the skill — never reimplement the step:

| Pipeline step | Agent | Skill it already covers |
|---|---|---|
| SPEC, ROADMAP, TASKS | `m3j-planner` | brainstorming, grilling, to-prd, to-issues, wayfinder |
| Test scaffolding | `m3j-tester` | test-driven-development, webapp-testing |
| Phase execution | `m3j-executor` | executing-plans, subagent-driven-development, using-git-worktrees |
| Local gate | `m3j-sentinel` | `/finish`, code-review, security-review, verification-before-completion |
| PR | `m3j-devops` | finishing-a-development-branch, resolving-merge-conflicts |
| Fresh-context review | `m3j-triage` / `m3j-sentinel` | requesting-code-review, receiving-code-review, triage |
| Fix loop | `m3j-executor` + `m3j-triage` | receiving-code-review, verification-before-completion |

## Principles

- **The tool is replaceable, the gates are not.** Any model can write code; the value lives in the gates — test scaffold first, `/finish`, fresh-context review, human merge check. Never weaken or skip a gate to save tokens. Skipping one is a human decision, made explicitly.
- **Reuse, don't duplicate.** The repo already has the agents and skills for every step — dispatch them, don't reimplement.
- **Token economy.** Free-tier context is precious: small files, small phases, one phase per session, compact handoffs (paths + acceptance commands, never full dumps). Keep SPEC/ROADMAP/TASKS each under ~200 lines — split the phase if it outgrows that.
- **Models stay pinned.** Planning/gates on `nemotron-3-ultra-free` (m3j-planner, m3j-triage), execution on `deepseek-v4-flash-free` (m3j-executor, m3j-devops), tests on `north-mini-code-free` (m3j-tester). Don't override.
- **CI stays code-only.** `.github/workflows/validate.yml` does file-presence checks, no builds/tests — keep it that way; `scripts/validate.sh` mirrors it locally.
