# skills — Atelier Skills

## Mission

Curated catalog of portable Claude Code skills, packaged for external use. Phase 1 ships an open-source GitHub repo with 3 polished skills extracted from operator's daily flow (PT-BR + EN). Phase 2 (conditional on demand signals) wraps additional premium skills behind a paid tier.

Editorial positioning: PT-BR as differentiator. The English-language skill ecosystem is competitive; PT-BR is empty. Operator's domain credibility (Substack EN ensaios + kanhan.com.br PT-BR + Bartleby + paper9) anchors the curation.

## Scope

**In scope (Phase 1)**:
- 3 skills extracted from `~/.claude/projects/-Users-kanhan-Documents/` and polished for external use.
- README PT-BR + EN, install instructions, MIT license.
- One distribution channel: public GitHub repo (`github.com/MKanhan/<repo-name>`).
- Two announcement posts: 1 EN essay (Substack) + 1 PT-BR (kanhan.com.br) + LinkedIn cross-post.

**Out of scope (Phase 1)**:
- Paid features, landing page, Stripe.
- Skill marketplace web UI.
- Premium repo.
- All deferred to Phase 2 — gated by Phase 1 measurement (see ROADMAP).

**Phase 2 (conditional)**:
- 2 additional premium skills not in OSS repo.
- Landing page `kanhan.com.br/skills`.
- Paid tier R$ 49/mês or R$ 399 lifetime via Stripe (TBD).
- Triggered by: ≥50 stars in 30 days OR ≥5 external issues/PRs.

## Stack

- Skills are plain text files (`SKILL.md` + optional helper scripts).
- Tests: bash-based smoke checks per skill (verify YAML frontmatter, required fields, no kanhan-specific paths leaked).
- No runtime — skills are consumed by Claude Code via `~/.claude/skills/` install.
- Distribution: git clone + symlink (no package manager).

## Structure

```
skills/
├── CLAUDE.md          ← this file (operational)
├── ROADMAP.md         ← strategic state (phases, sprints, gates)
├── skills_log.md      ← decisions + debug history
├── specs/             ← thin specs (NN_slug.md)
│   └── 00_bootstrap.md
├── README.md          ← public-facing (for GitHub)
├── LICENSE            ← MIT
├── .gitignore
└── skills/            ← the 3 polished skills live here (after Sprint 01-03)
    ├── <skill-1>/
    ├── <skill-2>/
    └── <skill-3>/
```

## Key conventions

- **Language**: skill internal language follows source (operator's existing skills are mixed PT-BR/EN). README and meta-docs are bilingual.
- **Portability gate**: a skill is portable when zero references to operator's filesystem (`~/Documents/`, `Infra/data/signals.db`, Notion data sources, etc.) remain. Sprint 01-03 enforce.
- **No secrets**: no `.env`, no API keys, no LinkedIn cookies.
- **Tests as guards**: a smoke test per skill verifies it loads + runs with mock inputs.
- **Branding**: working name "Atelier Skills" (TBD — operator may pick different public name).

## Roadmap

See `ROADMAP.md` for full state. Quick summary:

- **Sprint 00 — Bootstrap** (current). Spec: `specs/00_bootstrap.md`. Directory + scaffolds + LICENSE + .gitignore + spec template.
- **Sprint 01 — Skill #1 extraction** (planned). Operator picks 1 skill from candidates (see ROADMAP). Polish + test + README.
- **Sprint 02 — Skill #2 extraction** (planned).
- **Sprint 03 — Skill #3 extraction** (planned).
- **Sprint 04 — Public launch** (planned). README polish, GitHub repo public, 2 announcement posts, LinkedIn.
- **Sprint 05 — Measurement gate** (planned). 30 days post-launch: count stars, issues, PRs. Decision: continue to Phase 2 or kill.

## Handoff

**Last update**: 2026-05-22 — project initialized. Operator approved Phase 1 scope after `/propose` ideation session. No code yet; bootstrap is purely structural.

**Operator pending**:
1. Pick the 3 skills to extract in Sprints 01-03. Candidates (subset of operator's current skills): `/spec`, `/personas`, `/audit`, `/retrofit`. See ROADMAP for trade-offs.
2. Decide working repo name (`claude-skills-pt-br` is a candidate; alternatives: `atelier-skills`, `claude-skills-br`).
3. Decide branding for paid tier (deferred to Phase 2 — not blocking).

**Critical files**: none yet (no code).

**References**:
- Workspace convention: `~/Documents/CLAUDE.md`
- Spec template: `~/Documents/Infra/docs/spec-template.md`
- Portfolio state: `~/Documents/portfolio-state.md`
- Adjacent open-source projects: `~/Documents/projects/open-source/prose-loop/`, `~/Documents/projects/open-source/archlint/`
