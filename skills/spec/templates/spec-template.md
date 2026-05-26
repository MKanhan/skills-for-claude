# Spec NN — <short title>

> Thin spec format (~60-100 lines). Long specs collapse into wishlists.
> Inspiration: [Spec Kit](https://github.com/github/spec-kit) and [cc-sdd](https://github.com/gotalab/cc-sdd) — Requirements → Design → Tasks → Implementation.

## Goal
One sentence. What this sprint delivers to the user or to the system. Not the "how".

## Problem
2–4 sentences or short bullets. The current state and why it is insufficient. Anchor in evidence (failing test, operator feedback, observed metric). Without this, the spec is a wishlist.

## Decision
One design decision made BEFORE implementing. Shape, mode, contract. If the decision has meaningful alternatives, record the chosen one + one line of rationale. Large decisions belong in a separate ADR and are linked here.

> Useful for sprints with real ambiguity. Trivial sprints (mechanical refactor, isolated fix) may omit this section.

## In scope
Concrete list of changes, grouped by area. Each item names the affected file/module and the expected behavior. Use sub-headers (`### Detection`, `### Pipeline`, `### UI`) when >5 items.

- `path/to/file.py::function` — expected behavior, one sentence.
- Migration NNNN if there is a schema change.
- New/modified endpoints (verb + path + brief contract).
- UI: what appears, where, when.

## Out of scope
Explicit list of what is **not** in this sprint. Defends against scope creep and anchors the next sprint.

## Acceptance criteria
Verifiable list. Each item is a test or concrete observation. If you can't check it, it's not an AC.

- Behavior X when input Y.
- Endpoint Z returns shape W.
- Existing tests still pass; lint clean.
- Tag `vX.Y.Z-slug` applied after merge.

## Test additions
List of new or changed tests, by file. Include golden fixtures if applicable.

- `tests/unit/test_<area>.py` — cases covered.
- `tests/integration/test_<flow>.py` — end-to-end flow.
- `tests/golden/<artifact>` — expected update.
