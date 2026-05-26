---
name: audit
description: Audit a codebase for dead code, stale docs, and (opt-in) drifted memory. Read-only — reports issues, never modifies code. Useful before a refactor or release.
argument-hint: [--memory <path>] [--out <path>] [--deep]
---

# /audit — codebase health report

Audit the project at the current working directory. **Read-only.** Reports issues; the operator decides what to fix.

## Flags

- `--memory <path>` — opt-in scan of a memory directory for entries referencing removed code/files. Default: skipped. Use when you have Claude's persistent memory enabled and want drift-check on top of dead-code analysis.
- `--out <path>` — write the report to a file instead of stdout. Default: stdout.
- `--deep` — request deeper semantic analysis (logic errors, architectural drift). Default: surface-level scan. Use when the codebase has gone through several refactors and you suspect non-obvious dead paths.

## Behavior

1. **Dead code scan** — find unused imports, unreferenced functions, orphan files (files imported by nothing). Heuristic only; language-agnostic.

2. **Docs drift check** — if `CLAUDE.md` (or `README.md`) exists at project root, compare its claims about the codebase to the actual code state. Flag specifics: features mentioned but not present, files referenced but missing, modules described but renamed. Skip silently if no docs found.

3. **Test surface check** — list test files (`tests/`, `test_*.py`, `*.test.ts`, `*_test.go`, etc.) that reference removed code paths or fixtures.

4. **Memory drift** (only if `--memory <path>` provided) — scan that directory for entries referencing removed code, deleted files, or renamed modules. Useful for catching stale memory in Claude Code's auto-memory system.

5. **Emit report** — markdown to stdout by default; to `--out <path>` if specified. Sections in this order: Dead code / Docs drift / Test surface / Memory drift (if applicable) / Notes.

## Constraints

- **Never deletes anything.** Read-only. The report names paths; the operator decides next steps.
- **Never commits.** Even if findings are obviously correct, the audit only reports.
- **Skip sections that don't apply** (no `CLAUDE.md` → skip docs drift; no `--memory` flag → skip memory drift). Don't emit empty sections.
- **No project-type assumptions.** Works for Python, JS/TS, Go, Rust, Ruby, mixed monorepos. Heuristics, not type-specific rules.

## References

- This skill is read-only by design. For fixing dead code, use language-specific tools (e.g. `ruff --fix`, `eslint --fix`) on the paths reported here.
