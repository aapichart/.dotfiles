#!/usr/bin/env zsh

rm -rf $HOME/.zsh_plugins.sh
set +x

autoload -Uz compinit && compinit
source $HOME/.nix-profile/share/antidote/antidote.zsh
#antidote load $HOME/.zsh_plugins.txt > /dev/null 2>$1
antidote bundle <$HOME/.zsh_plugins.txt >$HOME/.zsh_plugins.sh 
