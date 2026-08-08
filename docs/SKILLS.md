# Skills Index — `.agents/skills/`

Per-project skill library (81 active skills, one directory per skill, each with a `SKILL.md`). Path is `.agents/skills/`, not `~/.agents/skills/`; retired skills live under `.agents/archive/skills/`. This index is complete so you can find the right skill fast; then read the skill's `description` frontmatter for exact triggers.

★ = used by the m3j workflow (the primary development process, see `docs/WORKFLOW.md`).

## Core workflow & gates ★
- `executing-plans` — execute written implementation plans with review checkpoints
- `subagent-driven-development` — run plan tasks as parallel subagents
- `dispatching-parallel-agents` — independent tasks → simultaneous dispatch
- `using-git-worktrees` — isolated workspace before feature work
- `verification-before-completion` — evidence before any "done" claim
- `finishing-a-development-branch` — merge / PR / cleanup decision
- `requesting-code-review` / `receiving-code-review` — ask for; verify feedback is sound before implementing
- `code-review` — standards + spec review in parallel
- `handoff` — compact conversation handoffs
- `m3j-workflow` — the 10-step pipeline itself (SPEC → ROADMAP → TASKS → one PR per phase)

## Engineering & planning
- `brainstorming` — exploration before building (creative work)
- `grilling` / `grill-me` — stress-test a plan or design
- `writing-plans` — turn a spec into bite-size steps
- `implement` — build from a PRD / issue set
- `wayfinder` — map huge work into investigation tickets
- `to-prd` / `to-issues` / `triage` — conversation → PRD, PRD → issues, issue state machine
- `qa` — conversational bug intake → GitHub issues
- `codebase-design` / `domain-modeling` / `ubiquitous-language` — deep modules, domain vocab, glossaries
- `improve-codebase-architecture` — deepening-opportunity report, pick one to grill
- `design-an-interface` — multiple module-interface designs in parallel
- `request-refactor-plan` — refactor into tiny commits via interview
- `loop-me` / `grill-me` — sharpen workflow specs before building

## Testing & QA
- `test-driven-development` — red-green-refactor (workflow step 4)
- `webapp-testing` — Playwright harness: verify UI, screenshots, logs
- `scaffold-exercises` — exercise dirs with lint-passing structure
- `setup-pre-commit` — Husky pre-commit + lint-staged
- `systematic-debugging` / `diagnosing-bugs` — root-cause loops before fixing

## Frontend & design
- `design-taste-frontend` — anti-slop visual direction for new UI
- `high-end-visual-design` / `impeccable` — premium polish, audits, redesigns
- `minimalist-ui` / `industrial-brutalist-ui` / `gpt-taste` — design systems
- `redesign-existing-projects` — upgrade existing sites without breaking them
- `shadcn` — component registry / preset management
- `theme-factory` — design tokens for any artifact
- `web-quality-audit` — Lighthouse audits
- `algorithmic-art` / `canvas-design` — generative art and static pieces
- `brand-guidelines` / `brandkit` — brand color/typography and identity systems

## Vercel
- `deploy-to-vercel` / `vercel-cli-with-tokens` — deploy sites, token-based CLI
- `vercel-optimize` — cost/perf optimization grounded in metrics
- `vercel-react-best-practices` / `vercel-composition-patterns` / `vercel-react-native-skills` / `vercel-react-view-transitions` — React/Next/RN performance patterns

## Writing & docs
- `doc-coauthoring` / `edit-article` — structured docs, article revision
- `writing-fragments` / `writing-shape` / `writing-beats` — explore → shape → beat structure
- `writing-guidelines` / `writing-great-skills` — prose + skill quality standards
- `writing-skills` / `skill-creator` — create, edit, eval skills
- `internal-comms` — status reports, newsletters, FAQs, incident reports
- `docx` / `pptx` / `pdf` / `xlsx` — Word/decks/PDF/spreadsheet manipulation

## Ops, devops & security
- `security-review` — codebase vulnerability scan and reasoning
- `mcp-builder` — build MCP servers (FastMCP or JS SDK)
- `wizard` — interactive bash wizard for manual third-party setups
- `git-guardrails-claude-code` — hooks that block destructive git commands
- `setup-matt-pocock-skills` — configure repo for the engineering skills
- `deploy-to-vercel` (see Vercel)

## Research & learning
- `research` — investigate high-trust sources, capture to Markdown
- `find-skills` — discover and install new skills
- `teach` — teach a concept within this workspace
- `obsidian-vault` — vault search / create / organize
- `claude-api` — Claude API reference (only when Claude/Anthropic is actually involved)

## Assets & misc
- `brandkit` / `brand-guidelines` / `theme-factory` — brand/theme assets
- `slack-gif-creator` — Slack-sized animated GIFs
- `internal-comms` — company comm formats
- `xlsx` / `docx` / `pptx` / `pdf` — file-format workhorses (see Writing)

## How to use

1. Find a likely group here (retired skills live under `.agents/archive/skills/`).
2. Open `.agents/skills/<name>/SKILL.md` for the skill's own instructions.
3. Skills marked ★ are wired into `docs/WORKFLOW.md` — the m3j pipeline dispatches them per step; the rest load on demand.