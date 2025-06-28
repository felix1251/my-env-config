## My Environment Config

Clone Repo

```
git clone https://github.com/felix1251/my-nvim-config.git temp
mv temp/* ~/.config/
rm -rf temp
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
