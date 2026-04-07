#!/bin/bash
# Run on a fresh Omarchy install to restore all customisations.
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing packages..."
bash "$DOTFILES/install-packages.sh"

echo "==> Installing Microsoft fonts..."
bash "$DOTFILES/install-msfonts.sh"

echo "==> Stowing dotfiles..."
cd "$DOTFILES"
for pkg in hypr waybar omarchy-theme mimeapps apps icons scripts git cava mise lazygit libreoffice fonts; do
    stow "$pkg" && echo "  Stowed: $pkg" || echo "  Failed: $pkg"
done

echo "==> Installing Plymouth theme (runs last to overwrite omarchy defaults)..."
bash "$DOTFILES/install-plymouth.sh"

echo ""
echo "All done. Log out and back in for all changes to take effect."
