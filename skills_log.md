# skills_log

Decisions + debug history for the skills project. Append-only.

---

## 2026-05-22 — Project initialized

**Trigger**: operator approved Phase 1 scope after `/propose` ideation session (proposal #9 — Atelier Skills).

**Decisions captured**:
- **Phase 1 is OSS-only, no monetization gate**. Goal is market-fit test via GitHub stars/issues/PRs, not revenue. Cost target <40h operator time.
- **Phase 2 is conditional**. Only proceeds if measurable demand signal in 30 days post-launch (see `ROADMAP.md` triggers).
- **Workspace convention adopted**: CLAUDE.md + ROADMAP.md + skills_log.md + specs/. Same pattern as macro-systems.
- **No premature naming**. Working name "Atelier Skills" in CLAUDE.md; final public repo name decided before Sprint 04 (candidates: `claude-skills-pt-br`, `atelier-skills`, `claude-skills-br`).
- **3 skills, not 5 or 10**. Tight scope prevents Phase 1 turning into a polish marathon. Marginal skill #4 has near-zero incremental signal value.

**Why this project sits in `projects/dev/`**: it's not live (no users), not open-source published yet, not infra. Standard "dev" classification per `~/Documents/CLAUDE.md`.

**Why not just a Substack post**: a public repo is a durable, searchable artifact. Stars and issues are externally legible signals. A Substack post about skills evaporates after the email open rate decays.

**Risk acknowledged**: Anthropic may launch an official skill marketplace mid-Phase-1. Mitigation = OSS repo retains portfolio value regardless; Phase 2 monetization pivots to consulting if needed.

---

## 2026-05-22 — Skill selection + repo name decided

**Decisions**:
- **3 skills to extract**: `/spec` (Sprint 01), `/personas` (Sprint 02), `/audit` (Sprint 03). Order chosen so the easiest port (`/spec`, low filesystem coupling) lands first as a forcing function for the polish pipeline; the PT-BR moat skill (`/personas`) lands second when conventions are already in place.
- **Public repo name**: `mkanhan/skills-for-claude`. Plain, descriptive, no jargon ("atelier" needed explanation). The handle `mkanhan` matches operator's existing GitHub identity (consistent with `MKanhan/prose-loop`, `MKanhan/archlint`).
- **`/retrofit` and `/propose` excluded** even though high-value: too coupled to operator's specific editorial guidelines + Notion + signals.db. Porting effort would dominate the project budget and dilute the curation message.

**Pending Phase 2 decisions** (non-blocking, ≥30 days away):
- Pricing model for paid tier (subscription R$ 49/mês vs lifetime R$ 399).
- Premium skill candidates not in OSS repo.

---
