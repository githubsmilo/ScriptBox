#/bin/bash

# common
alias ll='ls -alh'
alias vi='vim -u ${HOME}/scripts/sMiLo_vimrc'

# for git
alias update_git='git fetch upstream && git merge upstream/master && git push origin master && git fetch origin --prune'

# for git
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
