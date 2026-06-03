#!/bin/bash
set -euo pipefail
START_HERE="$CLAUDE_PROJECT_DIR/.claude/skills/_START HERE — Which Skill Do I Need.md"
if [ ! -f "$START_HERE" ]; then exit 0; fi
echo "# 🚦 Skills decision tree (auto-loaded at session start)"
echo ""
echo "Walk this tree FIRST. Check for a matching subagent, then a matching skill."
echo ""
echo "---"
echo ""
cat "$START_HERE"
