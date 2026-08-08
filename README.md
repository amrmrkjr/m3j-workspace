<p align="center">
  <a href="https://github.com/amrmrkjr/m3j-workspace"><img src="https://img.shields.io/github/stars/amrmrkjr/m3j-workspace?style=for-the-badge&logo=github&label=Stars&color=facc15&labelColor=1a1a2e" alt="Stars"></a>
  <a href="https://github.com/amrmrkjr/m3j-workspace/actions"><img src="https://img.shields.io/github/actions/workflow/status/amrmrkjr/m3j-workspace/validate.yml?style=for-the-badge&logo=github-actions&label=CI&color=22c55e&labelColor=1a1a2e" alt="CI"></a>
  <img src="https://img.shields.io/badge/skills-81%20(%2B13%20archived)-a855f7?style=for-the-badge&labelColor=1a1a2e" alt="Skills">
  <img src="https://img.shields.io/badge/agents-16-06b6d4?style=for-the-badge&labelColor=1a1a2e" alt="Agents">
  <img src="https://img.shields.io/badge/license-MIT-64748b?style=for-the-badge&labelColor=1a1a2e" alt="License">
</p>

<h1 align="center">m3j-workspace</h1>
<p align="center"><b>Production OpenCode workspace — 81 skills (+13 archived), 16 agents, built-in quality gate.</b></p>

<p align="center">
  <a href="#quick-start">quick start</a> &middot;
  <a href="#agent-roster">agents</a> &middot;
  <a href="#skills">skills</a> &middot;
  <a href="#commands">commands</a> &middot;
  <a href="site/agents.html">showcase</a>
</p>

---

## Quick start

```bash
git clone https://github.com/amrmrkjr/m3j-workspace.git
cd m3j-workspace
open site/index.html          # reference guide
opencode .                     # launch workspace
```

No build step. No dependencies. Open `site/index.html` in any browser for the full reference guide.

### Development

`main` is directly pushable — no PR required. Commits are validated in CI; force-pushes and branch deletion are blocked.

```bash
git commit -am "your change" && git push origin main
```

---

## Agent roster

Dispatch the right agent for the job. Every `m3j-*` agent has its own model, permissions, and dispatch triggers.

| Agent | Role | When to dispatch |
|---|---|---|
| `m3j-omniscient` | Commander, delegation | Strategic direction, final authority |
| `m3j-designer` | UI/UX, frontend, visual design | Landing pages, redesigns, bento grids |
| `m3j-engineer` | Architecture, APIs, MCP | Domain modeling, API design, modules |
| `m3j-debugger` | Bug diagnosis, security | Root-cause, security review, perf |
| `m3j-writer` | Docs, articles, prose | Technical writing, PRDs |
| `m3j-planner` | Strategy, issue breakdown | Scoping, planning, breaking epics |
| `m3j-deployer` | Vercel deploy + optimization | Deployments, preview URLs, config |
| `m3j-researcher` | Investigation, API docs | Research, API reference, context |
| `m3j-tester` | TDD, testing, QA | Red-green-refactor, test suites |
| `m3j-executor` | Plan execution, git worktrees | Running plans, parallel dispatch |
| `m3j-docs` | Word, PPT, PDF, spreadsheets | .docx, .pptx, .pdf, .xlsx |
| `m3j-skillsmith` | Skill creation + management | Authoring, evals, optimizing triggers |
| `m3j-devops` | Infra, git hooks, CI, wizards | Pre-commit, CI, setup scripts |
| `m3j-triage` | Issue triage, code review | Classifying, verifying, agent briefs |
| `m3j-sentinel` | Build errors, quality audits | Pre-merge review, quality gates |
| `ultra-minimal` | Minimal responses, no tools | Simple queries, max concision |

👉 Full visual showcase: [`site/agents.html`](site/agents.html)
📋 Dispatch rules: [`AGENTS.md`](AGENTS.md)

---

## Commands

### `/finish` — 7-step quality gate

Defined in `.opencode/commands/finish.md`, delegated to `m3j-sentinel`. Runs before every merge:

