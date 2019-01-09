packadd minpac
call minpac#init()
call minpac#add('Raimondi/delimitMate')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('ap/vim-css-color')
call minpac#add('chriskempson/base16-vim', {'type': 'opt'})
call minpac#add('craigemery/vim-autotag')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('janko-m/vim-test')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-lastpat')
call minpac#add('kana/vim-textobj-user')
call minpac#add('mattn/emmet-vim')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('svermeulen/vim-easyclip')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-capslock')
call minpac#add('tpope/vim-characterize')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-dotenv')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
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
call minpac#add('w0rp/ale')

set autowriteall
set background=dark
set backupdir=~/.cache/vim,~/,/tmp
set clipboard=unnamed
set colorcolumn=81
set cursorline
set directory=~/.cache/vim,~/,/tmp
set expandtab
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ --smart-case
set hlsearch
set ignorecase
set mouse=a
set number
set numberwidth=4
set relativenumber
set secure
set shell=$SHELL
set shiftwidth=4
set showcmd
set signcolumn=yes
set smartcase
set spelllang=en_us
set splitbelow
set splitright
set tabstop=4
set tags+=vendor/tags,~/.rbenv/versions/**/tags
set termguicolors
set undodir=~/.cache/vim,~/,/tmp
set undofile

if has('gui')
  set guicursor+=n-v-c:blinkon0
  set guifont=SF\ Mono:h12
  set guioptions=gm
endif

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
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
\   'python': ['autopep8', 'isort'],
\   'ruby': ['rubocop', 'rufo'],
\   'rust': ['rustfmt'],
\   'scss': ['stylelint', 'prettier'],
\   'sh': ['shfmt'],
\   'vue': ['prettier'],
\}
let g:ale_linters = {
\    'fish': [],
\    'java': [],
\   'javascript': ['eslint', 'prettier'],
\}
let g:ale_c_clangformat_options = '-style=WebKit'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_sh_shfmt_options = '-i 4'
let g:ale_fix_on_save = 1
let g:ctrlp_user_command = "rg --files --hidden --follow -g '!.git' -g '!.keep' %s"
let g:delimitMate_matchpairs = '(:),[:],{:}'
let g:EasyCLipAutoFormat = 1
let g:EasyClipShareYanksFile = 1
let g:EasyClipShareYanksDirectory = '~/.cache/vim'
let g:EasyClipUseSubstituteDefaults = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:go_fmt_autosave = 0
let g:php_cs_fixer_config_file = '.php_cs.dist'
let g:ruby_indent_block_style = 'do'
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_rails = 1
let g:rustfmt_autosave = 1
let g:mapleader = "\<space>"

if filereadable(expand('~/.vimrc_background'))
  let g:base16colorbase=256
  source ~/.vimrc_background
endif

command! SearchCount :%s///gn
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nmap <leader>vr :tabedit $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>n <Plug>RelativeNumberToggle

nnoremap gm m
nnoremap <leader>s :SearchCount<cr>
nnoremap <leader>wtf oputs '#' * 80<c-m>puts caller<c-m>puts '#' * 80<esc>

nnoremap & :&&<cr>
xnoremap & :&&<cr>

augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/*,/var/folders/* setlocal noundofile
  autocmd VimResized * :wincmd =

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
