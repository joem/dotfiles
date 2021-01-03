#=============================================================================
# .bashrc
#   - This is run from .bash_profile & when sub-shells start.
#       (so it is run _at least_ once per terminal window/tab)
#   - Aliases
#   - Functions
#   - Completions
#   - Prompt-string
#   - Environment settings
#   - ...and just everything .bash_profile doesn't set
#   - These should all be silent settings, i.e., no noise to stdout.
#
# (Use the .bash_profile instead for running commands that have stdout and
# setting the PATH.)
#
#=============================================================================

# NOTE: Portions of this file are Mac OS X specific.

# ------ Set some settings --------------------------------

#export TERM=xterm

export COLUMNS
# CLICOLOR and LSCOLORS are used by 'ls' to color things
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
# LS_COLORS is used by certain unix-y things, like 'tree' to color things
export LS_COLORS='no=00:fi=00:di=34:ln=35:pi=33:so=32:bd=34;46:cd=34;43:ex=31:su=30;41:sg=30;46:tw=30;42:ow=30;43:'
# can also color specific filetypes like so:
#export LS_COLORS="ex=35:di=36:ln=31:*.c=32:*.cpp=32:*.cc=32:*.cxx=32:*.h=33:*.hh=33:*.m=32"

# settings to show git repo info on command prompt:
export GIT_PS1_SHOWDIRTYSTATE=true      # If unstaged (*), if staged (+)
export GIT_PS1_SHOWUNTRACKEDFILES=true  # If untracked files (%)

# export github access token for homebrew (that file has the export command too)
if [ -f ~/.homebrew_github_personal_access_token ]; then . ~/.homebrew_github_personal_access_token ; fi

# Set the location of the Brewfile (can also do it manually with --file when running brew bundle)
export HOMEBREW_BUNDLE_FILE="~/.dotfiles/Brewfile"

# If I start to type something and press up it will search my history and jump to the first match.
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# ------ Aliases ------------------------------------------

# ls long
alias ll="ls -l"
# ls all
alias la='ls -a'
# ls long and all
alias lla='ls -la'
# find in an ls
alias lsg='ls | grep $1'
# find in an ll
alias llg='ll | grep $1'

# tree with ANSI
alias tree="tree -A"

# fdc is oposite of cdf. it opens a finder window of the current terminal dir
alias fdc="open ."

## Alias for cd'ing to the root dir of the current git repo
#alias git-root='cd $(git rev-parse --show-toplevel)'

# Useful aliases to help with rails dev
bundle_commands="rake spec rspec cucumber cap watchr rails rackup"

function run_bundler_cmd () {
  if [ -r ./Gemfile ]; then
    bundle exec $@
  else
    $@
  fi
}

for cmd in $bundle_commands
do
  alias $cmd="run_bundler_cmd $cmd"
done

# ------ Functions ----------------------------------------

# this command changes the working dir to the front-most window of the Finder
cdf()
{
  eval cd "`osascript -e 'tell app "Finder" to return the quoted form of the POSIX path of (target of window 1 as alias)' 2>/dev/null`"
  pwd
}

# For quickly setting up my rails dev tools how I like:
function dev-rails() {
  mvim .
  tmux \
         new-session -s SessionName -n Windowname \; \
         split-window -v -p 75 -t 1
}

# ------ Command Prompt ------------------------------------

COMP_NAME="imac"

# This gives you the cool __git_ps1 thing to use in the prompt:
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
fi

# Nice simple b&w prompt
# Looks like:  computer:directory $
prompt_bw() { PS1="$COMP_NAME:\W \$"; }

# Same as bw prompt, but also displays git info if in a repo
# Looks like:  computer:directory <git stuff, if in a repo> $
prompt_bw_with_git() { PS1='$COMP_NAME:\W$(__git_ps1 " <%s>") \$ '; }

# Using 'test' and functions allows something to set the PS1 before this.
#test -n "$PS1" && prompt_bw
test -n "$PS1" && prompt_bw_with_git

