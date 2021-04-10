if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Set window size
  set lines=70
  set columns=111

  " Disable beeping and flashing for all errors
  set vb t_vb=

  "" Command-Return for fullscreen
  "macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  "" Command-Shift-F for Ack
  "map <D-F> :Ack<space>

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

  " I disabled the following so that I have the yy/p clipboard and the <C-c>/<C-v> separately:
  "set clipboard=unnamed   " for osx clipboard integration

  " CTL-TAB and CTL-SHIFT-TAB cycle tabs forward and backward
  " (only set in gvim, since it might conflict with terminal tabs)
  nmap <c-tab> :tabnext<cr>
  imap <c-tab> <c-o>:tabnext<cr>
  vmap <c-tab> <c-o>:tabnext<cr>
  nmap <c-s-tab> :tabprevious<cr>
  imap <c-s-tab> <c-o>:tabprevious<cr>
  vmap <c-s-tab> <c-o>:tabprevious<cr>

  " CMD-SHIFT-RIGHT and CMD-SHIFT-LEFT cycle tabs forward and backward
  " (only set in gvim, since it might conflict with terminal tabs)
  nmap <d-s-Left> :tabprevious<cr>
  imap <d-s-Left> <c-o>:tabprevious<cr>
  vmap <d-s-Left> <c-o>:tabprevious<cr>
  nmap <d-s-Right> :tabnext<cr>
  imap <d-s-Right> <c-o>:tabnext<cr>
  vmap <d-s-Right> <c-o>:tabnext<cr>
endif

" Start without the toolbar
set guioptions-=T

" " Default gui color scheme
" " Don't set one here anymore since I set solarized in vimrc!
" colorscheme macvim      " good
" colorscheme ir_black    " ok
" colorscheme candycode   " ok
" colorscheme tomorrow-night " ok?
set bg=dark
set cursorline          " show the cursor line (maybe its better to not do so?)
" set cursorcolumn          " show the cursor column (maybe its better to not do so?)
""Improve the todo highlighting in 'tomorrow-night':
"hi Todo gui=NONE guifg=Black guibg=DeepSkyBlue1

