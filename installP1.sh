#!/usr/bin/bash

#if [ $SHELL = "/usr/bin/bash" ] || [ $SHELL = "/bin/bash" ] || [ $SHELL = "/bin/sh" ] || [ $REINSTALL_NIX = "TRUE" ]; then
    
    # install nix
    sudo mkdir /nix
    sudo chown -R $USER:$USER /nix

    # Install nix 
    curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
    # source nix
    . $HOME/.nix-profile/etc/profile.d/nix.sh

    # install packages
    nix-env -iA \
        nixpkgs.antibody \
        nixpkgs.git \
        nixpkgs.tmux \
	      nixpkgs.direnv \
        nixpkgs.neovim \
        nixpkgs.stow 

    # Need to reboot the system
    read -p "Please reboot the system, and then run installP2.sh (y/n)" check
    if [ "$check" = "y" ]; then
       reboot
    else
       echo "Please reboot system and run installP2.sh!!!!"
    fi
#fi

