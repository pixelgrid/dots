#!/usr/bin/bash

sudo mkdir /nix
sudo chown $USER /nix

#install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

 . $HOME/.nix-profile/etc/profile.d/nix.sh

#packages
nix-env -iA nixpkgs.zsh
nix-env -iA nixpkgs.git
nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.tmux
nix-env -iA nixpkgs.yarn
nix-env -iA nixpkgs.fzf
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.bat
nix-env -iA nixpkgs.direnv
nix-env -iA nixpkgs.lazygit
nix-env -iA nixpkgs.gcc
nix-env -iA nixpkgs.asdf

# languages
nix-env -iA nixpkgs.nodejs
nix-env -iA nixpkgs.erlang
nix-env -iA nixpkgs.elixir

# get the repo with my dotfiles
git clone https://github.com/pixelgrid/dots.git /tmp/dots

export PATH=$HOME/.nix-profile/bin:$PATH

#setup zsh as our shell
sudo chsh -s $(which zsh) $USER

# run nix.sh on every shell init
cp /tmp/dots/.zshrc $HOME/.zshrc
cp /tmp/dots/.tmux.conf $HOME/.tmux.conf

#neovim
mkdir -p ~/.config/nvim
cp /tmp/dots/init.lua $HOME/.config/nvim/
