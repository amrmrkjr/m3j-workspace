# m3j-workspace · reference site

A five-page static reference guide for a production OpenCode workspace — 81 active skills (+13
archived), 16 agents, one `/finish` quality gate. Built from the actual repo files, not theory.

## Quick start

Open `index.html` in any browser. No server, no build, no install.

```
open site/index.html
```

## Pages

| Page | What it covers |
|---|---|
| **index.html** | Landing — hero, workspace stats, nav grid to the 4 modules, dispatch principles |
| **setup.html** | SQLite vacuum + WAL checkpointing, config compaction, per-project agents/skills isolation, the `/finish` gate |
| **reference.html** | Annotated `opencode.json`, global config diff, every key path, the real `.gitignore`, repo map |
| **agents.html** | Dispatch table + lane-by-lane roster: every agent's role, model assignment, and covered skills |
| **workflow.html** | The 10-step pipeline: SPEC → ROADMAP → TASKS, test-first scaffolding, one reviewable PR per phase |

## Structure

```
site/
├── index.html       # landing — hero, stats, module grid
├── setup.html       # maintenance & configuration recipes
├── reference.html   # config, paths, .gitignore, repo map
├── agents.html      # the 16-agent fleet roster
├── workflow.html    # end-to-end AI coding pipeline
├── style.css        # "amber signal / carbon" design system
├── script.js        # theme toggle + scroll reveal (zero deps)
└── README.md
```

Every page shares the same `<nav>` (5 links: home → setup → reference → agents → workflow) and the
same head/favicon/theme-toggle snippet. `scripts/validate.sh` enforces nav sync and the homepage card
grid equals the nav's page count.

## Constraints

- No build step, no external JS/CSS, no CDN fonts — system font stack only, offline-safe.
- Dark theme is default; light persists via `localStorage["theme"]`.