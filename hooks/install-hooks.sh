#!/bin/bash
# Install git hooks in current repository
# Usage: /path/to/install-hooks.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d ".git" ]; then
    echo "Error: Not a git repository. Run from project root."
    exit 1
fi

echo "Installing git hooks..."

cp "$SCRIPT_DIR/pre-commit" .git/hooks/pre-commit
cp "$SCRIPT_DIR/pre-push" .git/hooks/pre-push

chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/pre-push

echo "Installed:"
echo "  - pre-commit (formatting, linting, secrets, debug statements)"
echo "  - pre-push (tests)"
echo ""
echo "Done!"
