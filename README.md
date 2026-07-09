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

A lean, no-build reference guide covering database maintenance, config compaction, per-project agents/skills, and token optimization.

[Open the guide](site/index.html) directly in a browser.

## Skills

Skills are organized under `.agents/skills/` and loaded per-project via `opencode.json`. This keeps session context lean (~8K tokens vs ~19K with global loading).
