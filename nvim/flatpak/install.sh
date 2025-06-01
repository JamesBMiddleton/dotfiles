#!/bin/bash
set -o pipefail 

cd "$(dirname "$0")" || exit 1
# install nvim flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub io.neovim.nvim

# set permissions
flatpak info --show-permissions io.neovim.nvim # confirm permissions are the same
flatpak override --user --unshare=network io.neovim.nvim
flatpak override --user --nofilesystem=/var/tmp io.neovim.nvim
flatpak override --user --nofilesystem=/tmp io.neovim.nvim
flatpak override --user --nofilesystem=host io.neovim.nvim
flatpak info --show-permissions io.neovim.nvim # confirm permissions are changed

# first startup to create .var 
flatpak run --command=/bin/bash io.neovim.nvim -c "exit"

# copy config into flatpak 
rm -rf "$HOME/.var/app/io.neovim.nvim/config/nvim" || true
cp -r config/nvim  "$HOME/.var/app/io.neovim.nvim/config/"
rm -rf "$HOME/.var/app/io.neovim.nvim/data/*" || true
cp -r data/* "$HOME/.var/app/io.neovim.nvim/data/"

# add nvim alias
printf "\nalias nvim='flatpak run --filesystem=\$PWD io.neovim.nvim '\n" >> "$HOME/.bashrc"
