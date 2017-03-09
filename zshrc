autoload -U colors && colors
autoload -Uz compinit;$_; zstyle ':completion:*' menu select
setopt autocd appendhistory extendedglob correct

# Run z to switch between folders
. ~/.zsh/z.sh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt incappendhistory
#plugins=(git node npm bower brew heroku)

# aliases
alias vi=nvim
alias vim=nvim
alias tls="tmux ls"
alias tnew="tmux new -s"
alias tat="tmux a -t"
alias gs="git status"
alias gd="git diff"
alias gp="git push"

source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
# zsh-history-substring key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# automatically cd into a directory after making it
function mkcd {
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load theme
autoload -U promptinit; promptinit
prompt pure
# Load plugins
source ~/.zsh/vi-mode.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
