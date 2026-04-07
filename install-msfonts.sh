#!/bin/bash
# Install Microsoft fonts
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Microsoft fonts..."
sudo mkdir -p /usr/share/fonts/Microsoft
sudo cp "$DOTFILES/msfonts/Microsoft/"* /usr/share/fonts/Microsoft/
sudo fc-cache -fv
echo "Microsoft fonts installed."
