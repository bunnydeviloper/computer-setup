let g:jsx_ext_required = 0    " not sure what this is???

set nocompatible              " be iMproved, required, prevent behaving like vi
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins on original GitHub repos
Plugin 'https://github.com/tpope/vim-vividchalk.git'
Plugin 'https://github.com/Reewr/vim-monokai-phoenix'
Plugin 'https://github.com/crusoexia/vim-monokai'
Plugin 'https://github.com/crusoexia/vim-javascript-lib'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'AutoComplPop'
Plugin 'mxw/vim-jsx'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/godlygeek/tabular'
Plugin 'https://github.com/tpope/vim-unimpaired'
Plugin 'https://github.com/itspriddle/vim-marked'
Plugin 'pangloss/vim-javascript'
Plugin 'mtscout6/syntastic-local-eslint.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" ---------- Vundle end ----------

" ---------- Plugins Related Settings begin ----------
" set up ignore for ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|platforms|Build)$'
let g:ctrlp_working_path_mode = 'r'

" syntastic
let g:syntastic_javascript_checkers = ['eslint']

" Silver Searcher, use Ack in case your vimrc is used on a system without Ag available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" leader key (map \ key to , key)
let mapleader=","
" Open a new tab and search for something
" nmap <leader>a :tab split<CR>:Ack ""<Left>
" Immediately search for the word under the cursor in a new tab
" nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>
" open ag.vim
" nnoremap <leader>a :Ag

" fzf fuzzy finder, add this line if installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Shortcuts Shortcuts
" map <C-f> :FZF<CR>
" map <C-N> :NERDTree<CR>
" map <C-_> :Ack<CR>
" ---------- Plugins Related Settings end ----------

" ---------- vimrc ----------
set mouse=a           " enable scrolling with the scroll wheel for noobs

if has("syntax")
  syntax on           " enables syntax highlighting by default
endif

" have Vim load indentation rules and plugins according to the detected filetype
if has ("autocmd")
  filetype plugin indent on
endif

set shiftwidth=2      " when you type >> in normal mode, it will indent the line for 2 columns, also = number of spaces for autoindenting
set softtabstop=2     " when you hit Tab/BS in insert mode, it will make sure to use 2 columns
set tabstop=2         " tell vim how many columns a Tab counts for, only affect existing text
set expandtab         " when you hit Tab in insert mode, produce the correct spaces, in case softtabstop and tabstop are diff. numbers

" Set UI
set rnu               " set relative number as default in normal mode
set nu                " when in insert mode, this will display line numbers in the left margin, and current line/column in botton status line
set ruler             " (ru) show the cursor position at all times
set visualbell        " Vim flash screen instead of beep on error

set wrap                         " text is wrapped around window size
set linebreak                    " prevent Vim to break line at the width of window
set nolist                       " neccessary for linebreak to work
set textwidth=0                  " this is set for linebreak to function properly
set wrapmargin=0                 " this is set for linebreak to function properly
" set list                       " [disable due to linebreak conflict] Set special characters
" set listchars=tab:→\ ,trail:·  " (specify below, trail=whitespace)

" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set showbreak=↪\      " Show at the start of line of a wrapped line
set showcmd           " Show (partial) command in status line (bottom right)
set showmode          " Display current mode: insert, replace, normal...
set showmatch         " Show matching brackets.
set cursorline        " draws a horizontal highlight on the line your cursor is currently on
set lazyredraw        " redraw only when we need to.


set title             " Screen title to currently opened file (middle top)
set scrolloff=20             " Set at least lines visible above or below cursor. large offset = vertically centered
set laststatus=2      " Always show the status line

