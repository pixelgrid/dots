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
nix-env -iA nixpkgs.lazygit

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch
git clone https://github.com/pixelgrid/dots.git /tmp/dots

#setup zsh as our shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# run nix.sh on every shell init
cp /tmp/dots/.zshrc $HOME/.zshrc
cp /tmp/dots/.tmux.conf $HOME/.tmux.conf

exec zsh
source ~/.zshrc

#asdf managed languages
#nodejs
nix-env -i gpgme gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

#elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir latest
asdf global elixir latest

#erlang
if [[ "$OSTYPE" =~ ^darwin ]]; then
  brew install autoconf
  brew install openssl@1.1
elif then
  apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
fi

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang latest
asdf global erlang latest

#neovim
mkdir -p ~/.config/nvim
cp /tmp/dots/init.lua $HOME/.config/nvim/
