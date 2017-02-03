autoload -U colors && colors
autoload -Uz compinit;$_; zstyle ':completion:*' menu select
setopt autocd appendhistory extendedglob correct

# Run z to switch between folders
. ~/.zsh/z.sh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
#plugins=(git node npm bower brew heroku)

# TEMP INCREASE STACK SIZE LIMIT
ulimit -S -s 60000

# aliases
alias vi=nvim
alias vim=nvim
alias tls="tmux ls"
alias tnew="tmux new -s"
alias tat="tmux a -t"
alias gs="git status"
alias gd="git diff"
alias gp="git push"

# automatically cd into a directory after making it
function mkcd {
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

# Load theme
autoload -U promptinit; promptinit
prompt pure
# Load plugins
source ~/.zsh/vi-mode.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
