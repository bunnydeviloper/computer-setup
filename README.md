# computer-setup

**Note**: make sure you are in home directory (type `cd` or `~`)  
* All-Inclusive option: clone this repo and move all files to home directory

### Set up your shell / terminal / bash environment
* copy .bashrc (file credit: Udacity)
  * to access this file later: `vim ~/.bashrc`
  * to make sure this file get run: `source ~/.bashrc`

### Git is powerful, we should put it in a camera ("snapshot" joke, get it? :laugh:)
* copy .git-completion.bash file [source](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash))
* vim .git-prompt.sh (copy from [here](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh))
* simple first time git configuration: (or you can use .gitconfig file below)
  * git config --global user.name "<Your-Full-Name>"
  * git config --global user.email "<your-email-address>"
  * git config --global color.ui auto
  * git config --global merge.conflictstyle diff3
  * git config --list // view all current configuration
* vim .gitconfig (copy content form your computer, this version is slight "complicated")

### Vim is for pro-programmers, but remmeber: 'Your computer is only as smart as you are!'
* install vim plugins to make your life easier:
  * Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  * Install Silver Searcher: `brew install the_silver_searcher`
  * Install fuzzy finder: `brew install fzf`
  * Install Tmux: `brew install tmux`
    * Setup tmux colors: `echo 'set -g default-terminal "screen-256color"' > ~/.tmux.conf`
* vim .vimrc (copy content from your computer)
* install all the plugins specified in .vimrc file:
  * Launch `vim` and run `:PluginInstall` (to install from command line: `vim +PluginInstall +qall`)
  * Installation progress and result will show up on the left pane of Vim.

