# AGENTS.md — instructions for AI agents in this repo

This file governs how AI agents behave when working in the `opencode_setup` repo. Follow these directives strictly.

## Repo identity

This is my OpenCode workspace. It contains:
- **`.agents/skills/`** — ~100 specialized skills (branding, frontend, docs, testing, etc.)
- **`.opencode/agents/`** — custom agent definitions
- **`opencode.json`** — project-level config
- **`site/`** — static reference guide (HTML/CSS/JS, no build)

## Core directives

**Be concise.** Say what needs to be said, nothing more. No intros, no summaries, no pleasantries unless the user engages first.

**Use skills.** Before any significant task, check if a matching skill exists and load it. Skills exist for design, debugging, planning, testing, deployment, writing, research, and more.

**Use parallel agents.** For independent work (editing separate files, investigating separate problems), dispatch sub-agents in parallel. Do not do sequentially what can be done concurrently.

**Use the right tool for the job.**
- Read/Write/Edit for file operations — not bash with cat/echo/sed
- Grep for content search — not bash with grep
- Glob for file search — not bash with find/ls
- Task/subagent for complex multi-step work — not one monolithic chain

**Verify before claiming done.** Run the relevant commands, check the output, confirm it works. Evidence before assertions.

**No unnecessary files.** Don't create READMEs, docs, or notes unless explicitly asked. Don't add emojis unless the user does first.

## Quality standards

- Every edit must preserve the codebase's existing style and conventions
- Don't leave placeholders, TODOs, or commented-out code
- Don't speculate — if you don't know, say so
- If something is wrong (bug, antipattern, security issue), flag it even if it wasn't the ask

## My recommendations (from experience)

These patterns produce the best results in this repo:

1. **Load the skill before acting** — reading a skill's SKILL.md first consistently produces better output than working from memory. The skill descriptions in the system prompt are summaries; the actual file has the detail.

2. **Ask clarifying questions early** — a 30-second question upfront saves 10 minutes of wrong direction. Don't guess the user's intent.

3. **Dispatch parallel agents aggressively** — if you can identify 2+ independent sub-tasks, dispatch them simultaneously. The overhead is near zero and the speedup is linear.

4. **Prefer the bento/double-bezel visual system** for any new UI in site/ — the CSS already supports it, and it's the established design language.

5. **Keep site/ pages in sync** — all pages share nav order (home → setup → reference) and the same nav partial structure. When adding or removing a page, update every HTML file's nav and the homepage card grid.

6. **Use per-project skills path** — `.agents/skills/` not `~/.agents/skills/`. This keeps configs isolated and manageable.
