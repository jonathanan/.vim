" ----------------------
" Set up Vundle plugins
" ----------------------

set nocompatible
set encoding=utf-8
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
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
map <F1> :NERDTreeToggle<CR>
"Toggle with I
let NERDTreeShowHidden=1
"Auto open NERDTree if vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
"Close vim if NERDTree is only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---GitGuttter plugin---
map <F2> :GitGutterToggle<CR>

" -------------
" Options
" -------------
"
" Set Spacing
set tabstop=2
set softtabstop=2
set bs=2
set expandtab

" Set Numbers
nmap <C-N> :set invnumber<CR>:set invrelativenumber<CR>

imap jj <Esc>
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
