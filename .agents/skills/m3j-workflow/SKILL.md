---
name: m3j-workflow
description: >-
  Orchestrate a full AI coding workflow end-to-end — SPEC, ROADMAP, TASKS,
  test-first scaffolding, one-phase execution, quality gates, one small PR, and
  fresh-context review — free-tier models only. Use when the user says "m3j
  workflow", "AI coding workflow", wants a spec→roadmap→tasks pipeline, or asks
  to build something end-to-end with quality gates and one reviewable change
  per PR.
---

# M3j Workflow (free-tier port)

An end-to-end AI coding workflow for OpenCode — free-tier models only. The pipeline turns an idea into a reviewed, mergeable PR through small phases — each phase ships as one reviewable change.

## Principles

**The tool is replaceable, the gates are not.** Any model can write code. The value lives in the gates — test scaffold first, `/finish`, fresh-context review, human merge check. Never weaken or skip a gate to save tokens.

**Reuse, don't duplicate.** This repo already has the agents and skills for every step. Your job is to dispatch them in the right order with the right inputs, not to reimplement their behavior. Map each step to the existing agent (table below).

**Token economy.** Free-tier context is precious. Small files, small phases, one phase per session, compact handoffs — pass paths and acceptance commands, never whole-file dumps or conversation history.

## The pipeline

Working files: `SPEC.md`, `ROADMAP.md`, `TASKS.md` at the project root, from `templates/`. Run steps in order; each step's done-criterion must be met before the next starts.

### Step 0 — Inventory
Check which of `AGENTS.md`, `SPEC.md`, `ROADMAP.md`, `TASKS.md` already exist. Create or refresh the missing ones.
Done: all four files present, or a missing one is deliberately deferred and that call is recorded in the SPEC.

### Step 1 — SPEC
Dispatch `m3j-planner` to write `SPEC.md` from `templates/SPEC.md`: problem, users, required behavior, architecture, security, PINNED dependency versions, non-goals, acceptance criteria.
Done: every acceptance criterion is testable (a command or a human action), and every dependency has an exact pinned version — no `^` ranges for the risky ones.

### Step 2 — ROADMAP
Dispatch `m3j-planner` to write `ROADMAP.md` from `templates/ROADMAP.md`: phases with exit criteria and dependencies, ≤3 tasks per phase.
Done: every phase has a checkable exit criterion and its dependencies on other phases are explicit.

### Step 3 — TASKS
Dispatch `m3j-planner` to write `TASKS.md` from `templates/TASKS.md`: vertical slices (each task delivers working value alone), an acceptance command + expected output per task, TDD checkbox steps.
Done: every task has an observable acceptance command.

### Step 4 — Test scaffolding first
Dispatch `m3j-tester` to set up the harness — test runner, lint, format, typecheck — BEFORE any feature code.
Done: the harness runs green on an empty/trivial baseline and the TASKS.md acceptance commands are runnable.

### Step 5 — Execute one phase
Dispatch `m3j-executor` to implement ONE phase from `TASKS.md`, TDD. One phase per session — never the whole roadmap.
Done: the phase's tasks pass their acceptance commands and the phase exit criterion is met.

### Step 6 — Local gate
Run `/finish` (dispatches `m3j-sentinel`, 7-step quality gate).
Done: all 7 steps reported pass/fail, and every failure is fixed and re-verified.

### Step 7 — One PR
Dispatch `m3j-devops` to open one small, reviewable PR for this phase.
Done: the PR contains only this phase's change and its description names the phase plus its acceptance criteria.

### Step 8 — Independent review, fresh context
Dispatch a NEW `m3j-triage` or `m3j-sentinel` session — a separate background agent with no memory of the implementation — to review the PR. Never the implementing session; you never grade your own work.
Done: the fresh session returns a verdict with specific findings.

### Step 9 — Fix/retest loop
For each finding, dispatch `m3j-executor` to fix, then re-run the affected acceptance commands and `/finish`. Route through `m3j-triage` (loads `receiving-code-review`): verify each suggestion is technically sound before implementing — don't blindly accept.
Done: findings resolved or rejected with reasons, and all gates re-pass.

### Step 10 — Human merge gate
Present the PR with this checklist. Nothing merges without human approval.
- [ ] Diff contains only the intended change
- [ ] Tests + CI pass on the latest commit
- [ ] Review threads resolved
- [ ] Docs match behavior
- [ ] Real-world manual check done

## Dispatch map (reuse-not-duplicate)

| Pipeline step | Agent | Skill it already covers |
|---|---|---|
| SPEC, ROADMAP, TASKS | `m3j-planner` | brainstorming, grilling, to-prd, to-issues, wayfinder |
| Test scaffolding | `m3j-tester` | test-driven-development, webapp-testing |
| Phase execution | `m3j-executor` | executing-plans, subagent-driven-development, using-git-worktrees |
| Local gate | `m3j-sentinel` | `/finish`, code-review, security-review, verification-before-completion |
| PR | `m3j-devops` | finishing-a-development-branch, resolving-merge-conflicts |
| Fresh-context review | `m3j-triage` / `m3j-sentinel` | requesting-code-review, receiving-code-review, triage |
| Fix loop | `m3j-executor` + `m3j-triage` | receiving-code-review, verification-before-completion |

## Cost-conscious rules

- Models are already pinned in the agent files — planning/gates on `nemotron-3-ultra-free` (m3j-planner, m3j-triage), execution on `deepseek-v4-flash-free` (m3j-executor, m3j-devops), tests on `north-mini-code-free` (m3j-tester). Don't override them.
- Keep `SPEC.md`, `ROADMAP.md`, `TASKS.md` each under ~200 lines. If a phase outgrows that, split the phase.
- One phase per execution session. Never feed the whole roadmap into one context.
- Compact handoffs: give sub-agents file paths, acceptance commands, and only the phase's tasks — not full file dumps.
- If the user asks to skip a gate for cost, say so plainly: the gates are the point. Skipping one is a human decision, made explicitly.
