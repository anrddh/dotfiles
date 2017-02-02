autoload -U colors && colors
autoload -Uz compinit;$_; zstyle ':completion:*' menu select
setopt autocd appendhistory extendedglob correct

# Run z to switch between folders
. `brew --prefix`/etc/profile.d/z.sh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
#plugins=(git node npm bower brew heroku)

# TEMP INCREASE STACK SIZE LIMIT
ulimit -S -s 60000

export PATH="$PATH:/Users/awesomeaniruddh/.nvm/versions/node/v5.7.1/bin:/Users/awesomeaniruddh/.rvm/gems/ruby-2.2.1/bin:/Users/awesomeaniruddh/.rvm/gems/ruby-2.2.1@global/bin:/Users/awesomeaniruddh/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/mongod/bin:/opt/X11/bin:/Library/TeX/texbin:$HOME/.rvm/bin:/Users/awesomeaniruddh/.cargo/bin:/Users/awesomeaniruddh/anaconda3/bin:`yarn global bin`:/Users/awesomeaniruddh/dotfiles"

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

#
# ANTIGEN BUNDLES
#
source ~/.zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle vi-mode
antigen bundle lukechilds/zsh-nvm
antigen apply
