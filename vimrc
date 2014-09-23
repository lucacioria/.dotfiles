set nocompatible
" filetype off 

set backup
set guioptions-=T
set mousehide
set ruler
set softtabstop=2
set shiftwidth=2
set expandtab
set sm
set tabstop=2
set wrap
set vb
set autoindent
set smartindent
set number "line numbers

set noswapfile
set ttimeoutlen=50
set backspace=2 " make backspace work like most other apps and delete even before start
" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'jonathanfilip/vim-lucius'

Plugin 'L9'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jgdavey/tslime.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-vinegar'
Plugin 'airblade/vim-gitgutter'

Plugin 'Shougo/neocomplete.vim'

Plugin 'derekwyatt/vim-scala'
Plugin 'digitaltoad/vim-jade'
Bundle 'rking/ag.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" slim cursor for insert mode
" block cursor for normal mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" exit insert mode with lk
:inoremap lk <ESC>

" incremental smartCase search with highlighting
set ignorecase
set hlsearch
set smartcase
set incsearch

" enable filetype (righe sotto di andre commentate per vundle)
filetype on
filetype plugin on
filetype indent on
" filetype off

" smart indent
set si

" ctags
set tags+=tags;$HOME

" colorscheme lucius (era quello di andre)
" let g:lucius_no_term_bg = 1
" LuciusBlackLowContrast
syntax enable
set background=dark
colorscheme solarized

let mapleader = ','

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  'tmp$\|\.git$\|\.hg$\|\.svn$\|build$\|target$\|node_modules$\|bower_components$',
  \ 'file': '\.class$\|\.so$\|\.dll$',
  \ 'link': '',
  \ }

" don't blink the cursor
set guicursor+=i:blinkwait0

" new empty line where cursor is
imap <C-c> <CR><Esc>O

" ctrl P shortcut
noremap <Leader>t :CtrlP<CR>

" \ save all open file
nnoremap \ :wa<CR>

" rerun macro q with space
nnoremap <Space> @q

" move 5 lines up
nnoremap <c-u> 5<c-y>

" move 5 lines down
nnoremap <c-d> 5<c-e>

" after yank in visual mode move cursor to end of selected area instead of start
vmap y y`]

"better indentation (keeps selection)
vnoremap > >gv
vnoremap < <gv

" diff against last saved version
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
     \ | wincmd p | diffthis
endif 

" vim better whitespace plugin config
autocmd FileType javascript,ruby,html,css,coffee,json autocmd BufWritePre <buffer> StripWhitespace

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" file completion
set wildmode=longest,list,full
set wildmenu

" powerline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'simple'
"let g:airline_symbols = {}
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

" syntastic
" let g:syntastic_quiet_warnings = 1

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

" NEOCOMPLETE STUFF TAKEN FROM THE EXAMPLE CONFIG IN THE REPO!!

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Better camel case matching
let g:neocomplete#enable_camel_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
