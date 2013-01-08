# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/njr11/.rvm/gems/ruby-1.9.3-p327/bin:/Users/njr11/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/njr11/.rvm/rubies/ruby-1.9.3-p327/bin:/Users/njr11/.rvm/bin:/usr/local/bin:/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Users/njr11/repositories/developwithpassion/devtools/automation:/Users/njr11/repositories/developwithpassion/devtools/automation/autohotkey:/Users/njr11/repositories/developwithpassion/devtools/automation/brew:/Users/njr11/repositories/developwithpassion/devtools/automation/cygwin:/Users/njr11/repositories/developwithpassion/devtools/automation/diffmerge_tool:/Users/njr11/repositories/developwithpassion/devtools/automation/divvy:/Users/njr11/repositories/developwithpassion/devtools/automation/git:/Users/njr11/repositories/developwithpassion/devtools/automation/git/gitrb:/Users/njr11/repositories/developwithpassion/devtools/automation/git/gitrb/lib:/Users/njr11/repositories/developwithpassion/devtools/automation/git/gitrb/lib/git:/Users/njr11/repositories/developwithpassion/devtools/automation/git/gitrb/spec:/Users/njr11/repositories/developwithpassion/devtools/automation/git/gitrb/spec/git:/Users/njr11/repositories/developwithpassion/devtools/automation/install:/Users/njr11/repositories/developwithpassion/devtools/automation/misc:/Users/njr11/repositories/developwithpassion/devtools/automation/perl:/Users/njr11/repositories/developwithpassion/devtools/automation/rvm:/Users/njr11/repositories/developwithpassion/devtools/automation/tasks:/Users/njr11/repositories/developwithpassion/devtools/automation/timers:/Users/njr11/repositories/developwithpassion/devtools/automation/vim:/Users/njr11/repositories/developwithpassion/devtools/automation/visual_studio:/Users/njr11/repositories/developwithpassion/devtools/automation/vmware:
export EDITOR=vi

export VMAIL_HTML_PART_READER='elinks -dump'
