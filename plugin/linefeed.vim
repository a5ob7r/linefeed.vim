if get(g:, 'loaded_linefeed', 0)
  finish
endif

let g:loaded_linefeed = 1

inoremap <silent> <Plug>(linefeed-goup) <C-R>=linefeed#goup()<CR>
inoremap <silent> <Plug>(linefeed-up) <C-R>=linefeed#up()<CR>
inoremap <silent> <Plug>(linefeed-godown) <C-R>=linefeed#godown()<CR>
inoremap <silent> <Plug>(linefeed-down) <C-R>=linefeed#down()<CR>

" vim: set expandtab tabstop=2 shiftwidth=2 :
