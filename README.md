# `~/.vim`

Plugins:
* [Vundle] (https://github.com/VundleVim/Vundle.vim)
  * Plugin Manager
* [Nerdtree] (https://github.com/scrooloose/nerdtree) 
  * File tree explorer
* [Syntastic] (https://github.com/scrooloose/syntastic)
  * Syntax checking
* [vim-fugitive] (https://github.com/tpope/vim-fugitive)
  * git wrapper to manager your git actions from within Vim
* [vim-gitgutter] (https://github.com/airblade/vim-gitgutter)
  * git diff while editing

# Configure

Install plugins by cloning the repository under your home directory
```
git clone https://github.com/jonathanan/.vim.git ~/.vim
vim +PluginInstall +qall
```

Clean unused plugins
```
:PluginClean
```
