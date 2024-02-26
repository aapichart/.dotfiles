if [ $SHELL = "/usr/bin/bash" ] || [ $SHELL = "/bin/bash" ] || [ $SHELL = "/bin/sh" ] || [ $REINSTALL_NIX = "TRUE" ]; then

# install packages
    nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.conky \
        nixpkgs.terminator \
        nixpkgs.lf \
        nixpkgs.gcc \
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
        nixpkgs.luarocks \
        nixpkgs.figlet \
        nixpkgs.go \
        nixpkgs.gotools \
        nixpkgs.gopls \
        nixpkgs.go-outline \
        #nixpkgs.gocode \
        nixpkgs.gopkgs \
        #nixpkgs.gocode-gomod \
        nixpkgs.godef \
        nixpkgs.golint \
        nixpkgs.typescript


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
  
    # use zsh as default shell
    chsh -s $(which zsh) $USER

    # bundle zsh plugins
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

fi

# Set up MesloLGS with devicons for vim and many app's glyph
sudo cp $HOME/.local/share/fonts/*.ttf /usr/local/share/fonts
sudo cp $HOME/.local/share/fonts/*.otf /usr/local/share/fonts
#sudo cd /usr/local/share/fonts
sudo fc-cache -fv
    

# Need to reboot the system
read -p "Finish Installation Process, Please reboot the system: (y/n) " check
if [ "$check" = "y" ]; then
   reboot
else
   echo "Finish Installation Process !!!!" 
fi
