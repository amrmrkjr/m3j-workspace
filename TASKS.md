# TASKS: m3j-workspace — current state

Granular, grabbable tasks reflecting the current actual state. ✅ = completed and directly verifiable; ⬜ = open.

## Open (grabbable)

### Task A: Rotate the leaked GitHub PAT token 👤
- **Phase:** 1 (housekeeping — human action, not agent-executable)
- **Why:** a GitHub Personal Access Token was leaked/spilled into the repo history/scope; treat it as compromised.
- **Acceptance:** old token revoked in GitHub settings, new token replaces it everywhere it was used, `.gitignore`/`/finish` confirms no token text lands in git.
- **Status:** ⬜ human — agents must not read or reuse the old value.

### Task B: Run the pipeline end-to-end on a real feature (dogfood)
- **Phase:** 2
- **Acceptance:** all 10 workflow steps executed on one modest feature; a single small PR merged with gates green (see `ROADMAP.md` Phase 2).
- **Status:** ⬜ next big push — consumes Phase 1 outputs.

### Task C: Verify `.rtk/filters.toml` against real commands
- **Phase:** 1
- **Acceptance:** run `ls -la`, `git log`, a test/build, `opencode --version` / `opencode run` through the filtered set locally under `rtk`; confirm output is compacted (no ansi garbage, line caps respected) and `on_empty` fires.
- **Status:** ⬜ — filters are hand-adapted from the reference; not yet empirically confirmed on this machine.

### Task D: Sync docs if validators complain of changed paths
- **Phase:** ongoing
- **Acceptance:** if `validate.sh` or CI flag a moved/renamed file referenced in `docs/` or root docs, update the references in the same PR (single-purpose).
- **Status:** ⬜ fire-and-forget.

## Done ✅ (directly verifiable)

- [x] **Build: m3j-workflow skill** — `.agents/skills/m3j-workflow/SKILL.md` + `templates/` (SPEC/ROADMAP/TASKS) | verified: files exist, CI checks them.
- [x] **Agent fleet** — 16 `m3j-*` + `ultra-minimal` under `.opencode/agents/` | verified: `ls .opencode/agents/`.
- [x] **/finish quality gate** — `.opencode/commands/finish.md` | verified: frontmatter (agent=m3j-sentinel, subtask) + 7 steps.
- [x] **Site 5 pages, shared nav** — `site/*.html` (index, setup, reference, agents, workflow) | verified: nav-sync check in `scripts/validate.sh` passes.
- [x] **CI + dependabot** — `.github/workflows/validate.yml`, `dependabot.yml` | verified: git tracks them.
- [x] **Root docs** — `SPEC.md`, `ROADMAP.md`, `TASKS.md` | verified: all exist; `bash -e scripts/validate.sh` exits 0.
- [x] **docs/** — `OPENCODE_LAYOUT.md`, `SKILLS.md`, `WORKFLOW.md` | verified: exist + validate.sh green.
- [x] **RTK filters** — `.rtk/filters.toml` (schema_version=1, generic + opencode-specific blocks) | verified: present + validate.sh green; runtime behavior pending Task C.
- [x] **PR template** — `.github/pull_request_template.md` | verified: no agent/Codex references, has checklist.