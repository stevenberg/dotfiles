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

source ~/.vim/vars.vim

function! PackInit() abort
  packadd minpac
  call minpac#init()
  source ~/.vim/packinit.vim
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
