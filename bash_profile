#=============================================================================
# .bash_profile
#   - This is run once per new terminal window/tab.
#   - Run commands that write to stdout.
#   - Finalize the PATH variable.
#   - Run your .bashrc.
#
# (Use the .bashrc instead for aliases, functions, completions, prompt-string,
# env settings, and and other silent settings.)
#
#=============================================================================

# ------ Set some settings --------------------------------

# Note: Always finalize path before doing other things, please.
# Note: Later path declarations take lower precedence. (But note below I'm prepending existing path, so the highest priority path is the last one prepended.)

#PATH=~/bin:$PATH:/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin
#PATH=~/bin:/usr/local/bin:$PATH:/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin
PATH=~/Programming/go/bin:$PATH
PATH=~/bin:$PATH
PATH=/usr/local/sbin:$PATH
export PATH

GOPATH=~/Programming/go
export GOPATH

#TODO: Should I move ALL the settings except path to .bashrc??

#export FLEX_HOME=/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec

#TODO: Remove this?
# For ruby versions less than 1.9.x
RUBYOPT="rubygems"
export RUBYOPT

# Fuck that you have new mail shit
unset MAILCHECK

# Some color set up
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;32'
export CLICOLOR=1

# Set vim as default editor for programs that care
export EDITOR='vim'

# Ignores dupes in the history
export HISTCONTROL=ignoredups
# Ignore some boring stuff in history.
export HISTIGNORE="ls:ll:la:lla:cd:cd .."

# Load rbenv (as per homebrew's instructions)
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load bash completion (as per homebrew's instructions)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# ------ Load .bashrc -------------------------------------

if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi

# ------ Display some things ------------------------------

# Display the date
date +"%a %e %b %Y @ %T %Z"

# Show a few things
echo -e "This is BASH ${BASH_VERSION%.*}\
 - DISPLAY on $DISPLAY\n"

