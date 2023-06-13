#My dotfiles
- This is the shell script build for automatically install all dependencies
-  for developing environment on linux based machine - especially pop_os

* Installation
- We have to run the script twice or two phase executions.
- 1. 1st phase, we try to install nix (as a package management)
    - > sh install.sh
    - > reboot
    - After reboot, you may ask for configuration zsh shell.  After done, goto 2nd phase
- 2. 2nd phase, we try to use nix install all tools and dependencies.
    - > sh install.sh
- That should be cover all requirement 
- PS. We need to git clone this package into our home folder ex. /home/tony 
    the package will be kept at /home/tony/.dotfiles  => This is the hidden folder
- After done installation for os part.
- 1. NVIM
    - open any text file 
    - then run :PackerInstall 
      (This will install all plugin for nvim)
    - and run :checkhealth 
      (This will check all other plugins need for nvim ex. npm, nodejs, lsp - language Servers)
