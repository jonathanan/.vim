# `~/.vim`

Plugins:
* [Vundle] (https://github.com/VundleVim/Vundle.vim)
  * Plugin Manager
  * ```:help vundle```
* [Nerdtree] (https://github.com/scrooloose/nerdtree) 
  * File tree explorer
  * ```:help nerdtree```
* [Syntastic] (https://github.com/scrooloose/syntastic)
  * Syntax checking
  * ```:help syntastic```
* [vim-fugitive] (https://github.com/tpope/vim-fugitive)
  * git wrapper to manager your git actions from within Vim
  * ```:help fugitive```
* [vim-gitgutter] (https://github.com/airblade/vim-gitgutter)
  * git diff while editing
  * ```:help gitgutter```
* [ctrlp.vim] (https://github.com/ctrlpvim/ctrlp.vim)
  * full path fuzzy file, buffer, mur, tag, ... finder for Vim
  * ```:help ctrlp-options```

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
