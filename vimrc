" vim: set tabstop=2 shiftwidth=2 et fdm=marker:

" Environment {{{

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

  " first the disabled features due to security concerns
  let g:secure_modelines_verbose=0 " securemodelines vimscript
  let g:secure_modelines_modelines = 15 " 15 available modelines

  " ---------------------------------------------------------------------------
  " load the pathogen bundle
  runtime bundle/pathogen/autoload/pathogen.vim
  " make pathogen load all bundles (plugins):
  call pathogen#infect()

" }}}

" General {{{

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

"move to formatting
set autoindent smartindent    " auto/smart indent
set expandtab                 " expand tabs to spaces
set smarttab                  " tab and backspace are smart
set tabstop=2                 " 2 spaces
set shiftwidth=2              " 2 spaces

"ok in general
  syntax on
  set more                      " use more prompt
  set autoread                  " watch for file changes
  set hidden                    " hide buffers when not displayed
  set noautowrite               " don't automagically write on :next
  set lazyredraw                " don't redraw when don't have to
  set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
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

" }}}

" Vim UI {{{
" }}}

" Formatting {{{
" }}}

" Key (re)Mappings {{{
" }}}

" Plugins {{{
" }}}

" GUI Settings {{{
" }}}

" Functions {{{
" }}}


"" ---------------------------------------------------------------------------
"" first the disabled features due to security concerns
"let g:secure_modelines_verbose=0 " securemodelines vimscript
"let g:secure_modelines_modelines = 15 " 15 available modelines

"" ---------------------------------------------------------------------------
"" load the pathogen bundle
"runtime bundle/pathogen/autoload/pathogen.vim
"" make pathogen load all bundles (plugins):
"call pathogen#infect()

"" ---------------------------------------------------------------------------
"" operational settings
"syntax on
"set ruler                     " show the line number on the bar
"set more                      " use more prompt
"set autoread                  " watch for file changes
"set number                    " line numbers
"set hidden                    " hide buffers when not displayed
"set noautowrite               " don't automagically write on :next
"set lazyredraw                " don't redraw when don't have to
"set showmode                  " show current mode down the bottom
"set showcmd                   " show incomplete cmds down the bottom
"set nocompatible              " vim, not vi
"set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
"set autoindent smartindent    " auto/smart indent
"set expandtab                 " expand tabs to spaces
"set smarttab                  " tab and backspace are smart
"set tabstop=2                 " 2 spaces
"set shiftwidth=2              " 2 spaces
"set scrolloff=5               " keep at least 5 lines above/below
"set sidescrolloff=5           " keep at least 5 lines left/right
"set backspace=indent,eol,start  " allow backspacing over everything in insert mode
"set showfulltag               " show full completion tags
"set noerrorbells              " no error bells please
"set linebreak                 " wrap lines at convenient points
"set cmdheight=1               " command line 1 line high (was: 2)
"set undolevels=1000           " 1000 undos
"set updatecount=100           " switch every 100 chars
"set completeopt=longest,menu,preview " completion options
"set complete=.,w,b,u,U,t      " do lots of scanning on tab completion
"set ttyfast                   " we have a fast terminal
"filetype on                   " Enable filetype detection
"filetype indent on            " Enable filetype-specific indenting
"filetype plugin on            " Enable filetype-specific plugins
""compiler ruby                 " Enable compiler support for ruby
"set wildmode=longest:full
"set wildignore+=*.o,*~,.lo    " ignore object files
"set wildmenu                  " menu has tab completion
"let maplocalleader=','        " all my macros start with ,
"" set foldmethod=syntax         " fold on syntax automagically, always
"" set foldcolumn=2              " 4 lines of column for fold showing, always
"set wrap                      " Line wrapping off
""set whichwrap=<,>,h,l,[,]     " Lets arrow keys (and h,l) wrap past end of lines
"set ssop-=options             " do not store global & local values in a session
"set ssop-=folds               " do not store folds in a session
"set list                            " display tabs, trailing spaces, nbsp's
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " and only tabs, trailing spaces, nbsp's
""set listchars=eol:$,tab:^I          " default, for comparison
"let g:is_posix = 1            " consider all shell scripts as POSIX

"make
autocmd FileType make setlocal noexpandtab   "use tabs instead of spaces in makefiles

"python
autocmd FileType python set tabstop=4     " 4 spaces in python files
autocmd FileType python set shiftwidth=4  " 4 spaces in python files

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
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

runtime ftplugin/man.vim  " lets you now do :Man COMMAND to get a manpage

"colorscheme candycode   " .gvimrc uses a different colorscheme
colorscheme tomorrow-night  " test running this, think i like it!
"Improve the todo coloring for 'tomorrow-night':
hi Todo gui=NONE guifg=Black guibg=DeepSkyBlue1

set dictionary=/usr/share/dict/words " more words!

"" make omnicomplete complete from syntax if there's nothing else to use
"if has("autocmd") && exists("+omnifunc")
"  autocmd Filetype *
"        \   if &omnifunc == "" |
"        \           setlocal omnifunc=syntaxcomplete#Complete |
"        \   endif
"endif


