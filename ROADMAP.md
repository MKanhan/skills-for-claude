# ROADMAP — skills

Strategic state for the Atelier Skills project. Source of truth for what's active, planned, and deferred. Updates roll into `CLAUDE.md` Handoff at sprint close.

## Vision

Solve a real market gap (PT-BR Claude Code skills) without committing to a product before signal. Phase 1 is portfolio-builder + autoridade move; Phase 2 only happens if external interest materializes within 30 days of launch.

## Phases

### Phase 1 — Open-source launch (active)

Goal: publish 3 polished skills in a public GitHub repo. Measure adoption. Decide.

Cost target: <40h of operator time over 4 weeks. Zero R$ cost (no infra, no paid tools).

**Sprints**:
- **00 — Bootstrap** ✅ done 2026-05-22. Spec: `specs/00_bootstrap.md`. Commit `3413a66`.
- **01 — `/spec` extraction** ✅ done 2026-05-26. Spec: `specs/01_spec_skill.md`. Tag `sprint-01-spec`.
- **02 — `/personas` extraction** ✅ done 2026-05-26. Spec: `specs/02_personas_skill.md`. Tag `sprint-02-personas`.
- **03 — `/audit` extraction**. Spec: `specs/03_audit_skill.md`.
- **04 — Public launch**. Spec: `specs/04_public_launch.md`. README polish, push to `github.com/MKanhan/skills-for-claude`, 2 announcement posts (Substack EN + kanhan.com.br PT-BR), LinkedIn cross-post.
- **05 — Measurement gate**. Spec: `specs/05_measurement_gate.md`. Day-30 review.

### Phase 2 — Paid tier (deferred, conditional)

Goal: monetize Phase 1 audience with a curated premium skill pack.

**Trigger condition** (any of):
- ≥50 GitHub stars in 30 days post-launch.
- ≥5 external issues or PRs.
- ≥3 inbound DMs / emails asking for "more skills like this".

**Kill condition** (all of):
- <10 stars + 0 issues + 0 DMs at day 30.
- No mention by relevant accounts on LinkedIn or Substack.

**If triggered**:
- **Sprint 10 — Premium skill #1 spec**.
- **Sprint 11 — Premium skill #2 spec**.
- **Sprint 12 — Landing kanhan.com.br/skills**.
- **Sprint 13 — Stripe + access gating** (delivery via private GitHub repo invite).
- **Sprint 14 — Launch + first 10 customers**.

Tickets: R$ 49/mês recurring OR R$ 399 lifetime. Operator picks at Sprint 12.

## Skills for Phase 1 (decided 2026-05-22)

The 3 skills get extracted in this order:

| Order | Skill | Source | Portability effort | Distinct value |
|-------|-------|--------|-------------------|----------------|
| Sprint 01 | `/spec` | workspace-wide | Low — already operator-agnostic | Demonstrates spec-driven discipline (operator's signature workflow) |
| Sprint 02 | `/personas` | cultivation/ | Medium — references goldens + profiles | **PT-BR moat** — 5 business reader personas, hardest to clone |
| Sprint 03 | `/audit` | workspace tool | Low | General-purpose codebase audit (broader appeal) |

`/retrofit` and `/propose` were considered but excluded: `/retrofit` ports are too coupled to operator's editorial guidelines; `/propose` is tightly bound to operator's signals.db + Notion. Both stay private.

## Deferred (not in scope)

- **Skill submission marketplace** — community contribution flow. Deferred until ≥3 external PRs land naturally.
- **Anthropic skill registry alignment** — if Anthropic ships official marketplace, evaluate. Skills format may need adjustment.
- **Multi-language packaging** — beyond PT-BR/EN. Spanish/French require domain partners; no current path.
- **Telemetry on skill usage** — privacy-sensitive; deferred unless explicit demand.

## Risks

| Risk | Mitigation |
|------|------------|
| Anthropic launches official marketplace mid-Phase-1 | OSS repo retains value as portfolio piece; Phase 2 monetization may pivot to consulting around skills. |
| Skills are not portable enough — break for external users | Smoke test per skill in Sprint 01-03 gates merge. |
| <10 stars at day 30 | Accepted — kill switch fires; effort cost ≈ 40h, recoverable. Skills remain in personal use. |
| Premium tier cannibalizes Bartleby/Paper9 attention | Phase 2 explicitly gated; only proceeds if signal independent of those products. |

## References

- Workspace convention: `~/Documents/CLAUDE.md`
- Operator skills source: `~/.claude/skills/` and `~/.claude/projects/-Users-kanhan-Documents/`
- Adjacent OSS: `prose-loop` (operator's flywheel pattern reference), `archlint` (Claude Code hook pattern reference).
