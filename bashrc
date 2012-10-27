# NOTE:
# .bash_profile is run under the conditions of a new login. therefore, it
# is only run once for that shell window (in Terminal.app's case). however,
# .bashrc is run under the conditions of a sub-shell and .bash_profile is
# skipped in a sub-shell. so, what does that mean?

# in .bash_profile, you can run commands that write to stdout. you wouldn't
# want chatty commands when you start a sub-shell. the PATH variable should be
# finalized in .bash_profile. this is so that sub-shells don't
# alter/prepend/append to it. since fink's init sets PATH and exports some
# variables, run fink's init from .bash_profile. also, run your .bashrc from
# .bash_profile

# .bashrc is the driver for everything else, aliases, functions, completions,
# prompt-string, env settings, etc. They should be silent settings, i.e., no
# noise to stdout.

# NOTE:
# Portions of this file are Mac OS X specific.

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


# If I start to type something and press up it will search my history and jump to the first match.
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

###########################
##        Aliases        ##
###########################
## ls with color  # NOT NECESSARY WITH 'export LSCOLORS' above!
#alias ls="ls -G"
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
## quickly open vim
#alias v='vim'      # conflicts with my 'v' script that opens vim in nerdtree mode
## cat and highlight
#alias cath='pygmentize -g'

# tree with ANSI
alias tree="tree -A"

## this 'trash' command was installed with osxutils
#alias rmm="trash"

# this rmtrash command was installed by homebrew
alias trash='rmtrash'

# fdc is oposite of cdf. it opens a finder window of the current terminal dir
alias fdc="open ."

# opendiff launches filemerge for comparing files. i alias it to adiff, similar to aless and less
alias adiff="opendiff"

## use vim 7.2 from macvim instead of the 7.0 one that came with Leopard
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
### FIXED by making a symlink to the mvim script

# have vdiff open vim in diff mode, just as vimdiff does
# note: my vimdiff is itself a symlink to the mvim script
alias vdiff='vimdiff'

## open a Shoes ruby app in Shoes itsef
#alias shoes="open -a Shoes.app "

## for commandline-vlc (Video Lan Client)
#alias cvlc='/Applications/VLC.app/Contents/MacOS/vlc'

## for commandline access to Darwine (Windows emulator)
#alias wine='/Applications/Darwine/Wine.bundle/Contents/bin/wine'

## for quick access to wcd's graphical mode
#alias wcdg='wcd -g'

alias h='history | grep'
alias g=grep

# alias to love
alias love="/Applications/love.app/Contents/MacOS/love"


# useful aliases to help with rails dev
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

# Old versions of some rails dev helper aliases:
#alias bake="bundle exec rake"
#alias be="bundle exec"


###########################
##       Functions       ##
###########################

# this command changes the working dir to the front-most window of the Finder
cdf()
{
eval cd "`osascript -e 'tell app "Finder" to return the quoted form of the POSIX path of (target of window 1 as alias)' 2>/dev/null`"
pwd
}

## this command uses bwana/safari as a manpage viewer
#aman () { open man:$* ; }

# use this as a command line calculator. ex: "calc 2*2"
calc () { echo "$@" | bc -l ; }

