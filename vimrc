" ----------------------
" Set up Vundle plugins
" ----------------------

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'jisaacks/GitGutter'
call vundle#end() 

filetype plugin indent on
" Install with :PluginInstall


" Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerdtree plugin
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 "Toggle with I

" -------------
" Options
" -------------

" Set Spacing
set tabstop=2
set softtabstop=2
set bs=2
set expandtab

imap jj <Esc>
" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
