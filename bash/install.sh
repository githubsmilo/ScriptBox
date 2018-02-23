#!/bin/bash

# Imported from https://stackoverflow.com/a/27776822/1837846
case "$(uname -s)" in
   Darwin)
     echo "Start to setup new Mac OS X"

     MAC_BASH_PROFILE=${HOME}/.bash_profile
     echo "- Update ${MAC_BASH_PROFILE}..."
     echo $'\n# for sMiLo' >> ${MAC_BASH_PROFILE}
     echo $'if [ -f ~/scripts/git-completion.bash ]; then\n    . ~/scripts/git-completion.bash\nfi\n' >> ${MAC_BASH_PROFILE}
     echo $'if [ -f ~/scripts/git-prompt.sh ]; then\n    . ~/scripts/git-prompt.sh\nfi\n' >> ${MAC_BASH_PROFILE}
     echo $'if [ -f ~/scripts/sMiLo_env.sh ]; then\n    . ~/scripts/sMiLo_env.sh\nfi\n' >> ${MAC_BASH_PROFILE}

     MAC_INPUTRC=${HOME}/.inputrc
     echo "- Update ${MAC_INPUTRC}..."
     echo $'set completion-ignore-case on\n' >> ${MAC_INPUTRC}
     echo $'set show-all-if-ambiguous on\n' >> ${MAC_INPUTRC}
     echo $'#TAB: menu-complete' >> ${MAC_INPUTRC}

     echo "- Update brew and install wget..."
     brew update
     brew install wget

     echo "- Install Powerline fonts..."
     git clone https://github.com/powerline/fonts.git --depth=1
     cd fonts
     ./install.sh
     cd ..
     rm -rf fonts

     MAC_VIMRC=${HOME}/.vimrc
     echo "- Update ${MAC_VIMRC}..."
     echo $'\n# for sMiLo' >> ${MAC_VIMRC}
     echo $'set guifont=Source\ Code\ Pro\ for\ Powerline:h14\n' >> ${MAC_VIMRC}

     echo "- Install Vundle for Vim plugins..."
     VIM=${HOME}/.vim
     mkdir -p ${VIM}/autoload ${VIM}/bundle
     git clone https://github.com/VundleVim/Vundle.vim.git ${VIM}/bundle/Vundle.vim
     git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit --all"

     echo "- Install my scripts..."
     SCRIPTS=${HOME}/scripts
     mkdir -p ${SCRIPTS}
     wget --force-directories -O ${SCRIPTS}/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
     wget --force-directories -O ${SCRIPTS}/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
     wget --force-directories -O ${SCRIPTS}/sMiLo_env.sh https://raw.githubusercontent.com/withsmilo/ScriptBox/master/bash/sMiLo_env.sh
     wget --force-directories -O ${SCRIPTS}/sMiLo_vimrc https://raw.githubusercontent.com/withsmilo/ScriptBox/master/bash/sMiLo_vimrc

     echo "Finished! Please renew your terminal and execute vim, enter :PluginInstall"
     ;;

   Linux)
     echo "Linux"
     ;;

   CYGWIN*|MINGW32*|MSYS*)
     echo "MS Windows"
     ;;

   *)
     echo "other OS"
     ;;
esac
