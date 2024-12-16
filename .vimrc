call plug#begin('~/.vim/plugged')

Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'zxqfl/tabnine-vim'

call plug#end()

" Vimscript initialization file
"let g:nightflyTransparent = v:true

" Vimscript initialization file
colorscheme nightfly
set background=dark
set nu!
set mouse=a
set cursorline
set encoding=utf-8
set autoindent
set incsearch
set wildmenu
set laststatus=2
set confirm
set title
set clipboard+=unnamedplus
"source ~/.vim/themes/terroo-colors.vim
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
"set cursorcolumn
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set tabstop=4
set shiftwidth=4
set expandtab

" Some Maps Keys
map <C-q> :quit<CR>
map <C-s> :w<CR>
map <C-x> :x!<CR>

" You Complete Me
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cuda', 'objc', 'objcpp', 'h', 'hpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ }]
let g:ycm_clangd_args=['--header-insertion=never']

" UtilSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Airline
let g:airline_theme = 'nightfly'
" powerline symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty='⚡'



