# to install fun cow fortune, run this command in terminal: 'brew install cowsay'
fortune | cowsay -f small
cowsay -f tux "Meowww... you look beautiful today."
cowthink -e ^^`Date`

# Terminal colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx          # Light Blue for Directories
# OR you can use this: alias ls="ls -G"         # Royal Blue

export EDITOR=vim

# Other useful alias
alias llip="ssh sophiaaa@llip.life"   # alias to ssh into garageScript
alias la="ls -aF"                     # list all files (including hidden) in short format, flag -F will add special char. at the end
alias ll="ls -aFl"                    # long format
alias src="source ~/.bashrc"          # alias to refresh the environment if you make changes to .bashrc
# Alias for git
alias g="git"
alias ga="git add ."
alias gb="git branch"
alias gd="git diff"
alias gf="git fetch"
alias gs="git status"
alias gcm="git commit -m"
alias gco="git checkout"
alias rebase="git rebase origin/master"
alias push="git push origin master"
alias log="git log --oneline --graph"

# Useful commands - lcd changes directory and ls
function changeDirectory {
  cd $1;
  ls -aF .
}
alias cl=changeDirectory
# Quickly jumps to parent directores
alias .='cl ..'
alias ..='cl ../..'
alias ...='cl ../../..'

# Enable tab completion
source ~/.git-completion.bash

# Bash command history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# colors!
Green="\[\033[0;32m\]"         # Green
greenblue="\[\033[38;05;38m\]" # Green (blue-ish)
Yellow="\[\033[0;33m\]"        # Yellow
red="\[\033[38;5;203m\]"       # Red (light)
reset="\[\033[0m\]"

# Change command prompt, explain: $red\username $Green\gitbranch $Yellow\dir-fullpath $greenblue\time12a $
export PS1="$red\u$Green\$(__git_ps1) $Yellow\w $greenblue\@ $
$reset" # start typing on the next line

# show a * or + next to branch name if it's been modified
export GIT_PS1_SHOWDIRTYSTATE=1

source ~/.git-prompt.sh

export PATH="$PATH:`yarn global bin`"
