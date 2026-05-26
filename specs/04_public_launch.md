# Spec 04 — Public launch

## Goal
Push the 3 polished skills + bilingual README to `github.com/MKanhan/skills-for-claude` (already created), tag `v0.1.0`, and draft 2 announcement posts (Substack EN + kanhan.com.br PT-BR) plus LinkedIn cross-posts. Operator publishes manually.

## Problem
The remote repo exists but is empty. Skills from sprints 01–03 are local-only. To enter the 30-day measurement window (Sprint 05), the launch needs:
- Public README that signals scope, install, contributing rules.
- Working CI so external contributors can smoke-test PRs.
- Two announcement posts that drive traffic to the repo from the operator's two existing channels (Substack EN, kanhan.com.br PT-BR) plus LinkedIn amplification.
- Version tag for repeatable references.

Without all four, the measurement gate at Day 30 measures nothing meaningful.

## Decision

**Public title** — README `<h1>` reads `Skills for Claude / Skills para Claude` (operator-confirmed 2026-05-26). "Atelier Skills" remains internal only.

**Push strategy** — single commit `feat: initial 3 skills (spec, personas, audit)` against `main`. Branch protection deferred (zero external contributors at launch). Tag `v0.1.0` after CI passes locally.

**CI** — minimal GitHub Actions workflow `.github/workflows/ci.yml`: runs each `tests/*/smoke.sh` on push and PR. Ubuntu-only, bash-only, no matrix. Failures block merge once branch protection is enabled (post-launch).

**Announcement drafts** — two long-form + two short-form, all in `outputs/posts/`:
- `outputs/posts/en/skills-for-claude-launch.md` — Substack draft, ~1200 words. Themes: the PT-BR moat in Claude Code skills, opinionated curation as differentiator, "skills > one-off prompts" thesis.
- `outputs/posts/pt-br/skills-para-claude-lancamento.md` — kanhan.com.br draft, ~800 words. Themes: por que skills > prompts soltos, casos práticos com `/spec`, `/personas`, `/audit`.
- `outputs/posts/linkedin/en.md` — ~300 words, links to Substack + repo.
- `outputs/posts/linkedin/pt-br.md` — ~300 words, links to kanhan.com.br + repo.

**Publishing boundary** — auto mode writes drafts and stops. Operator publishes via `/push-substack` (EN), manual paste (kanhan.com.br), and manual paste (LinkedIn). Auto mode does **not** call `/push-substack`, does not push to kanhan.com.br, does not post anywhere external.

**Release tag** — `v0.1.0` created locally. Push to remote (`git push --tags`) requires explicit operator confirmation since it's a one-way visible action.

## In scope

- `README.md` — polish. Remove "WIP" banner. Fill skills table with 3 entries (description + status). Add install instructions (`git clone` + symlink to `~/.claude/skills/`). Add CI badge.
- `CONTRIBUTING.md` (~30 lines) — issues welcome, PRs via fork, smoke tests required to pass, conventional commits not enforced.
- `.github/workflows/ci.yml` — runs `bash tests/spec/smoke.sh && bash tests/personas/smoke.sh && bash tests/audit/smoke.sh` on Ubuntu latest.
- `outputs/posts/en/skills-for-claude-launch.md` — draft.
- `outputs/posts/pt-br/skills-para-claude-lancamento.md` — draft.
- `outputs/posts/linkedin/en.md` — draft.
- `outputs/posts/linkedin/pt-br.md` — draft.
- Local git: commit + `git tag v0.1.0`. **Push and tag-push deferred to operator.**
- `CLAUDE.md` Handoff update: launch sprint state + operator action items.

## Out of scope

- Paid tier landing page (Phase 2, conditional).
- Stripe integration (Phase 2).
- Usage telemetry (privacy concern, deferred).
- Additional skills beyond the 3.
- Marketing automation (no scheduled posts, no email sequences).
- CI matrix (no macOS, no Windows, no multi-bash-version testing in v0.1.0).
- Skill marketplace web UI.
- Stargazer alerts / GitHub webhooks.

## Acceptance criteria

- `README.md` opens with `# Skills for Claude / Skills para Claude`, no "WIP" banner, skills table fully populated with 3 entries.
- `CONTRIBUTING.md` exists and is ≤50 lines.
- `.github/workflows/ci.yml` exists; `act` or a local equivalent confirms the workflow parses.
- All 3 smoke tests pass locally: `bash tests/spec/smoke.sh && bash tests/personas/smoke.sh && bash tests/audit/smoke.sh`.
- `git tag` shows `v0.1.0` locally (tag-push deferred).
- 4 draft posts exist at the specified paths, each in `outputs/posts/`, with the documented word-count targets ±20%.
- `grep -rE "(\.env|api_key|password|token=)" .` returns no credential leaks.
- `CLAUDE.md` Handoff lists exactly the operator-facing manual actions: (a) review 4 drafts, (b) `git push origin main`, (c) `git push --tags`, (d) publish Substack via `/push-substack`, (e) publish kanhan.com.br + LinkedIn manually.

## Test additions

- `.github/workflows/ci.yml` runs existing smoke tests from sprints 01–03 — no new test scripts written in this sprint.
- Optional: a top-level `tests/all.sh` that invokes the 3 smoke tests sequentially (defer if CI workflow is clean enough on its own).
