packadd minpac
call minpac#init()
call minpac#add('Raimondi/delimitMate')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('chriskempson/base16-vim', {'type': 'opt'})
call minpac#add('craigemery/vim-autotag')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('fatih/vim-go')
call minpac#add('janko-m/vim-test')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('kana/vim-textobj-user')
call minpac#add('kassio/neoterm', {'type': 'opt'})
call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})
call minpac#add('mattn/emmet-vim')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('noahfrederick/vim-composer')
call minpac#add('noahfrederick/vim-laravel')
call minpac#add('rust-lang/rust.vim')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('svermeulen/vim-easyclip')
call minpac#add('tpope/tpope-vim-abolish')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-capslock')
call minpac#add('tpope/vim-characterize')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-dotenv')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-flagship')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-git')
call minpac#add('tpope/vim-jdaddy')
call minpac#add('tpope/vim-obsession')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-ragtag')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-rbenv')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-rsi')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-vinegar')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('w0rp/ale')

set autowriteall
set background=dark
set backupdir=~/.cache/vim,~/,/tmp
set clipboard=unnamed
set colorcolumn=81
set cursorline
set directory=~/.cache/vim,~/,/tmp
set expandtab
set grepprg=rg\ --no-header\ --color\ never
set hlsearch
set mouse=a
set number
set numberwidth=4
set relativenumber
set secure
set shell=$SHELL
set shiftwidth=4
set showcmd
set signcolumn=yes
set splitbelow
set splitright
set tabstop=4
set tags+=~/.gem/$RUBY_ENGINE/$RUBY_VERSION/gems/**/tags
set tags+=~/.rubies/$RUBY_ENGINE-$RUBY_VERSION/**/tags
set tags+=./.gem/$RUBY_ENGINE/$RUBY_VERSION/gems/**/tags
set termguicolors
set undodir=~/.cache/vim,~/,/tmp
set undofile

if has('gui')
  set guicursor+=n-v-c:blinkon0
  set guifont=SF\ Mono:h12
  set guioptions=gm
  set columns=100
  set lines=60
endif

if has('nvim')
  set inccommand=split
endif

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:ale_fixers = {
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'css': ['stylelint', 'prettier'],
\   'go': ['goimports'],
\   'javascript': ['eslint', 'prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'php': ['php_cs_fixer'],
\   'ruby': ['rubocop'],
\   'rust': ['rustfmt'],
\   'scss': ['stylelint', 'prettier'],
\   'sh': ['shfmt'],
\   'vue': ['prettier'],
\}
let g:ale_linters = {
\   'eruby': [],
\   'javascript': ['eslint', 'prettier'],
\}
let g:ale_c_clangformat_options = '-style=WebKit'
let g:ale_sh_shfmt_options = '-i 4'
let g:ale_fix_on_save = 1
let g:ctrlp_user_command = "rg --files --hidden --follow -g '!.git' -g '!.keep' %s"
let g:EasyCLipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:go_fmt_autosave = 0
let g:php_cs_fixer_config_file = '.php_cs.dist'
let g:ruby_indent_block_style = 'do'
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_rails = 1
let g:rustfmt_autosave = 1
let g:solarized_extra_hi_groups = 1
let g:mapleader = "\<space>"

if has('nvim')
  let g:test#strategy='neoterm'
endif

if filereadable(expand('~/.vimrc_background'))
  let g:base16colorbase=256
  source ~/.vimrc_background
endif

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

nmap 0 ^
nmap <leader>vr :tabedit $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>p :Files<cr>

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

nnoremap <leader>n :call NumberToggle()<cr>
nnoremap <leader>wtf oputs '#' * 80<c-m>puts caller<c-m>puts '#' * 80<esc>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-l> <c-\><c-n><c-w>l
  nnoremap <a-h> <c-w>h
  nnoremap <a-j> <c-w>j
  nnoremap <a-k> <c-w>k
  nnoremap <a-l> <c-w>l
  tnoremap <expr> <a-r> '<c-\><c-n>"'.nr2char(getchar()).'pi'
endif

augroup vimrc
  autocmd!
  autocmd FocusLost * :set norelativenumber
  autocmd FocusGained * :set relativenumber
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd Filetype help nmap <buffer> q :q<cr>
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
  autocmd BufRead,BufNewFile Brewfile setfiletype ruby
  autocmd VimResized * :wincmd =

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
