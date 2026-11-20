#!/usr/bin/env bash
# Regenerates the cross-agent files from the single source of truth:
# plugins/neo-brutalist-design/skills/neo-brutalist-design/SKILL.md
set -euo pipefail
cd "$(dirname "$0")/.."
SRC=plugins/neo-brutalist-design/skills/neo-brutalist-design/SKILL.md
BODY=$(awk 'BEGIN{f=0} /^---$/{f++; next} f>=2{print}' "$SRC")
HEAD="Use this style guide whenever you design or restyle UI, web pages, slides, posters, social graphics or brand assets and the user wants a bold, modern, neo-brutalist look."

# Universal: AGENTS.md (Codex, Cursor, Copilot coding agent, Gemini CLI via config, Jules, etc.)
printf '# Neo-brutalist design guide\n\n%s\n%s\n' "$HEAD" "$BODY" > adapters/AGENTS.md
# Gemini CLI
cp adapters/AGENTS.md adapters/GEMINI.md
# Cursor rule (.cursor/rules/*.mdc)
{ printf -- '---\ndescription: %s\nglobs:\nalwaysApply: false\n---\n' "$HEAD"; printf '%s\n' "$BODY"; } > adapters/cursor/neo-brutalist-design.mdc
# GitHub Copilot custom instructions
printf '%s\n%s\n' "$HEAD" "$BODY" > adapters/copilot/copilot-instructions.md
echo "adapters regenerated"
