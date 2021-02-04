# Lite linux/vim dev env initialization
# -------- # 
##
sudo apt update && sudo apt upgrade -y

## rar - not installed by default
sudo apt install rar unrar -y

## media codecs and true type fonts
sudo apt install ubuntu-restricted-extras -y

## git
sudo apt install git -y

## curl
sudo apt install curl -y

## after cloning plugin manager, make sure you have ~/.tmux.conf from dotfiles installed
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## node.js for coc nvim
sudo apt install nodejs -y

## neovim
sudo apt install neovim -y

## vimplug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Sync dotfiles
git clone --separate-git-dir=$HOME/dotfiles https://github.com/phelps-matthew/dotfiles.git tmpdotfiles
rsync --recursive --verbose tmpdotfiles/.config/ $HOME/.config/
rsync --recursive --verbose tmpdotfiles/.bashrc $HOME/.bashrc
rsync --recursive --verbose tmpdotfiles/.inputrc $HOME/.inputrc
rsync --recursive --verbose tmpdotfiles/.tmux.conf $HOME/.tmux.conf
rm -r tmpdotfiles

## Source .tmux.conf
tmux source ~/.tmux.conf

## Within ~/.bashrc
echo 'set -o vi' >> ~/.bashrc
echo "alias python='python3'" >> ~/.bashrc
echo 'export EDITOR=nvim' >> ~/.bashrc

## terminal themes (dope!)
#bash -c  "$(wget -qO- https://git.io/vQgMr)" 
# gruvbox is 61 (could append w/ && 61)

## fzf
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

