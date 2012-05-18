[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
source "$rvm_path/contrib/ps1_functions"
ps1_set --prompt ∴
export PATH=/usr/local/bin:$PATH:/Developer/usr/bin:~/source/mulberry/mulberry/mulberry/bin/
alias git=hub
alias e="vim ."
export EDITOR='vim -w'
alias tmux="TERM=screen-256color-bce tmux"
export TERM=xterm-256color
