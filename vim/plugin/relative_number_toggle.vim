function s:RelativeNumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

nnoremap <Plug>RelativeNumberToggle :<C-U>call <SID>RelativeNumberToggle()<CR>

augroup relative_number_toggle
  autocmd!
  autocmd FocusLost,InsertEnter * :set norelativenumber
  autocmd FocusGained,InsertLeave * :set relativenumber
augroup END
