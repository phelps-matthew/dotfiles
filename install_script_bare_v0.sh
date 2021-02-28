#!/usr/bin/env bash

# ----------------- # 
# Bare Installation
# ----------------- # 

# Within ~/.bashrc
echo 'set -o vi' >> $HOME/.bashrc
echo "alias python='python3'" >> $HOME/.bashrc
echo "export LS_COLORS=$LS_COLORS:'ow=35:' #purple, 36=blue" >> $HOME/.bashrc
echo "-- Updated ~/.bashrc --"

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "-- Install tmux plugin manager --"

# Sync dotfiles
echo $HOME
git clone https://github.com/phelps-matthew/dotfiles.git $HOME/tmpdotfiles
rsync --verbose $HOME/tmpdotfiles/.inputrc $HOME
rsync --verbose $HOME/tmpdotfiles/.tmux.conf $HOME
rm -rf $HOME/tmpdotfiles
echo "-- syncd .inputrc and .tmux.conf dotfiles --"

# Source .tmux.conf
tmux source $HOME/.tmux.conf
echo "-- sourced tmux conf --"
