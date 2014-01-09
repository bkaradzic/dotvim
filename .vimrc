source $VIMRUNTIME/mswin.vim

call pathogen#infect()

filetype plugin indent on

" Remove menu bar
set guioptions-=m

" Remove toolbar
if has('gui_running')
	set guioptions-=T
endif

set ffs=unix,dos

" ,,,
set nocompatible

" no swp and ~ files
set noswapfile
set nobackup

" render tabs and trailing spaces
nmap <leader>l :set list!<CR>
set list
set listchars=tab:--,trail:-,extends:#,nbsp:.

" highlight everything after 80-chars
au FileType markdown match ErrorMsg '\%>80v.\+'

" invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" single character insert
"nmap <Space> i_<Esc>r
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" airline
set laststatus=2
set encoding=utf-8
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

" fuzzyfinder.vim - http://www.vim.org/scripts/script.php?script_id=1984
call l9#defineVariableDefault('g:fuf_dataDir', '~/.vim-fuf-data')
nnoremap <A-O> :call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['**/*.h*', '**/*.inl',  '**/*.cpp', '**/*.c', '**/*.lua', '**/*.go', '**/*.sc', '**/*.sh', '**/*.*lsl']]) \| FufCoverageFile<CR>
nnoremap <A-P> :FufBuffer<CR>

" easytags.vim
let g:easytags_cmd='ctags'
let g:easytags_include_members=1
let g:easytags_file='~/.vimtags'

" easymotion
let g:EasyMotion_leader_key='<leader>'

" a.vim - alternate file
nnoremap <A-o> :A<CR>

" Toggle between relative and absolute line numbers.
nnoremap <F3> :NumbersToggle<CR>

" tabs
map <C-S-tab> <Esc>:bp<CR>
nmap <C-S-tab> :bp<CR>
imap <C-S-tab> <Esc>:bp<CR>
map <C-tab> <Esc>:bn<CR>
nmap <C-tab> :bn<CR>
imap <C-tab> <Esc>:bn<CR>
map <C-n> <Esc>:tabedit<CR>
nmap <C-n> :tabedit<CR>
imap <C-n> <Esc>:tabedit<CR>
" ..
set autowrite
command! W w
command! Q q

syntax on
colorscheme molokai
set nocp
set bs=2
set number
set lines=50
set columns=120
set sessionoptions=resize,winpos,winsize
set gdefault

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
"set visualbell    " don't beep
set noerrorbells  " don't beep
set t_vb=         " don't flash

set diffexpr=

if has('win32')
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10:cDEFAULT
elseif has('mac')
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
	set clipboard+=unnamed
	nnoremap ø :A<CR>
	nnoremap Ø :call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['**/*.h*', '**/*.inl',  '**/*.cpp', '**/*.c', '**/*.lua', '**/*.go', '**/*.sc', '**/*.sh', '**/*.*lsl']]) \| FufCoverageFile<CR>
	nnoremap ∏ :FufBuffer<CR>
	nnoremap <C-tab> :bn<CR>
	nnoremap <C-S-tab> :bt<CR>
elseif has('unix')
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif
