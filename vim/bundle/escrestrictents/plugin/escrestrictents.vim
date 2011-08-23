" Document {{{
" Copyright: Copyright (C) 2005 @AUTHOR@
"            Permission is hereby granted to use and distribute this code,
"            with or without modifications, provided that this copyright
"            notice is copied with it. Like anything else that's free,
"            @FILE@.vim is provided *as is* and comes with no
"            warranty of any kind, either expressed or implied. In no
"            event will the copyright holder be liable for any damages
"            resulting from the use of this software.
" Filename:  @FILE@
" Author:    @AUTHOR@
" Email:     @EMAIL@
" Date:      @DATE@
" @CVS_REVISION@
" Description:
" Installation:
"   Drop the script to your plugin directory.
" Prerequisite:
"   This script needs
" Usage:
" }}}

if exists('g:loaded_escrestrictents') " {{{
  finish
endif
let g:loaded_escrestrictents = 1 " }}}

" gobal setting {{{
" }}}

" interface functions {{{

amenu Plugin.HTML\ Entities.Escape\ Line(s)   :call HtmlEscape()<CR>
amenu Plugin.HTML\ Entities.UnEscape\ Line(s) :call HtmlUnEscape()<CR>

"function MakeJoeMenu()
"  amenu Joe.Say\ Hello        :!echo hello<CR>
"  amenu Joe.Escape\ Line(s)   :call HtmlEscape()<CR>
"  amenu Joe.UnEscape\ Line(s) :call HtmlUnEscape()<CR>
"  amenu Joe.HTML\ 4.Strict        :Template html4-strict<CR>
"  amenu Joe.HTML\ 4.Transitional  :Template html4-trans<CR>
"endfunction

" sample {{{
"   }}}
" }}}


"  for converting "<" (and such) to "&lt;" (and such) in html
"   use \h to escape, \H unescape
function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction
function HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction
map <Leader>h :call HtmlEscape()<CR>
map <Leader>H :call HtmlUnEscape()<CR>

" Implement {{{

" }}}

" Modeline for ViM {{{
"vim:fdm=marker fdl=0 fdc=3 fenc=utf-8 bomb:
"vim:set ft=vim et sw=4 sts=4:
