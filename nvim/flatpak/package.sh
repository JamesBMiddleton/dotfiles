#!/bin/bash

set -o pipefail

cd "$(dirname "$0")" || exit 1
root_dir=$PWD

rm -rf config/* || true
cp -r "$HOME/.config/nvim" ./config

rm -rf data/* || true
cp -r "$HOME/.local/share/nvim/" ./data

# make symbolic links relative !! MAY NEED UPDATING !!
#
# for symlink in $(find ~/.local/share/nvim -type l); do
#     echo $symlink
#     readlink $symlink
#     echo
# done
#
rm ./data/nvim/mason/bin/*
cd ./data/nvim/mason/bin/ || exit 1;
ln -s ../packages/clangd/clangd_17.0.3/bin/clangd clangd
ln -s ../packages/pyright/node_modules/.bin/pyright-langserver pyright-langserver
ln -s ../packages/pyright/node_modules/.bin/pyright pyright
ln -s ../packages/rust-analyzer/rust-analyzer-x86_64-unknown-linux-gnu rust-analyzer
ln -s ../packages/bash-language-server/node_modules/.bin/bash-language-server bash-language-server
ln -s ../packages/shellcheck/shellcheck shellcheck
cd "$root_dir" || exit 1
rm ./data/nvim/mason/share/mason-schemas/lsp/*
cd ./data/nvim/mason/share/mason-schemas/lsp/ || exit 1
ln -s ../../../../packages/clangd/mason-schemas/lsp.json clangd.json
ln -s ../../../../packages/rust-analyzer/mason-schemas/lsp.json rust-analyzer.json
ln -s ../../../../packages/pyright/mason-schemas/lsp.json pyright.json
ln -s ../../../../packages/bash-language-server/mason-schemas/lsp.json bash-language-server.json
cd "$root_dir" || exit 1

# include cargo
mkdir ./data/cargo
cp -r "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/*" ./data/cargo/

# include ripgrep (just adding it somewhere already in $PATH)
cp /usr/bin/rg ./data/nvim/mason/bin/

rm nvim_flatpak_pkg.tar
tar -cvf nvim_flatpak_pkg.tar config data install.sh
