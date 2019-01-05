set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" install NerdTree 
Plugin 'scrooloose/nerdTree'

" vim markdown with tabular dependency
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" install colorschemes
Plugin 'flazz/vim-colorschemes'

" git integration
Plugin 'tpope/vim-fugitive'

" junegunn minimalist writing screen
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" go autocompletion
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" golang code format plugin
Plugin 'fatih/vim-go'

" solidity plugin
Plugin 'tomlion/vim-solidity'

" vim plugin
Plugin 'moll/vim-node'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set mouse=a
set t_Co=256
colorscheme gardener
syntax on

let mapleader = "," " change leader key to ,
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " highlight whitespace
set visualbell
set encoding=utf-8
set expandtab
set tabstop=4 shiftwidth=4 expandtab " all tabs are spaces
set autoindent
set nu " display line numbers
let g:vim_markdown_folding_disabled = 1
set nofoldenable
set scrolloff=5
set showmode
set wildmenu
set wildmode=list:longest
set cursorline "highlight the line the cursor is on
set ttyfast
set backspace=indent,eol,start
set incsearch
set laststatus=2
"set colorcolumn=85
set wrap
set textwidth=79
set formatoptions=qrn1

hi CursorLine cterm=NONE ctermbg=235

" disable arrow keys while in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" disable arrow keys while in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
nnoremap <silent><leader>rd :.-1r! echo $RANDOM<CR>


" Fugitive {
    if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>

        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
"}
