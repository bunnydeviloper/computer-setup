let g:jsx_ext_required = 0    " Allow JSX in normal JS files, specifically for React user

set nocompatible              " be iMproved, required, prevent behaving like vi
filetype off                  " required

if has("syntax")
  syntax on                   " enables syntax highlighting by default
endif

" have Vim load indentation rules and plugins according to the detected filetype
if has ("autocmd")
  filetype plugin indent on
endif

" remap leader key from \ to , (type ':map <leader>' to see all leader key mapping)
let mapleader=","

" Fast saves
nmap <leader>, :w!<cr>
nmap <leader>,, :wq!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ---------- Vundle begin ----------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim                " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                    " let Vundle manage all the vim plugins, required

Plugin 'Valloric/YouCompleteMe'                  " Make sure to follow http://github.com/Valloric/YouCompleteMe#full-installation-guide

Plugin 'https://github.com/godlygeek/tabular'    " vim script for text alignment

Plugin 'mxw/vim-jsx'                             " for JSX in JS, not a standalone package, need js plugin below
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'            " keyword highlight of famous js libraries
Plugin 'https://github.com/scrooloose/syntastic' " syntax/error checking
Plugin 'mtscout6/syntastic-local-eslint.vim'     " to make syntastic compatible with JSX

" Plugin 'kien/ctrlp.vim'
" Plugin 'mileszs/ack.vim'
" Plugin 'https://github.com/scrooloose/nerdtree.git'

