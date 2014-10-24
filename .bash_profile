# . ~/.bashrc
# ENV=$HOME/.bashrc


# export ENV
export PATH=/usr/local/bin:$PATH

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# START
# History of commands
export HISTFILESIZE=3000       # The bach history should save 3000 commands
export HISTCONTROL=ignoredups  # Don't put duplicate lines in the history
alias hist='history | grep $1' # Requires one input string; displays all
                               # previous commands which match the string

# Some useful aliases
alias ls='ls -FG'         # list hidden files; add colors and file types extension
alias ll="ls -la |less"   # display in list format using pager
alias lt="ls -lat |less"  # display in order of time last modifed
alias lu="ls -laut |less" # display in order of time last accessed
alias l='ls -lah'					# display in order
alias rm="rm -i"          # default to confirm deletion of files
alias igrep="grep -i"     #grep with auto ignore case
alias st="open -a 'Sublime text 2'" #open sublime text 2
alias fis="cd /Users/jarretmoses/Documents/development/flatiron"
alias opn="open -a"       #open with an application
alias code="cd /Users/jarretmoses/Documents/development" #open /development
alias gst="git status"		#execute 'git status' in one move
alias cheat="open -a \"Google Chrome\" http://overapi.com/ruby/" 
alias subl="open -a \"Sublime Text\"" #open Sublime Text 3 with [option]
alias stack="open -a \"Google Chrome\" http://www.stackoverflow.com"





export PATH="$PATH:/Applications:."

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#export PATH="/usr/local/git/bin:$PATH"
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH:$PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#END

# export PS1="\[\033[G\]$PS1" #ensures prompt is in first column

#terminal tabs have current working directory instead of 'bash'
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
# terminal tabs have curent diectory
export PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}\007"'

##### CUSTOMIZATION FUNCTION FOR CLI#####
function prompt
{
local CYAN="\[\033[0;36m\]"
local GRAY="\[\033[0;37m\]"
local BLUE="\[\033[0;34m\]"
local BRED="\[\033[41m\]"
local LIGHTGREEN="\[\033[1;32m\]"
local LIGHT_RED="\[\033[1;31m\]"
local CHAR="☯"
# export PS1="${CYAN}\h ${CYAN}\w % "
# export PS1="☯ [\W] % "
# \033[1;32m\]\$(__git_ps1)\e[0m\] 
export PS1="[\[\e[37;44;1m\]\@\[\e[0m\]] \[\e[0;37m\]\W\[\e[0m\]$LIGHTGREEN\$(__git_ps1)\[\e[0m\]\n$LIGHT_RED$CHAR \[\e[0m\] "
}
prompt

#function forvox program
function vox {
  /Users/jarretmoses/Documents/development/projects/voxnews/bin/cli
}

export LSCOLORS=GxFxCxDxBx #Changing CLI Folder color to....
export CLICOLOR=1

# Export subl as editor
export EDITOR=subl

# Case-Insensitive Auto Completion
bind "set completion-ignore-case on" 

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}


# USE: desktop
#      desktop subfolder
function desktop {
  cd /Users/$USER/Desktop/$@
}

# GIT_MERGE_AUTO_EDIT
# This variable configures git to not require a message when you merge.
export GIT_MERGE_AUTOEDIT='no'

# A function to easily grep for a matching file
# USE: lg filename
function lg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ls -la | grep "[$FIRST]$REST"
}

# CREATE FUNCTION FOR RECURSIVE MOVING OF RUBY FILES
# mv *.rb */*.rb testing/.

#git auto completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
