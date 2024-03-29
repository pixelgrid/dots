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
nix-env -iA nixpkgs.nix-direnv
nix-env -iA nixpkgs.fish

# languages
nix-env -iA nixpkgs.nodejs
nix-env -iA nixpkgs.erlang
nix-env -iA nixpkgs.elixir

# get the repo with my dotfiles
git clone https://github.com/pixelgrid/dots.git /tmp/dots

#setup oh my tmux
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
cp /tmp/dots/.tmux.conf.local $HOME/

export PATH=$HOME/.nix-profile/bin:$PATH

#setup zsh as our shell
sudo chsh -s $(which fish) $USER

# run nix.sh on every shell init
# cp /tmp/dots/.zshrc $HOME/.zshrc

#neovim
mkdir -p ~/.config/nvim
cp /tmp/dots/init.lua $HOME/.config/nvim/

# needed for nix-direnv setup
echo "source \$HOME/.nix-profile/share/nix-direnv/direnvrc" > $HOME/.direnvrc