# use vim as a manpage viewer, and use a lone q to quit, like in man
vman() {
 if [ $# -eq 0 ]; then
 /usr/bin/man
 else
 vim -c "Man $*" -c "silent! only" -c 'nmap q :q<cr>'
 fi
}

# use macvim as a manpage viewer, and use a lone q to quit, like in man
gvman() {
 if [ $# -eq 0 ]; then
 /usr/bin/man
 else
 mvim -c "Man $*" -c "silent! only" -c 'nmap q :q<cr>'
 fi
}

# use Preview to display a postscript/pdf-formatted manpage
pman() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}

## use Darwin-specific man pages in your browser
#wman() {
#   url="man -w ${1} | sed 's#.*\(${1}.\)\([[:digit:]]\).*\$#http://developer.apple.com/documentation/Darwin/Reference/ManPages/man\2/\1\2.html#'"
#   open `eval $url`
#}

## list file and dir sizes, biggest first
#duf() {
#du -k | sort -rn | perl -ne '($s,$f)=split(/\t/,$_,2);for(qw(K M G T)){if($s<1024){$x=($s<10?"%.1f":"%3d"); printf("$x$_\t%s",$s,$f);last};$s/=1024}'
#}

## list file and dir sizes, biggest last, no perl
#duf() {
#du -sk "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done;
#}

## quickly convert from hex to dec or from dec to hex, using bash
hex2dec() { printf '%d\n' 0x$@ ; }
dec2hex() { printf '%x\n' $@ ; }
# maybe use "${1}" instead of "$@"???

## wcd is whatever change directory - a quick dir changer
#function wcd() {
#  $HOME/bin/wcd.exe $*
#  . $HOME/bin/wcd.go
#}

# For quickly setting up my rails dev tools how I like:
function dev-rails() {
  mvim .
  tmux \
         new-session -s SessionName -n Windowname \; \
         split-window -v -p 75 -t 1
}


###############################
##     the command prompt    ##
###############################

#BLACK=`tput sgr0; tput setaf 0`
#RED=`tput sgr0; tput setaf 1`
#GREEN=`tput sgr0; tput setaf 2`
#YELLOW=`tput sgr0; tput setaf 3`
#BLUE=`tput sgr0; tput setaf 4`
#MAGENTA=`tput sgr0; tput setaf 5`
#CYAN=`tput sgr0; tput setaf 6`
#WHITE=`tput sgr0; tput setaf 7`
#COLORS_RESET=`tput sgr0`

### Alternate method of terminal colorization:
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[0;33m\]"
CYAN="\[\033[0;36m\]"
GREY="\[\033[0;37m\]"
BLUE="\[\033[0;34m\]"
COLORS_RESET="\[\033[0m\]"
COMP_NAME="imac"
#PS_CLEAR="\[\033[0m\]"
#SCREEN_ESC="\[\033k\033\134\]"


### by default, it looks like
# computer:directory user$
### [time user directory]$
#PS1="[\t \u \W]\\$ "
### computer:directory $
#PS1="$COMP_NAME:\W \$"
### computer:directory <git branch, if it exists> $
#PS1='$COMP_NAME:\W$(__git_ps1 " <%s>") \$ '


# a nice b&w prompt w/o git info
prompt_simple() {
  #unset PROMPT_COMMAND
  PS1="$COMP_NAME:\W \$"
}

# a nice b&w prompt with that display git info if in a repo
prompt_bw() {
  PS1='$COMP_NAME:\W$(__git_ps1 " <%s>") \$ '
  # __git_ps1 adds: (*) If unstaged, (+) if staged, (%) if untracked files
}

# a nice color prompt with that display git info if in a repo
prompt_color() {
  #PS1="${yellow}$COMP_NAME:\W"
  #PS1+='$(__git_ps1 " <%s>")'
  #PS1+=" \$ ${colors_reset}"
  PS1="\[${CYAN}\]$COMP_NAME:\W\[${YELLOW}\]"
  PS1+='$(__git_ps1 " <%s>")'
  PS1+="\[${CYAN}\] \$ \[${COLORS_RESET}\]"
  # __git_ps1 adds: (*) If unstaged, (+) if staged, (%) if untracked files
  # I had to do the PS1+= thing since I couldn't quote right for __git_ps1
  # Good colors: yellow, green, cyan (everything else is harder to read)
  # Yellow/green is a pleasing combo, but cyan/yellow makes sense with
  # the git log colors.
  # Need to put the /[ and /] around the colors so bash knows they're
  # non-printing chars!
}

# Use the color prompt by default when interactive
#test -n "$PS1" && prompt_color
test -n "$PS1" && prompt_bw
#test -n "$PS1" && prompt_simple


## set the command line editing mode to vi, instead of the default, emacs
#set -o vi


