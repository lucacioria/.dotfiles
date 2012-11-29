set nocompatible

set backup
set guioptions-=T
set mousehide
set ruler
" set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set sm
set tabstop=2
set wrap
set vb

" pathogen
call pathogen#infect()

" enable syntax highlighting
syntax on
" show matching parenthesis
set showmatch

" disable backups
set nobackup

" enable mouse
set mouse=a

" incremental smartCase search with highlighting
set ignorecase
set hlsearch
set smartcase
set incsearch

" enable filetype
filetype on
filetype plugin on
filetype indent on

" smart indent
set si

" ctags
set tags+=tags;$HOME

colorscheme wombat-my

let mapleader = ','

" plugins
let g:clang_complete_auto=0
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
let g:pyflakes_use_quickfix = 0

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$\|target$',
  \ 'file': '\.class$\|\.so$\|\.dll$',
  \ 'link': '',
  \ }

nnoremap ; :

noremap <Leader>t :CtrlP<CR>

"better indentation (keeps selection)
vnoremap > >gv
vnoremap < <gv

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" tagbar
nmap <F8> :TagbarToggle<CR>

" powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2
