## My Environment Config

- [x] [Alacritty](https://alacritty.org/index.html)
- [x] TMUX
- [x] Neovim

Clone Repo

```
git clone git@github.com:felix1251/my-env-config.git ~/my-config
```

Create Symlink

```
chmod +x symlink.sh
```

```
./symlink.sh
```

### Troubleshoot (Ubuntu)

Tabnine Binary Issue

> Required Unzip package

```
sudo apt-get install unzip
```

```
bash ~/.local/share/nvim/site/pack/packer/start/tabnine-nvim/dl_binaries.sh
```

Telescope Live Grep not working

```
sudo apt-get install ripgrep
```

## TMUX

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
