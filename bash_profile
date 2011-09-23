# NOTE:
# .bash_profile is run under the conditions of a new login.
# Therefore, it is only run once for that shell window (in
# terminal.app's case). However, .bashrc is run under the conditions
# of a sub-shell and .bash_profile is skipped in a sub-shell. so,
# what does that mean?
#
# In .bash_profile, you can run commands that write to stdout. You
# wouldn't want chatty commands when you start a sub-shell. The
# PATH variable should be finalized in .bash_profile. This is so that
# sub-shells don't alter/prepend/append to it. Since fink's init
# sets PATH and exports some variables, run fink's init from
# .bash_profile. Also, run your .bashrc from .bash_profile.

# .bashrc is the driver for everything else, aliases, functions,
# completions, prompt-string, env settings, etc. They should be
# silent settings, i.e., no noise to stdout.

# $HOME/.rbenv/bin      = rbenv
# ~/bin                 = my addition for scripts
# /opt/local/bin        = MacPorts
# /opt/local/sbin       = MacPorts
# /usr/local/mysql/bin  = MySQL
# /usr/local/games      = games I've compiled w/o fink or macports
# /Developer/AdobeAIRSDK/bin        = Adobe AIR SDK
# /Users/joemiragliuolo/.brew/bin   = 'homebrew' package manager
# $PATH                 = whatever the path may have been set to before this

####PATH=~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/local/games:/Developer/SDKs/AdobeAIRSDK/bin:$PATH
PATH=$HOME/.rbenv/bin:~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/local/games:/Developer/SDKs/flex_sdk_3/bin:/Users/joemiragliuolo/.brew/bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH:/opt/jruby/bin
export PATH
#NOTE: later path declarations take lower precedence

# /opt/local/share/man  = MacPorts
# /usr/local/man        = no idea? for installed-from-source stuff maybe?
# $MANPATH              = whatever the manpath may have been set to before this

MANPATH=/opt/local/share/man:/usr/local/man:$MANPATH
export MANPATH

# For node.js
export NODE_PATH="/usr/local/lib/node"

# For ruby versions less than 1.9.x
RUBYOPT="rubygems"
export RUBYOPT

#PLOTICUS_PREFABS=/usr/local/pl240macos/prefabs
#export PLOTICUS_PREFABS

# fuck that you have new mail shit
unset MAILCHECK

# some color set up
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;32'
export CLICOLOR=1 
# export COLOR_NC='\e[0m' # No Color
# export COLOR_WHITE='\e[1;37m'
# export COLOR_BLACK='\e[0;30m'
# export COLOR_BLUE='\e[0;34m'
# export COLOR_LIGHT_BLUE='\e[1;34m'
# export COLOR_GREEN='\e[0;32m'
# export COLOR_LIGHT_GREEN='\e[1;32m'
# export COLOR_CYAN='\e[0;36m'
# export COLOR_LIGHT_CYAN='\e[1;36m'
# export COLOR_RED='\e[0;31m'
# export COLOR_LIGHT_RED='\e[1;31m'
# export COLOR_PURPLE='\e[0;35m'
# export COLOR_LIGHT_PURPLE='\e[1;35m'
# export COLOR_BROWN='\e[0;33m'
# export COLOR_YELLOW='\e[1;33m'
# export COLOR_GRAY='\e[0;30m'
# export COLOR_LIGHT_GRAY='\e[0;37m'

# set vim as default editor for programs that care
export EDITOR='vim'
# Ignores dupes in the history
export HISTCONTROL=ignoredups 
## set vim as the default man-viewer
#export MANPAGER="col -b |vim -R -u ~/.vimrc -c 'set ft=man nomod nolist' -"

# ignore some boring stuff in history. The " *" bit ignores all command lines
# starting with whitespace, useful to selectively avoid the history
#export HISTIGNORE="ls:cd:cd ..:..*: *"
export HISTIGNORE="ls:ll:la:lla:cd:cd .."

export CACA_DRIVER=ncurses

## bash completion settings (actually, these are readline settings):
## No bell, because it's damn annoying:
#bind "set bell-style none"
## This allows you to automatically show completion without double tab-ing:
#bind "set show-all-if-ambiguous On"

# fink init
test -r /sw/bin/init.sh && . /sw/bin/init.sh

### DISABLED:
###....not sure if I need any of this. Maybe just a "export DISPLAY=:0.0"
## Set the DISPLAY variable -- works for Apple X11 with Fast User Switching
#if [[ -z $DISPLAY && -z $SSH_CONNECTION ]]; then
#    disp_no=($( ps -awx | grep -F X11.app | awk '{print $NF}' | grep -e ":[0-9]"  ))
#    if [[ -n $disp_no ]];then
#        export DISPLAY=${disp_no}.0
#    else
#        export DISPLAY=:0.0
#    fi
#    echo "DISPLAY has been set to $DISPLAY"
#fi

# load up bash completion for git
if [ -f ~/bin/git-completion.sh ]; then . ~/bin/git-completion.sh ; fi

# Load rbenv
eval "$(rbenv init -)"

# load up .bashrc too
if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi

# reports, etc
date +"%a %e %b %Y @ %T %Z"

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
GRAY='\e[0;37m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# Looks best on a black background.....
#echo -e "${cyan}This is BASH ${red}${BASH_VERSION%.*}\
#${cyan} - DISPLAY on ${red}$DISPLAY${NC}\n"
echo -e "This is BASH ${BASH_VERSION%.*}\
 - DISPLAY on $DISPLAY\n"