hi User1 ctermfg=15 ctermbg=19                " color number ranges, eg: '15' is white, '19' is royal blue
hi User2 ctermfg=0 ctermbg=14 cterm=BOLD      " color number ranges, eg: '0' is black, '14' is sky blue
set statusline=%1*\ %F%m%r%h%w\ %2*\ %=\ [FORMAT=%{&ff}]\ [FILETYPE=%y]\ [POS=%l,%v]\ [%p%%]\ [#Lines:%L]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}
" Status line: set 1st color, filepath, set 2nd color, align right, format, filetype, cursor position, % complete, buffer, date, and time
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2

" Set search options
set hlsearch          " highlight matches
set incsearch         " Incremental search
set smartcase         " Do smart case matching
"set gdefault         " Subtitute all matches in a line by default
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Copy to clipboard
" map <C-c> y:e ~/copybufferforvimclipboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
" map <C-d> :r !pbpaste<CR><CR>

" vim auto complete for HTML tags: eg: '<div></' then press ',<CR>' (still in insert mode)
inoremap <leader><CR> <C-x><C-o><C-[>%i<CR><C-o>==<C-o>O
" explain: <C-x><C-o> omni-completed '<div></div>', then <C-[> to ESC to n mode, search matching bracket to move cursor to the middle, back to i mode, <CR> to enter a new line, ESC (switch to n mode for 1 command), indent current line, ESC, insert a line above with O

" vim expand code block for javascript: eg {}, or even css
inoremap <leader>j <C-[>i<CR><C-o>==<C-o>O

" html tag format after hitting Enter
" i,n,o means insert mode, normal mode, o mode?
" ??? inoremap <expr> <CR> '<CR>' . (search('\V>\%#<','bcn') ? '<Esc>O' : '')
" ??? nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

" ??? autocmd BufNewFile,BufRead *.scss setlocal filetype=css
" ??? iabbrev [a-z] <C-X><C-O>

" ????
" (dict) dictionary used for keyword completion
" to use: while in insertion mode and in the middle of a word, type <ctrl-n> and <ctrl-p>
" set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
" set complete-=k complete+=k

set noerrorbells         " don't beep
set autowrite  "Save on buffer switch

" Fast saves
nmap <leader>, :w!<cr>
nmap <leader>,, :wq!<cr>

"easier window navigation

" nmap <C-h> <C-w>h
" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-l> <C-w>l

set nobackup " Don't make backup before overwriting file
set nowritebackup
set noundofile
set directory=~/.vim/.swp// " Keep swap files in one location, not in project root

"code folding
set nofoldenable        " don't fold by default, !foldenable (fen)
set foldmethod=indent   " fold based on indent level
set foldnestmax=5       " sometimes fold may define too many folds
set foldlevel=1         " depth of folds to be displayed
" z character is used to represent folding in Vim because it looks like a folded piece of paper
" use za to toggle open/close current folds
" use zR to open all folds
" use zM to close all folds


" ??? au BufNewFile,BufRead *.ejs set filetype=html
" ??? au BufNewFile,BufRead *.erb set filetype=html

" Abbreviations
" ------------------------------------------------------------
" abbreviate <i <img src="" /><left><left><left><left>, same as...
abbreviate <i <img src="" /><C-[>3h
abbreviate <a <a href=""></a><C-[>5h

" Don't destroy the current buffer when you switch to another one
" Hide it instead, which keep the undo buffer.
set hidden

set autoindent
set smartindent
set autoread " Update open files when changed externally
set splitbelow " put the new window below of the current one
set splitright " put the new window right of the current one
set backspace=2 " allow deleting charaters backward

" Set tab completion
set wildmenu " Enables menu of current option at bottom of vim/gvim window
set wildmode=list:longest,full  " Tab completion vim mode cmd line
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*

" ??? set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/mobile/js/web/* " ctrlp i↪ gnores
" ??? set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Automatically reload vimrc when it's saved
augroup AutoReloadVimRC
  au!
  au BufWritePost .vimrc so ~/.vimrc
  au BufWritePost .vimrc.local so ~/.vimrc
augroup END

" Set relative number in normal mode, and line number in insert mode
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

" Use Perl regex by default
" nnoremap / /\v
" vnoremap / /\v

"Write changes to protected read-only files.
cmap w!! %!sudo tee > /dev/null %

" Make Y copy from cursor to EOL
map Y y$

" Make Q break line to textwidth
map Q gq

" Make + (Shift=) format the whole file
nmap + gg=G

" Movement maps
" nnoremap ; :
" nnoremap : ;
" Go up and down 1 display line (!number line), move vertically by visual line
noremap j gj
noremap k gk
" nnoremap $ g$
" nnoremap ^ g^

  " Reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Keep search term at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Manage buffers
nnoremap <C-k> :bn<CR>
nnoremap <C-j> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>


" Drag current lines
noremap <A-j> :m+<CR>
noremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv
