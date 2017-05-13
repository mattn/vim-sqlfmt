if !executable('sqlfmt')
  finish
endif

function! s:sqlfmt(...) abort
  call setqflist([])
  let lines = system(g:sqlfmt_program, getline(1, '$'))
  if v:shell_error == 0
    echoerr lines
  endif
endfunction

command! -nargs=* -complete=file SQLFmt call <SID>sqlfmt(<f-args>)
