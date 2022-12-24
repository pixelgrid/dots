if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
  .  $HOME/.nix-profile/etc/profile.d/nix.sh
  export PATH=$HOME/.nix-profile/bin:$PATH
fi
# Source Prezto. (currently handled by creating symlinks on install.sh
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi
