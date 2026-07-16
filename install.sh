sudo pacman -Syu
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin
yay -S floorp-bin \
    pacseek-bin \
    vesktop-bin \
    sway \
    swaybg \
    foot \
    wmenu \
    thunar \
    nano \
    steam \
    prismlauncher \
    git \
    github-cli \
    curl \
    wget
mv sway ~/.config
