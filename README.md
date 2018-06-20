# computer-setup

**Note**: make sure you are in home directory (type `cd` or `~`)
* All-Inclusive option: clone this repo and move all files to home directory

### Set up your shell / terminal / bash environment
* copy .bashrc (file credit: Udacity)
  * to make sure this file get run: `source ~/.bashrc`

### Git is powerful, we should take a selfie with it ("snapshot" joke, get it? :smile::smile::smile:)
* copy .git-completion.bash file [source](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash)
* copy .git-prompt.sh [source](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh)
* simple first time git configuration: (**baby step!**)
  * git config --global user.name "<Your-Full-Name>"
  * git config --global user.email "<your-email-address>"
  * git config --global color.ui auto
  * git config --global merge.conflictstyle diff3
  * git config --list // view all current configuration
* Slightly complicated (aka **AWESOME**) configuration: use .gitconfig

### Vim is for pro-programmers, but remmeber: 'Your computer is only as smart as you are!'
* install vim plugins to make your life easier:
  * Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  * Install Silver Searcher: `brew install the_silver_searcher`
  * Install fuzzy finder: `brew install fzf`
  * Install Tmux: `brew install tmux`
    * Setup tmux colors: `echo 'set -g default-terminal "screen-256color"' > ~/.tmux.conf`
* copy .vimrc (file credit: multiple sources, from the best of the best, including some from myself :smile:)
* Launch `vim` and run `:PluginInstall` (to install from command line: `vim +PluginInstall +qall`)
* Installation progress and result will show up on the left pane of Vim.

