## NVIM Setup

Clone Repo

```shell
# go to root user path
$ cd ~/
$ mkdir .config 
$ cd .config
$ git clone https://github.com/felix1251/my-nvim-config.git nvim
```

## Troubleshoot

### Ubuntu

Tabnine Binary Issue

```
bash ~/.local/share/nvim/site/pack/packer/start/tabnine-nvim/dl_binaries.sh
```

Tabnine required Unzip package

```
sudo apt-get install unzip
```

Telescope Live Grep not working

```
sudo apt-get install ripgrep
```
