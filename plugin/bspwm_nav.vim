" Defines functions for moving windows or forwarding the move on to bspwm

" TODO figure out what &cp does and what version of vim is required
if exists("g:loaded_bspwm_nav") || &cp || v:version < 700
  finish
endif

let g:loaded_bspwm_nav = 1

function! s:BspwmNavigate(dir)
  let nr = winnr()
  call s:VimNavigate(a:dir)

  if nr == winnr()
    let cmd = 'bspc window -f '
    if a:dir == 'h'
      let cmd = cmd . 'left'
    elseif a:dir == 'j'
      let cmd = cmd . 'down'
    elseif a:dir == 'k'
      let cmd = cmd . 'up'
    elseif a:dir == 'l'
      let cmd = cmd . 'right'
    else
      " TODO throw error
    endif
    silent call system(cmd)
  endif
endfunction

function! s:VimNavigate(dir)
  try
    execute 'wincmd ' . a:dir
  catch
    echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits: wincmd k' | echohl None
  endtry
endfunction

command! BspwmNavigateLeft     call <SID>BspwmNavigate('h')
command! BspwmNavigateDown     call <SID>BspwmNavigate('j')
command! BspwmNavigateUp       call <SID>BspwmNavigate('k')
command! BspwmNavigateRight    call <SID>BspwmNavigate('l')

nnoremap <silent> <c-left>  :BspwmNavigateLeft<cr>
nnoremap <silent> <c-down>  :BspwmNavigateDown<cr>
nnoremap <silent> <c-up>    :BspwmNavigateUp<cr>
nnoremap <silent> <c-right> :BspwmNavigateRight<cr>

inoremap <silent> <c-left>  <c-o>:BspwmNavigateLeft<cr>
inoremap <silent> <c-down>  <c-o>:BspwmNavigateDown<cr>
inoremap <silent> <c-up>    <c-o>:BspwmNavigateUp<cr>
inoremap <silent> <c-right> <c-o>:BspwmNavigateRight<cr>
