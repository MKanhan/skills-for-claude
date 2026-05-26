#!/usr/bin/env bash
# Smoke test for skills/audit/
# Asserts portability: valid frontmatter, no operator paths, all flags documented.

set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../skills/audit" && pwd)"
fail() { echo "FAIL: $1" >&2; exit 1; }

# 1. SKILL.md exists
[ -f "$SKILL_DIR/SKILL.md" ] || fail "SKILL.md missing at $SKILL_DIR"

# 2. SKILL.md has YAML frontmatter with required keys
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^---$' || fail "SKILL.md missing opening frontmatter delimiter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^name:' || fail "SKILL.md missing 'name:' in frontmatter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^description:' || fail "SKILL.md missing 'description:' in frontmatter"
head -10 "$SKILL_DIR/SKILL.md" | grep -q '^argument-hint:' || fail "SKILL.md missing 'argument-hint:' in frontmatter"

# 3. No operator-private paths
if grep -rE "(\.claude/projects/|_archive/audits/|Documents/|signals\.db|Notion)" "$SKILL_DIR" >/dev/null 2>&1; then
    grep -rnE "(\.claude/projects/|_archive/audits/|Documents/|signals\.db|Notion)" "$SKILL_DIR" >&2
    fail "Found operator-private references in $SKILL_DIR"
fi

# 4. All flags documented in SKILL.md and README.md
for flag in "--memory" "--out" "--deep"; do
    grep -q -- "$flag" "$SKILL_DIR/SKILL.md" || fail "Flag $flag not documented in SKILL.md"
    grep -q -- "$flag" "$SKILL_DIR/README.md" || fail "Flag $flag not documented in README.md"
done

# 5. README is bilingual
[ -f "$SKILL_DIR/README.md" ] || fail "README.md missing"
grep -q '^## English' "$SKILL_DIR/README.md" || fail "README.md missing '## English' section"
grep -q '^## Português' "$SKILL_DIR/README.md" || fail "README.md missing '## Português' section"

# 6. Explicit read-only contract documented
grep -qiE "(read.only|never deletes|never commits)" "$SKILL_DIR/SKILL.md" || fail "SKILL.md should explicitly state read-only contract"

echo "OK: skills/audit/ smoke test passed"
