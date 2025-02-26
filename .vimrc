set nocompatible

if !has('nvim')
  """"""""
  " Plug "
  """"""""
  call plug#begin()

  " tpope stuff
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Solarized
  Plug 'altercation/vim-colors-solarized'
  Plug 'lifepillar/vim-solarized8'

  " Seoul256
  Plug 'junegunn/seoul256.vim'

  " Async
  Plug 'w0rp/ale'

  " git
  Plug 'airblade/vim-gitgutter'

  " python
  Plug 'davidhalter/jedi-vim'
  Plug 'vim-python/python-syntax'

  " go
  Plug 'fatih/vim-go'

  " misc
  Plug 'ervandew/supertab'
  Plug 'janko-m/vim-test'
  Plug 'junegunn/goyo.vim'
  Plug 'rking/ag.vim'
   
  Plug 'scrooloose/nerdtree'
   
  call plug#end()
  """"""""
endif


""""""""""""""""""""""""""""""""""
" Misc vim quality-of-life stuff "
""""""""""""""""""""""""""""""""""
" Swap colon and semi-colon for command purposes
noremap ; :
noremap : ;
set laststatus=2
set number
set expandtab
set tabstop=4
set sw=2
set softtabstop=2
set showmatch
set backspace=indent,eol,start
set nohlsearch

" Split navigation
nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>

" Tab navigation
nmap <C-H> gT
nmap <C-L> gt

" Move to last postion
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufRead,BufNewFile *.alph set filetype=alph

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let mapleader = ","

" Make search work better
set ignorecase
set smartcase
set incsearch

" Control C copies to * reg
" vnoremap <C-c> "+y
" vnoremap . :norm.<CR>

" Copying to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

" Fixes scrolling being bollocksed-up
set lazyredraw

" Automatically cd to directory of current buffer
set autochdir

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" For regular expressions turn magic on
set magic

" Remap VIM 0 to first non-blank character
map 0 ^

" Remove scrollbars and toolbar
set guioptions=
set guioptions-=T
""""""""""""""""""""""""""""""""""


""""""""""""""""""
" airline config "
""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['ale']
let g:airline#extensions#ale#enabled = 1
""""""""""""""


""""""""""""""
" ale config "
""""""""""""""
let g:ale_linters = {'go': ['staticcheck'], 'python': ['ruff', 'mypy']}
let g:ale_fixers = {"python": ["trim_whitespace", "remove_trailing_lines"]}
let g:ale_fix_on_save = 1
let g:ale_go_staticcheck_lint_package = 1
let g:ale_python_auto_poetry = 1
let g:ale_python_mypy_auto_poetry = 1

" Navigation keys for ale errors/warnings
nmap <silent> <C-k> <Plug>(ale_next_wrap)
nmap <silent> <C-j> <Plug>(ale_previous_wrap)

" Error and warning signs.
" let g:ale_sign_error = '⤫'
" let g:ale_sign_warning = '⚠'
""""""""""""""


"""""""""""""""""""""""""
" Python-specific stuff "
"""""""""""""""""""""""""
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4

"python-syntax
let g:python_highlight_all = 1

" Jedi stuff
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
"""""""""""""""""""""""""


"""""""""""""""""""
" Solarized stuff "
"""""""""""""""""""
colorscheme solarized8_high
if !has("gui_running")
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
endif
let g:solarized_termcolors=256
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set background=dark
set termguicolors
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let macvim_skip_colorscheme=1
"""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

set t_ut=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""
" MacVim stuff "
""""""""""""""""
" Turn off error sounds
set noerrorbells
set visualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" Font
set guifont=InconsolataForPowerline:h14

let macvim_skip_colorscheme=1
""""""""""""""""


"""""""""""""
" git stuff "
"""""""""""""
"tell fugitive about GHE url
let g:github_enterprise_urls = ['https://github.snooguts.net']
"""""""""""""


""""""""""""""""
" Golang stuff "
""""""""""""""""
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
""""""""""""""""


""""""""""""""
" Ruby stuff "
""""""""""""""
autocmd Filetype ruby setlocal expandtab tabstop=2 softtabstop=2
""""""""""""""
