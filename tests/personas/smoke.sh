#!/usr/bin/env bash
# Smoke test for skills/personas/
# Asserts portability: valid frontmatter, all 5 personas present, no private brand refs.

set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../skills/personas" && pwd)"
FIXTURES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/fixtures" && pwd)"
fail() { echo "FAIL: $1" >&2; exit 1; }

# 1. SKILL.md exists
[ -f "$SKILL_DIR/SKILL.md" ] || fail "SKILL.md missing at $SKILL_DIR"

# 2. SKILL.md has YAML frontmatter with required keys
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^---$' || fail "SKILL.md missing opening frontmatter delimiter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^name:' || fail "SKILL.md missing 'name:' in frontmatter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^description:' || fail "SKILL.md missing 'description:' in frontmatter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^argument-hint:' || fail "SKILL.md missing 'argument-hint:' in frontmatter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q 'path-to-piece' || fail "SKILL.md argument-hint should reference a piece path"

# 3. All 5 personas present
for persona in "The Partner" "The CTO" "The Specialist Executive" "The Editor" "The Theorist"; do
    grep -q "^### $persona\$" "$SKILL_DIR/SKILL.md" || fail "Persona section '### $persona' missing in SKILL.md"
done

# 4. No operator-private brand/product names
if grep -rE "(Bartleby|paper9|kanhan\.com\.br|signals\.db|Notion|Documents/)" "$SKILL_DIR" >/dev/null 2>&1; then
    grep -rnE "(Bartleby|paper9|kanhan\.com\.br|signals\.db|Notion|Documents/)" "$SKILL_DIR" >&2
    fail "Found operator-private references in $SKILL_DIR"
fi

# 5. README exists and is bilingual
[ -f "$SKILL_DIR/README.md" ] || fail "README.md missing at $SKILL_DIR"
grep -q '^## English' "$SKILL_DIR/README.md" || fail "README.md missing '## English' section"
grep -q '^## Português' "$SKILL_DIR/README.md" || fail "README.md missing '## Português' section"
grep -q 'How to customize' "$SKILL_DIR/README.md" || fail "README.md missing customization guide"

# 6. Fixture exists
[ -f "$FIXTURES_DIR/sample-piece.md" ] || fail "Fixture missing at $FIXTURES_DIR/sample-piece.md"

echo "OK: skills/personas/ smoke test passed"
