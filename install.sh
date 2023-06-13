if [ $SHELL = "/usr/bin/bash" ] || [ $SHELL = "/bin/bash" ] || [ $SHELL = "/bin/sh" ];
then
    # 1st phase installation - we will install nix package management and restart then run this install.sh again 
    # to install other utilities
    # install nix
    sudo mkdir /nix
    sudo chown apichart /nix
    curl -L https://nixos.org/nix/install | sh -s -- --no-daemon

    # source nix
    . ~/.nix-profile/etc/profile.d/nix.sh

    # install packages
    nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.antibody \
        nixpkgs.git \
        nixpkgs.neovim \
        nixpkgs.tmux \
	nixpkgs.direnv \
        nixpkgs.stow 

    # add zsh to valid login shells
    command -v zsh | sudo tee -a /etc/shells

    # stow any dot config modules
    stow git
    stow zsh
    stow nvim
    stow tmux
    stow lfconf
    stow direnv

    # use zsh as default shell
    chsh -s $(which zsh) $USER

    # bundle zsh plugins
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

    # Set up MesloLGS with devicons for vim and many app's glyph
    sudo cp ~/.local/share/fonts/*.ttf /usr/local/share/fonts
    sudo cd /usr/local/share/fonts
    sudo fc-cache -fv
else
    # 2nd phase installation - This phase we will focus on install utilities need for development
    # install packages
    nix-env -iA \
        nixpkgs.yarn \
        nixpkgs.nodejs_20 \
        nixpkgs.xsel \
        nixpkgs.xclip \
        nixpkgs.fzf \
        nixpkgs.lazygit \
        nixpkgs.ripgrep \
        nixpkgs.bat \
        nixpkgs.gtop \
        nixpkgs.gping \
        nixpkgs.neofetch \
        nixpkgs.conky \
        nixpkgs.terminator \
        nixpkgs.tree \
        nixpkgs.cmatrix \
        nixpkgs.nmap \
        nixpkgs.postgresql \
        nixpkgs.python39Packages.pip \
        nixpkgs.virtualenv \
        nixpkgs.pipenv \
        nixpkgs.pv \
        nixpkgs.fd \
        nixpkgs.lf \
        nixpkgs.ranger \
        nixpkgs.jq \
        nixpkgs.nfs-utils \
        nixpkgs.pandoc \
        nixpkgs.zathura \
        nixpkgs.bmon \
        nixpkgs.iftop \
        nixpkgs.nload \
        nixpkgs.vpnc \
        nixpkgs.figlet
    stow deskpi
    stow gtk-3.0
    stow terminator
    stow conky
    stow selected_editor
    stow autostart
    stow startupScript
    stow rasp4utils
    stow myfonts
    stow krohnkite
fi

