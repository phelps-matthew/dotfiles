# dotfiles
Workflow configuation files.

## Contents
* neovim (init.config)
* tmux (.tmux.conf)
* linux shell (.bashrc, .inputrc)
* Win10 keymaps (caps_alt_win10.ahk.ahk)
* ipdb color scheme (./ipython/profile_default/ipython_config.py)

## Commit Procedure

```bash
dotfile add foo.py
dotfile commit -m 'added foo.py'
dotfile push
# if you don't want to worry about readme.md not being in ~/ then 
dotfile push -f
```

## Implementing on remote PC

```bash
# Clone to temp directory
git clone --separate-git-dir=$HOME/dotfiles git@github.com:phelps-matthew/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
