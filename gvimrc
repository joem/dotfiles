if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Set window size
  set lines=77
  set columns=141 " Allows room for nerdtree to add its scrollbar into

  " Disable beeping and flashing for all errors
  set vb t_vb=

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-e for ConqueTerm
  map <D-e> :call StartTerm()<CR>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

  "" Map Command-# to switch tabs
  "map  <D-0> 0gt
  "imap <D-0> <Esc>0gt
  "map  <D-1> 1gt
  "imap <D-1> <Esc>1gt
  "map  <D-2> 2gt
  "imap <D-2> <Esc>2gt
  "map  <D-3> 3gt
  "imap <D-3> <Esc>3gt
  "map  <D-4> 4gt
  "imap <D-4> <Esc>4gt
  "map  <D-5> 5gt
  "imap <D-5> <Esc>5gt
  "map  <D-6> 6gt
  "imap <D-6> <Esc>6gt
  "map  <D-7> 7gt
  "imap <D-7> <Esc>7gt
  "map  <D-8> 8gt
  "imap <D-8> <Esc>8gt
  "map  <D-9> 9gt
  "imap <D-9> <Esc>9gt


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

" Default gui color scheme
"colorscheme ir_black    " good
"colorscheme candycode   " good
"colorscheme macvim      " best!
colorscheme tomorrow-night  "trying it out
set bg=dark
set cursorline          " show the cursor line (maybe its better to not do so?)
" set cursorcolumn          " show the cursor column (maybe its better to not do so?)
"Improve the todo highlighting in 'tomorrow-night':
hi Todo gui=NONE guifg=Black guibg=DeepSkyBlue1


" ConqueTerm wrapper
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction


""" Removed because this IS my local config!:
"" Include user's local vim config
"if filereadable(expand("~/.gvimrc.local"))
"  source ~/.gvimrc.local
"endif
