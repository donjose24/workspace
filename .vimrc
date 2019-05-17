set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'powerline/powerline'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'StanAngeloff/php.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'joonty/vim-phpqa'
Plugin 'othree/xml.vim'

call vundle#end() 

set nocompatible
set backspace=indent,eol,start

syntax on
set nu
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Put this function at the very end of your vimrc file.
colorscheme solarized
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"PHP Fixer
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_enable_default_mapping = 1 
let g:php_cs_fixer_verbose = 1
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
inoremap { {}<ESC>ha
set autoindent
set smartindent
set clipboard=unnamed
