# ROADMAP — skills

Strategic state for the Atelier Skills project. Source of truth for what's active, planned, and deferred. Updates roll into `CLAUDE.md` Handoff at sprint close.

## Vision

Solve a real market gap (PT-BR Claude Code skills) without committing to a product before signal. Phase 1 is portfolio-builder + autoridade move; Phase 2 only happens if external interest materializes within 30 days of launch.

## Phases

### Phase 1 — Open-source launch (active)

Goal: publish 3 polished skills in a public GitHub repo. Measure adoption. Decide.

Cost target: <40h of operator time over 4 weeks. Zero R$ cost (no infra, no paid tools).

**Sprints**:
- **00 — Bootstrap** (in progress, this commit). Spec: `specs/00_bootstrap.md`.
- **01 — Skill #1 extraction**. Spec: `specs/01_<slug>.md` (TBD after skill choice).
- **02 — Skill #2 extraction**. Spec: `specs/02_<slug>.md`.
- **03 — Skill #3 extraction**. Spec: `specs/03_<slug>.md`.
- **04 — Public launch**. Spec: `specs/04_public_launch.md`. README polish, repo public, 2 announcement posts (Substack EN + kanhan.com.br PT-BR), LinkedIn cross-post.
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

## Candidate skills for Phase 1

The 3 skills to extract get picked from operator's current set, balancing (a) portability (low filesystem coupling) and (b) demonstration of operator's PT-BR domain.

| Candidate | Source location | Portability effort | PT-BR distinct value | Notes |
|-----------|-----------------|-------------------|----------------------|-------|
| `/spec` | workspace-wide | Low — already operator-agnostic | Low — works any lang | Strong demo of spec-driven discipline |
| `/personas` | cultivation/ | Medium — references goldens, profiles | **High** — 5 PT-BR business personas | Showcases curation depth |
| `/audit` | workspace tool | Low | Low | Generic dev tool |
| `/retrofit` | content/ | High — references guidelines, goldens | High — PT-BR editorial conventions | Heavy to port; defer |
| `/propose` | sales hub | Very high — couples to signals.db + Notion | Medium | Not portable; skip |

**Recommended picks** (operator confirms):
1. `/spec` — universal appeal, easy port, demonstrates discipline.
2. `/personas` — PT-BR moat, hardest to clone, showcases editorial depth.
3. `/audit` OR `/retrofit` — operator picks based on which is closer to ready.

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
