#!/bin/bash
# Install all packages from packages.txt
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Installing yay packages..."
yay -S --needed - < "$DOTFILES/packages.txt"
echo "Packages installed."
