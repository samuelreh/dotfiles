let g:python3_host_prog = '/usr/local/var/pyenv/versions/3.5.2/bin/python'

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' } 
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Completion
Plug 'Shougo/deoplete.nvim'

" Initialize plugin system
call plug#end()

colorscheme jellybeans

" Denite config
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> fi :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
nnoremap <silent> fb :<C-u>Denite buffer<CR>

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
nnoremap <silent> fg :<C-u>Denite grep<CR>
nnoremap <silent> fs :<C-u>DeniteCursorWord grep<CR>

call denite#custom#source('file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

" Tags tags tags
set tags=./.tags,.tags,./tags,tags

" Spaces > Tabs
filetype plugin indent on

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Line NUmbering
set number                     " Show current line number
set relativenumber             " Show relative line numbers

" Keep buffer open
set hidden

" Tree
let g:netrw_banner=0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist

" Use deoplete.
let g:deoplete#enable_at_startup = 1
