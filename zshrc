#!/bin/zsh

# Much of this config came from https://scriptingosx.com/2019/07/moving-to-zsh-part-4-aliases-and-functions/

##############################################################################
# Path:

export PATH="$HOME/bin:/Applications/MacVim.app/Contents/bin:$PATH"


##############################################################################
# Misc

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

# Load rbenv (Note: This updates the path, and not sure what else)
eval "$(rbenv init -)"


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
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# enable zsh correction
setopt CORRECT
setopt CORRECT_ALL

##############################################################################
# Completions:

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
#zstyle ':completion:*' menu select # Highlights selected completion when menu in use
zstyle ':completion:*' menu select=0 interactive # Highlights selected completion when menu in use
zstyle ':completion:*' special-dirs .. # Enable expanding/completing .. to ../
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Use LS_COLORS to colorize the completion menus

# init the zsh completions system
autoload -Uz compinit && compinit
# _comp_options+=(globdots) # Show hidden dirs/files in completions always


##############################################################################
# Prompts:

# Left prompt
PROMPT='%B%F{240}%2~%f%b %# '

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
zstyle ':vcs_info:git:*' formats '%F{240}(%s:%b%u%c%m%F{240})%f'
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
RPROMPT=\$vcs_info_msg_0_

# Another way to get changes info is with git-prompt.sh
# ( from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh )


##############################################################################
# Aliases & Functions:

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
# fdc is oposite of cdf. it opens a finder window of the current terminal dir
alias fdc='open .'


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

# changes directory to frontmost Finder window
alias cdf='pwdf; cd "$(pwdf)"'

