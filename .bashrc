echo -n "Welcome "; whoami; echo ""
cal
echo ""; echo -n "Uptime: "; uptime; echo ""

# to install fun cow fortune, run this command in terminal: 'brew install cowsay'
# fortune | cowsay -f small

GITHUB_API=$(curl -s https://api.github.com/zen)
# the -s flag is 'silent', which means no show curl progress bar
# <<<"$GITHUB_API" sed # this line will print output to terminal
cowsay -f tux "$GITHUB_API"

# cowsay -f tux "Meowww... you look beautiful today."

cowthink -e ^^`Date`

# export PATH="$PATH:/c/Python36"                 # enable python on windows

# Terminal colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx          # Light Blue for Directories
# OR you can use this: alias ls="ls -G"         # Royal Blue

export EDITOR=vim
export LESS="-MN"                     # -M shows information bar at bottom, -N shows line number

# Other useful alias
alias llip="ssh sophiaaa@llip.life"   # alias to ssh into garageScript
alias l="ls -aF"                      # list all files (including hidden) in short format, flag -F will add special char. at the end
alias ll="ls -laFhG"                  # long format, include hidden, indicate file type, humanize file size, colorize output
alias src="source ~/.bashrc"          # alias to refresh the environment if you make changes to .bashrc

alias h="history"
alias mv="mv -i"
alias rm="rm -i"
# alias cp="cp -i"
# alias df="df -h"
# alias du="du -h"
# alias mkdir="mkdir -p"

# Alias for MBU
alias ml="mbu launch outlookall debug"
alias mb="mbu build outlookall debug"
alias mbd="mbu build --retry -d -m outlook -c debug ship"
alias fl="findlurkers | zsh"

alias mupdate="bash ~/Scripts/Build.sh"
alias blog="less ~/Scripts/Build_Output.log"

# Alias for git
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add" # to add all: `ga .`, to add new files `ga -N`
alias gcm="git commit -m"
alias gamend="git commit --amend --no-edit" # add new changes to last commit
alias gn="git status && git add . && git commit -m"     # shortcut to save new commit
alias gN="git status && git add -A && git commit -m"    # shortcut to save new commit all files

alias gb="git branch"
alias gco="git checkout"
alias gf="git fetch"
alias rb="git rebase origin/master"
alias p="git push -u origin" # then add your own branch `p spmai/feature1`
alias pmaster="git push -u origin master"  # flag -u will make sure git add tracking to origin/master
alias gv="git remote -v"

# install bash_completion with `brew install bash_completion@2`
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# setup autocompletion
if [ -f "/usr/local/etc/profile.d/bash_completion.sh" ]; then
  source /usr/local/etc/profile.d/bash_completion.sh
  __git_complete gco _git_checkout
else
  echo "Error loading git completions"
fi

alias log="git log --oneline --graph -15"
alias log1="git log -p -1"           # show the difference (patch output) for the last commit
alias log2="git log -p -2"           # show the different for the last 2 commits
alias logm="git log master.."          # show changes since you branches off master forward
alias loga="git log --oneline --graph --stat -p --all"

# Useful commands: changes directory and ls
function changeDirectory {
  cd $1;
  ls -aF .
}
alias cdl=changeDirectory
# Quickly jumps to parent directores
alias .='cl ..'
alias ..='cl ../..'
alias ...='cl ../../..'

# Enable tab completion
source ~/.git-completion.bash

# Bash command history
HISTCONTROL=ignoredups:erasedups
# append history list to HISTFILE when shell exits (rather than overwrite)
shopt -s histappend # (-s: set) shell-optional behavior: histappend

# Update history every time we execute a prompt command so we don't lose track of all shell sessions
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
# -n: append current Bash session's history to the current history list
# -w: write the current history list to the history file
# -c: clear history for the current shell
# -r: re-read the whole history from the history file

# colors!
Green="\[\033[0;32m\]"         # Green
greenblue="\[\033[38;05;38m\]" # Green (blue-ish)
Yellow="\[\033[0;33m\]"        # Yellow
red="\[\033[38;5;203m\]"       # Red (light)
reset="\[\033[0m\]"

# Change command prompt, explain: $red\username $Green\gitbranch $Yellow\dir-fullpath $greenblue\time12a $
export PS1="$red\u$Green\$(__git_ps1) $Yellow\w $greenblue\@ $
# export PS1="$Green\h #red\u$ $Yellow\w $greenblue\@ $
$reset" # start typing on the next line

# show a * or + next to branch name if it's been modified
export GIT_PS1_SHOWDIRTYSTATE=1

source ~/.git-prompt.sh

# export PATH="$PATH:`yarn global bin`"

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# !$ will use previous command's argument for current command
# ps aux, top, | head, tail -f,...
# find, 
# sort old.txt > sorted.txt (>> will append, > will overwrite)
# uniq old.txt, echo "(3*4)+(11+47)" | bc, echo "Hello" | wc
