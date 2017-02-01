# Setup

#### zsh
```bash
$ ln -s "$PWD/zshrc" "$HOME/.zshrc"
$ ln -s "$PWD/zsh" "$HOME/.zsh"
$ cd zsh
$ git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
```

#### tmux
```bash
$ ln -s "$PWD/tmux.conf" "$HOME/.tmux.conf"
$ ln -s "$PWD/tmux-spotify-info" "$HOME/.tmux-spotify-info"
```
#### The prompt: [pure](https://github.com/sindresorhus/pure)
```bash
$ fpath=( "$HOME/.zfunctions" $fpath )
$ ln -s "$PWD/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
$ ln -s "$PWD/async.zsh" "$HOME/.zfunctions/async"
```
