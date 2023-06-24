export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
#$LANG=en_US.UTF-8 $LC_ALL= $LC_CTYPE=C.UTF-8
export TERM="screen-256color"
EDITOR='nvim'
# export variable for nvim
export MYVIMRC=$HOME/.config/nvim/init.lua
export XDG_CONFIG_DIRS=$HOME/.config
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

#use to controll install.sh under .dotfiles folder to re-install nix environment or not
export REINSTALL_NIX=FALSE

# use nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# This is all setting about LF - file manager
# Source these file for icons on lf
source ~/.config/lf/icons
if [ -f ~/.local/bin/lfcd.sh ]; then
    source ~/.local/bin/lfcd.sh 
fi
bindkey -s '^o' 'lfcd\n'  # zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# Alias, some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -la'
alias f='fzf'
alias zr='source ~/.zshrc'
alias sv='source ~/.config/nvim/init.vim'
alias python='python3'
alias pip='pip3'
alias v='nvim'
alias rng='ranger'
alias ga='git add .'
alias gs='git status'
alias lf='lfcd'
alias hms='home-manager switch'
# Global alias
alias -g F=' | fzf'
alias -g L=' | less'
alias -g J=' | jq'

# suffix alias
alias -s py='nvim'
alias -s js='nvim'
alias -s sql='nvim'

# function alias
gcom() {
    git commit -m $1
}

cdd() {
    cd $1 && ls
}

# source plugins
source ~/.zsh_plugins.sh

# setting for direnv 
eval "$(direnv hook zsh)"

#source command for fzf keybinding
# source ~/.config/nvim/autoload/plugged/fzf/shell/key-bindings.zsh
# source ~/.config/nvim/autoload/plugged/fzf/shell/completion.zsh 
#source command for ranger merge with fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# This is set for stopping powerlevel9k warning message
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

export PATH="$HOME/.poetry/bin:$PATH"


if [ -e /home/apichart/.nix-profile/etc/profile.d/nix.sh ]; then . /home/apichart/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
