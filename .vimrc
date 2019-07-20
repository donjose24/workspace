set rtp+=~/.vim/bundle/Vundle.vim

filetype off
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
Plugin 'othree/xml.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'dikiaap/minimalist'
Plugin 'flrnprz/plastic.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'elixir-editors/vim-elixir'

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
filetype plugin indent on
autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype elixir setlocal ts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab

set expandtab
set clipboard=unnamed
set t_Co=256

"syntactic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

set t_Co=256
set background=dark
colorscheme plastic

nmap <F8> :TagbarToggle<CR>
