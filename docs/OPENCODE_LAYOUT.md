# OpenCode Workspace Layout

Purpose: a map of this repo for agents — where to look for what, and the conventions that keep the agent fleet, skills, workflow docs, and static site in sync. Read this before hunting for anything.

## Tree (top 2–3 levels)

```
opencode_setup/
├── opencode.json                # primary config: model, skills path, instructions
├── AGENTS.md                    # primary-agent contract + dispatch table (read first)
├── README.md                    # human-facing overview + badge roster
├── SPEC.md · ROADMAP.md · TASKS.md   # Titus-workflow working files (root)
├── docs/                        # agent-facing docs
│   ├── OPENCODE_LAYOUT.md       #   this file
│   ├── SKILLS.md                #   index of .agents/skills/ (~94 skills, grouped)
│   └── WORKFLOW.md              #   10-step pipeline, agent-per-step map
├── .agents/
│   └── skills/                  # ~94 skills, one dir per skill (SKILL.md each)
├── .opencode/
│   ├── agents/                  # 16 m3j-* agents + ultra-minimal
│   ├── commands/finish.md       # /finish — 7-step quality gate (@m3j-sentinel)
│   └── package.json             # pins @opencode-ai/plugin (finish deps)
├── .github/
│   ├── workflows/validate.yml   # CI: file-presence only, code-free
│   ├── dependabot.yml
│   └── pull_request_template.md
├── .rtk/
│   └── filters.toml             # command-output filters for this repo
├── scripts/
│   └── validate.sh              # local mirror of CI + nav-sync check
└── site/                        # static reference guide — no build step
    ├── index.html · setup.html · termux.html · reference.html
    ├── agents.html · workflow.html · trading.html      (7 pages, shared nav)
    ├── style.css · script.js · README.md
```

## Key files & conventions

| File | What it is | Conventions |
|---|---|---|
| `opencode.json` | Primary OpenCode config | Model `opencode/big-pickle`; plan agent `opencode/nemotron-3-ultra-free`; compaction `opencode/deepseek-v4-flash-free`; skills path `.agents/skills`; instructions `AGENTS.md`. Edit only through `customize-opencode` skill. |
| `AGENTS.md` | Primary-agent contract | Dispatch table for all m3j-* agents; "be concise, delegate, verify before claiming done". Read before any delegation. |
| `.opencode/agents/*.md` | Agent fleet | 16 `m3j-*` specialists + `ultra-minimal`. One Markdown per agent: frontmatter (description, model, tools, mode) + body prompt. Models are free-tier pinned — don't override. |
| `.opencode/commands/finish.md` | `/finish` command | 7-step quality gate (sanity → security → style → quality → diff → verify → ship), dispatched to `m3j-sentinel`. Never weaken a gate. |
| `.agents/skills/` | Skill library | ~94 per-project skills, one dir per skill with `SKILL.md`. Path is per-project (`.agents/skills/`), not `~/.agents/`. Indexed in `docs/SKILLS.md`. |
| `docs/` | Agent-facing docs | Layout (this), skills index, workflow. Keep terse, table-heavy — agents read them. |
| `site/` | Static reference guide | 7 HTML pages sharing one nav partial (home → setup → termux → reference → agents → workflow → trading). Design language: bento grid, double-bezel cards. Adding/removing a page = update every nav + homepage card grid. |
| `.github/workflows/validate.yml` | CI | Existence checks only (agent files, site pages, config, titus skill + templates). No builds, no tests. Keep it code-only. |
| `.rtk/filters.toml` | RTK output filters | `schema_version = 1`; `[filters.X]` blocks with `match_command`, `strip_ansi`, `max_lines`, `on_empty`. |
| `scripts/validate.sh` | Local gate | Mirrors CI plus nav-sync check. Run before claiming done (`bash -e scripts/validate.sh`). |

## Where to look for what

- **"Which agent does this?"** → `AGENTS.md` dispatch table (design → m3j-designer, bugs → m3j-debugger, docs → m3j-writer, etc.).
- **"How is work planned/executed here?"** → `docs/WORKFLOW.md`, then `SPEC.md` / `ROADMAP.md` / `TASKS.md` at root.
- **"Is there a skill for X?"** → `docs/SKILLS.md` group index, then `.agents/skills/<name>/SKILL.md`.
- **"What does the site look like?"** → `site/` — read one HTML page; all share the nav block and `style.css` design system.
- **"Why did CI fail?"** → `.github/workflows/validate.yml` + local `scripts/validate.sh` (same checks, runnable offline).
