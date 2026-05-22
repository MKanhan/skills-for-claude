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

**Pending operator decisions** (non-blocking for bootstrap):
1. Pick the 3 skills to extract (candidates listed in ROADMAP).
2. Decide working repo name.
3. (Phase 2 trigger only) decide pricing model (subscription vs lifetime).

**Why this project sits in `projects/dev/`**: it's not live (no users), not open-source published yet, not infra. Standard "dev" classification per `~/Documents/CLAUDE.md`.

**Why not just a Substack post**: a public repo is a durable, searchable artifact. Stars and issues are externally legible signals. A Substack post about skills evaporates after the email open rate decays.

**Risk acknowledged**: Anthropic may launch an official skill marketplace mid-Phase-1. Mitigation = OSS repo retains portfolio value regardless; Phase 2 monetization pivots to consulting if needed.

---
