#!/bin/zsh

# Much of this config came from https://scriptingosx.com/2019/07/moving-to-zsh-part-4-aliases-and-functions/

# NOTE: Path is now set in zprofile instead o zshrc.

##############################################################################
# Misc / Settings for individual programs

#bindkey '^[[A' up-line-or-search # Make up arrow do a up arrow or search history
#bindkey '^[[B' down-line-or-search # Make down arrow do a down arrow or search history

# CLICOLOR and LSCOLORS are used by 'ls' to color things
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
# LS_COLORS is used by certain unix-y things, like 'tree' to color things
export LS_COLORS='no=00:fi=00:di=34:ln=35:pi=33:so=32:bd=34;46:cd=34;43:ex=31:su=30;41:sg=30;46:tw=30;42:ow=30;43:'
# can also color specific filetypes like so:
#export LS_COLORS="ex=35:di=36:ln=31:*.c=32:*.cpp=32:*.cc=32:*.cxx=32:*.h=33:*.hh=33:*.m=32"
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;32'

# Set vim as default editor for programs that care
export EDITOR='vim'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Set up fzf default options (do not set preview here!)
export FZF_DEFAULT_OPTS="--no-mouse --layout=reverse --info=inline"
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}




# Load asdf
# . /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

##############################################################################
# zsh settings:

# setopt NO_CASE_GLOB # not sure I like this
setopt GLOB_COMPLETE # make globbing work like it does in bash

# cd to a dir just by typing the dir name (without cd)
# setopt AUTO_CD # not sure I like this

# Command history settings:
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY # add more info to the history file
SAVEHIST=5000
HISTSIZE=2000
# # share history across multiple zsh sessions
# setopt SHARE_HISTORY
# DON'T share history across multiple zsh sessions
setopt no_share_history
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
# do not store commands that start with a space
setopt HIST_IGNORE_SPACE
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# disable zsh correction
setopt NO_CORRECT
setopt NO_CORRECT_ALL

##############################################################################
# Completions:

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
#zstyle ':completion:*' menu select # Highlights selected completion when menu in use
zstyle ':completion:*' menu select=0 interactive # Highlights selected completion when menu in use
zstyle ':completion:*' special-dirs .. # Enable expanding/completing .. to ../
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Use LS_COLORS to colorize the completion menus

# Add homebrew completion path
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# init the zsh completions system
autoload -Uz compinit && compinit
# _comp_options+=(globdots) # Show hidden dirs/files in completions always


##############################################################################
# Prompts:

# Notes:
#   %F{COLOR}   = start foreground color
#   %f          = end foreground color
#   %K{COLOR}   = start background color
#   %k          = end background color
#   %B          = start bold
#   %b          = end bold
#   %#          = prompt as # when with root priviledges, otherwise it's %
#   %2~         = show rightmost two directorys in path or ~ if it's ~
#   %(3~|.../%2~|%~)  = show rightmost two dirs in path or ~ if it's ~, and if there's more than 2 show a ... also

# Left prompt
# Explanation of current prompt:
#   %F{14}            = start foreground text color 14
#   %(3~|.../%2~|%~)  = show rightmost two directorys and so on (see description above)
#   %f                = reset foreground color to default textcolor
#   %F{7}             = start foreground text color 14
#   %#                = prompt as # when with root priviledges, otherwise it's %
#   %f                = reset foreground color to default textcolor
# PROMPT='%B%F{240}%2~%f%b %# '
# Same as above except:
# %(3~|.../%2~|%~)  = if path is 3 or more directories, show ... and rightmost 2 directories, or show ~
# PROMPT='%B%F{240}%(3~|.../%2~|%~)%f%b %# '
PROMPT='%F{14}%(3~|.../%2~|%~)%f %F{7}%#%f '

# Right prompt
# A good simple git integration example: https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# A bit more complicated git integration that I pieced together:
# ( Reference: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Gathering-information-from-version-control-systems )
setopt PROMPT_SUBST 
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git                # enable vcs_info for git
zstyle ':vcs_info:*' check-for-changes true    # enable check-for-changes to get %u %c %m (faster if disabled)
### Display the existence of files not yet known to VCS
### git: Show marker (%) if there are untracked files in repository
# Make sure you have added misc to your 'formats':  %m
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]+='%F{red}?%f' # This is used for %m
  fi
}
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f' # This is used for %u
zstyle ':vcs_info:*' stagedstr '%F{green}+%f' # This is used for %c
# %s = The VCS in use (git, hg, svn, etc.).
# %b = Information about the current branch.
# %c = The string from the stagedstr style if there are staged changes in the repository.
# %u = The string from the unstagedstr style if there are unstaged changes in the repository.
# %m = A "misc" replacement. It is at the discretion of the backend to decide what this replacement expands to. The hg and git backends use this expando to display patch information.
#zstyle ':vcs_info:git:*' formats '(%b %u%c%m)'
zstyle ':vcs_info:git:*' formats '%F{14}(%s:%b%u%c%m%F{14})%f'
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
RPROMPT=\$vcs_info_msg_0_

# Another way to get changes info is with git-prompt.sh
# ( from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh )

##############################################################################
# Aliases & Functions:

# alias ll='ls -l'
alias ll='eza -l'
# alias la='ls -a'
alias la='eza -a'
# alias lla='ls -la'
alias lla='eza -la'
alias lll='ll --color|less -R'
alias llla='lla --color|less -R'
# fdc is oposite of cdf. it opens a finder window of the current terminal dir
alias fdc='open .'
alias ql='qlmanage -p'

# some handy sips image processing aliases:
alias resizeto='sips -Z'
alias resizeto2000='sips -Z 2000'
alias getimagesize='sips -g pixelHeight -g pixelWidth'

# changes directory to frontmost Finder window
alias cdf='pwdf; cd "$(pwdf)"'

# alias to love
alias love="/Applications/love.app/Contents/MacOS/love"

# prints the path of the front Finder window. Desktop if no window open
function pwdf () {
    osascript <<EOS
        tell application "Finder"
            if (count of Finder windows) is 0 then
                set dir to (desktop as alias)
            else
                set dir to ((target of Finder window 1) as alias)
            end if
            return POSIX path of dir
        end tell
EOS
}


