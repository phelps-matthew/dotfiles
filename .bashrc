# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# User specific aliases and functions
if [ ! -f ~/.ssh/id_rsa ]; then
    echo -e "No public/private RSA keypair found.\n"
    ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    chmod 644 ~/.ssh/authorized_keys
    echo -e "\t- Cluster SSH keypairs generated."
    echo -e "\t- Altering your home directory permissions"
    echo -e "\t- or contents of $HOME/.ssh may"
    echo -e "\t- affect your ability to run jobs."
fi

# ------------ mp -------------- #
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# alias ll='ls -alF'
alias ll='ls -alFh --group-directories-first'
alias la='ls -A'
alias l='ls -CF'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

set -o vi
export EDITOR=vi
alias python='python3'
export LS_COLORS=$LS_COLORS:'ow=35:'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
export TERM=xterm-256color
