# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.xclip \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.direnv \
    nixpkgs.compton \
    nixpkgs.gtop \
    nixpkgs.gping \
	nixpkgs.neofetch \
	nixpkgs.conky \
    nixpkgs.conky-all \ 
    nixpkgs.terminator \
    nixpkgs.tree \
    nixpkgs.cmatrix \
    nixpkgs.python39Packages.pip \
    nixpkgs.pv \
    nixpkgs.fd \
    nixpkgs.lf \
    nixpkgs.ranger \
    nixpkgs.jq \
    nixpkgs.nfsUtils \
    nixpkgs.pandoc \
    nixpkgs.figlet

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# stow any dot config modules
stow git
stow zsh
stow nvim
stow deskpi
stow gtk-3.0
stow terminator
stow tmux
stow conky
stow selected_editor
stow autostart
stow startupScript
stow rasp4utils
stow myfonts
stow lfconf
stow krohnkite

# use zsh as default shell
chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Set up MesloLGS with devicons for vim and many app's glyph
sudo cp ~/.local/share/fonts/*.ttf /usr/local/share/fonts
sudo cd /usr/local/share/fonts
sudo fc-cache -fv
