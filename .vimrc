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

" ----------------------------- Vundle begin ----------------------------
set rtp+=~/.vim/bundle/Vundle.vim                   " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                       " let Vundle manage all the vim plugins, required
Plugin 'Valloric/YouCompleteMe'                     " Make sure to follow http://github.com/Valloric/YouCompleteMe#full-installation-guide
Plugin 'https://github.com/godlygeek/tabular'       " vim script for text alignment
Plugin 'https://github.com/tomtom/tcomment_vim'     " easy, filetype comment
Plugin 'https://github.com/scrooloose/nerdtree.git' " file system explorer, visually browse complex directory hierarchies
Plugin 'kien/ctrlp.vim'                             " Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'mileszs/ack.vim'                            " search tool for Vim

Plugin 'mxw/vim-jsx'                                " for JSX in JS, not a standalone package, need js plugin below
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'                   " make JSX pretty and ensure indentation works
Plugin 'crusoexia/vim-javascript-lib'               " keyword highlight of famous js libraries
Plugin 'https://github.com/scrooloose/syntastic'    " syntax/error checking
Plugin 'mtscout6/syntastic-local-eslint.vim'        " to make syntastic compatible with JSX

Plugin 'easymotion/vim-easymotion'                  " plugin to move around quickly w/o using numbering
Plugin 'mattn/emmet-vim'                            " simplify writing HTML
Plugin 'https://github.com/tpope/vim-surround'      " easily delete, change, and add surrounding in pairs

call vundle#end()                                   " All of your Plugins must be added before this line
" Brief help (see :h vundle for more details or wiki for FAQ)
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" ----------------------------- Vundle end ----------------------------

" CtrlP settings
let g:ctrlp_working_path_mode = 'ra'                        " search current/ancestor directories
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'       " combine with ag for blazing speed
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|platforms|Build)$',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.DS_Store'
      \ }
" type C-p to start, once CtrlP is open:
  " C-f to cycle through modes (files, buffers, mru-most recently used)
  " C-d to search filename only instead of fullpath
  " C-j, C-k to navigate result list
  " C-t, C-v to open selected entry in a new tab or new split (vertical)
  " C-n, C-p to select next/prev search string in history
  " C-y to create a new file and its parent directories
