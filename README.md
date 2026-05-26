# Skills for Claude / Skills para Claude

[![CI](https://github.com/MKanhan/skills-for-claude/actions/workflows/ci.yml/badge.svg)](https://github.com/MKanhan/skills-for-claude/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)

A curated catalog of [Claude Code](https://docs.claude.com/en/docs/claude-code) skills with PT-BR + EN documentation. Maintained by [Marcelo Kanhan](https://kanhan.com.br).

> **Opinionated.** These skills come out of one practitioner's daily flow, not from a checklist. The PT-BR documentation isn't a translation layer — it's a positioning choice. If a skill makes a strong editorial call, the README says so.

## Skills

| Skill | Description | Status |
|-------|-------------|--------|
| [`/spec`](./skills/spec/) | Scaffold a thin spec file (`specs/NN_slug.md`) in any project with a bundled template. Enforces spec-driven sprints. | ✅ v0.1.0 |
| [`/personas`](./skills/personas/) | Evaluate an editorial piece through 5 reader personas (Partner, CTO, Specialist Executive, Editor, Theorist). BR boutique professional-services lens. PT-BR output. | ✅ v0.1.0 |
| [`/audit`](./skills/audit/) | Read-only codebase health report: dead code, stale docs, drifted memory. `--memory` / `--out` / `--deep` flags. | ✅ v0.1.0 |

Each skill has its own README with full install + usage docs in EN and PT-BR.

## Install

Skills are plain Markdown — install by symlinking:

```bash
git clone https://github.com/MKanhan/skills-for-claude.git ~/skills-for-claude

# Install all 3 skills
for skill in spec personas audit; do
  ln -s ~/skills-for-claude/skills/$skill ~/.claude/skills/$skill
done
```

Restart Claude Code (or open a new session). Skills are available as slash commands: `/spec`, `/personas`, `/audit`.

To install only the skills you want, symlink them individually.

## Tests

Each skill ships a smoke test that asserts portability (valid YAML frontmatter, no operator-private paths, expected sections). Run all of them:

```bash
bash tests/spec/smoke.sh
bash tests/personas/smoke.sh
bash tests/audit/smoke.sh
```

CI runs these on every push and PR.

## Why PT-BR

The Portuguese-speaking developer + writer audience has near-zero curated Claude Code resources. This repo bets that domain expertise + language localization is a real differentiator. Skills here are documented in both PT-BR and EN; the `/personas` skill goes further and outputs in PT-BR by editorial position.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md). Short version: issues welcome; PRs via fork; smoke tests must pass.

## License

MIT — see [LICENSE](./LICENSE).
