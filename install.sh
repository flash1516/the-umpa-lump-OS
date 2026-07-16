#!/bin/sh
set -eu

# --- System update ---
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel

# --- AUR helper (yay) ---
if ! command -v yay >/dev/null 2>&1; then
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
    (cd "$tmpdir/yay-bin" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
else
    echo "yay already installed, skipping."
fi

# --- Packages required for sway to actually work ---
yay -S --needed --noconfirm \
    sway \
    swaybg \
    swayidle \
    swaylock \
    foot \
    wmenu \
    mako \
    polkit-gnome \
    grim \
    playerctl \
    brightnessctl \
    thunar

# --- Personal / extra applications ---
yay -S --needed --noconfirm \
    floorp-bin \
    pacseek-bin \
    vesktop-bin \
    nano \
    steam \
    prismlauncher \
    git \
    github-cli \
    curl \
    wget

# --- Install sway config ---
config_dir="$HOME/.config/sway"
if [ -d "$config_dir" ]; then
    backup="${config_dir}.bak.$(date +%Y%m%d%H%M%S)"
    echo "Existing sway config found, backing up to $backup"
    mv "$config_dir" "$backup"
fi
mkdir -p "$HOME/.config"
cp -r "$(dirname "$0")/sway" "$config_dir"

echo "Done. Log out and select sway from your display manager, or run 'sway' from a TTY."
