set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'nvie/vim-flake8'
Bundle 'davidhalter/jedi-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'ervandew/supertab'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'

set runtimepath^=~/.vim/bundle/ctrlp.vim

call vundle#end()
filetype plugin indent on

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" The rest of your config follows here
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 100
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%100v.*/
    autocmd FileType python set nowrap
augroup END

set laststatus=2
set number
set expandtab
set tabstop=4
set sw=4
set softtabstop=4
set showmatch " Show matching brackets.
set backspace=indent,eol,start
let g:flake8_max_line_length=100
let g:syntastic_python_flake8_args = "--ignore=E501"
set nohlsearch

let g:PyLintOnWrite = 1
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction


" autocmd BufWritePost *.py call Flake8()
autocmd FileType python map <buffer> <F4> :call Flake8()<cr>
autocmd BufWritePre *.py :%s/\s\+$//e " remove trailing wwhitespace chars

autocmd BufWritePre *.py call TrimEndLines()

" Move to last postion
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd BufRead,BufNewFile *.alph set filetype=alph

" Solarized stuff
syntax enable
set background=dark
colorscheme solarized
" let g:solarized_termcolors=256
" se t_Co=256

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
Plugin 'rking/ag.vim'

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

" Syntastic recommended settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
