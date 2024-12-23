call plug#begin('~/.vim/plugged')

Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

"Plug 'zxqfl/tabnine-vim'

call plug#end()

" Vimscript initialization file
"let g:nightflyTransparent = v:true

" Vimscript initialization file
colorscheme nightfly
set background=dark
set number
set relativenumber
set mouse=a
set cursorline
set encoding=utf-8
set autoindent
set incsearch
set wildmenu
set laststatus=2
set confirm
set title
"set clipboard+=unnamedplus
"source ~/.vim/themes/terroo-colors.vim
set clipboard=unnamedplus
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
set history=10000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set tabstop=4
set shiftwidth=4
set expandtab

"" Some Maps Keys
map <C-q> :quit<CR>
map <C-s> :w<CR>
"map <C-x> :x!<CR>

"function to copy text on clipboard without version compiled
"function Func2X11()
":call system('xclip -selection c', @r)
"endfunction
"vnoremap <F9> "ry:call Func2X11()<cr>

"You Complete Me
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
"let g:airline_section_z = '◉ ␤ % %l/%c'

" NerdTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
let g:NERDTreeFileLines = 1
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
function! OpenInTab(node)
     call a:node.activate({'reuse': 'all', 'where': 't'})
endfunction
