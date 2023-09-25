function! s:strcharpart_before_cursor() abort
  return strpart(getline('.'), 0, col('.') - 1)
endfunction

function! s:cursor_position_on_left_side() abort
  return searchpos('.', 'bn', line('.'))
endfunction

function! s:indent_whitespaces(n) abort
  let l:tabs = &expandtab ? 0 : a:n / &tabstop
  let l:spaces = &expandtab ? a:n : a:n % &tabstop

  return repeat("\<Tab>", l:tabs) . repeat(' ', l:spaces)
endfunction

function! s:indent_str() abort
  let l:screen_column_until_cursor = virtcol(s:cursor_position_on_left_side())

  return s:indent_whitespaces(l:screen_column_until_cursor)
endfunction

function! s:current_indent_str() abort
  return matchstr(getline('.'), '\s\+')
endfunction

function! linefeed#goup() abort
  return "\<C-T>\<C-U>0\<C-D>" . s:indent_str() . "\<End>\<CR>0\<C-D>" . s:strcharpart_before_cursor() . "\<Up>"
endfunction

function! linefeed#up() abort
  return "\<Home>\<CR>0\<C-D>" . s:current_indent_str() . "\<End>\<Up>\<End>\<C-T>\<C-U>0\<C-D>" . s:indent_str()
endfunction

function! linefeed#godown() abort
  return "\<CR>\<C-T>\<C-U>0\<C-D>" . s:indent_str()
endfunction

function! linefeed#down() abort
  return "\<End>\<CR>0\<C-D>" . s:indent_str()
endfunction

" vim: set expandtab tabstop=2 shiftwidth=2 :
