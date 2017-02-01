# Path to your oh-my-zsh installation.
autoload U colors && colors
export ZSH=/Users/awesomeaniruddh/.oh-my-zsh
. `brew --prefix`/etc/profile.d/z.sh

plugins=(git node npm bower brew heroku)

# TEMP INCREASE STACK SIZE LIMIT
ulimit -S -s 60000

# User configuration

export PATH="$PATH:/Users/awesomeaniruddh/.nvm/versions/node/v5.7.1/bin:/Users/awesomeaniruddh/.rvm/gems/ruby-2.2.1/bin:/Users/awesomeaniruddh/.rvm/gems/ruby-2.2.1@global/bin:/Users/awesomeaniruddh/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/mongod/bin:/opt/X11/bin:/Library/TeX/texbin:$HOME/.rvm/bin:/Users/awesomeaniruddh/.cargo/bin:/Users/awesomeaniruddh/anaconda3/bin:`yarn global bin`:/Users/awesomeaniruddh/dotfiles"
# export MANPATH="/usr/local/man:$MANPATH"

export RUST_SRC_PATH="/Users/awesomeaniruddh/rust/src"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="/Users/awesomeaniruddh/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# THEME
autoload -U promptinit; promptinit
prompt pure

alias vim=nvim
alias tls="tmux ls"
alias tnew="tmux new -s"
alias tat="tmux a -t"

fortune | cowsay

# Enable syntax highlighting in the prompt
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
