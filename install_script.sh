#!/usr/bin/env bash

# Lite linux/vim dev env initialization
# -------- # 
##
sudo apt update && sudo apt upgrade -y
echo "-- updated and upgraded --"

## rar - not installed by default
sudo apt install rar unrar -y
echo "-- rar install --"

## media codecs and true type fonts
sudo apt install ubuntu-restricted-extras -y
echo "-- media codecs and true type fonts --"

## git
sudo apt install git -y
echo "-- git --"

## curl
sudo apt install curl -y
echo "-- curl --"

## after cloning plugin manager, make sure you have ~/.tmux.conf from dotfiles installed
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "-- tmux plugin manager --"

## node.js and npm for coc nvim
sudo apt install nodejs -y
echo "-- node.js --"

sudo apt install npm -y
echo "-- npm install --"

## neovim
sudo apt install neovim -y
echo "-- neovim --"

## vimplug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "-- vimplug for neovim --"

## tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "-- install tmux plugin manager --"

## Sync dotfiles
echo $HOME
git clone https://github.com/phelps-matthew/dotfiles.git $HOME/tmpdotfiles
rsync --recursive --verbose $HOME/tmpdotfiles/.config $HOME
rsync -v $HOME/tmpdotfiles/.inputrc $HOME
rsync --verbose $HOME/tmpdotfiles/.tmux.conf $HOME
rm -rf $HOME/tmpdotfiles
echo "-- syncd dotfiles --"

## Source .tmux.conf
tmux source $HOME/.tmux.conf
echo "-- sourced tmux conf --"

## Vim plug update
nvim +'PlugInstall --sync' +qa

## Within ~/.bashrc
echo 'set -o vi' >> $HOME/.bashrc
echo "alias python='python3'" >> $HOME/.bashrc
echo 'export EDITOR=nvim' >> $HOME/.bashrc
#echo "-- updated ~/.bashrc --"

## terminal themes (dope!)
#bash -c  "$(wget -qO- https://git.io/vQgMr)" 
# gruvbox is 61 (could append w/ && 61)

## fzf
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
