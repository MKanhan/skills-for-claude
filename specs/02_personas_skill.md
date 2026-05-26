# Spec 02 — `/personas` skill extraction

## Goal
Ship `/personas` as a near-verbatim port. The BR boutique professional-services lens is the differentiator, not a defect to launder into generic "reader feedback".

## Problem
The source command at `~/.claude/commands/personas.md` (75 lines) has zero filesystem coupling — no paths to scrub. The real risk is editorial:

- **Overgeneralization** ("reader feedback through 5 personas") would destroy the PT-BR moat that justifies the project. Generic skills in EN already exist.
- **Under-explanation** would confuse external users encountering 5 highly opinionated personas (Partner / CTO / Specialist Executive / Editor / Theorist) with no context for why those 5, why BR boutique framing, why PT-BR output is mandatory.

Source also implicitly assumes the operator's editorial context (Substack EN essays + business pieces in PT-BR). External users need that context surfaced explicitly.

## Decision

**SKILL.md** — port verbatim from `~/.claude/commands/personas.md`. Only edits: confirm frontmatter (`description`, `argument-hint`, `allowed-tools`) renders cleanly outside the operator's harness. No content changes to persona definitions.

**README.md** — front-load the editorial position. Opening line: "Opinionated. Built for BR boutique partner/CTO/specialist decision-makers evaluating editorial pieces (essays, business posts, pitches). Fork to customize for your audience." Include:
- Why these 5 personas (1 paragraph each).
- Why PT-BR output (editorial decision, not bug).
- `## How to customize` section with concrete edit points — which persona block to swap if your audience is e.g. SF tech founders, German B2B enterprise buyers, academic peer reviewers.

**Output language** — PT-BR remains mandatory (per source). Documented as the editorial position, not a configuration knob. Editor persona stays bilingual.

**Scope contract** — the skill evaluates **a single piece** at a path argument. Does not crawl directories, does not save outputs to files. Terminal-only output. (Matches source.)

## In scope

- `skills/personas/SKILL.md` (~80 lines) — verbatim port of `~/.claude/commands/personas.md`. Frontmatter validated.
- `skills/personas/README.md` (~120 lines) — PT-BR + EN. Sections: install, usage, the 5 personas (audience framing), output format, how to customize, FAQ.
- `tests/personas/smoke.sh` — bash. Asserts: (a) SKILL.md exists with valid YAML frontmatter; (b) all 5 persona section headings present; (c) no operator-specific brand strings (`Bartleby`, `paper9`, `kanhan.com.br`, `signals.db`, `Notion`); (d) `argument-hint` references a markdown file path.

## Out of scope

- Persona customization tooling — fork-friendly is enough, no scaffolding.
- Automated rubric scoring across multiple pieces (batch mode).
- Language packs beyond PT-BR/EN.
- Persona expansion (no 6th persona).
- Integration with other skills (e.g., feeding `/personas` output into `/spec`).

## Acceptance criteria

- `/personas path/to/piece.md` invoked on a sample markdown piece produces:
  - A scores table with all 5 personas + Avg row.
  - 5 narrative blocks (one per persona).
  - 3–5 concrete suggestions.
  - Output entirely in PT-BR (except quoted EN passages from the piece itself).
- `tests/personas/smoke.sh` exits 0; CI invokes on every push.
- `grep -rE "(Bartleby|paper9|kanhan\.com\.br|signals\.db|Notion)" skills/personas/` returns empty.
- README explicitly names the BR boutique audience in the opening paragraph.

## Test additions

- `tests/personas/smoke.sh` — frontmatter validity, all 5 personas present, no-private-brands check, argument-hint sanity.
- Sample fixture `tests/personas/fixtures/sample-piece.md` (~300 words, neutral subject) for manual smoke testing — not asserted on output (LLM nondeterminism), only that the skill loads.
