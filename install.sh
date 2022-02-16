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
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.direnv \
    	nixpkgs.compton \
    	nixpkgs.gtop \
    	nixpkgs.gping \
	nixpkgs.neofetch \
	nixpkgs.conky \
    	nixpkgs.terminator \
    	nixpkgs.tree \

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# stow any dot config modules
stow git
stow zsh
stow nvim
stow deskpi
stow gtk-3.0

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
cp .zsh_plugins.txt ~/.zsh_plugins.txt
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh


