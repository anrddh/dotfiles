# Setup

If anyone actually cares, these instructions are *probably* outdated and I'm too
lazy to update them.

### zsh
```bash
ln -s "$PWD/zshrc" "$HOME/.zshrc"
ln -s "$PWD/zsh" "$HOME/.zsh"
```

### tmux
```bash
ln -s "$PWD/tmux.conf" "$HOME/.tmux.conf"
ln -s "$PWD/tmux-spotify-info" "$HOME/.tmux-spotify-info"
```

### nvim
```bash
mkdir -p "$HOME/.config/nvim"
ln -s "$PWD/init.vim" "$HOME/.config/nvim/init.vim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Run :PlugInstall in vim
```

### The prompt: [pure](https://github.com/sindresorhus/pure)
```bash
fpath=( "$HOME/.zfunctions" $fpath )
ln -s "$PWD/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
ln -s "$PWD/async.zsh" "$HOME/.zfunctions/async"
```
