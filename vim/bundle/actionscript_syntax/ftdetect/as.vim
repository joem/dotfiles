
" Overwrite the "atlas" association in favor of "actionscript"
au BufNewFile,BufRead *.as  setlocal ft=actionscript

if exists('&ofu')
  au BufNewFile,BufRead *.as  setlocal ofu=actionscriptcomplete#Complete
endif