" Settings for tagbar
let g:tagbar_width = 28
let g:tagbar_expand = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
" actionscript language
let g:tagbar_type_actionscript = {
      \   'ctagstype' : 'actionscript',
      \   'kinds'     : [ 'c:class', 'f:method', 'p:property', 'v:variable' ]
      \ }

" Settings for :TOhtml
let html_number_lines=1
let html_use_css=1
let use_xhtml=1

"" DISABLED BECAUSE ITS NOT INSTALLED!
"" Settings for HTML.vim
"let g:no_html_toolbar = 'yes'      " get rid of the graphic toolbar
"let g:do_xhtml_mappings = 'yes'    " sets it to xhtml mode by default
""let g:no_html_map_override = 'yes' " don't override any previous mappings
"let g:html_tag_case = 'lowercase'  " lowercase html tags
""let g:no_html_maps = '^.*$'        " don't do any mappings (disables menus!)
""let g:no_html_tab_mapping = 'yes'  " don't remap the tab key
""let g:html_default_charset = 'text/html; charset=UTF-8'  " force this charset

" Settings for Align
let g:DrChipTopLvlMenu= "Plugin."   "put its menu in plugin submenu

"" Settings for VimWiki
"let g:vimwiki_menu= 'Plugin'        " put its menu in plugin submenu
"let g:vimwiki_folding=0             " turn off autofolding for vimwiki
"" change path of vimwiki files:
"let g:vimwiki_list = [{'path': '~/.vimwiki/', 'path_html': '~/.vimwiki_html/'}]
"
"" Settings for VimClojure
"let g:clj_highlight_builtins=1      " highlight Clojure's builtins
"let g:clj_paren_rainbow=1           " rainbow parentheses'!

" Settings for SnipMate
let g:snips_author= 'joem <sod@llawn.com>'
let g:snippets_dir= '~/.vim/bundle/my_snipmate_snippets/snippets'

" Settings for NERD_commenter
let g:NERDCustomDelimiters = {
        \ 'csound': { 'left': ';'},
        \ 'ck': { 'left': '//'}
    \ }

" Settings for airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='powerlineish'
set ttimeoutlen=50


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


" ---------------------------------------------------------------------------
"  searching and diffs
set incsearch                 " incremental search
set ignorecase smartcase      " search ignoring case, unless you use a capital
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler            " insert filler to make lines match up
set diffopt+=iwhite           " ignore all whitespace
set diffopt+=vertical         " make :diffsplit default to vertical

" ---------------------------------------------------------------------------
"  mouse stuffs
set mouse=a                   " mouse support in all modes
set mousehide                 " hide the mouse when typing
" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p

" ---------------------------------------------------------------------------
"  backup options
set backup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=200
"set viminfo='100,f1

" ---------------------------------------------------------------------------
"" spelling...
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
" some useful mappings
" No Help, please
map <F1> <Esc>
map! <F1> <Esc>
" make Y consistent with C and D (Y yanks from cursor to $)
map Y y$
" change directory to that of current file
nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
nmap <LocalLeader>lcd :lcd%:p:h<cr>
" open all folds
nmap <LocalLeader>fo  :%foldopen!<cr>
" close all folds
nmap <LocalLeader>fc  :%foldclose!<cr>
" ,tt will toggle tagbar on and off
nmap <LocalLeader>tt :TagbarToggle<cr>
" ,nn will toggle NERDTree on and off
nmap <LocalLeader>nn :NERDTreeToggle<cr>
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %
" use \rci to indent ruby cody with ruby-code-indenter
nmap <Leader>rci :%!ruby-code-indenter<cr>
" use ,ww to toggle line wrapping
nmap <LocalLeader>ww :set wrap! wrap?<cr>
" ,hh will turn search highlighting off temporarily
nmap <LocalLeader>hh :noh<cr>
" ,pp will try to draw a preview of whatever file is currently in your buffer
map <LocalLeader>pp :Hammer<CR>
" toggle comments
nnoremap <silent> gcc :call NERDComment(0, "toggle")<cr>
vnoremap <silent> gc <ESC>:call NERDComment(1, "toggle")<cr>
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


" ---------------------------------------------------------------------------
" auto load extensions for different file types
if has('autocmd')
        filetype plugin indent on
        syntax on

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

" ---------------------------------------------------------------------------
"  misc stuff

" Change the netrw plugin to get the source view, instead of the rendered view
" (when opening something from a http:// or ftp:// file location)
" NOTE: the following works if you have elinks (preferred), might not otherwise
let g:netrw_http_xcmd= "-source >"
" NOTE: the following will work if you have wget, won't otherwise
"let g:netrw_http_cmd = "wget -q -O"

let g:ConqueTerm_Color = 0

" use :Tidy when viewing html to tidy it up
command! Tidy :%!tidy -quiet -i -f /dev/null
" use ,jt when viewing json to tidy it up
nmap <LocalLeader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" TODO: make a ':Rebuildhelptags' command that does:
"   :helptags ~/.vim/doc
"   :Helptags             " replaces ':call pathogen#helptags()' in pathogen

" Disable beeping and flashing
set vb t_vb=

