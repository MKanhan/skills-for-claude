---
name: spec
description: Scaffold a thin spec file (NN_slug.md) in the current project's specs/ folder using a bundled template. Used for spec-driven development sprints.
argument-hint: <short-slug>
---

# /spec — scaffold a thin spec

Args: `$ARGUMENTS` (short slug, e.g. `risk_engine_v2`, `auth_hardening`).

## Behavior

1. **Detect project root** by walking up from CWD until one of these markers is found:
   - `.git/` directory
   - existing `specs/` directory
   - `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, or `Gemfile`

   If no marker is found within 6 levels, fall back to CWD and warn the operator explicitly. **Abort** if CWD is `$HOME` (defends against accidental personal-folder pollution).

2. **Ensure `specs/` exists** at the detected root. Create it if missing.

3. **Compute next NN** by listing `specs/*.md` and taking `max(NN) + 1`, zero-padded to 2 digits. If `specs/` is empty, start at `00`.

4. **Validate slug** from `$ARGUMENTS`: must be lowercase, no spaces (`_` or `-` allowed). If missing, ask the operator. If invalid, normalize (lowercase + replace spaces with `_`) and confirm.

5. **Create the file** `specs/<NN>_<slug>.md` by copying the bundled template at `./templates/spec-template.md` (relative to this SKILL.md) and substituting:
   - Title line: `# Spec <NN> — <short title>` — leave `<short title>` as a visible placeholder for the operator to fill.

6. **Report** to the operator:
   - Absolute path of the created file.
   - Next steps: (a) replace `<short title>` in the heading, (b) write `Goal` / `Problem` / `Decision`, (c) reference the spec in the project's `CLAUDE.md` (or equivalent project doc).

## Constraints

- **Do not overwrite** an existing spec. If `<NN>_<slug>.md` already exists (slug collision at the next NN), abort and suggest an alternative slug.
- **Do not commit**. The operator decides when to commit.
- **Do not fill content**. This skill only scaffolds; design work happens separately.
- **Do not create `specs/` in directories that are clearly not projects** (e.g. `$HOME`, `/tmp`). If in doubt, ask.

## References

- Bundled template: `./templates/spec-template.md`
- Pattern source: Marcelo Kanhan's workspace convention (CLAUDE.md + ROADMAP.md + `<name>_log.md` + `specs/`).
