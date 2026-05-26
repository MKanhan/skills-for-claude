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

## 2026-05-26 — Specs 01–05 drafted

**Trigger**: operator requested all 5 sprint specs written before firing auto mode. Two decisions confirmed in same exchange:
- Public title: `Skills for Claude / Skills para Claude`.
- Repo created publicly at `https://github.com/MKanhan/skills-for-claude` (empty, awaiting first push).

**Specs written** (52–70 lines each, all under 100-line guideline):
- `specs/01_spec_skill.md` — `/spec` extraction. Key decisions: project-root marker scan (replaces `~/Documents/` gate), bundled template at `skills/spec/templates/`, EN SKILL.md + bilingual README.
- `specs/02_personas_skill.md` — `/personas` extraction. Key decision: ship the BR boutique lens as opinionated (not laundered into generic); README front-loads audience framing + customization guide.
- `specs/03_audit_skill.md` — `/audit` extraction. Key decisions: memory check opt-in (`--memory`), stdout default with `--out` flag, SKILL.md expanded from 14 → ~30 lines for clearer contract.
- `specs/04_public_launch.md` — first push + tag `v0.1.0` + 4 announcement drafts (Substack EN, kanhan.com.br PT-BR, LinkedIn ×2). **Publishing boundary**: auto mode writes drafts only; operator publishes manually. Tag-push deferred to operator.
- `specs/05_measurement_gate.md` — `tools/measure.sh` + Day-30 log template + 3 explicit branches (trigger / kill / mid-range). No automated trigger — operator decides.

**Plan file**: `~/.claude/plans/silly-strolling-pebble.md` (approved 2026-05-26).

Auto mode unblocked. Sprint 01 is next.

---
