# skills — Atelier Skills

## Venture

<!-- prosa: tese, oferta, modelo de receita, mercado, domínio/canais -->

```venture
icp: "OSS — devs e entusiastas de agentes de código; sem comprador (aquisição e credibilidade, não receita)"
```

Curated catalog of portable Claude Code skills, packaged for external use. Phase 1 shipped an open-source GitHub repo with 3 polished skills extracted from the operator's daily flow (PT-BR + EN). Phase 2 (conditional on demand signals) would wrap additional premium skills behind a paid tier.

Editorial positioning: PT-BR as differentiator. The English-language skill ecosystem is competitive; PT-BR is empty. Operator's domain credibility (Substack EN essays + kanhan.com.br PT-BR + Bartleby + paper9) anchors the curation.

### Scope

**Phase 1 (shipped)**: 3 skills extracted and polished for external use; bilingual README + install instructions + MIT license; one channel — public GitHub repo at `github.com/MKanhan/skills-for-claude`; announcement posts (EN Substack essay + PT-BR kanhan.com.br + LinkedIn cross-post).

**Phase 2 (conditional, not triggered)**: 2 additional premium skills, landing page `kanhan.com.br/skills`, paid tier R$ 49/mês or R$ 399 lifetime via Stripe (TBD). Trigger: ≥50 stars in 30 days OR ≥5 external issues/PRs OR ≥3 inbound DMs asking for "more skills like this". Kill: <10 stars + 0 issues + 0 DMs at day 30, no mention on LinkedIn/Substack. Explicitly gated so it only proceeds on signal independent of Bartleby/paper9 attention. See Now/Next for where the actual signal landed.

## Stack

- Skills are plain text files (`SKILL.md` + optional helper scripts).
- Tests: bash-based smoke checks per skill (verify YAML frontmatter, required fields, no kanhan-specific paths leaked).
- No runtime — skills are consumed by Claude Code via `~/.claude/skills/` install.
- Distribution: git clone + symlink (no package manager).

## Structure

```
skills/
├── CLAUDE.md          ← this file (operational)
├── skills_log.md      ← decisions + debug history
├── specs/             ← thin specs (NN_slug.md)
│   └── 00_bootstrap.md
├── README.md          ← public-facing (for GitHub)
├── LICENSE             ← MIT
├── .gitignore
└── skills/            ← the 3 polished skills
    ├── spec/
    ├── personas/
    └── audit/
```

## Key conventions

- **Language**: skill internal language follows source (operator's existing skills are mixed PT-BR/EN). README and meta-docs are bilingual.
- **Portability gate**: a skill is portable when zero references to operator's filesystem (`~/Documents/`, `Infra/data/signals.db`, Notion data sources, etc.) remain.
- **No secrets**: no `.env`, no API keys, no LinkedIn cookies.
- **Tests as guards**: a smoke test per skill verifies it loads + runs with mock inputs.
- **Branding**: public repo name is `skills-for-claude` (decided 2026-05-22). "Atelier Skills" is the internal/working name; Phase 2 branding for a paid tier is deferred.

## Now / Next

**Phase 1 complete and public.** All 5 sprints done (bootstrap → `/spec` → `/personas` → `/audit` → public launch → measurement-gate mechanism). Repo `github.com/MKanhan/skills-for-claude` is public and pushed (confirmed on GitHub: created 2026-05-26, last push 2026-09-05), tagged `sprint-01-spec`, `sprint-02-personas`, `sprint-03-audit`, `sprint-05-measure`, `v0.1.0`. The 3 skills (`/spec`, `/personas`, `/audit`) ship with bilingual READMEs + smoke tests; CI green on push/PR.

**Measurement gate: signal checked, never formally closed.** Day 30 (~2026-06-25) passed without `tools/measure.sh` running — `skills_log.md`'s Day-30 template is still an empty placeholder. Checked directly against GitHub now (2026-09-06, 3+ months post-launch): **0 stars, 0 issues, 0 PRs** — meets the kill threshold on the numeric side. Whether there was any mention on LinkedIn/Substack is unverified, and uncertain anyway given the gap below. Branch decision (kill / extend / trigger Phase 2) is the operator's call, not made here.

**Announcement batch: 1 of 4 drafts missing.** `outputs/posts/` has the PT-BR kanhan.com.br post and both LinkedIn posts (EN + PT-BR), but no `en/skills-for-claude-launch.md` — the EN Substack essay draft that the original launch handoff pointed to isn't in the directory. Worth confirming with the operator whether it was ever written, published directly, or lost, before treating the announcement batch as complete or drawing conclusions from the 0/0/0 signal above.

**Phase 2**: not triggered — deferred, see Scope above for conditions.

## Handoff

Last real work: Phase 1 sprints 00–05, all closed 2026-05-26. Since then, two housekeeping passes only (venture manifest added 2026-07-31; log distilled to 7 decisions 2026-09-05) — no product code touched.

**Next session, if picking this up**: (1) resolve the missing EN Substack draft; (2) decide the Phase 1 measurement branch given the 0/0/0 signal above — `tools/measure.sh` (gh CLI + jq) is ready to run and emits a paste-ready record for `skills_log.md`; (3) only if Phase 2 triggers, decide branding + pricing for the paid tier.

## References

- Workspace convention: `~/Documents/CLAUDE.md`
- Spec template: `~/Documents/infra/docs/spec-template.md`
- Portfolio (derived, weekly): `~/Documents/portfolio.md`
- Adjacent open-source projects: `~/Documents/software/prose-loop/`, `~/Documents/software/archlint/`
