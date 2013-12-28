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

Bundle 'jonathanfilip/vim-lucius'

Bundle 'L9'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'jgdavey/tslime.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'derekwyatt/vim-scala'
Bundle 'scrooloose/nerdtree'

Bundle 'unc0/vim-gorilla-script'


" enable syntax highlighting
syntax on
" show matching parenthesis
set showmatch

" disable backups
set nobackup

" enable mouse
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

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

colorscheme lucius
let g:lucius_no_term_bg = 1
LuciusBlackLowContrast

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

" " neocomplcache
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" " omnicomplete
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.go = '[^. *\t]\.\w*'
"

" file completion
set wildmode=longest,list,full
set wildmenu

" tagbar
nmap <F8> :TagbarToggle<CR>

" powerline
set laststatus=2
set ttimeoutlen=50
let g:airline_theme = 'simple'
let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" syntastic
let g:syntastic_quiet_warnings = 1

" splits
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" " latex
" let g:Tex_ViewRule_pdf = '/Applications/Preview.app/Contents/MacOS/Preview'
" au BufWritePost *.tex silent call Tex_RunLaTeX()
" au BufWritePost *.tex silent call Tex_ViewLaTeX()
"

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