call vundle#end()                                " All of your Plugins must be added before this line
" Brief help (see :h vundle for more details or wiki for FAQ)
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ---------- Vundle end ----------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set up ignore for ctrlp
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/tmp/*,*.so,*.swp,*~,._*,*/node_modules/*,*/mobile/js/web/* " ctrlp ignores
set wildignore+=*\\tmp\\*,*.swp,*.exe                                        " Windows
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|platforms|Build)$'
let g:ctrlp_working_path_mode = 'r'

" to make syntastic compatible with JSX
let g:syntastic_javascript_checkers = ['eslint']

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t" :Tabularize /"<CR>
  vmap <leader>t" :Tabularize /"<CR>
  " this <leader>t! doesn't work yet, not sure why...
  nmap <leader>t! :Tabularize /:\zs<CR>
  vmap <leader>t! :Tabularize /:\zs<CR>
endif

" nnoremap <leader>a :Ack!<Space>
" let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Open a new tab and search for something
"nmap <leader>a :tab split<CR>:Ack ""<Left>
" Immediately search for the word under the cursor in a new tab
"nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>


" fzf fuzzy finder, add this line if installed using Homebrew
" set rtp+=/usr/local/opt/fzf

" Shortcuts
" map <C-f> :FZF<CR>
" map <C-N> :NERDTree<CR>
" map <C-_> :Ack<CR>

" Copy to clipboard
" map <C-c> y:e ~/copybufferforvimclipboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
" map <C-d> :r !pbpaste<CR><CR>

" html tag format after hitting Enter
" ??? inoremap <expr> <CR> '<CR>' . (search('\V>\%#<','bcn') ? '<Esc>O' : '')
" ??? nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>
" autocmd BufNewFile,BufRead *.scss setlocal filetype=css
" autocmd BufNewFile,BufRead *.ejs set filetype=html
" autocmd BufNewFile,BufRead *.erb set filetype=html


set mouse=a           " enable scrolling with the scroll wheel for noobs

set shiftwidth=2      " when you type >> in normal mode, it will indent the line for 2 columns, also = number of spaces for autoindenting
set softtabstop=2     " when you hit Tab/BS in insert mode, it will make sure to use 2 columns
set tabstop=2         " tell vim how many columns a Tab counts for, only affect existing text
set expandtab         " when you hit Tab in insert mode, produce the correct spaces, in case softtabstop and tabstop are diff. numbers

" Set UI
set rnu               " set relative number as default in normal mode
set nu                " when in insert mode, this will display line numbers in the left margin, and current line/column in botton status line
set ruler             " (ru) show the cursor position at all times
set visualbell        " Vim flash screen instead of beep on error
set noerrorbells      " don't beep

" Set relative number in normal mode, and line number in insert mode
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

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
set statusline=%1*\ %F%m%r%h%w\ %2*\ %=\ [FORMAT=%{&ff}]\ [FILETYPE=%y]\ [POS=%l,%v]\ [%p%%]\ [#Lines:%L]\ [Buffer:%n/%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}
" Status line: set 1st color, filepath, set 2nd color, align right, format, filetype, cursor position, % complete, current line, buffer #, date, and time
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2

" Manage buffers (to alternate between buffers, use C-^)
nnoremap <C-k> :bn<CR>
nnoremap <C-j> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

set hidden       " Don't destroy the current buffer when you switch to another one, hide it instead (keep the undo buffer)
set autowrite    " Save on buffer switch

" Set search options
set hlsearch          " highlight matches
set incsearch         " Incremental search
set ignorecase        " searching is not case sensitive
set smartcase         " if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not

" turn off search highlight
nnoremap <leader>h :nohlsearch<CR>

" vim auto-closed brackets
inoremap ( ()<C-[>i
inoremap [ []<C-[>i
inoremap { {}<C-[>i
inoremap ` ``<C-[>i
inoremap ' ''<C-[>i
inoremap " ""<C-[>i
inoremap < <><C-[>i

" vim expand code block for javascript: eg {}, or even css (note, incorporated with auto-closed brackets)
" <CR> to enter a new line, ESC (switch to n mode for 1 command), indent current line, ESC, insert a line above with O
inoremap <leader>e <CR><C-o>==<C-o>O

" abbreviate word+space will become... (note, incorporated with auto-closed brackets)
abbreviate itag <img src="
abbreviate atag <a href="<C-[>A</a<C-[>F"i
abbreviate divtag <div<C-[>A</div<C-[>F<i
abbreviate ptag <p<C-[>A</p<C-[>F<i
abbreviate h1tag <h1<C-[>A</h1<C-[>F<i
abbreviate h2tag <h2<C-[>A</h2<C-[>F<i
abbreviate h3tag <h3<C-[>A</h3<C-[>F<i
abbreviate h4tag <h4<C-[>A</h4<C-[>F<i
abbreviate h5tag <h5<C-[>A</h5<C-[>F<i
abbreviate h6tag <h6<C-[>A</h6<C-[>F<i

" easier window navigation
" nmap <C-h> <C-w>h
" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-l> <C-w>l
" noremap <C-H> :tabp<CR>
" noremap <C-L> :tabn<CR>
" noremap <C-J> :tabc<CR>
" noremap <C-K> :tabe<CR>

set nobackup                " Don't make backup before overwriting file
set nowritebackup
set noundofile
set directory=~/.vim/.swp// " Keep swap files in one location, not in project root

" code folding: z character is used to represent folding in Vim because it looks like a folded piece of paper
" use za to toggle open/close current folds, zR to open all folds, zM to close all folds
set nofoldenable        " don't fold by default, !foldenable (fen)
set foldmethod=indent   " fold based on indent level
set foldnestmax=5       " sometimes fold may define too many folds
set foldlevel=1         " depth of folds to be displayed

set autoindent
set smartindent
set autoread    " Update open files when changed externally
set splitbelow  " put the new window below of the current one
set splitright  " put the new window right of the current one
set backspace=2 " allow deleting charaters backward

set wildmenu                   " Enables menu of current option at bottom of vim/gvim window
set wildmode=list:longest,full " Tab completion vim mode cmd line

" Write changes to protected read-only files.
cmap w!! %!sudo tee > /dev/null %

" Make Y copy from cursor to EOL
map Y y$

" Make + (Shift=) format the whole file
nmap + gg=G

" Movement mapping: Go up and down 1 display line (!number line) (move vertically by visual line)
noremap j gj
noremap k gk
nnoremap $ g$
nnoremap ^ g^

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

" Move current lines/block up/down
noremap mj :m+<CR>
noremap mk :m-2<CR>
vnoremap mj :m'>+<CR>gv
vnoremap mk :m-2<CR>gv

" Automatically reload vimrc when it's saved
augroup AutoReloadVimRC
  au!
  au BufWritePost .vimrc so ~/.vimrc
  au BufWritePost .vimrc.local so ~/.vimrc
augroup END
