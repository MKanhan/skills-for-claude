#!/usr/bin/env bash
# Day-30 measurement gate for the skills-for-claude repo.
# Outputs a paste-ready markdown block for skills_log.md.
#
# Usage: bash tools/measure.sh
# Requires: gh CLI authenticated (gh auth login).

set -euo pipefail

REPO="MKanhan/skills-for-claude"
LAUNCH_DATE="2026-05-26"
OPERATOR_LOGIN="MKanhan"

# 1. Verify gh auth
if ! gh auth status >/dev/null 2>&1; then
    echo "Error: gh CLI not authenticated. Run 'gh auth login' first." >&2
    exit 1
fi

# 2. Fetch repo metadata
REPO_DATA=$(gh api "repos/${REPO}")
STARS=$(echo "$REPO_DATA" | jq -r '.stargazers_count')
FORKS=$(echo "$REPO_DATA" | jq -r '.forks_count')

# 3. Count external issues (author != OPERATOR_LOGIN; excludes PRs)
ISSUES_EXTERNAL=$(gh api "repos/${REPO}/issues?state=all&per_page=100" \
    --jq "[.[] | select(.pull_request == null and .user.login != \"${OPERATOR_LOGIN}\")] | length")

# 4. Count external PRs (author != OPERATOR_LOGIN)
PRS_EXTERNAL=$(gh api "repos/${REPO}/pulls?state=all&per_page=100" \
    --jq "[.[] | select(.user.login != \"${OPERATOR_LOGIN}\")] | length")

# 5. Days since launch (macOS date form)
TODAY=$(date +%Y-%m-%d)
LAUNCH_EPOCH=$(date -j -f "%Y-%m-%d" "${LAUNCH_DATE}" +%s)
TODAY_EPOCH=$(date +%s)
DAYS_SINCE=$(( (TODAY_EPOCH - LAUNCH_EPOCH) / 86400 ))

# 6. Emit paste-ready markdown
cat <<EOF
## ${TODAY} — Day-${DAYS_SINCE} measurement gate

**Repo**: \`${REPO}\`
**Launch**: ${LAUNCH_DATE} (v0.1.0)
**Days since launch**: ${DAYS_SINCE}

### Signals

| Signal | Count | Threshold (trigger / kill) |
|--------|-------|----------------------------|
| GitHub stars | ${STARS} | ≥50 trigger / <10 kill |
| GitHub forks | ${FORKS} | (context only) |
| External issues opened | ${ISSUES_EXTERNAL} | combined w/ PRs ≥5 trigger / 0 kill |
| External PRs opened | ${PRS_EXTERNAL} | combined w/ issues ≥5 trigger / 0 kill |
| Inbound DMs / emails / mentions | _FILL_ | ≥3 trigger / 0 kill |

### Branch decision

- [ ] **Trigger fired** (any one signal meets threshold) → unlock Phase 2 sprints 10–14. Update ROADMAP.md Phase 2 status from "deferred, conditional" to "active".
- [ ] **Kill condition met** (stars <10 AND issues+PRs = 0 AND DMs = 0) → repo stays public for portfolio value; no further sprints planned.
- [ ] **Mid-range** → choose: **extend 30 days** (re-run gate at Day 60) OR **park-and-monitor** (revisit if a new signal appears organically).

### Notes

_(operator: brief reflection on what signals mean qualitatively — was there a Substack spike? a HN mention? an inbound from someone in the target audience? — that helps interpret the raw counts)_
EOF
