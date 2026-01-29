#!/bin/bash
# install.sh - Set up terminal environment (tmux, zsh, powerlevel10k)
# Usage: ./install.sh

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "=================================="
echo "  Terminal Environment Setup"
echo "=================================="
echo ""

# 1. Check for Homebrew
echo "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo -e "${GREEN}✓${NC} Homebrew installed"

# 2. Install packages
echo "Installing terminal packages..."

brew install tmux 2>/dev/null || echo "tmux already installed"
brew install powerlevel10k 2>/dev/null || echo "powerlevel10k already installed"
brew install zsh-autosuggestions 2>/dev/null || echo "zsh-autosuggestions already installed"
brew install zsh-syntax-highlighting 2>/dev/null || echo "zsh-syntax-highlighting already installed"
brew install eza 2>/dev/null || echo "eza already installed"
brew install zoxide 2>/dev/null || echo "zoxide already installed"

echo -e "${GREEN}✓${NC} Packages installed"

# 3. Backup existing configs
echo "Backing up existing configs..."
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.tmux.conf.backup.$(date +%Y%m%d)
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d)
[ -f ~/.p10k.zsh ] && cp ~/.p10k.zsh ~/.p10k.zsh.backup.$(date +%Y%m%d)
echo -e "${GREEN}✓${NC} Backups created"

# 4. Copy config files
echo "Installing config files..."
cp "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf
cp "$SCRIPT_DIR/zshrc" ~/.zshrc
cp "$SCRIPT_DIR/p10k.zsh" ~/.p10k.zsh
echo -e "${GREEN}✓${NC} Config files installed"

# 5. Install Nerd Font (required for icons)
echo ""
echo -e "${YELLOW}Note:${NC} For icons to render correctly, install a Nerd Font:"
echo "  brew tap homebrew/cask-fonts"
echo "  brew install --cask font-meslo-lg-nerd-font"
echo ""
echo "Then set your terminal font to 'MesloLGS NF'"

# Summary
echo ""
echo "=================================="
echo "  Setup Complete!"
echo "=================================="
echo ""
echo "Installed:"
echo "  - tmux (terminal multiplexer)"
echo "  - powerlevel10k (zsh theme)"
echo "  - zsh-autosuggestions"
echo "  - zsh-syntax-highlighting"
echo "  - eza (better ls)"
echo "  - zoxide (better cd)"
echo ""
echo "Config files:"
echo "  ~/.tmux.conf"
echo "  ~/.zshrc"
echo "  ~/.p10k.zsh"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Install a Nerd Font (see above)"
echo "  3. Start tmux: tmux"
echo ""
echo "Tmux key bindings:"
echo "  Prefix: Ctrl+b"
echo "  Split horizontal: Prefix + |"
echo "  Split vertical: Prefix + -"
echo "  Navigate panes: Prefix + j/k/i/l"
echo "  Reload config: Prefix + r"
echo ""
