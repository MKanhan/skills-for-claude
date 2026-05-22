# Spec 00 — Bootstrap

## Goal
Project skeleton ready for skill extraction work — directory structure, scaffolds, license, and conventions in place. No skill code yet.

## Problem
Operator approved Phase 1 of the skills project (3 OSS skills + GitHub launch + 30-day measurement gate). Need a workspace that follows the same `CLAUDE.md + ROADMAP.md + <name>_log.md + specs/` convention used by macro-systems, plus the open-source conventions needed for a public GitHub repo (README, LICENSE, .gitignore). Without bootstrap, every subsequent sprint stalls on "where does this file go?".

## Decision
- Adopt the workspace **tripla canonical** (CLAUDE.md + ROADMAP.md + `<name>_log.md` + `specs/`) for project-level state. Pattern source: `~/Documents/CLAUDE.md`.
- Add OSS-facing files alongside (`README.md` public draft, `LICENSE` MIT, `.gitignore` minimal).
- Skill code does **not** live at repo root; it lives in `skills/<skill-name>/` (subdir). Allows future README at root to describe the catalog without being entangled with any single skill.
- License = MIT. Matches operator's two existing OSS projects (prose-loop v1.2, archlint v0.1).
- Git: local repo only at bootstrap. Push to GitHub deferred to Sprint 04 (avoids public exposure of pre-polish state).

## In scope
- `projects/dev/skills/` directory tree (already created by mkdir).
- `CLAUDE.md` — operational description, references workspace convention.
- `ROADMAP.md` — phases, sprints, gates, candidate skills.
- `skills_log.md` — initial entry documenting project trigger and decisions.
- `specs/00_bootstrap.md` — this file.
- `README.md` — public-facing draft. Marked "work in progress"; cleaned in Sprint 04.
- `LICENSE` — MIT, year 2026, author Marcelo Kanhan.
- `.gitignore` — `.DS_Store`, `venv/`, `__pycache__/`, `.env*`, `node_modules/` (defensive, even though no code expected).
- `git init` + initial commit `chore: bootstrap skills project`.

## Out of scope
- Picking the 3 skills (Sprint 01-03 decision).
- Pulling skill source files from `~/.claude/`.
- GitHub repo creation / push.
- Tests directory (created in Sprint 01 when first skill arrives).
- `skills/<skill-name>/` subdirs (created in their respective sprints).
- Premium tier scaffolding (Phase 2, deferred).

## Acceptance criteria
- `projects/dev/skills/` contains all 7 files listed in "In scope".
- `git log` shows exactly one commit, message starts with `chore: bootstrap`.
- `git status` clean (no untracked files outside .gitignore).
- `CLAUDE.md` Handoff section lists operator-pending decisions.
- `ROADMAP.md` has at least 3 candidate skills documented with portability + value notes.
- No references to `~/Documents/` absolute paths in `README.md` (it's public-facing) — paths only in internal docs (CLAUDE.md OK, log OK, specs OK).

## Test additions
None for bootstrap (no code). Smoke tests appear in Sprint 01 when first skill lands.
