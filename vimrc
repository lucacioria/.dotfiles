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

set noswapfile

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'Conque-Shell'
" gocode
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'jnwhiteh/vim-golang'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'Lokaltog/vim-powerline'
Bundle 'derekwyatt/vim-scala'
Bundle 'scrooloose/syntastic'
Bundle 'bitc/vim-hdevtools'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Shougo/vimproc'
Bundle 'wlangstroth/vim-racket'
Bundle 'lunaru/vim-twig'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

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

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$\|target$',
  \ 'file': '\.class$\|\.so$\|\.dll$',
  \ 'link': '',
  \ }

" nnoremap ; :

noremap <Leader>t :CtrlP<CR>

"better indentation (keeps selection)
vnoremap > >gv
vnoremap < <gv

" highlight trailing whitespace
" highlight ExtraWhitespace ctermbg=darkred guibg=#382424
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" " the above flashes annoyingly while typing, be calmer in insert mode
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" omnicomplete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '[^. *\t]\.\w*'

" tagbar
nmap <F8> :TagbarToggle<CR>

" powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" syntastic
let g:syntastic_quiet_warnings = 1

" disable autoindent for sml
autocmd FileType sml :set noautoindent

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" latex
let g:Tex_ViewRule_pdf = '/Applications/Preview.app/Contents/MacOS/Preview'
au BufWritePost *.tex silent call Tex_RunLaTeX()
au BufWritePost *.tex silent call Tex_ViewLaTeX()
