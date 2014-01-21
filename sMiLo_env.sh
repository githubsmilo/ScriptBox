#/bin/bash

# common
alias vi='vi -u $HOME/sMiLo_vimrc'
alias vim='vim -u $HOME/sMiLo_vimrc'
alias ll='ls -alh'
alias grep='grep --exclude-dir=".svn"'

# to show git branch
export PS1="\[\033[00m\]\u@\h\[\033[00m\]:\[\033[00m\]\w\[\033[00m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[00m\]$\[\033[00m\] "

# for local
# TODO: Add some local rules.

# for server
# TODO: Add some server rules.

# Greps on all local Java files.
alias jgrep='find . -type f -name "*\.java" -print0 | xargs -0 grep --exclude-dir=".svn" --color -n "$@"'
# Greps on all local C/C++ files.
alias cgrep='find . -type f -name "*\.c*" -print0 | xargs -0 grep --exclude-dir=".svn" --color -n "$@"'
# Greps on all local Python files.
alias pgrep='find . -type f -name "*\.py" -print0 | xargs -0 grep --exclude-dir=".svn" --color -n "$@"'
