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
alias log="git log --oneline --graph --decorate"

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

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# Various variables you might want for your PS1 prompt:
# '\u' adds the name of the current user to the prompt (this is for Windows user???)
# '\$(__git_ps1)' adds git-related stuff
# '\w' adds the full path of the current directory ('\W' is short path)
# Time12h="\T", Time12a="\@", NewLine="\n", Jobs="\j"

# explain: $username\u   $gitbranch\$(__git_ps1)   $directorypath \W   \@   $   $reset"
export PS1="$red\u$Green\$(__git_ps1)$Yellow \w $greenblue \@ $
$reset" # start typing on the next line

# ---------------------
### Yarn
export PATH="$PATH:`yarn global bin`"

### FZF
# Use ag instead of the default find command for listing candidates.
# - The first argument to the function is the base path to start traversal
# - Note that ag only lists files not directories
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  ag -g "" "$1"
}

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# ---------------------
