#!/usr/binenv bash

# ----------------- # 
# Bare Installation, vim.
# ----------------- # 

# tmux plugin manager
echo "-- Installing tmux plugin manager --"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "-- Installing FZF --"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Sync dotfiles
echo "-- Syncing .vimrc, .inputrc, and .tmux.conf dotfiles --"
echo $HOME
git clone https://github.com/phelps-matthew/dotfiles.git $HOME/tmpdotfiles
rsync --verbose $HOME/tmpdotfiles/.inputrc $HOME
rsync --verbose $HOME/tmpdotfiles/.tmux.conf $HOME
rsync --verbose $HOME/tmpdotfiles/.vimrc $HOME

# Within ~/.bashrc
echo "-- Updating ~/.bashrc --"
echo '# ------------ mp -------------- #' >> $HOME/.bashrc
echo 'set -o vi' >> $HOME/.bashrc
echo 'export EDITOR=vi' >> $HOME/.bashrc
echo "alias python='python3'" >> $HOME/.bashrc
echo "export LS_COLORS=\$LS_COLORS:'ow=35:'" >> $HOME/.bashrc
echo "export FZF_DEFAULT_COMMAND='rg --files'" >> $HOME/.bashrc
echo "export FZF_CTRL_T_COMMAND='\$FZF_DEFAULT_COMMAND'" >> $HOME/.bashrc

# Source .tmux.conf
echo "-- Sourcing tmux conf --"
tmux source $HOME/.tmux.conf

echo "-- Finished. --"
