# opencode setup

My OpenCode workspace — skills, agents, and a reference site for configuration tuning and optimization.

## Contents

```
.agents/skills/     # ~100 skills (branding, frontend, docs, testing, etc.)
.opencode/agents/   # custom agent definitions
opencode.json       # project-level OpenCode config
site/               # static reference guide (open site/index.html)
```

## Site

A lean, no-build reference guide covering database maintenance, config compaction, and per-project agents/skills.

[Open the guide](site/index.html) directly in a browser.

## Skills

Skills are organized under `.agents/skills/` and loaded per-project via `opencode.json` to keep things isolated and clean.
