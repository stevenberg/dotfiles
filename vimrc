set autowriteall
set backupdir=~/.cache/vim,~/,/tmp
set clipboard=unnamed
set colorcolumn=100
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
set tags+=vendor/tags,~/.rbenv/versions/**/tags,./.git/tags
set termguicolors
set undodir=~/.cache/vim,~/,/tmp
set undofile

let bg = trim(system('light-or-dark'))
if bg ==# 'light'
  set background=light
else
  set background=dark
endif

if exists('$BASE16_THEME')
    \ && (!exists('g:colors_name')
    \ || g:colors_name != 'base16-$BASE16_THEME')
  let base16colorspace=256
  colorscheme base16-$BASE16_THEME
endif

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#whitespace#enabled = 1
let g:ale_fix_on_save = 1
let g:delimitMate_matchpairs = '(:),[:],{:}'
let g:EasyCLipAutoFormat = 1
let g:EasyClipShareYanksFile = 1
let g:EasyClipShareYanksDirectory = '~/.cache/vim'
let g:EasyClipUseSubstituteDefaults = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:go_fmt_autosave = 0
let g:ruby_indent_block_style = 'do'
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_rails = 1
let g:mapleader = "\<space>"

function! PackInit() abort
  packadd minpac
  call minpac#init()
  call minpac#add('Raimondi/delimitMate')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('ap/vim-css-color')
  call minpac#add('base16-project/base16-vim', {'type': 'opt'})
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('mattn/emmet-vim')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('svermeulen/vim-easyclip')
  call minpac#add('tpope/vim-capslock')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-ragtag')
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-rsi')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-vinegar')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('vim-language-dept/css-syntax.vim')
  call minpac#add('dense-analysis/ale')
endfunction

command! SearchCount :%s///gn
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

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

nnoremap <c-p> :Files<cr>

augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/*,/var/folders/* setlocal noundofile
  autocmd VimResized * :wincmd =

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
