#!/bin/bash

if [[ $SHELL != /bin/zsh ]] || [[ $REINSTALL_NIX == "TRUE" ]]; then
# install packages
    # source nix
    . $HOME/.nix-profile/etc/profile.d/nix.sh

    nix-env -iA \
        nixpkgs.zsh \
        nixpkgs.conky \
        nixpkgs.terminator \
        nixpkgs.graphicsmagick \
        nixpkgs.lf \
        nixpkgs.gcc \
        nixpkgs.htop \
        nixpkgs.yarn \
        nixpkgs.nodejs_23 \
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
        nixpkgs.vpnc 

    echo "1st Stage - Installation is done .................!! "
fi

if [[ $SHELL != /bin/zsh ]] || [[ $REINSTALL_NIX == "TRUE" ]]; then
    nix-env -iA nixpkgs.python312Full \
        nixpkgs.python312Packages.python \
        nixpkgs.python312Packages.pip \
        nixpkgs.python312Packages.pip-api \
        nixpkgs.python312Packages.virtualenv \
        nixpkgs.pipenv \
        nixpkgs.python312Packages.tree-sitter \
        nixpkgs.python312Packages.flake8 \
        nixpkgs.python312Packages.poetry-core \
        nixpkgs.tree-sitter \
        nixpkgs.wl-clipboard \
        nixpkgs.julia \
        nixpkgs.lua51Packages.lua \
        nixpkgs.lua51Packages.luarocks \
        nixpkgs.lua52Packages.lua \
        nixpkgs.lua52Packages.luarocks \
        nixpkgs.lua52Packages.luacheck \
        nixpkgs.vimPlugins.nvim-treesitter-parsers.regex \
        nixpkgs.cargo \
        nixpkgs.php83Packages.composer 
        # nixpkgs.jdt-language-server \
        # nixpkgs.java-language-server \
        # nixpkgs.jdk22 \
        # nixpkgs.php83 \
    nix-env -iA nixpkgs.stylua \
        nixpkgs.eslint_d \
        nixpkgs.prettierd \
        nixpkgs.figlet \
        nixpkgs.go \
        nixpkgs.gotools \
        nixpkgs.gopls \
        nixpkgs.go-outline 
        #nixpkgs.gocode \
        # nixpkgs.gopkgs \
        #nixpkgs.gocode-gomod \
        # nixpkgs.godef \
        # nixpkgs.golint \
        # nixpkgs.typescript
        
    # To check nix avilable packages for nix-env using the following command
    # nix-env -qaP '.*prettierd.*'
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
  echo "2nd Stage - Installation Process are done......................!! "
fi

if [[ $SHELL != /bin/zsh ]] || [[ $REINSTALL_NIX == "TRUE" ]]; then
  # Install Kitty terminal for graphic user
  # Check whether Kitty already installed or not
  if [[ -f ~/.local/bin/kitty ]]; then
    echo "Kitty is ready to rock...!!!!"
  else
    if [[ -f ./kitty/.config/kitty/autoInstallKitty.sh ]]; then
      echo "Kitty auto Installer exist.  Prepare for installation.....!!"
      ./kitty/.config/kitty/autoInstallKitty.sh
    fi
  fi
  # This setup is for vpnc
  if [[ -f /etc/vpnc ]]; then
    sudo cp ./vpnc/default.conf /etc/vpnc/default.conf
    sudo chown chart:chart /etc/vpnc
    sudo chown chart:chart /etc/vpnc/default.conf
  else
    sudo mkdir -p /etc/vpnc/
    sudo cp ./vpnc/default.conf /etc/vpnc/default.conf
    sudo chown chart:chart /etc/vpnc
    sudo chown chart:chart /etc/vpnc/default.conf
  fi
  echo "3rd Stage - Installation Process are done......................!! "
fi

if [[ $SHELL != /bin/zsh ]] || [[ $REINSTALL_NIX == "TRUE" ]]; then
  echo "Configuration Process start .......................!! "
  # add zsh to valid login shells
  command -v zsh | sudo tee -a /etc/shells

    # stow any dot config modules
  stow git
  if [[ -f "$HOME/.zshrc" ]]; then
    rm -rf $HOME/.zshrc
  fi
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


  # This setup is for tmuxifier
  git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier/
  echo "Done cloning code for tmuxifier.....................!! "

  # This setup is for tpm -- It is used to auto install any plugins for tmux
  if [[ -f ~/.tmux/plugins/tpm/ ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
  else
    mkdir -p ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
  fi

  # This setup is for t (tmux session manager)
  ln -s ~/.tmux/plugins/t-smart-tmux-session-manager/bin/t ~/.local/bin/t
  echo "Done cloning code for tpm.......................!!"

  # This setup is for catppuccin tmux theme
  if [[ -f ~/.tmux/plugins/catppuccin/ ]]; then
    git clone https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/
  else
    mkdir -p ~/.tmux/plugins/catppuccin
    git clone https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/
  fi
  echo "Done cloining cappuccin theme..................!!"


  # Set up MesloLGS with devicons for vim and many app's glyph
  # This will solve the powerline prompt strange icon issues
  sudo cp $HOME/.local/share/fonts/*.ttf /usr/local/share/fonts
  sudo cp $HOME/.local/share/fonts/*.otf /usr/local/share/fonts
  #sudo cd /usr/local/share/fonts
  sudo fc-cache -fv

  # Install PowerlineFont
  if [[ -f fonts ]]; then 
    rm -rf fonts
  fi
  git clone https://github.com/powerline/fonts.git --depth=1
  sh ./fonts/install.sh
  sudo fc-cache -fv
  # clean up directory
  rm -rf fonts

  # Set up ohmyzsh for managing theme and  command line prompt
  if [[ -f "$HOME/.oh-my-zsh" ]]; then
    rm -rf $HOME/.oh-my-zsh
  fi
  curl -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --no-daemon
  if [[ -f "$HOME/.zshrc.pre-oh-my-zsh" ]]; then
    cp $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
  fi
  echo ""
  echo ""
fi

# Need to reboot the system
read -p "Finish Installation Process, Please reboot the system: (y/n) " check
if [[ "$check" = "y" ]]; then
   reboot
else
  echo "Finish Installation Process ( without reboot - some features may not be set )!!!!" 
fi
