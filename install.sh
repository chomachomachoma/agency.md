#!/usr/bin/env bash
set -euo pipefail

# Agency.md — Installer
# Installs the agency.md plugin for Claude Code

PLUGIN_NAME="agency-dot-md"
PLUGIN_SOURCE="${1:-.}"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills/${PLUGIN_NAME}"

echo "=== Agency.md Installer ==="
echo ""

# Check Claude Code is available
if ! command -v claude &>/dev/null; then
  echo "Error: Claude Code CLI not found. Install it first:"
  echo "  npm install -g @anthropic-ai/claude-code"
  exit 1
fi

echo "Installing plugin to: ${CLAUDE_SKILLS_DIR}"

# Create target directory
mkdir -p "${CLAUDE_SKILLS_DIR}"

# Copy plugin files
if [ -d "${PLUGIN_SOURCE}/.claude-plugin" ]; then
  cp -r "${PLUGIN_SOURCE}/.claude-plugin" "${CLAUDE_SKILLS_DIR}/"
fi
if [ -f "${PLUGIN_SOURCE}/SKILL.md" ]; then
  cp "${PLUGIN_SOURCE}/SKILL.md" "${CLAUDE_SKILLS_DIR}/"
fi
if [ -d "${PLUGIN_SOURCE}/agency" ]; then
  cp -r "${PLUGIN_SOURCE}/agency" "${CLAUDE_SKILLS_DIR}/"
fi

echo ""
echo "Plugin installed to: ${CLAUDE_SKILLS_DIR}"
echo ""
echo "Now run in Claude Code:"
echo "  /reload-plugins"
echo ""
echo "Then use:"
echo "  /agency <your task description>"
echo ""
echo "Or naturally:"
echo "  Call in the team, I need help with..."
echo ""

# Offer to enable the plugin
if claude plugin list 2>/dev/null | grep -q "${PLUGIN_NAME}"; then
  echo "Plugin is already registered. You may need to run /reload-plugins to pick up changes."
else
  echo "To enable the plugin, run in Claude Code:"
  echo "  /reload-plugins"
fi

echo ""
echo "Done."