#!/usr/bin/bash

#install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# force create .nix-profile
nix-env -q

#source nix
. ~/.nix-profile/etc/profile.d/nix.sh

#packages
nix-env -iA nixpkgs.zsh
nix-env -iA nixpkgs.git
nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.tmux
nix-env -iA nixpkgs.stow
nix-env -iA nixpkgs.yarn
nix-env -iA nixpkgs.fzf
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.bat
nix-env -iA nixpkgs.direnv
nix-env -iA nixpkgs.asdf
nix-env -iA nixpkgs.lazygit

#languages
nix-env -iA nixpkgs.nodejs
nix-env -iA nixpkgs.erlang
nix-env -iA nixpkgs.elixir

#setup zsh as our shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# run nix.sh on every shell init
touch $HOME/.zshrc

sudo tee -a "if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then .  $HOME/.nix-profile/etc/profile.d/nix.sh fi"
