set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'nvie/vim-flake8'
Bundle 'tpope/vim-fugitive'
Bundle 'davidhalter/jedi-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'ervandew/supertab'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rking/ag.vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline_extensions = ['ale']
let g:ale_linters = {'ruby': ['rubocop']}

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set laststatus=2
set number
set expandtab
set tabstop=4
set sw=2
set softtabstop=2
set showmatch
set backspace=indent,eol,start
set nohlsearch

autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4
autocmd Filetype ruby setlocal expandtab tabstop=2 softtabstop=2

" Python-specific stuff
" The rest of your config follows here
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 100
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%100v.*/
    autocmd FileType python set nowrap
augroup END

function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre *.py :%s/\s\+$//e " remove trailing whitespace chars
autocmd BufWritePre *.py call TrimEndLines()

" Move to last postion
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufRead,BufNewFile *.alph set filetype=alph

" Solarized stuff
syntax enable
set background=dark
colorscheme solarized

" Swap colon and semi-colon for command purposes
noremap ; :
noremap : ;

" Tab changing stuff
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let mapleader = ","

" Make search work better
set ignorecase
set smartcase
set incsearch

" Control C copies to * reg
vnoremap <C-c> "+y
vnoremap . :norm.<CR>

nnoremap <silent> <C-h> gT
nnoremap <silent> <C-l> gt

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

if exists('$TMUX')
      set term=screen-256color
endif

set t_ut=

" Jedi stuff
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0

" Navigation keys for ale errors/warnings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Copying to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>


" MacVim stuff:
" Turn off error sounds
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" Font
set guifont=InconsolataForPowerline:h12

" Remove scrollbars and toolbar
set guioptions=
set guioptions-=T
