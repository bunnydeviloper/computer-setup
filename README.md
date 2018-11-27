# Sophia's dotfiles for computer-setup

**Note**: make sure you are in home directory (type `cd` or `~`)
* All-Inclusive option: clone this repo and move all files to home directory (note: use `ls -a` to see the dotfiles)

### Set up your shell / terminal / bash environment
* copy .bashrc (**AWESOME**)
  * to make sure this file get run: `source ~/.bashrc`
  * For Windows: download nodeJS, install, and add cowsay package (`npm install -g cowsay`)
  * For Windows: also copy .bash_profile (which will load ~/.bashrc)

### Git is powerful, we should take a selfie with it ("snapshot" joke, get it? :smile::smile::smile:)
* copy .git-completion.bash file ([source](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash))
* copy .git-prompt.sh ([source](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh))
* simple first time git configuration: (see more in .gitconfig)
  * git config --global user.name "<Your-Full-Name>"
  * git config --global user.email "<your-email-address>"
  * git config --global color.ui auto
  * git config --global merge.conflictstyle diff3
  * git config --list // view all current configuration

### Vim is for pro-programmers, but remmeber: 'Your computer is only as smart as you are!'
* copy .vimrc (file credit: multiple sources, from the best of the best, including some from myself :smile::smile::smile:)
* install vim plugins to make your life easier:
  * Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  * Install Silver Searcher: `brew install the_silver_searcher`
  * Install fuzzy finder: `brew install fzf`
  * Install Tmux: `brew install tmux`
    * Setup tmux colors: `echo 'set -g default-terminal "screen-256color"' > ~/.tmux.conf`
* Launch `vim` and run `:PluginInstall` (to install from command line: `vim +PluginInstall +qall`)
  * Installation progress and result will show up on the left pane of Vim.

