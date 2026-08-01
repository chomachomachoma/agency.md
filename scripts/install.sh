#!/usr/bin/env bash
set -euo pipefail

# agency.md - Installation Script
# Installs the plugin into Claude Code's skills directory

PLUGIN_NAME="agency.md"
SOURCE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills/$PLUGIN_NAME}"

echo "  ___                          _         __  __ ____   "
echo " / _ \  __ _  ___  ___ __   __(_) _ __  |  \/  |  _ \  "
echo "/ ___| / _  |/ __|/ _ \\\\ \ / /| || '_ \ | |\/| | | | | "
echo "\_/   | (_| |\__ \| __/ \ V / | || | | || |  | | |_| | "
echo "     \____|   ___/\___|  \_/  |_||_| |_||_|  |_|____/  "
echo ""
echo "Installing agency.md plugin..."
echo ""

# Create target directory
mkdir -p "$TARGET_DIR"
mkdir -p "$HOME/.claude/agency/roles"

# Copy all plugin files
echo "Copying plugin files to $TARGET_DIR..."
cp -r "$SOURCE_DIR/.claude-plugin" "$TARGET_DIR/"
cp -r "$SOURCE_DIR/skills" "$TARGET_DIR/"
cp -r "$SOURCE_DIR/agents" "$TARGET_DIR/"
cp -r "$SOURCE_DIR/templates" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$SOURCE_DIR/prompts" "$TARGET_DIR/" 2>/dev/null || true

# Copy optional files
if [ -f "$SOURCE_DIR/README.md" ]; then
  cp "$SOURCE_DIR/README.md" "$TARGET_DIR/" 2>/dev/null || true
fi
if [ -f "$SOURCE_DIR/LICENSE" ]; then
  cp "$SOURCE_DIR/LICENSE" "$TARGET_DIR/" 2>/dev/null || true
fi

echo ""
echo "  [OK] Plugin files installed to $TARGET_DIR"
echo "  [OK] Custom roles directory: $HOME/.claude/agency/roles/"
echo ""
echo "To activate, run /reload-plugins in Claude Code or restart Claude Code."
echo ""
echo "Usage:"
echo "  /agency <your project description>"
echo "  /hire <role-name> [description]"
echo "  /fire <role-name>"
echo ""
echo "Your agency is ready. Go build something great."
echo ""