# opencode setup

A lean reference guide for running OpenCode — configuration tuning, database maintenance, agent/skills management, and Android setup. Built from real sessions, not theory.

## Quick start

Open `index.html` in any browser. No server, no install.

```
open site/index.html
```

## What you'll find

| Page | What it covers |
|---|---|
| **Home** | Landing page with bento nav grid, theme toggle, scroll reveal |
| **Setup** | SQLite vacuum + WAL checkpointing, config compaction, per-project agents/skills isolation |
| **Reference** | Annotated global config with explanations, all key file paths, `.gitignore` patterns for OpenCode artifacts |
| **Termux** | OpenCode on Android via Termux — native install, no root |
| **Agents** | Full agent fleet roster with dispatch hierarchy, model assignments, and workflow explanation |
| **Workflow** | Titus AI coding workflow port — SPEC → ROADMAP → TASKS pipeline, test-first scaffolding, quality gates, one PR per phase on free-tier models |

## Structure

```
site/
├── index.html       # homepage with bento grid
├── setup.html       # optimization recipes
├── reference.html   # annotated config + paths
├── termux.html      # Android / Termux guide
├── agents.html      # agent fleet showcase
├── workflow.html    # end-to-end AI coding pipeline (titus-workflow)
├── style.css        # Ethereal Glass theme
└── script.js        # theme toggle, scroll reveal
```

No build step. No dependencies. Plain HTML/CSS/JS.
