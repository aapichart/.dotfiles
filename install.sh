if [ $SHELL = "/usr/bin/bash" ] || [ $SHELL = "/bin/bash" ] || [ $SHELL = "/bin/sh" ] || [ $REINSTALL_NIX = "TRUE" ]; then
    # If reinstall nix we need to backup old nix directory
    if [ $REINSTALL_NIX = "TRUE" ]; then
        [ -d "/nix" ] && sudo mv /nix /nix.old 
        [ -f "$HOME/.nix-channels" ] && mv $HOME/.nix-channels $HOME/.nix-channels.old 
        [ -d "$HOME/.nix-defexpr" ] && mv $HOME/.nix-defexpr $HOME/.nix-defexpr.old 
        [ -L "$HOME/.nix-profile" ] && mv $HOME/.nix-profile $HOME/.nix-profile.old 
        if [ -d "$HOME/.config/home-manager" ]; then
		mv $HOME/.config/home-manager $HOME/.config/home-manager-old
		rm $HOME/.local/state/nix/profiles/*
		rm $HOME/.local/state/nix/profiles/home-manager*
		rm $HOME/.local/state/home-manager/gcroots/current-home 
	fi	
    fi
    
    # 1st phase installation - we will install nix package management and restart then run this install.sh again 
    # to install other utilities
    # install nix
    sudo mkdir /nix
    sudo chown apichart:apichart /nix

    # Install nix 
    curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
    # source nix
    . $HOME/.nix-profile/etc/profile.d/nix.sh

    # install packages
    nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.antibody \
        nixpkgs.git \
        nixpkgs.tmux \
	    nixpkgs.direnv \
        nixpkgs.stow \
        nixpkgs.conky \
        nixpkgs.terminator \
        nixpkgs.lf \
    nixpkgs.gcc \
	  nixpkgs.neovim \
    nixpkgs.htop \
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
    nixpkgs.tree \
    nixpkgs.cmatrix \
    nixpkgs.nmap \
    nixpkgs.postgresql \
    nixpkgs.python310Full \
    nixpkgs.python310Packages.pip \
    nixpkgs.virtualenv \
    nixpkgs.pipenv \
    nixpkgs.pv \
    nixpkgs.fd \
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

    # add zsh to valid login shells
    command -v zsh | sudo tee -a /etc/shells

    # stow any dot config modules
    stow git
    stow zsh
    #stow nvim
    stow nvim.lazy
    #stow nvim.22
    stow tmux
    stow tmuxifier
    stow lfconf
    stow direnv
    stow deskpi
    stow gtk-3.0
    stow selected_editor
    stow autostart
    stow startupScript
    stow rasp4utils
    stow myfonts
    stow krohnkite
    stow terminator
    stow conky
    
    # Install nix home-manager - This is a tool for manage nix installaton
    #nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
    # update nix channel
    #nix-channel --update
    # Install home-manager
    #nix-shell '<home-manager>' -A install
    # Source this home-manager session files
    #. $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    
    # This routine use for config home-manager
    #stow home-manager
    #if [ -f "$HOME/.config/home-manager/home.nix" ]; then 
    #    rm -f $HOME/.config/home-manager/home.nix
    #    mv $HOME/.config/home-manager/home.nix.so $HOME/.config/home-manager/home.nix 
    #fi
    # Run home-manager auto install
    #home-manager switch 
   
   # Set up MesloLGS with devicons for vim and many app's glyph
    sudo cp $HOME/.local/share/fonts/*.ttf /usr/local/share/fonts
    #sudo cd /usr/local/share/fonts
    sudo fc-cache -fv
    
    # Reset re-install nix variable
    [ $REINSTALL_NIX="TRUE" ] && export REINSTALL_NIX="FALSE"
    
    # use zsh as default shell
    chsh -s $(which zsh) $USER

    # bundle zsh plugins
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
fi

