" vim: set tabstop=2 shiftwidth=2 et fdm=marker:

" Hint: To toggle a fold, use:   za
"       To open all folds, use:  ,fo
"       To close all folds, use: ,fc

" Environment ---------------{{{

  " Basics
  set nocompatible        " Must be first line
  "if !(has('win16') || has('win32') || has('win64'))
  "    set shell=/bin/sh
  "endif

  "" Windows Compatible
  "" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
  "" across (heterogeneous) systems easier.
  "if has('win32') || has('win64')
  "  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  "endif

  " ---------------------------------------------------------------------------
  " load the pathogen bundle
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  " make pathogen load all bundles (plugins):
  execute pathogen#infect()

  " ---------------------------------------------------------------------------
  "  backup options
  set backup
  set backupdir=~/.backup
  set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
  set history=200
  "set viminfo='100,f1

  " ---------------------------------------------------------------------------
  " setup for the visual environment
  if $TERM =~ '^xterm'
    "set t_Co=16   " changed from 256
    set t_Co=256
  elseif $TERM =~ '^screen-bce'
    set t_Co=256            " just guessing
  elseif $TERM =~ '^rxvt'
    set t_Co=88
  elseif $TERM =~ '^linux'
    set t_Co=8
  else
    set t_Co=16
  endif

" }}}

" General ---------------{{{

  "move to UI
  set ruler                     " show the line number on the bar
  set number                    " line numbers
  set showmode                  " show current mode down the bottom
  set showcmd                   " show incomplete cmds down the bottom
  set linebreak                 " wrap lines at convenient points
  set cmdheight=1               " command line 1 line high (was: 2)
  set wildmode=longest:full
  set wildignore+=*.o,*~,.lo    " ignore object files
  set wildmenu                  " menu has tab completion
  set list                            " display tabs, trailing spaces, nbsp's
  set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " and only tabs, trailing spaces, nbsp's
  "set listchars=eol:$,tab:^I          " default, for comparison
  " set foldmethod=syntax         " fold on syntax automagically, always
  " set foldcolumn=2              " 4 lines of column for fold showing, always
  set wrap                      " Line wrapping off

  "ok in general
  syntax on
  set more                      " use more prompt
  set autoread                  " watch for file changes
  set hidden                    " hide buffers when not displayed
  set noautowrite               " don't automagically write on :next
  set lazyredraw                " don't redraw when don't have to
  set modeline                  " enable modelines, they're safe enough now
  set modelines=5               " enable modelines, they're safe enough now
  set scrolloff=5               " keep at least 5 lines above/below
  set sidescrolloff=5           " keep at least 5 lines left/right
  set backspace=indent,eol,start  " allow backspacing over everything in insert mode
  set showfulltag               " show full completion tags
  set noerrorbells              " no error bells please
  set undolevels=1000           " 1000 undos
  set updatecount=100           " switch every 100 chars
  set completeopt=longest,menu,preview " completion options
  set complete=.,w,b,u,U,t      " do lots of scanning on tab completion
  set ttyfast                   " we have a fast terminal
  filetype on                   " Enable filetype detection
  filetype indent on            " Enable filetype-specific indenting
  filetype plugin on            " Enable filetype-specific plugins
  "filetype plugin indent on   " Automatically detect file types. (one line)
  "compiler ruby                 " Enable compiler support for ruby
  let maplocalleader=','        " all my macros start with ,
  "set whichwrap=<,>,h,l,[,]     " Lets arrow keys (and h,l) wrap past end of lines
  set ssop-=options             " do not store global & local values in a session
  set ssop-=folds               " do not store folds in a session
  let g:is_posix = 1            " consider all shell scripts as POSIX

  set dictionary=/usr/share/dict/words " more words!

  "" make omnicomplete complete from syntax if there's nothing else to use
  "if has("autocmd") && exists("+omnifunc")
  "  autocmd Filetype *
  "        \   if &omnifunc == "" |
  "        \           setlocal omnifunc=syntaxcomplete#Complete |
  "        \   endif
  "endif

  "  mouse stuffs
  set mouse=a                   " mouse support in all modes
  set mousehide                 " hide the mouse when typing

  " ---------------------------------------------------------------------------
  "  spelling...
  if v:version >= 700
    "use english for spellchecking
    "setlocal spelllang=en
    setlocal spelllang=en_us
    "use ,ss to toggle spellchecking on/off
    nmap <LocalLeader>ss :set spell! spell?<CR>
    "don't spellcheck by default
    set nospell
  endif

  " ---------------------------------------------------------------------------
  "  searching and diffs
  set incsearch                 " incremental search
  set ignorecase smartcase      " search ignoring case, unless you use a capital
  set hlsearch                  " highlight the search
  set showmatch                 " show matching bracket
  set diffopt=filler            " insert filler to make lines match up
  set diffopt+=iwhite           " ignore all whitespace
  set diffopt+=vertical         " make :diffsplit default to vertical

