# Spec 03 — `/audit` skill extraction

## Goal
Ship a portable `/audit` skill that reports dead code, stale docs, and (opt-in) drifted memory — no operator-specific paths, no hardcoded output destinations.

## Problem
The source command at `~/.claude/commands/audit.md` (14 lines) has two operator-specific couplings:
- References `~/.claude/projects/.../memory/` as a checked surface. External users mostly do not run auto-memory, and even those who do will have different paths.
- Writes report to `_archive/audits/YYYY-MM-DD-<project>.md` — operator's archive convention. Externals have no `_archive/` directory.

The skill is also under-specified at 14 lines: the contract for "compare CLAUDE.md to actual code state" is vague, and external users will fail at first invocation guessing what `--deep` does.

## Decision

**Memory check** — opt-in via `--memory <path>` flag. Default: skip memory entirely. Documented as "if you use Claude's persistent memory and want drift-check on top of dead-code analysis, point this at your memory directory."

**Output destination** — stdout by default. `--out <path>` writes to file. No hardcoded `_archive/` location, no date-based filename heuristics. External users decide where reports live.

**Flags retained** — `--deep` (opt into deeper semantic analysis using Opus; default uses whatever model the harness picked). No other flags.

**SKILL.md scope** — expand from 14 to ~30 lines. Clearer behavior contract:
1. Scan for unused imports, dead functions, orphan files (language-agnostic heuristics).
2. If `CLAUDE.md` exists at project root: compare claims to code; flag drift.
3. List test files referencing removed code paths.
4. If `--memory <path>`: scan that dir for entries referencing removed code/files.
5. Emit report (stdout or `--out`).

Read-only — never deletes. Operator decides next.

## In scope

- `skills/audit/SKILL.md` (~30 lines) — rewritten with explicit behavior contract, flag list, output destination logic.
- `skills/audit/README.md` (~80 lines) — PT-BR + EN. Install, usage, flag reference, example reports (short snippet, not a full audit).
- `tests/audit/smoke.sh` — bash. Asserts: (a) SKILL.md exists with valid YAML frontmatter; (b) no `~/.claude/projects/` strings; (c) no `_archive/audits/` strings; (d) `--memory` and `--out` flags documented; (e) `--deep` flag documented.

## Out of scope

- Auto-fix mode — strict read-only, no patch generation in v0.1.0.
- Codebase-specific lint rules (Python-only, JS-only) — heuristics only.
- Project-type-specific deep analysis (e.g., React component graph, Rails route audit).
- CI integration / GitHub Action wrapper.
- Multi-project batch mode.

## Acceptance criteria

- `/audit` invoked in a project without `~/.claude/projects/` runs cleanly to stdout.
- `/audit --out report.md` writes to `report.md` and prints nothing to stdout (beyond a one-line "wrote report.md" confirmation).
- `/audit --memory ~/.claude/memory` (when present) includes a memory-drift section in the report. When absent, that section is omitted.
- `/audit --deep` prompts for or auto-routes to Opus for semantic analysis; output is clearly distinguishable from default (e.g., "Deep analysis:" prefix on those findings).
- `tests/audit/smoke.sh` exits 0; CI invokes on every push.
- `grep -rE "(\.claude/projects/|_archive/audits/)" skills/audit/` returns empty.

## Test additions

- `tests/audit/smoke.sh` — frontmatter validity, no-private-refs check, flag-documentation check (greps for `--memory`, `--out`, `--deep` in README and SKILL.md).
