" vim:foldmethod=marker:foldlevel=0
" 'zR/zM' to open/close all folds, '<leader>,' or 'za' to toggle open/close a fold

" Misc {{{
set nocompatible
set encoding=utf-8
let mapleader = "\<Space>"
set autoread
set clipboard^=unnamed
set wildmenu

" Faster Escape in normal/command mode
imap jj <Esc>
cmap jj <C-c>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Buffers
map <C-n> :bnext<cr>
map <C-p> :bprevious<cr>
map <C-b> :b#<cr>
" }}}

" F<N> Mappings {{{
map <F1> :NERDTreeToggle<CR>
map <F2> :GitGutterToggle<CR>
nmap <F3> :set invnumber<CR>:set invrelativenumber<CR>
let g:ctrlp_map = '<F4>'
nnoremap <F5> :buffers<CR>:buffer<Space>
" }}}

" Searching {{{
set incsearch

" Toggle word highlighting
nmap <silent> <leader>hw :call <SID>hlwordon()<CR>
nmap <silent> <leader>hW :call <SID>hlwordoff()<CR>

" Search with '/', Replace with 'cs', <Esc>, Repeat search + replace with 'n.'
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
" }}}

" UI Format {{{
set fileformats=unix,dos
set formatoptions=tcroqnj
set laststatus=2
set invnumber
set invrelativenumber
set nowrap
set autoindent
set smartindent
set backspace=indent,eol,start
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set lazyredraw
set ruler
set list listchars=tab:\ \ ,precedes:«,extends:»
set scrolloff=8
set showtabline=1
set sidescroll=1
set sidescrolloff=12
set splitright
set synmaxcol=1024
set textwidth=80
set timeoutlen=500
set virtualedit=block
" }}}

" Colors {{{
syntax enable
set cursorline
" }}}

" Folding {{{
set foldcolumn=1
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <leader>a za
" }}}

" Line Shortcuts {{{
" Move to the beginning/end of line
nnoremap B ^
nnoremap E $

" Yank to the end of the line instead of the entire line
map Y y$

" Insert line break in normal mode
nnoremap <CR> i<CR><ESC>

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Jump to end of the current line in insert mode
inoremap <C-e> <C-o>$
" }}}

" Leader Shortcuts {{{
" Faster saving
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>wa :wa<CR>

" Faster quitting
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>Q :q!<CR>
nmap <silent> <leader>qa :qa<CR>

" Enter visual line mode
nmap <leader><leader> V

nmap <silent> <leader>noh :noh<CR>

" Press 'qq' to record into q register, End recording with 'q', '<leader>.' to
" play recording
nnoremap <leader>. @q

" Replace current word and all of its occurences
nnoremap <leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <leader>rc y:%s/<C-r>"/

" More leader shortcuts in other sections...
" }}}

" Custom Functions {{{
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
" }}}

" Vundle Plugins {{{
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
Plugin 'tpope/vim-sleuth'
call vundle#end()

filetype plugin indent on
" Install with :PluginInstall
" }}}

" nerdtree {{{
"map <F1> :NERDTreeToggle<CR>
"Toggle with I
let NERDTreeShowHidden=1
"Auto open NERDTree if vim starts up with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Close vim if NERDTree is only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" nerdcommenter {{{
" map - for comment toggling
map <silent> = <leader>c<space>
" }}}

" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" vim-gitgutter {{{
"map <F2> :GitGutterToggle<CR>
" }}}

" ctrlp.vim {{{
"let g:ctrlp_map = '<F4>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" }}}

" better-whitespace {{{
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist = ['markdown']
command! SWS :StripWhitespace
" }}}

" ag.vim {{{
nnoremap <leader>ag :Ag<Space>
" }}}

set modelines=1
