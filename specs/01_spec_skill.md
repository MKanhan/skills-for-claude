# Spec 01 — `/spec` skill extraction

## Goal
Ship a portable `/spec` skill that scaffolds `specs/NN_slug.md` in any project, with a bundled template — no dependency on the operator's workspace layout.

## Problem
The source command at `~/.claude/commands/spec.md` (39 lines) hardcodes operator-specific paths:
- Requires CWD under `~/Documents/projects/<project>/` — aborts otherwise.
- Reads the template from `~/Documents/Infra/spec-template.md` (absolute path).
- Cites `agent-lgpd` as the validated pattern.

External users cannot run the skill without those paths. The skill also conflates two concerns (project detection + template loading) in a way that breaks portability simultaneously on both axes.

## Decision

**Project root detection** — replace the `~/Documents/projects/` check with a marker scan walking up from CWD until one of:
- `.git/` directory
- existing `specs/` directory
- `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, or `Gemfile`

If no marker is found, fall back to CWD with an explicit warning. Abort outright if invoked from `$HOME` directly (defends against accidental personal-folder pollution).

**Template** — bundle at `skills/spec/templates/spec-template.md`. Derived from `~/Documents/Infra/docs/spec-template.md` with all operator-specific references scrubbed (no `agent-lgpd`, no `~/Documents/` paths in the template body). The "Convenções de uso" section is preserved (it's the user-facing reference) but rewritten generically.

**Language** — `SKILL.md` and bundled template in EN (lingua franca for the global Claude Code ecosystem; aligns with prose-loop and archlint precedent). `README.md` bilingual (PT-BR + EN) for install + usage.

## In scope

- `skills/spec/SKILL.md` (~50 lines) — frontmatter (description, argument-hint) + behavior steps (detect root, compute next NN, validate slug, write file from bundled template, report path).
- `skills/spec/templates/spec-template.md` (~50 lines) — scrubbed template, Goal/Problem/Decision/In scope/Out of scope/AC/Test additions.
- `skills/spec/README.md` (~80 lines) — PT-BR + EN. Install via `~/.claude/skills/` symlink, usage example, FAQ on project-root detection.
- `tests/spec/smoke.sh` — bash. Asserts: (a) SKILL.md exists with valid YAML frontmatter; (b) `templates/spec-template.md` present; (c) `grep -r "Documents/" skills/spec/` returns empty; (d) `grep -r "agent-lgpd" skills/spec/` returns empty.

## Out of scope

- Spec validation / linting (e.g., enforcing AC presence).
- Automatic sprint tagging or git integration.
- Schema-driven specs (JSON / YAML frontmatter).
- Custom templates beyond the bundled one (user can fork to customize).
- Conversion of existing operator specs (the workspace keeps using its own `~/Documents/Infra/docs/spec-template.md`; this skill is for external users).

## Acceptance criteria

- `/spec my_feature` invoked from a fresh `~/projects/foo/` directory (with `.git/`) creates `~/projects/foo/specs/00_my_feature.md`.
- `/spec my_feature` invoked from `~/projects/foo/` (with existing `specs/01_bar.md`) creates `~/projects/foo/specs/02_my_feature.md` (next NN).
- `/spec my_feature` invoked from `$HOME` aborts with a clear message.
- `tests/spec/smoke.sh` exits 0; CI invokes it on every push.
- `grep -rE "(Documents/|agent-lgpd|signals\.db|Notion)" skills/spec/` returns empty.

## Test additions

- `tests/spec/smoke.sh` — frontmatter validity (uses `awk` or `grep` on first 5 lines), template-present check, no-private-refs check.
