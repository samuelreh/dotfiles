"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/samuelreh/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/samuelreh/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mileszs/ack.vim'

NeoBundleLazy 'Shougo/unite.vim', {
        \ 'autoload': {
        \   'commands': [
        \     'Unite',
        \     'UniteWithBufferDir',
        \     'UniteWithCurrentDir',
        \     'UniteWithProjectDir',
        \   ],
        \ },
        \ }

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make',
\    },
\ }

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

colorscheme Atom

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set ruler

set undolevels=1000
set backspace=indent,eol,start

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guifont=Monaco:h14

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader = ","

nnoremap <leader>. :NERDTreeToggle<Cr>

nnoremap <leader>S :Unite file_rec -default-action=split -direction=rightbelow<Cr>
nnoremap <leader>s :Unite file_rec/git file -default-action=split -direction=rightbelow -hide-source-names<Cr>
nnoremap <leader>e :Unite file_rec/async<Cr>
nnoremap <leader>o :Unite outline -auto-preview -buffer-name=outline<Cr>
nnoremap <leader>c :Unite colorscheme font -auto-preview<Cr>
nnoremap <leader>f :UniteWithBufferDir file_rec -default-action=split<Cr>
nnoremap <leader>m :Unite file_mru -default-action=split<Cr>
nnoremap <leader>b :Unite buffer -default-action=split<Cr>
nnoremap <leader>re :Unite ref/man ref/hoogle ref/pydoc -default-action=split<Cr>
nnoremap <leader>u :Unite history/command source command<Cr>
nnoremap <leader>p :Unite process -no-split -buffer-name=process<Cr>
nnoremap <leader>q :UniteClose build<Cr>
