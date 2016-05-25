set nocompatible
set encoding=utf-8
let mapleader = ';'

" ----------------------
" Set up Vundle plugins
" ----------------------

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
call vundle#end()

filetype plugin indent on
" Install with :PluginInstall

" ---Syntastic plugin---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ---Nerdtree plugin---
"map <F1> :NERDTreeToggle<CR>
"Toggle with I
let NERDTreeShowHidden=1
"Auto open NERDTree if vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Close vim if NERDTree is only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---GitGuttter plugin---
"map <F2> :GitGutterToggle<CR>

" ---ctrlp.vim plugin---
"let g:ctrlp_map = '<F4>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" ---Better Whitespace plugin---
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist = ['markdown']
command! SWS :StripWhitespace

" ---ag.vim plugin---
nnoremap <leader>a :Ag<Space>

" -------------
" Options
" -------------

syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard^=unnamed
set cursorline
set expandtab
set fileformats=unix,dos
set foldcolumn=1
set formatoptions=tcroqnj
set incsearch
set invnumber
set invrelativenumber
set laststatus=2
set lazyredraw
set list listchars=tab:\ \ ,precedes:«,extends:»
set nowrap
set ruler
set scroll=8
set scrolloff=8
set shiftwidth=4
set showtabline=1
set sidescroll=1
set sidescrolloff=12
set smartindent
set softtabstop=4
set splitright
set synmaxcol=1024
set tabstop=4
set textwidth=80
set timeoutlen=500
set virtualedit=block
set wildmenu

" ---F<N> Mappings---
map <F1> :NERDTreeToggle<CR>
map <F2> :GitGutterToggle<CR>
nmap <F3> :set invnumber<CR>:set invrelativenumber<CR>
let g:ctrlp_map = '<F4>'
nnoremap <F5> :buffers<CR>:buffer<Space>

" Nerd commenter map - for comment toggling
map <silent> - <leader>c<space>

" Faster Escape in normal/command mode
imap jj <Esc>
cmap jj <C-c>

" Move to the beginning/end of line
nnoremap B ^
nnoremap E $

" Faster saving
 nmap <silent> <leader>w :w<CR>

" Faster quitting
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>Q :q!<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Buffers
map <C-n> :bnext<cr>
map <C-p> :bprevious<cr>
map <C-b> :b#<cr>

" Yank to the end of the line instead of the entire line
map Y y$

" Insert line break in normal mode
nnoremap <CR> i<CR><ESC>

" Insert a space in normal mode
nnoremap <space> i<space><ESC>l

" highlight last inserted text
nnoremap gV `[v`]

" Toggle word highlighting
nmap <silent> <leader>hw :call <SID>hlwordon()<CR>
nmap <silent> <leader>hW :call <SID>hlwordoff()<CR>

function! s:hlwordon()
    call s:hlwordoff()
    let w:hlword = expand('<cword>')
    let w:hlwordmatch = matchadd('Search', '\<'. w:hlword .'\>' )

    " Set the search register so that n and N can be used to find additional
    " occurrences of the word.
    let @/ = '\<'. w:hlword .'\>'
endfunction

function! s:hlwordoff()
    if exists('w:hlwordmatch')
        call matchdelete( w:hlwordmatch )
        unlet w:hlwordmatch
        unlet w:hlword
    endif
endfunction

" Set folding options
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap , za
