#!/usr/bin/env bash
# Smoke test for skills/spec/
# Asserts portability: valid frontmatter, bundled template present, no operator-private refs.

set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../skills/spec" && pwd)"
fail() { echo "FAIL: $1" >&2; exit 1; }

# 1. SKILL.md exists
[ -f "$SKILL_DIR/SKILL.md" ] || fail "SKILL.md missing at $SKILL_DIR"

# 2. SKILL.md has YAML frontmatter with required keys
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^---$' || fail "SKILL.md missing opening frontmatter delimiter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^name:' || fail "SKILL.md missing 'name:' in frontmatter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^description:' || fail "SKILL.md missing 'description:' in frontmatter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^argument-hint:' || fail "SKILL.md missing 'argument-hint:' in frontmatter"

# 3. Bundled template exists
[ -f "$SKILL_DIR/templates/spec-template.md" ] || fail "Bundled template missing at $SKILL_DIR/templates/spec-template.md"

# 4. No operator-private references
if grep -rE "(Documents/|agent-lgpd|signals\.db|Notion|kanhan\.com\.br|Bartleby|paper9)" "$SKILL_DIR" >/dev/null 2>&1; then
    grep -rnE "(Documents/|agent-lgpd|signals\.db|Notion|kanhan\.com\.br|Bartleby|paper9)" "$SKILL_DIR" >&2
    fail "Found operator-private references in $SKILL_DIR"
fi

# 5. README exists and is bilingual (has both English and Português headings)
[ -f "$SKILL_DIR/README.md" ] || fail "README.md missing at $SKILL_DIR"
grep -q '^## English' "$SKILL_DIR/README.md" || fail "README.md missing '## English' section"
grep -q '^## Português' "$SKILL_DIR/README.md" || fail "README.md missing '## Português' section"

echo "OK: skills/spec/ smoke test passed"
