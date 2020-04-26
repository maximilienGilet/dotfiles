" This beauty remembers where you were the last time you edited the file, and
" returns to the same position.
 au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set encoding=utf8
set number
"enable mouse features"
:set mouse=a 
syntax on
" Set 10 lines to the cursor - when moving vertically using j/k
set so=10
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" search as characters are entered
set incsearch 
" search as characters are entered
set incsearch 
" Highlight search results
set hlsearch
" Show matching brackets when text indicator is over them
set showmatch
" search as characters are entered
set incsearch 
" number of visual spaces per TAB
set tabstop=4       
" number of spaces in tab when editing
set softtabstop=4
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to.
set lazyredraw
" Language correction
set spelllang =fr
set spellsuggest =5
" Toggle spellcheck on enter/exit INSERT mode
autocmd InsertEnter * setlocal spell
autocmd InsertLeave * setlocal nospell
"set spell
" make copy/paste go to the clipboard
:set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
" Better handling for split change
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" More natural splitting
set splitbelow
set splitright

set laststatus=2
set noshowmode
set background=dark

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
