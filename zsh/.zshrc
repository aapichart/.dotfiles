export TERM="xterm-256color"
EDITOR='nvim'
# Preferred editor for local and remote session
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi
# export variable for nvim
export MYVIMRC=$HOME/.config/nvim/init.vim
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
# This is all setting about LF - file manager
# Source these file for icons on lf
source ~/.config/lf/icons
LFCD="~/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
   source "$LFCD"
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

# source plugins
source ~/.zsh_plugins.sh

# Alias, some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -la'
alias f='fzf'
alias zr='source ~/.zshrc'
alias sv='source ~/.config/nvim/init.vim'
alias py='python3'
alias v='nvim'
alias rg='ranger'
alias ga='git add .'
alias gs='git status'
alias gp='git push -u origin main'

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


# use nix
if [ -e /home/apichart/.nix-profile/etc/profile.d/nix.sh ]; then . /home/apichart/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

