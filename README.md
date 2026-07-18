# opencode-setup

[![GitHub stars](https://img.shields.io/github/stars/amrmrkjr/opencode-setup?style=flat-square&label=stars)](https://github.com/amrmrkjr/opencode-setup)
[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](LICENSE)
[![OpenCode](https://img.shields.io/badge/opencode-1.17.15-6f4cff?style=flat-square)](https://opencode.ai)
[![CI](https://img.shields.io/github/actions/workflow/status/amrmrkjr/opencode-setup/validate.yml?style=flat-square&label=CI)](https://github.com/amrmrkjr/opencode-setup/actions)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](https://github.com/amrmrkjr/opencode-setup/pulls)

A production OpenCode workspace with 98 specialized skills, 16 purpose-built agents, and a built-in quality gate — ready to clone and run.

---

## Quick start

```bash
git clone https://github.com/amrmrkjr/opencode-setup.git
cd opencode-setup
open site/index.html          # browse the reference guide
opencode .                     # launch the workspace
```

No build step. No dependencies. Open `site/index.html` in any browser for the full reference guide covering config tuning, database maintenance, and agent management.

---

## Agent roster

Dispatch the right agent for the job. Every m3j-* agent is a custom definition in `.opencode/agents/` with its own model, permissions, and instructions.

| Agent | Role | Model | When to dispatch |
|---|---|---|---|
| `m3j-omniscient` | Commander, delegation, oversight | deepseek-v4-flash-free | Strategic direction, sub-agent coordination, final authority |
| `m3j-designer` | UI/UX, frontend, visual design | default | Landing pages, redesigns, component polish, bento grids |
| `m3j-engineer` | Architecture, APIs, MCP servers | default | Domain modeling, API design, module interfaces |
| `m3j-debugger` | Bug diagnosis, security, quality | default | Root-cause analysis, security review, performance regression |
| `m3j-writer` | Docs, articles, prose | default | Documentation, technical writing, PRDs |
| `m3j-planner` | Strategy, PRDs, issue breakdown | nemotron-3-ultra-free | Scoping work, writing plans, breaking down epics |
| `m3j-deployer` | Vercel deploy and optimization | default | Deployments, preview URLs, Vercel config |
| `m3j-researcher` | Investigation, API docs, skill discovery | default | Research questions, API reference, gathering context |
| `m3j-tester` | TDD, testing, QA | default | Red-green-refactor, integration tests, test suites |
| `m3j-executor` | Plan execution, parallel dispatch, git | default | Running plans, parallel sub-agent work, worktrees |
| `m3j-docs` | Word, PPT, PDF, spreadsheet generation | default | .docx, .pptx, .pdf, .xlsx deliverables |
| `m3j-skillsmith` | Skill creation and management | default | Authoring skills, running evals, optimizing triggers |
| `m3j-devops` | Infrastructure, git hooks, CI, wizards | default | Pre-commit hooks, CI pipelines, setup scripts |
| `m3j-triage` | Issue triage, code review workflow | default | Classifying issues, verifying PRs, writing agent briefs |
| `m3j-sentinel` | Build errors, code review, quality audits | default | Pre-merge review, quality gates, style enforcement |
| `ultra-minimal` | Ultra-minimal responses, no tools | default | Simple queries, tool-free answers, maximum concision |

Not sure which agent fits? Dispatch `m3j-planner` first to scope the work.

---

## Built-in commands

### `/finish` — 7-step quality gate

Defined in `.opencode/commands/finish.md` and delegated to `m3j-sentinel`. Runs before every merge:

| Step | Check |
|---|---|
| 1 — Sanity | File integrity, no debug artifacts, no large files |
| 2 — Security | Secrets scan, injection patterns, exposed credentials |
| 3 — Style | Naming conventions, banned fonts, trailing whitespace |
| 4 — Quality | Design system compliance, responsive breakpoints, transitions |
| 5 — Diff | Scope creep check, unrelated changes, intent alignment |
| 6 — Verify | Uncommitted changes, remote status, test suite |
| 7 — Ship | Merge / PR / cleanup recommendation with exact command |

---

## Skills (98)

All skills live under `.agents/skills/` and are loaded per-project via `opencode.json` — keeping them isolated from global state.

**Design & frontend:** algorithmic-art, brand-guidelines, brandkit, canvas-design, design-taste-frontend, frontend-design, gpt-taste, high-end-visual-design, image-to-code, impeccable, industrial-brutalist-ui, minimalist-ui, redesign-existing-projects, stitch-design-taste, web-design-guidelines, web-quality-audit

**Development & architecture:** codebase-design, design-an-interface, domain-modeling, improving-codebase-architecture, shadcn, vercel-composition-patterns, vercel-react-best-practices, vercel-react-native-skills, vercel-react-view-transitions

**Testing & QA:** tdd, test-driven-development, webapp-testing, diagnosing-bugs, systematic-debugging, security-review, code-review, receiving-code-review, requesting-code-review

**Writing & docs:** doc-coauthoring, edit-article, internal-comms, writing-beats, writing-fragments, writing-great-skills, writing-guidelines, writing-plans, writing-shape, writing-skills

**AI & APIs:** claude-api, mcp-builder, research, find-skills

**Project management:** brainstorming, implement, prototype, to-issues, to-prd, triage, wayfinder, wizard, qa

**Execution & delivery:** dispatching-parallel-agents, executing-plans, finishing-a-development-branch, handoff, subagent-driven-development, verification-before-completion, using-git-worktrees, claude-handoff

**Documents & media:** docx, pdf, pptx, xlsx, slack-gif-creator, imagegen-frontend-web, imagegen-frontend-mobile

**Infrastructure:** deploy-to-vercel, vercel-cli-with-tokens, vercel-optimize, setup-pre-commit, git-guardrails-claude-code, skill-creator

**Other:** ask-matt, full-output-enforcement, grilling, grill-me, grill-with-docs, loop-me, migrate-to-shoehorn, obsidian-vault, scaffold-exercises, setup-matt-pocock-skills, teach, template-skill, theme-factory, ubiquitous-language

---

## Why this exists

OpenCode is powerful out of the box, but its defaults are generous — global skills, verbose tool output, full LSP, unchecked DB growth. After a few weeks the SQLite database can bloat past 100MB.

This workspace is the result of real usage, not theory. It codifies the conventions, agents, and quality gates that emerged from production sessions into something you can clone and immediately use. Every agent, skill path, and config decision was shaped by actual work — what sped things up, what caught bugs before they shipped, what made collaboration with AI feel less like a demo and more like engineering.

---

## Structure

```
opencode-setup/
├── .agents/skills/       # 98 specialized skills
├── .opencode/
│   ├── agents/           # 16 custom agent definitions
│   └── commands/         # built-in /finish command
├── site/                 # static reference guide (no build)
├── opencode.json         # project-level config
└── AGENTS.md             # agent hierarchy and dispatch rules
```

---

<p align="center">
  <a href="https://github.com/amrmrkjr/opencode-setup">GitHub</a>
  &middot;
  <a href="https://opencode.ai">OpenCode</a>
  &middot;
  <a href="site/index.html">Reference Guide</a>
  &middot;
  <a href="https://github.com/amrmrkjr/opencode-setup/issues">Issues</a>
</p>
