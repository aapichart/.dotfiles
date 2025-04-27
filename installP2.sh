#!/usr/bin/bash

if [ $SHELL != /bin/zsh ] || [ $REINSTALL_NIX == "TRUE" ]; then
# install packages
    # source nix
    . $HOME/.nix-profile/etc/profile.d/nix.sh

    nix-env -iA nixpkgs.zsh 
    nix-env -iA nixpkgs.sshfs 
    nix-env -iA nixpkgs.tmuxinator
    nix-env -iA nixpkgs.conky 
    nix-env -iA nixpkgs.terminator 
    nix-env -iA nixpkgs.graphicsmagick 
    nix-env -iA nixpkgs.lf 
    nix-env -iA nixpkgs.gcc 
    nix-env -iA nixpkgs.htop 
    nix-env -iA nixpkgs.yarn 
    #nix-env -iA nixpkgs.nodejs_23 
    nix-env -iA nixpkgs.xsel 
    nix-env -iA nixpkgs.xclip 
    nix-env -iA nixpkgs.fzf 
    nix-env -iA nixpkgs.lazygit 
    nix-env -iA nixpkgs.ripgrep 
    nix-env -iA nixpkgs.bat 
    nix-env -iA nixpkgs.gtop 
    nix-env -iA nixpkgs.gping 
    nix-env -iA nixpkgs.neofetch 
    nix-env -iA nixpkgs.tree 
    nix-env -iA nixpkgs.cmatrix 
    nix-env -iA nixpkgs.nmap 
    nix-env -iA nixpkgs.postgresql 
    nix-env -iA nixpkgs.sqlite 
    nix-env -iA nixpkgs.pv 
    nix-env -iA nixpkgs.fd 
    nix-env -iA nixpkgs.ranger 
    nix-env -iA nixpkgs.jq 
    nix-env -iA nixpkgs.nfs-utils 
    nix-env -iA nixpkgs.pandoc 
    nix-env -iA nixpkgs.zathura 
    nix-env -iA nixpkgs.bmon 
    nix-env -iA nixpkgs.iftop 
    nix-env -iA nixpkgs.nload 
    nix-env -iA nixpkgs.vpnc 

    echo "1st Stage - Installation is done .................!! "
fi

if [ $SHELL != /bin/zsh ] || [ $REINSTALL_NIX == "TRUE" ]; then
    nix-env -iA nixpkgs.uv
    nix-env -iA nixpkgs.python312Packages.pynvim
    nix-env -iA nixpkgs.python312Packages.pip-api 
    nix-env -iA nixpkgs.python312Packages.virtualenv 
    #nix-env -iA nixpkgs.pipenv 
    nix-env -iA nixpkgs.python312Packages.tree-sitter 
    nix-env -iA nixpkgs.python312Packages.flake8 
    nix-env -iA nixpkgs.vimPlugins.LanguageClient-neovim
    nix-env -iA nixpkgs.tree-sitter 
    nix-env -iA nixpkgs.wl-clipboard 
    nix-env -iA nixpkgs.julia 
    nix-env -iA nixpkgs.lua51Packages.lua 
    nix-env -iA nixpkgs.lua51Packages.luarocks 
    #nix-env -iA nixpkgs.lua52Packages.lua 
    #nix-env -iA nixpkgs.lua52Packages.luarocks 
    nix-env -iA nixpkgs.lua52Packages.luacheck 
    nix-env -iA nixpkgs.sumneko-lua-language-server
    nix-env -iA nixpkgs.vimPlugins.nvim-treesitter-parsers.regex 
    nix-env -iA nixpkgs.cargo 
    nix-env -iA nixpkgs.php82Packages.composer 
    #nix-env -iA nixpkgs.jdt-language-server 
        # nixpkgs.java-language-server \
    nix-env -iA nixpkgs.jdk22 
    nix-env -iA nixpkgs.php82 
    nix-env -iA nixpkgs.stylua 
    nix-env -iA nixpkgs.eslint_d 
    nix-env -iA nixpkgs.prettierd 
    nix-env -iA nixpkgs.figlet 
    nix-env -iA nixpkgs.go 
    nix-env -iA nixpkgs.gotools 
    nix-env -iA nixpkgs.gopls 
    nix-env -iA nixpkgs.go-outline 
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

if [ $SHELL != /bin/zsh ] || [ $REINSTALL_NIX == "TRUE" ]; then
  # Install Kitty terminal for graphic user
  # Check whether Kitty already installed or not
  if [ -f ~/.local/bin/kitty ]; then
    echo "Kitty is ready to rock...!!!!"
  else
    if [ -f ./kitty/.config/kitty/autoInstallKitty.sh ]; then
      echo "Kitty auto Installer exist.  Prepare for installation.....!!"
      ./kitty/.config/kitty/autoInstallKitty.sh
    fi
  fi
  # This setup is used for python3
  if [ -f ~/.nix-profile/bin/uv ]; then
    uv python install 3.12 --default --preview
  else
    echo "Error: Install uv have problem ........!!!!! "
  fi
  # This setup is for vpnc
  if [ -f /etc/vpnc ]; then
    sudo cp ./vpnc/default.conf /etc/vpnc/default.conf
    sudo chown apichart:apichart /etc/vpnc
    sudo chown apichart:apichart /etc/vpnc/default.conf
  else
    sudo mkdir -p /etc/vpnc/
    sudo cp ./vpnc/default.conf /etc/vpnc/default.conf
    sudo chown apichart:apichart /etc/vpnc
    sudo chown apichart:apichart /etc/vpnc/default.conf
  fi
  echo "3rd Stage - Installation Process are done......................!! "
fi

if [ $SHELL != /bin/zsh ] || [ $REINSTALL_NIX == "TRUE" ]; then
  echo "Configuration Process start .......................!! "
  # add zsh to valid login shells
  command -v zsh | sudo tee -a /etc/shells

    # stow any dot config modules
  stow git
  if [ -f "$HOME/.zshrc" ]; then
    rm -rf $HOME/.zshrc
  fi
  stow zsh
  #stow nvim
  #stow nvim.lazy
  stow nvim.startup
  #stow nvim.22
  stow tmux
  stow tmuxinator
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

  # Install kitty
  sudo ./kitty/.config/kitty/autoInstallKitty.sh

  # This setup is for tmuxifier
  git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier/
  echo "Done cloning code for tmuxifier.....................!! "

  # This setup is for tpm -- It is used to auto install any plugins for tmux
  if [ -f ~/.tmux/plugins/tpm/ ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
  else
    mkdir -p ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/
  fi

  # This setup is for t (tmux session manager)
  ln -s ~/.tmux/plugins/t-smart-tmux-session-manager/bin/t ~/.local/bin/t
  echo "Done cloning code for tpm.......................!!"

  # This setup is for catppuccin tmux theme
  if [ -f ~/.tmux/plugins/catppuccin/ ]; then
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
  if [ -f fonts ]; then 
    rm -rf fonts
  fi
  git clone https://github.com/powerline/fonts.git --depth=1
  sh ./fonts/install.sh
  sudo fc-cache -fv
  # clean up directory
  rm -rf fonts

  # Set up ohmyzsh for managing theme and  command line prompt
  if [ -f "$HOME/.oh-my-zsh" ]; then
    rm -rf $HOME/.oh-my-zsh
  fi
  curl -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --no-daemon
  if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
    cp $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
  fi
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
