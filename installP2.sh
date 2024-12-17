if [ $SHELL = "/usr/bin/bash" ] || [ $SHELL = "/bin/bash" ] || [ $SHELL = "/bin/sh" ] || [ $REINSTALL_NIX = "TRUE" ]; then

# install packages
    nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.conky \
        nixpkgs.terminator \
        nixpkgs.kitty \
        nixpkgs.ueberzug \
        nixpkgs.graphicsmagick \
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
        nixpkgs.sqlite \
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
        nixpkgs.python312Packages.python \
        nixpkgs.python312Packages.pip \
        nixpkgs.python312Packages.pip-api \
        nixpkgs.python312Packages.virtualenv \
        nixpkgs.pipenv \
        nixpkgs.python312Packages.tree-sitter \
        nixpkgs.python312Packages.flake8 \
        nixpkgs.python312Packages.poetry-core \
        nixpkgs.tree-sitter \
        nixpkgs.julia \
        nixpkgs.lua51Packages.lua \
        nixpkgs.lua52Packages.lua \
        nixpkgs.lua52Packages.luarocks \
        nixpkgs.lua52Packages.luacheck \
        nixpkgs.vimPlugins.nvim-treesitter-parser.regex \
        nixpkgs.cargo \
        nixpkgs.php83Packages.composer \
        nixpkgs.jdt-language-server \
        nixpkgs.java-language-server \
        nixpkgs.jdk22 \
        nixpkgs.php83 \
        nixpkgs.stylua \
        nixpkgs.eslint_d \
        nixpkgs.prettierd \
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
        
    # To check nix avilable packages for nix-env using the following command
    # nix-env -qaP -P '.*prettierd.*'
    #
    # To check whether existing package is in which location on linux system using the following command
    # nix-env -q --out-path | grep prettierd
    #
    # To uninstall the package above using the following command
    # nix-env --uninstall fsouza-prettierd-0.25.3
    # or
    # nix-env -e fsouza-prettierd-0.25.3
    #
    # To install the package
    # nix-env -iA nixpkgs.prettierd
    #
    # To check packages which already installed in your system
    # nix-env -q | grep prettierd

    # add zsh to valid login shells
    command -v zsh | sudo tee -a /etc/shells

    # stow any dot config modules
    stow git
    [ -f $HOME/.zshrc] || rm -rf $HOME/.zshrc
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
    stow kitty
    stow conky
  
    # use zsh as default shell
    chsh -s $(which zsh) $USER

    # bundle zsh plugins
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh


    # Set up MesloLGS with devicons for vim and many app's glyph
    # This will solve the powerline prompt strange icon issues
    sudo cp $HOME/.local/share/fonts/*.ttf /usr/local/share/fonts
    sudo cp $HOME/.local/share/fonts/*.otf /usr/local/share/fonts
    #sudo cd /usr/local/share/fonts
    sudo fc-cache -fv

    # Install PowerlineFont
    [ -f fonts ] || rm -rf fonts
    git clone https://github.com/powerline/fonts.git --depth=1
    sh ./fonts/install.sh
    sudo fc-cache -fv
    # clean up directory
    rm -rf fonts

    # Set up ohmyzsh for managing theme and  command line prompt
    [ -f $HOME/.oh-my-zsh ] || rm -rf $HOME/.oh-my-zsh
    curl -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --no-daemon
    [ -f $HOME/.zshrc.pre-oh-my-zsh] || cp $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc  
    echo ""
    echo ""

fi

# Need to reboot the system
read -p "Finish Installation Process, Please reboot the system: (y/n) " check
if [ "$check" = "y" ]; then
   reboot
else
  echo "Finish Installation Process ( without reboot - some features may not be set )!!!!" 
fi