" }}}

" Vim UI ---------------{{{

  "colorscheme candycode   " .gvimrc uses a different colorscheme
  colorscheme tomorrow-night  " test running this, think i like it!
  "Improve the todo coloring for 'tomorrow-night':
  hi Todo gui=NONE guifg=Black guibg=DeepSkyBlue1

  " Disable beeping and flashing for all errors
  set noerrorbells visualbell t_vb=

  "improve autocomplete menu color
  highlight Pmenu ctermbg=238 gui=bold

  " Make the 81st column stand out
  highlight ColorColumn ctermbg=magenta
  call matchadd('ColorColumn', '\%81v', 100)


  " ---------------------------------------------------------------------------
  " statusline setup
  " (this is currently overridden with airline, so this is just in case)
  hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
  hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
  hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green

  set laststatus=2
  if has('statusline')
    set statusline=   " clear the statusline, allow for rearranging parts
    set statusline+=%f                "Path to the file, as typed or relative to current dir
    set statusline+=%#errormsg#        "change color
    set statusline+=%{&ff!='unix'?'['.&ff.']':''}   "display a warning if fileformat isnt unix
    set statusline+=%*                "reset color to normal statusline color
    set statusline+=%#errormsg#       "change color
    set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}   "display a warning if file encoding isnt utf-8
    set statusline+=%*                "reset color to normal statusline color
    set statusline+=\ %y              "filetype
    set statusline+=%([%R%M]%)        "read-only (RO), modified (+) and unmodifiable (-) flags between braces
    set statusline+=%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%* "shows '!' if file format is not platform default
    set statusline+=%{'~'[&pm=='']}   "shows a '~' if in patchmode
    set statusline+=\ %{fugitive#statusline()}  "show Git info, via fugitive.git
    "set statusline+=\ (%{synIDattr(synID(line('.'),col('.'),0),'name')}) "DEBUG : display the current syntax item name
    set statusline+=%#error#          "change color
    set statusline+=%{&paste?'[paste]':''}    "display a warning if &paste is set
    set statusline+=%*                "reset color to normal statusline color
    set statusline+=%=                "right-align following items
    "set statusline+=%{v:register}     "active register
    set statusline+=\ %l/%L           "current line number/total number of lines,
    set statusline+=\ \ %2.c          "Column number (space padded)
    set statusline+=\ %3.p%%          "percentage of lines through the file% (space padded)
    set statusline+=\                 "trailing space

    if has('title')
      set titlestring=%t%(\ [%R%M]%)
    endif

    "highlight StatusLine    ctermfg=White ctermbg=DarkBlue cterm=bold
    "highlight StatusLineNC  ctermfg=White ctermbg=DarkBlue cterm=NONE
  endif

" }}}

" Formatting ---------------{{{

  set autoindent smartindent    " auto/smart indent
  set expandtab                 " expand tabs to spaces
  set smarttab                  " tab and backspace are smart
  set tabstop=2                 " 2 spaces
  set shiftwidth=2              " 2 spaces

" }}}

" Key (re)Mappings ---------------{{{

  " ---------------------------------------------------------------------------
  " some useful mappings
  " No Help, please
  map <F1> <Esc>
  map! <F1> <Esc>
  " make Y consistent with C and D (Y yanks from cursor to $)
  map Y y$
  " open all folds
  nmap <LocalLeader>fo  :%foldopen!<cr>
  " close all folds
  nmap <LocalLeader>fc  :%foldclose!<cr>
  " use ,ww to toggle line wrapping
  nmap <LocalLeader>ww :set wrap! wrap?<cr>
  " ,hh will turn search highlighting off temporarily
  nmap <LocalLeader>hh :noh<cr>
  " Search mappings: These will make it so that going to the next one in a
  " search will center on the line it's found in.
  map N Nzz
  map n nzz
  " ,uu will underline current line for a Markdown header
  " ,u- does same
  " ,u= does same but with =
  nnoremap <silent> <LocalLeader>uu yyp<c-v>$r-
  nnoremap <silent> <LocalLeader>u- yyp<c-v>$r-
  nnoremap <silent> <LocalLeader>u= yyp<c-v>$r=
  "' resize horzontal split window
  nmap <C--> <C-W>-<C-W>-
  nmap <C-+> <C-W>+<C-W>+
  " move up/down like a webbrowser using shift-up/shift-down
  map <s-Down> <C-E>
  map <s-Up> <C-Y>
  " Space will toggle folds!
  "nnoremap <space> za
  " Space works like in a webbrowser
  nnoremap <space> <PageDown>
  nnoremap <s-space> <PageUp>

  " use :Tidy when viewing html to tidy it up
  command! Tidy :%!tidy -quiet -i -f /dev/null
  " use ,jt when viewing json to tidy it up
  nmap <LocalLeader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" }}}

" File Types ---------------{{{

  "make
  autocmd FileType make setlocal noexpandtab   "use tabs instead of spaces in makefiles

  "python
  autocmd FileType python setlocal tabstop=4     " 4 spaces in python files
  autocmd FileType python setlocal shiftwidth=4  " 4 spaces in python files

  ""(Can't figure out how to make this work without undoing settings for .py files!)
  ""htmldjango (to undo the python settings)
  "autocmd FileType python set tabstop=2     " 2 spaces in python files
  "autocmd FileType python set shiftwidth=2  " 2 spaces in python files

  "xml
  "(via http://ku1ik.com/2011/09/08/formatting-xml-in-vim-with-indent-command.html)
  au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

  ""ruby
  "autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  "autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  "autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  "autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  " Stop the mouseover balloons
  autocmd FileType ruby,eruby setlocal balloonexpr=

  " KiCad s-expression format files
  au BufNewFile,BufRead *.kicad_mod,*.kicad_pcb setlocal filetype=lisp

  runtime ftplugin/man.vim  " lets you now do :Man COMMAND to get a manpage

" }}}

" Plugins ---------------{{{


  " Settings for :TOhtml
  let html_number_lines=1
  let html_use_css=1
  let use_xhtml=1

  " Settings for airline
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  "let g:airline_theme='powerlineish'
  set ttimeoutlen=50

  " ---------------------------------------------------------------------------
  "  Processing settings
  let processing_doc_path="/Applications/Processing.app/Contents/Resources/Java/reference"

  " ---------------------------------------------------------------------------
  " " latex-suite settings
  "
  " " IMPORTANT: grep will sometimes skip displaying the file name if you
  " " search in a singe file. This will confuse Latex-Suite. Set your grep
  " " program to always generate a file-name.
  " set grepprg=grep\ -nH\ $*
  "
  " " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
  " " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
  " " The following changes the default filetype back to 'tex':
  " let g:tex_flavor='latex'

  let g:Tex_ViewRule_pdf = 'Preview'

  " Change the netrw plugin to get the source view, instead of the rendered view
  " (when opening something from a http:// or ftp:// file location)
  " NOTE: the following works if you have elinks (preferred), might not otherwise
  let g:netrw_http_xcmd= "-source >"
  " NOTE: the following will work if you have wget, won't otherwise
  "let g:netrw_http_cmd = "wget -q -O"

  " the following doesn't work right in terminal, but works ok in macvim:
  " " Settings for netrw/vinegar
  " " let escape return you to previous buffer:
  " autocmd FileType netrw nmap <buffer> <esc> <C-^>

  " Setting for rainbow parantheses
  let g:rainbow_active = 0 "set to 0 if you want to enable it later via :RainbowToggle

" }}}

" GUI Settings ---------------{{{

" }}}

" Functions ---------------{{{

" }}}



" ---------------------------------------------------------------------------
" auto load extensions for different file types
if has('autocmd')

        "jump to last cursor position when opening a file
        "dont do it when writing a commit log entry
        autocmd BufReadPost *
              \ if &filetype !~ 'commit\c'|
              \      if line("'\"") > 0|
              \            if line("'\"") <= line("$")|
              \                    exe("norm '\"")|
              \            else|
              \                    exe "norm $"|
              \            endif|
              \      endif|
              \ endif

        " improve legibility
        au BufRead quickfix setlocal nobuflisted wrap number

        " improved formatting for markdown
        " http://plasticboy.com/markdown-vim-mode/
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
endif

" ---------------------------------------------------------------------------
"  misc stuff


" TODO: make a ':Rebuildhelptags' command that does:
"   :helptags ~/.vim/doc
"   :Helptags             " replaces ':call pathogen#helptags()' in pathogen


