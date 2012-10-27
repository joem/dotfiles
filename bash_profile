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


# ~/bin                          = my addition for scripts
# /usr/local/bin                 = for homebrew
# $PATH                          = whatever the path may have been set to before this
# /usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin   = the flex sdk installed via homebrew

#PATH=~/bin:$PATH:/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin
PATH=~/bin:/usr/local/bin:$PATH:/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin
export PATH
#NOTE: Later path declarations take lower precedence.

# paths for homebrew are now handled by putting it in the recommended /usr/local dir
# paths for rbenv are now handled by the 'eval "$(rbenv init -)"' command later

export FLEX_HOME=/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec

# For ruby versions less than 1.9.x
RUBYOPT="rubygems"
export RUBYOPT

# fuck that you have new mail shit
unset MAILCHECK

# some color set up
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;32'
export CLICOLOR=1 

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

## bash completion settings (actually, these are readline settings):
## No bell, because it's damn annoying:
#bind "set bell-style none"
## This allows you to automatically show completion without double tab-ing:
#bind "set show-all-if-ambiguous On"

# load up bash completion for git (from homebrew git)
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# bash completion for homebrew is now handled automatically after making some symlink

## Load rbenv
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

## Colorized version looks best on a black background...
#echo -e "${cyan}This is BASH ${red}${BASH_VERSION%.*}\
#${cyan} - DISPLAY on ${red}$DISPLAY${NC}\n"

# No color version is simpler...
echo -e "This is BASH ${BASH_VERSION%.*}\
 - DISPLAY on $DISPLAY\n"

