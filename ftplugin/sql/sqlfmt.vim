if !executable('sqlfmt')
  finish
endif

function! s:sqlfmt() abort
  call setqflist([])
  let lines = system(get(g:, 'sqlfmt_program', 'sqlfmt'), getline(1, '$'))
  if v:shell_error != 0
    echoerr substitute(lines, '[\r\n]', ' ', 'g')
  endif
endfunction

nnoremap <silent> <Plug>(sqlfmt) :<c-u>call <SID>sqlfmt()<cr>

command! -nargs=0 SQLFmt call <SID>sqlfmt()
