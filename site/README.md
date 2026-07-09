# opencode setup

A lean reference guide for running OpenCode — configuration tuning, database maintenance, token optimization, and agent/skills management. Built from real sessions, not theory.

## Quick start

Open `index.html` in any browser. No server, no install.

```
open site/index.html
```

## What you'll find

| Page | What it covers |
|---|---|
| **Setup** | SQLite vacuum + WAL checkpointing, config flags for token reduction, per-project agents/skills isolation, session overhead from ~19K→~8K tokens |
| **Reference** | Annotated global config with explanations, all key file paths, `.gitignore` patterns for OpenCode artifacts |

## Why this exists

OpenCode's defaults are generous — global skills, verbose tool output, full LSP, unchecked DB growth. After a few weeks of regular use, the session context can hit 19K+ tokens before you type a word, and the SQLite db can bloat past 100MB.

This guide documents the knobs worth turning.

## Key optimizations

- **Vacuum the DB** — `sqlite3 ~/.local/share/opencode/opencode.db "VACUUM;"` reclaims space from deleted session data
- **Disable LSP + formatter** — saves ~3-4K tokens per session if you don't use them
- **Per-project skills** — move from `~/.agents/skills/` to `.agents/skills/` and reference via `opencode.json`
- **Budget model** — set `model.small` for cheap mechanical tasks instead of defaulting to Sonnet

## Structure

```
site/
├── index.html       # homepage with bento grid
├── setup.html       # optimization recipes
├── reference.html   # annotated config + paths
├── style.css        # Ethereal Glass theme
└── script.js        # theme toggle, scroll reveal
```

No build step. No dependencies. Plain HTML/CSS/JS.
