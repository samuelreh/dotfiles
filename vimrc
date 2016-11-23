"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'xolox/vim-misc' 
NeoBundle 'shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 't9md/vim-choosewin'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make',
\    },
\ }

NeoBundle 'Shougo/neocomplete', {'depends': [
      \ 'Shougo/neoinclude.vim',
      \ 'Shougo/neco-syntax',
      \ 'Shougo/neco-vim' ]}

NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ensime/ensime-vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

colorscheme ir_black

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
set guifont=Monaco:h12

set clipboard=unnamed

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader = ","

nnoremap <leader>. :VimFilerExplorer -auto-expand -split -winwidth=30<Cr>
let g:vimfiler_as_default_explorer = 1
let g:choosewin_overlay_enable = 1

nnoremap <leader>S :Unite file_rec -default-action=split<Cr>
nnoremap <leader>s :Unite file_rec/git file -default-action=split -hide-source-names<Cr>
nnoremap <leader>e :Unite file_rec/async<Cr>
nnoremap <leader>o :Unite outline -auto-preview -buffer-name=outline<Cr>
nnoremap <leader>f :UniteWithBufferDir file_rec -default-action=split<Cr>
nnoremap <leader>m :Unite file_mru -default-action=split<Cr>
nnoremap <leader>b :Unite buffer -default-action=split<Cr>
nnoremap <leader>re :Unite ref/man ref/hoogle ref/pydoc -default-action=split<Cr>
nnoremap <leader>u :Unite history/command source command<Cr>
nnoremap <leader>q :UniteClose build<Cr>

nnoremap <leader>t :EnInspectType<Cr>
nnoremap <leader>T :EnType<Cr>
nnoremap <leader>p :TypeCheck<Cr>
nnoremap <leader>] :EnDeclaration<Cr>

" unite-grep
nnoremap sg :<C-u>Unite grep:. -default-action=split<Cr>
nnoremap sG :<C-u>execute 'Unite grep:.:-iR:' . expand('<cword>') . ' -default-action=split'<Cr>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore tags --ignore target'
  let g:unite_source_grep_recursive_opt = ''
endif


" Ctags
set tags=./.tags,.tags,./tags,tags


" Autocompletion
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

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
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0

let g:syntastic_javascript_checkers = ['eslint']
