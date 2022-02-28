with (import <nixpkgs> {});
let
  my-python-packages = python-packages: with python-packages; [
    pandas
    requests
    # other python packages you want
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
mkShell {
  buildInputs = [
    python-with-my-packages
  ];
  shellHook = ''
    # Alias, some more ls aliases
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias ls='ls -la'
    alias f='fzf'
    alias zr='source ~/.zshrc'
    alias sv='source ~/.config/nvim/init.vim'
    alias py='python3'
    alias v='nvim'
    alias ga='git add .'
    alias gs='git status'
    alias gp='git push -u origin main'

    # function alias
    gcom() {
        git commit -m $1
    }

    mkdir -p .nix-node
    export NODE_PATH=$PWD/.nix-node
    export NPM_CONFIG_PREFIX=$PWD/.nix-node
    export PATH=$NODE_PATH/bin:$PATH
    '';
}
