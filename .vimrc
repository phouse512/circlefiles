set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" File viewer
Plugin 'scrooloose/nerdtree'

" Used for comments
Plugin 'scrooloose/nerdcommenter'

" Creates the status bar at the bottom
Plugin 'bling/vim-airline'

" Check for syntax problems
Plugin 'scrooloose/syntastic'

" git integration
Plugin 'tpope/vim-fugitive'

" all of the colors
Plugin 'flazz/vim-colorschemes'

" Better json
Plugin 'elzr/vim-json'

" for ruby
Plugin 'vim-ruby/vim-ruby'

" better identify indents so they can be highlited
Plugin 'nathanaelkane/vim-indent-guides'

" line up blocks of text
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" tab complete
Plugin 'ervandew/supertab'

"python debuger
"Plugin 'jaredly/vim-debug' install this through pip

"see where you are jumping too
Plugin 'Lokaltog/vim-easymotion'

Plugin 'motus/pig.vim'

"set up Goyo for minimalist typing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

set history=50
set autoindent  " Keeps the indent when you hit return



" PHIL's SETTINGS
set hlsearch    " highlight the word you are searching
set encoding=utf-8
syntax on       " Turn on syntax colors
set number      " Show the line numbers
set visualbell  " Flash the screen instead of making a sound
set list " Show spaces
set mouse=a     " Enable the use of the mouse in all modes
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
let mapleader = "," " Change leader key to ,
set tabstop=4 shiftwidth=4 expandtab " All tabs are spaces
set scrolloff=5 " the minimum # of lines above/below the cursor
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set cursorline  " Highlight the line the cursor is on
set ttyfast
set backspace=indent,eol,start
set incsearch   " Start searching as soon as you type
set laststatus=2    " Show airline all the time
set colorcolumn=85  " highlight column max
set wrap
set textwidth=79
set formatoptions=qrn1


" ------ SHORTCUTS -------
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" ------ UI CHANGES -------

color molokai   " Set the color scheme to molokai
set t_Co=256    " Turns on xterm colors so you can set the color of the cursor line
hi CursorLine   cterm=NONE ctermbg=235

" ------ Plugin Changes ------

" airline {
    let g:airline_theme='molokai'
    if !exists('g:airline_powerline_fonts')
e       " Use the default set of separators with a few customizations
"set nowrap      " Do not word wrap
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
    endif
"}

" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    endif
    " }

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

" vim-JSON {
    let g:vim_json_syntax_conceal = 0
" }

" vim-indent-guides {
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
" }

" Tabularize {
    if isdirectory(expand("~/.vim/bundle/tabular"))
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif
" }
let g:vim_markdown_folding_disabled = 1
set hlsearch

" disable arrow keys while in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" fold tag
nnoremap <leader>ft Vatzf

