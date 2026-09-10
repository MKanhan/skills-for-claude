---
status: done
---

# Spec 05 — Day-30 measurement gate

## Goal
At Day 30 post-launch, run a structured demand-signal review and explicitly decide one of: trigger Phase 2 / kill / extend monitoring. Avoid drift toward sunk-cost reasoning.

## Problem
Phase 2 (paid tier) is conditional on signals defined in `ROADMAP.md`:
- **Trigger**: ≥50 GitHub stars OR ≥5 external issues/PRs OR ≥3 inbound DMs/emails.
- **Kill**: <10 stars AND 0 issues AND 0 DMs at Day 30.

Without a procedural review at Day 30, the operator is likely to either (a) silently continue investing past the kill condition (sunk cost), or (b) miss a trigger fire because no one tallied the signals. The fix is a lightweight ritual: one script run + one log entry + one explicit branch decision.

## Decision

**Metrics captured** — 5 signals, in this exact order:
1. GitHub stars (via `gh api repos/MKanhan/skills-for-claude`).
2. GitHub forks (same call).
3. External issues opened (filter: `author != MKanhan`).
4. External PRs opened (filter: `author != MKanhan`).
5. Inbound DMs / emails / Telegram mentions referencing the repo — counted manually by operator (no automation here; privacy + low volume).

**Helper script** — `tools/measure.sh` wraps the `gh api` calls and prints a paste-ready markdown block. Manual fields (DMs, mentions) appear as `_FILL_` placeholders for operator completion.

**Log entry** — output gets pasted into `skills_log.md` as `## YYYY-MM-DD — Day-30 measurement gate`. The entry includes raw counts AND the operator's explicit branch decision.

**Branches** — three outcomes, no fourth:
- **Trigger fired** (any one signal meets threshold) → unlock Phase 2 sprints 10–14. Operator updates `ROADMAP.md` Phase 2 status from "deferred, conditional" to "active".
- **Kill condition met** (all three thresholds undershot) → repo stays public for portfolio value. `skills_log.md` records the kill decision. No further sprints planned.
- **Mid-range** (some signal between kill and trigger thresholds) → operator picks: **extend 30 days** (re-run gate at Day 60) or **park-and-monitor** (no scheduled review; revisit if a new signal appears organically). Decision logged.

**No automated branch execution** — the script reports, the operator decides. Avoids false-positive triggers from edge cases (e.g., 50 stars from a Hacker News spike without engagement).

## In scope

- `tools/measure.sh` (~50 lines bash) — uses `gh api`, formats output as a markdown block ready to paste into `skills_log.md`. Exits non-zero if `gh` is not authenticated.
- `skills_log.md` — append a `### Template — Day-30 measurement gate` block (the section operator fills on the actual day). Template includes the 5 signals + the 3 branch decisions.
- `ROADMAP.md` — minor update: Sprint 05 row mentions `tools/measure.sh` as the helper.
- `CLAUDE.md` — Handoff section notes the Day-30 calendar reminder is the operator's responsibility (no automated scheduler in this sprint).

## Out of scope

- Continuous analytics dashboard.
- Paid telemetry (e.g., PostHog) inside the skills themselves — privacy boundary, hard no.
- Automated Phase 2 trigger execution.
- Email notification when threshold crossed (would require always-running monitor; over-engineered).
- Star history charts, contributor graphs.
- A/B testing of announcement post variants.

## Acceptance criteria

- `bash tools/measure.sh` (with `gh` authenticated) outputs a markdown block containing all 5 signals — first 4 with real counts, 5th as `_FILL_`.
- `tools/measure.sh` exits 1 with a clear error if `gh` is not authenticated.
- `skills_log.md` contains a `### Template — Day-30 measurement gate` block listing the 5 signals and the 3 branch decisions.
- `ROADMAP.md` Sprint 05 row references `tools/measure.sh`.
- No actual Day-30 review runs at spec-writing time — the spec ships the **mechanism**, not the execution. Real Day-30 review happens 30 days after `v0.1.0` push (operator-driven).

## Test additions

- None — procedural sprint. `tools/measure.sh` smoke-tested manually by the operator on first run (it either prints counts or errors on auth). Adding a mock `gh` test harness would over-engineer a 50-line script.
