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
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'dense-analysis/ale'
Plugin 'exu/pgsql.vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'jparise/vim-graphql'
Plugin 'neoclide/coc.nvim'

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
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
inoremap { {}<ESC>ha
set autoindent
filetype plugin indent on
autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype elixir setlocal ts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

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
colorscheme cryslominsa

nmap <F8> :TagbarToggle<CR>

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

set clipboard=unnamed
let mapleader = ","

"Make sure to respect the tsconfig file
autocmd FileType typescript call s:typescript_filetype_settings()
function! s:typescript_filetype_settings()
        set makeprg=tsc
endfunction
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:sql_type_default = 'pgsql'

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
