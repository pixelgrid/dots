if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
  .  $HOME/.nix-profile/etc/profile.d/nix.sh
  export PATH=$HOME/.nix-profile/bin:$PATH
fi
. $HOME/.asdf/asdf.sh
