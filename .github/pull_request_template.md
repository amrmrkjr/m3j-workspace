## Summary

<!-- What this change does and why. One short paragraph; reference the issue if there is one. -->

## Test commands

<!-- Everything you ran to verify, as exact commands with their output below. -->

```console
$ <command>
<output>
```

## Evidence

Paste actual output proving the change works — test results, build/validate logs, or a manual check transcript.

## Screenshots

<!-- For UI/design changes: before/after screenshots. Delete this section otherwise. -->

## Checklist

- [ ] Docs updated to match the change (docs/ or site/ when behavior or files changed)
- [ ] CI green — `bash -e scripts/validate.sh` passes locally
- [ ] Single-purpose: the diff contains only what the summary describes
- [ ] No secrets, credentials, or large binaries in the diff
- [ ] `.rtk/filters.toml` updated if new noisy commands were introduced