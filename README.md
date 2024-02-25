#My dotfiles
- This is the shell script build for automatically install all dependencies
-  for developing environment on linux based machine - especially pop_os

* Installation
- We have to run the script twice or two phase executions.
- 1. 1st phase, we try to install nix (as a package management)
    - > sh installP1.sh
    - > reboot
    - After reboot, you may ask for configuration zsh shell.  After done, goto 2nd phase
- 2. 2nd phase, we try to use nix install all tools and dependencies.
    - > sh installP2.sh
- That should be cover all requirement 
- PS. We need to git clone this package into our home folder ex. /home/tony 
    the package will be kept at /home/tony/.dotfiles  => This is the hidden folder
- After done installation for os part.
- 1. NVIM
    - open any text file 
    1.1 run :PackerInstall 
      (This will install all plugin for nvim)
    1.2 run :checkhealth 
      (This will check all other plugins need for nvim ex. npm, nodejs, lsp - language Servers)
      or you can run 
      :checkhealth treesitter 
      for checking treesitter plugin whether there are any errors
    1.3 run :Mason
      - This will let you install any language servers that you want ex. pyright for python
    1.4 run :npm install -g pyright
      - Because treesitter using pyright for parser python language
    1.5 run :npm install -g bash-parser
            :TSInstall bash
      - Because treesitter using bash-parser for parser bash language
    1.6 run :npm install -g markdown-parser
            :TSInstall markdown
      - Because treesitter using markdown-parser for parser md language
    1.7 run :TSInstall c
      - This will install c parser for you
      - You should install c, gcc, html, python, etc.
    
