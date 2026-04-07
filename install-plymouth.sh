#!/bin/bash
# Install custom Plymouth theme
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Plymouth theme..."
sudo mkdir -p /usr/share/plymouth/themes/omarchy-red
sudo cp "$DOTFILES/plymouth/omarchy-red/"* /usr/share/plymouth/themes/omarchy-red/
sudo plymouth-set-default-theme omarchy-red
sudo mkinitcpio -P
echo "Plymouth theme installed."