" set up ignore for ctrlp
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/tmp/*,*.so,*.swp,*~,._*,*/node_modules/*,*/mobile/js/web/* " Mac/OS
set wildignore+=*\\tmp\\*,*.swp,*.exe                                        " Windows

" Surrounding notes:
" cs"' -> change surrounding double quotes to single quotes
" cs'<p> -> change surrouning single quotes to p-tag
" cst<p> -> change surrounding tag to p-tag
" dst, ds", ds' -> delete surrounding tag, delete quotes
" yssb -> wrap entire line in parentheses
" VS<p class="surround"> -> V to select the whole line, wrap the current line in a p-tag

" Emmet-vim settings for JSX
" default trigger key is <C-Y><leader> in all modes, now change it to '<Tab><leader>'
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
" <Tab>/ : comment/uncomment the whole tag
" type URL, then <Tab>a : to create an anchor tag with the url in href (use <Tab>A for blockquote)
" idiv<Tab><leader> : to create a new div tag, same with any other tags
" idiv>p#foo$*3>a, then <Tab>, -> create a div tag with nested p-tag (+id) with nested a-tag
" type some content, then <Tab>, then at the 'Tag:' prompt, type 'ul>li*', or 'div>div*'
  " => wrap the contents inside a list, or wrap the contents inside nested div

" Easy-motion settings
let g:EasyMotion_do_mapping = 0       " Disable default mappings
" change prefix default key binding
nmap e <Plug>(easymotion-prefix)
" Jump to anywhere you want with 2 keystrokes, with just one key binding.
" `s{char}{label}` or `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" TComment settings
nmap <leader>c :TComment<CR>
vmap <leader>c :TCommentBlock<CR>

let g:jsx_ext_required = 0        " Allow JSX in normal JS files, specifically for React user

" Syntastic settings
let g:syntastic_check_on_open=0 " check on first load
"let g:syntastic_error_symbol='✗'
let g:syntastic_error_symbol='»'
let g:syntastic_stl_format = ' %E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} '
"let g:syntastic_warning_symbol='⚠'
let g:syntastic_warning_symbol='»'
" to make syntastic compatible with JSX
let g:syntastic_javascript_checkers = ['eslint']

" Ack settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackprg="ack-grep -s -H --nocolor --nogroup --column --smart-case --follow"
let g:ack_autoclose = 1    " close result window after selection
" let g:ackpreview = 1      " to preview the result
let g:ackhighlight = 1     " Set ackvim to highlight results
set shellpipe=>            " prevent Ack from printing result to terminal
" use ag (the_silver_searcher) whenever possible
nnoremap <leader>a :Ack!<Space> ""<Left>
" search for the word under the cursor
nmap <leader>A :Ack! <C-r><C-w><CR>
" Ack note: "q" to close search, "o" to open file, "v" to open in vsplit

" Git settings:
nmap <leader>gs :!git status
nmap <leader>g :!git status && git add % && git commit -m ''<left>
nmap <leader>ga :!git status && git add . && git commit -m ''<left>

" Vim 'q:' and 'q/': open commandline editing window
" use jkhl to move, type 'i' to go to insert mode for new command

" search and replace :%s/foo/bar/g, '/gc' will ask for comfirmation first
nmap <leader>r :%s//g<left><left>
nmap <leader>rr :%s//gc<left><left><left>

" Tabularize settings
if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t" :Tabularize /"<CR>
  vmap <leader>t" :Tabularize /"<CR>
  " this <leader>t! doesn't work yet, not sure why...
  nmap <leader>t! :Tabularize /:\zs<CR>
  vmap <leader>t! :Tabularize /:\zs<CR>
endif

" Nerdtree toogle
nmap <C-o> :NERDTreeToggle<CR>

" YouCompleteMe settings
let g:ycm_allow_changing_updatetime = 0
let g:ycm_min_num_of_chars_for_completion = 1
"----------------------------------------------------------------------------------"
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
set scrolloff=20      " Set at least lines visible above or below cursor. large offset = vertically centered
set laststatus=2      " Always show the status line

hi User1 ctermfg=15 ctermbg=19
hi User2 ctermfg=0 ctermbg=14 cterm=BOLD
" color number ranges, eg: '15' is white, '19' is royal blue, '0' is black, '14' is sky blue
set statusline=                                                                       " reset statusline
set statusline+=%1*\                                                                  " set 1st color
set statusline+=%F%m%r%h%w\                                                           " filepath
set statusline+=%2*\                                                                  " set 2nd color
set statusline+=%=\                                                                   " right align
set statusline+=%y\                                                                   " filetype
set statusline+=[%{&ff}]\                                                             " format
set statusline+=[POS=%l,%v]\                                                          " cursor position
set statusline+=[%p%%]\                                                               " location of cursor in %
set statusline+=[#Lines:%L]\                                                          " current line
set statusline+=[Buffer:%n/%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}]\   " buffer #/total
set statusline+=%{strftime(\"%m/%d/%y\ -\ %H:%M\")}                                   " date and time
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2

" Easier window navigation (to alternate between buffers, use C-n)
" to display all buffers including unlisted buffers
nmap <leader>b :ls!
" to switch to the next buffer
nmap bn :bn<CR>

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

set hidden       " Don't destroy the current buffer when you switch to another one, hide it instead (keep the undo buffer)
set autowrite    " Save on buffer switch

" Set search options
set hlsearch          " highlight matches
set incsearch         " Incremental search
set ignorecase        " searching is not case sensitive
set smartcase         " if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not

" turn off search highlight
nnoremap <leader>h :nohlsearch<CR>

" vim expand code block for javascript: eg {}, or even css (note, incorporated with auto-closed brackets)
" <CR> to enter a new line, ESC (switch to n mode for 1 command), indent current line, ESC, insert a line above with O
inoremap <leader>e <CR><C-o>==<C-o>O

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

" Mark the 101 columns
if exists('+colorcolumn')
  set colorcolumn=101
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Enable persistent undo
if exists("+undofile")
  set udf
  set undodir=~/.vimundo
endif

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
