[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source "$rvm_path/contrib/ps1_functions"
ps1_set --prompt ∴
export PATH=/usr/local/bin:$PATH:/Developer/usr/bin:~/source/mulberry/mulberry/mulberry/bin/
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
alias git=hub
alias e='vim .'
export EDITOR='vim -w'
alias tmux="TERM=screen-256color-bce tmux"
export TERM=xterm-256color
MAIL=/var/spool/mail/njr11 && export MAIL

. ~/dotfiles/z/z.sh
function precmd () {
  z --add "$(pwd -P)"
}
