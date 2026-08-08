<!--
  TASKS — the executable slice of the roadmap. One block per task.
  Vertical slices: each task delivers working value on its own.
  Acceptance = exact command + exact expected output.
  TDD: tick the test-first boxes in order, never skip.
-->

# TASKS: <project name>

## Task T1: <title>
- **Phase:** <Phase N>
- **Files touched:** `src/path/file`, `tests/path/test`
- **Acceptance:**
  - Command: `pytest tests/path/test.py -v`
  - Expected: `1 passed`
- **TDD steps:**
  - [ ] Write failing test (red)
  - [ ] Run: fails for the right reason
  - [ ] Implement minimal code (green)
  - [ ] Run: passes
  - [ ] Refactor + re-run
  - [ ] Commit

## Task T2: <title>
- **Phase:** <Phase N>
- **Files touched:** <paths>
- **Acceptance:**
  - Command: <exact command>
  - Expected: <exact expected output>
- **TDD steps:**
  - [ ] Write failing test (red)
  - [ ] Run: fails for the right reason
  - [ ] Implement minimal code (green)
  - [ ] Run: passes
  - [ ] Refactor + re-run
  - [ ] Commit
