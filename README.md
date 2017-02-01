# Setup

#### ZSH
```bash
$ ln -s "$PWD/zshrc" "$HOME/.zshrc"
$ ln -s "$PWD/zsh" "$HOME/.zsh"
```

#### The prompt: [pure](https://github.com/sindresorhus/pure)
```bash
$ fpath=( "$HOME/.zfunctions" $fpath )
$ ln -s "$PWD/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
$ ln -s "$PWD/async.zsh" "$HOME/.zfunctions/async"
```
