let g:python3_host_prog = '/Users/samuelreh/miniconda3/bin/python'

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' } 
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'padde/jump.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master'}
Plug 'brooth/far.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'vim-airline/vim-airline'
Plug 'tmhedberg/SimpylFold'



" Initialize plugin system
call plug#end()

colorscheme jellybeans

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Change matchers.
call denite#custom#source('file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source('file/rec', 'matchers', ['matcher/cpm'])

nnoremap <silent> fi :<C-u>Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
nnoremap <silent> fm :<C-u>Denite file_mru<CR>
nnoremap <silent> fb :<C-u>Denite buffer<CR>
nnoremap <silent> ff :<C-u>Denite file/rec<CR>
nnoremap <silent> fg :<C-u>Denite grep<CR>
nnoremap <silent> fs :<C-u>DeniteCursorWord grep<CR>

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#alias('source', 'file/rec/py', 'file/rec')

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

set wildignore+=.git,.DS_Store,.npm,*.zip,*.tgz,*.pdf,*.mp4,*.bmp,*.ico,*.jpg,*.png,*.gif,*.epub,.hg,.dropbox,.config,.cache,*.pyc,node_modules/*,*.min.*

set clipboard=unnamed


" Tags tags tags
set tags=./.tags,.tags,./tags,tags

set autoread

" Spaces > Tabs
filetype plugin indent on

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

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

nnoremap <F5> "=strftime("%A, %b %d, %Y")<CR>P

command! CDPWD cd %:p:h

augroup markdownSpell
    autocmd!
    autocmd FileType md,markdown,txt setlocal spell
augroup END

" Folding
nnoremap <space> za
vnoremap <space> zf

g:SimpylFold_fold_docstring = 0

call defx#custom#option('_', {
    \ 'show_ignored_files': 1,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1
    \ })

nnoremap <silent> <leader>- :<C-u>Defx -split=vertical -winwidth=50 -direction=topleft<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  " Define mappings
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> l defx#do_action('drop')
  nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> M defx#do_action('new_file')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = ['coc-solargraph']

" global find/replace inside working directory
function! FindReplace()
  " figure out which directory we're in
	let dir = expand('%:h')
  " ask for patterns
  call inputsave()
  let find = input('Pattern: ')
  call inputrestore()
  let replace = input('Replacement: ')
  call inputrestore()
  " are you sure?
  let confirm = input('WARNING: About to replace ' . find . ' with ' . replace . ' in ' . dir . '/**/* (y/n):')
  " clear echoed message
  :redraw
  if confirm == 'y'
    " find with rigrep (populate quickfix )
    :silent exe 'Rg ' . find
    " use cfdo to substitute on all quickfix files
    :silent exe 'cfdo %s/' . find . '/' . replace . '/g | update'
    " close quickfix window
    :silent exe 'cclose'
    :echom('Replaced ' . find . ' with ' . replace . ' in all files in ' . dir )
  else
    :echom('Find/Replace Aborted :(')
    return
  endif
endfunction
nnoremap <Leader>fr :call FindReplace()<CR>


