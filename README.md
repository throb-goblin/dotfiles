# Dotfiles

My personal dotfiles for [Omarchy](https://omarchy.org) — an opinionated Arch Linux + Hyprland distribution.

![Desktop Preview](desktop-screenshot.png)

## What's included

| Package | Contents |
|---------|----------|
| `hypr` | Hyprland, Hyprlock, Hypridle, Hyprsunset configs + keybindings |
| `waybar` | Status bar config and stylesheet |
| `omarchy-theme` | Amberbyte theme (backgrounds, colours, hyprlock, waybar, etc.) |
| `mimeapps` | Default app associations (Brave as default browser) |
| `apps` | Custom desktop entries (web apps, Claude Terminal, etc.) |
| `icons` | Custom app icons |
| `scripts` | `claude-terminal`, `osk-toggle` |
| `git` | Git aliases and preferences |
| `cava` | Audio visualiser colour scheme |
| `mise` | Runtime version manager config |
| `lazygit` | Lazygit config |
| `libreoffice` | LibreOffice user settings |
| `fonts` | Omarchy icon font |
| `plymouth/` | Custom boot splash theme (omarchy-red) |
| `msfonts/` | Microsoft fonts for LibreOffice compatibility |

---

## Fresh install instructions

### 1. Install Omarchy

Follow the [Omarchy install guide](https://omarchy.org) to get a base Omarchy system up and running.

### 2. Clone this repo

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Run the install script

This installs all packages, stows dotfiles (creating symlinks), installs Microsoft fonts, and sets up the Plymouth boot theme.

```bash
bash install-all.sh
```

> Plymouth is installed last intentionally — it overwrites Omarchy's default boot images with the custom ones.

### 4. Log out and back in

Most changes take effect immediately via Hyprland's auto-reload, but a full log out/in ensures everything is applied cleanly.

---

## Optional: Microsoft Surface Pro 7

If installing on a Surface Pro 7, run the following to add touchscreen device mapping for correct HiDPI coordinate alignment:

```bash
bash install-surface.sh
```

Skip this on any other machine.

---

## How it works (GNU Stow)

Each top-level directory (e.g. `hypr/`, `waybar/`) is a Stow package. Running `stow <package>` creates symlinks from the package contents into `~`, mirroring the directory structure.

For example:

```
~/dotfiles/hypr/.config/hypr/bindings.conf
    → symlinked to →
~/.config/hypr/bindings.conf
```

To stow a single package manually:

```bash
cd ~/dotfiles
stow hypr
```

To restow all packages (e.g. after pulling updates):

```bash
cd ~/dotfiles
for pkg in hypr waybar omarchy-theme mimeapps apps icons scripts git cava mise lazygit libreoffice fonts; do
    stow --restow "$pkg"
done
```

To remove symlinks for a package:

```bash
stow -D hypr
```

---

## Keybindings (highlights)

| Key | Action |
|-----|--------|
| `SUPER + B` | Browser (Brave) |
| `SUPER + A` | Copilot |
| `SUPER + SHIFT + A` | Claude AI |
| `SUPER + SHIFT + Return` | Browser |
| `SUPER + SHIFT + C` | Calculator (NaSC) |
| `SUPER + SHIFT + G` | Signal |
| `SUPER + SHIFT + M` | Spotify |
| `SUPER + SHIFT + E` | Gmail |
| `SUPER + SHIFT + Y` | YouTube |

---

## Hardware

Configured for a **Microsoft Surface Pro 7** running the `linux-surface` kernel. The `hypr/input.conf` includes Surface-specific touchscreen device mapping — adjust for other hardware.