| Step | Check |
|---|---|
| 1 — Sanity | File integrity, no debug artifacts, no large files |
| 2 — Security | Secrets scan, injection patterns, exposed credentials |
| 3 — Style | Naming conventions, banned fonts, trailing whitespace |
| 4 — Quality | Design system compliance, responsive breakpoints |
| 5 — Diff | Scope creep check, unrelated changes, intent alignment |
| 6 — Verify | Uncommitted changes, remote status, test suite |
| 7 — Ship | Merge / PR / cleanup recommendation with exact command |

---

## Skills (81, +13 archived)

All skills live under `.agents/skills/` — loaded per-project via `opencode.json`, isolated from global state. Retired skills move to `.agents/archive/skills/` (git history preserved).

**Design & frontend:** algorithmic-art, brand-guidelines, brandkit, canvas-design, design-taste-frontend, gpt-taste, high-end-visual-design, impeccable, industrial-brutalist-ui, minimalist-ui, redesign-existing-projects, web-quality-audit

**Development & architecture:** codebase-design, design-an-interface, domain-modeling, improve-codebase-architecture, shadcn, vercel-composition-patterns, vercel-react-best-practices, vercel-react-native-skills, vercel-react-view-transitions

**Testing & QA:** test-driven-development, webapp-testing, diagnosing-bugs, systematic-debugging, security-review, code-review, receiving-code-review, requesting-code-review

**Writing & docs:** doc-coauthoring, edit-article, internal-comms, writing-beats, writing-fragments, writing-great-skills, writing-guidelines, writing-plans, writing-shape, writing-skills

**AI & APIs:** claude-api, mcp-builder, research, find-skills

**Project management:** brainstorming, implement, request-refactor-plan, to-issues, to-prd, triage, wayfinder, wizard, qa

**Execution & delivery:** dispatching-parallel-agents, executing-plans, finishing-a-development-branch, handoff, m3j-workflow, resolving-merge-conflicts, subagent-driven-development, verification-before-completion, using-git-worktrees

**Documents & media:** docx, pdf, pptx, xlsx, slack-gif-creator

**Infrastructure:** deploy-to-vercel, vercel-cli-with-tokens, vercel-optimize, setup-pre-commit, git-guardrails-claude-code, skill-creator

**Other:** grilling, grill-me, loop-me, obsidian-vault, scaffold-exercises, setup-matt-pocock-skills, teach, theme-factory, ubiquitous-language

---

## Structure

```
m3j-workspace/
├── .agents/
│   ├── skills/            # 81 active skills (+13 archived)
│   └── archive/skills/    # retired skills (git history preserved)
├── .opencode/
│   ├── agents/            # 16 custom agent definitions
│   └── commands/          # built-in /finish command
├── .github/               # CI workflows + PR template
├── .rtk/                  # RTK output filters (filters.toml)
├── docs/                  # agent-facing docs (layout, skills index, workflow)
├── scripts/
│   └── validate.sh        # local CI mirror + nav-sync check
├── site/                  # static reference guide (HTML/CSS/JS)
│   ├── index.html         # homepage
│   ├── setup.html         # optimization recipes
│   ├── termux.html        # Android setup guide
│   ├── reference.html     # annotated config + paths
│   ├── agents.html        # agent fleet showcase
│   ├── workflow.html      # AI coding workflow
│   ├── trading.html       # trading hub
│   ├── style.css          # design system
│   └── script.js          # theme toggle, scroll reveal
├── opencode.json          # project-level config
├── AGENTS.md              # agent hierarchy and dispatch rules
├── SPEC.md · ROADMAP.md · TASKS.md   # m3j-workflow working files (root)
└── LICENSE                # MIT
```

---

<p align="center">
  <a href="https://github.com/amrmrkjr/m3j-workspace">GitHub</a>
  &middot;
  <a href="site/index.html">Reference Guide</a>
  &middot;
  <a href="site/agents.html">Agent Showcase</a>
  &middot;
  <a href="https://github.com/amrmrkjr/m3j-workspace/issues">Issues</a>
</p>
