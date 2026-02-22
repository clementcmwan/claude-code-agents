#!/bin/bash
# install.sh - Set up Claude Code environment on a new machine
# Usage: ./install.sh

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "=================================="
echo "  Claude Code Environment Setup"
echo "=================================="
echo ""

# 1. Check prerequisites
echo "Checking prerequisites..."

MISSING=""

if ! command -v mamba &> /dev/null; then
    MISSING="$MISSING mamba"
fi

if ! command -v git &> /dev/null; then
    MISSING="$MISSING git"
fi

if [ -n "$MISSING" ]; then
    echo -e "${YELLOW}Warning:${NC} Missing:$MISSING"
    echo "Install mamba: https://github.com/conda-forge/miniforge"
    echo ""
fi

echo -e "${GREEN}✓${NC} Prerequisites checked"

# 2. Create directories
echo "Creating directories..."
mkdir -p ~/bin
mkdir -p ~/.claude
echo -e "${GREEN}✓${NC} Directories created"

# 3. Symlink new-ds-project
echo "Setting up new-ds-project..."
ln -sf "$SCRIPT_DIR/new-ds-project" ~/bin/new-ds-project
echo -e "${GREEN}✓${NC} new-ds-project linked to ~/bin/"

# 4. Symlink global Claude rules
echo "Setting up global Claude rules..."
ln -sf "$SCRIPT_DIR/claude_global_rules/CLAUDE.md" ~/.claude/CLAUDE.md
echo -e "${GREEN}✓${NC} Global rules linked to ~/.claude/"

# 5. Symlink agents (optional - for global access)
echo "Setting up agents..."
if [ -d ~/.claude/agents ] && [ ! -L ~/.claude/agents ]; then
    echo -e "${YELLOW}Warning:${NC} ~/.claude/agents exists and is not a symlink"
    echo "  Skipping agents symlink. Manually merge if needed."
else
    ln -sf "$SCRIPT_DIR/agents" ~/.claude/agents
    echo -e "${GREEN}✓${NC} Agents linked to ~/.claude/agents"
fi

# 6. Symlink commands
echo "Setting up commands..."
if [ -d ~/.claude/commands ] && [ ! -L ~/.claude/commands ]; then
    echo -e "${YELLOW}Warning:${NC} ~/.claude/commands exists and is not a symlink"
    echo "  Skipping commands symlink. Manually merge if needed."
else
    ln -sf "$SCRIPT_DIR/commands" ~/.claude/commands
    echo -e "${GREEN}✓${NC} Commands linked to ~/.claude/commands"
fi

# 7. Symlink settings.local.json
echo "Setting up settings.local.json..."
if [ ! -f "$SCRIPT_DIR/settings.local.json" ]; then
    echo '{"permissions": {"allow": []}}' > "$SCRIPT_DIR/settings.local.json"
    echo -e "${GREEN}✓${NC} Created empty settings.local.json"
fi
ln -sf "$SCRIPT_DIR/settings.local.json" ~/.claude/settings.local.json
echo -e "${GREEN}✓${NC} settings.local.json linked to ~/.claude/"

# 8. Check if ~/bin is in PATH
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo ""
    echo -e "${YELLOW}Note:${NC} ~/bin is not in your PATH"
    echo "Add this to your ~/.zshrc or ~/.bashrc:"
    echo ""
    echo '  export PATH="$HOME/bin:$PATH"'
    echo ""
    echo "Then run: source ~/.zshrc"
fi

# 9. GitHub CLI (optional)
echo ""
if ! command -v gh &> /dev/null; then
    echo -e "${YELLOW}Optional:${NC} GitHub CLI not installed"
    echo "  Install with: brew install gh"
    echo "  Then run: gh auth login"
else
    echo -e "${GREEN}✓${NC} GitHub CLI installed"
fi

# Summary
echo ""
echo "=================================="
echo "  Setup Complete!"
echo "=================================="
echo ""
echo "Installed:"
echo "  ~/bin/new-ds-project          → $SCRIPT_DIR/new-ds-project"
echo "  ~/.claude/CLAUDE.md           → $SCRIPT_DIR/claude_global_rules/CLAUDE.md"
echo "  ~/.claude/agents/             → $SCRIPT_DIR/agents/"
echo "  ~/.claude/commands/           → $SCRIPT_DIR/commands/"
echo "  ~/.claude/settings.local.json → $SCRIPT_DIR/settings.local.json"
echo ""
echo "Usage:"
echo "  new-ds-project my-project 3.11    # Create new DS project"
echo ""
echo "Git hooks are auto-installed with new-ds-project."
echo "To add hooks to existing projects:"
echo "  $SCRIPT_DIR/hooks/install-hooks.sh"
echo ""
