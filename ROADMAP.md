# ROADMAP: opencode_setup — Titus port + dogfood

Real milestones in priority order. No dates — status only. Each milestone is one reviewable phase (per the workflow: one PR per phase).

## Phase 1 — Port complete (current ✅)
**Deliverables:**
- [x] `m3j-workflow` skill ported into `.agents/skills/m3j-workflow/` (SKILL.md + templates/SPEC.md, ROADMAP.md, TASKS.md)
- [x] Agent fleet: 16 `m3j-*` + `ultra-minimal` under `.opencode/agents/`
- [x] `/finish` 7-step quality gate command at `.opencode/commands/finish.md`
- [x] Static site: 7 pages with shared nav (home → setup → termux → reference → agents → workflow → trading)
- [x] CI (`.github/workflows/validate.yml`) + dependabot; repo layout mirrored (docs/, .rtk/, scripts/, PR template)
- [x] Workflow docs (`docs/OPENCODE_LAYOUT.md`, `docs/SKILLS.md`, `docs/WORKFLOW.md`) + root `SPEC.md` / `ROADMAP.md` / `TASKS.md`
**Exit Criteria:**
- [x] `bash -e scripts/validate.sh` exits 0 with PASS summary
- [x] `.rtk/filters.toml` present, schema-valid, no placeholders

## Phase 2 — Dogfood: run the full pipeline end-to-end (next ⏳)
**Deliverables:**
- [ ] Pick a modest real feature in this repo; run the full 10-step workflow (SPEC → ROADMAP → TASKS → test scaffold → one phase → /finish → one PR → fresh-context review → fix loop → human merge)
- [ ] Fix whatever the run reveals (gaps in docs, skills, gates)
**Dependencies:** Phase 1
**Exit Criteria:**
- [ ] The feature ships as one small PR, all gates green, fresh-context review returns a verdict
- [ ] Any doc/process fixups from the run are merged

## Phase 3 — Optional: Vercel deploy of site/ (blocked 🔒)
**Deliverables:**
- [ ] Deploy `site/` to Vercel, wire the domain, connect previews to PRs
**Dependencies:** user provides a Vercel access token (deploy-to-vercel skill)
**Exit Criteria:**
- [ ] `site/` reachable at a public URL; preview deploys appear on PRs
**Status:** BLOCKED — no token in this environment; skip until the user supplies one.

## Phase 4 — Future: paid models (later ⬜)
**Deliverables:**
- [ ] Swap model pins in `opencode.json` only (agent files stay free-tier-pinned)
- [ ] Re-evaluate workflow token-economy rules against paid limits
**Dependencies:** user decision + budget
**Exit Criteria:**
- [ ] Models switched; `/finish` and tests still green on the new stack
**Status:** deliberately deferred — nothing blocks it but a human decision.