let g:python3_host_prog = '/usr/local/var/pyenv/versions/3.6.2/bin/python'

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' } 
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'padde/jump.vim'
Plug 'airblade/vim-rooter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()

colorscheme jellybeans

" Denite config
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', ''])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> fi :<C-u>Denite `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
nnoremap <silent> fb :<C-u>Denite buffer<CR>
nnoremap <silent> ff :<C-u>Denite file_rec<CR>

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

set autoread

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
let g:netrw_keepdir=0
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist

" Use deoplete.
let g:deoplete#enable_at_startup = 1

nnoremap <F5> "=strftime("%A, %b %d, %Y")<CR>P

command! CDPWD cd %:p:h

augroup markdownSpell
    autocmd!
    autocmd FileType md,markdown,txt setlocal spell
augroup END

call defx#custom#option('_', {
    \ 'winwidth': 45,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 1,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1
    \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent> <leader>- :<C-u>Defx -split=vertical -winwidth=50 -direction=topleft<CR>
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  " Define mappings
  nnoremap <silent><buffer><expr> c \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> E \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd \ defx#do_action('change_vim_cwd')
endfunction
