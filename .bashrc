# to install fun cow fortune, run this command in terminal: 'brew install cowsay'
fortune | cowsay -f small

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

# Other useful alias
alias llip="ssh sophiaaa@llip.life"   # alias to ssh into garageScript
alias l="ls -aF"                      # list all files (including hidden) in short format, flag -F will add special char. at the end
alias ll="ls -aFl"                    # long format
alias src="source ~/.bashrc"          # alias to refresh the environment if you make changes to .bashrc

# Alias for git
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add ."
alias gA="git add -A"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gn="git status && git add . && git commit -m"     # shortcut to save new commit
alias gN="git status && git add -A && git commit -m"    # shortcut to save new commit all files

alias gb="git branch"
alias gco="git checkout"
alias gf="git fetch"
alias rb="git rebase origin/master"
alias gfrb="git fetch && git rebase origin/master"      # to be used when ABSOLUTELY sure
alias push="git push -u origin master"  # flag -u will make sure git add tracking to origin/master

alias gcl="git clone"
alias gv="git remote -v"
alias grao="git remote add origin"
# alias grau="git remote add upstream"
# alias grat="git remote add temp"

alias log="git log --oneline --graph"
alias logp1="git log -p -1"           # show the difference (patch output) for the last commit
alias logp2="git log -p -2"           # show the different for the last 2 commits
alias glm="git log master.."          # show changes since you branches off master forward
alias loga="git log --oneline --graph --stat -p --all"

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
