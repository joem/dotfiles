
Clone the following plugins into the `start` subdirectory to have Vim
automatically load them. (After cloning them, run `:helptags ALL` in Vim.) The
end result is you want the structure to be like:

    ~/.vim/pack/plugins/start/plugin1/...
    ~/.vim/pack/plugins/start/plugin2/...
    (and so on)


- [vim-commentary](https://github.com/tpope/vim-commentary)
  - "comment stuff out"
  - This gives me the `gcc` mapping/function that I use often to comment/uncomment things.
- [vim-vinegar](https://github.com/tpope/vim-vinegar)
  - "Combine with netrw to create a delicious salad dressing"
  - This gives me the `-` mapping that lets me browse directories with netrw.
- [vim-airline](https://github.com/vim-airline/vim-airline)
  - "lean & mean status/tabline for vim that's light as air"
  - This gives me a nice looking status line.
- [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
  - "precision colorscheme for the vim text editor"
  - Nice looking colorscheme.
- [srcery-vim](https://github.com/srcery-colors/srcery-vim)
  - "Dark colorscheme for gvim and vim"
  - Nice looking colorscheme. I can't decide between this or Solarized, so I keep both.
- [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
  - "Vastly improved Javascript indentation and syntax support in Vim"
  - This works in combo with vim-jsx-pretty to make react highlighting better.
- [vim-jsx-pretty](https://github.com/MaxMEllon/vim-jsx-pretty)
  - "JSX and TSX syntax pretty highlighting for vim"
  - This works in combo with vim-javascript to make react highlighting better.
- [vim-vimhints](git@github.com:joem/vim-vimhints.git)
  - "my hints for using vim"
  - My own personal hints/notes about using Vim, formatted as a vim help file
- [vim-hints_syntax](git@github.com:joem/vim-hints_syntax.git)
  - "syntax highlighting for my hints files"
  - Simple syntax highlighting for my own personal general hints files (not to
    be confused with my vimhints)


Note that the `plugins` part in `~/.vim/pack/plugins/start/` can actually be
anything, and you can have multiple directories too. With that in mind, if you
have a lot you may want to break
them up like this:

    ~/.vim/pack/plugins/start/plugin1/...
    ~/.vim/pack/plugins/start/plugin2/...
    (For general plugins or anything that doesn't fit on the other directories)

    ~/.vim/pack/colors/start/colorscheme1/...
    ~/.vim/pack/colors/start/colorscheme2/...
    (For color schemes)

    ~/.vim/pack/syntax/start/syntax1/...
    ~/.vim/pack/syntax/start/syntax2/...
    (For language syntax, compilers, linters, etc.)

Also note that in addition to `~/.vim/pack/*/start/` you can have
`~/.vim/pack/*/opt/`. When in `opt`, plugins are not loaded automatically.
Instead, these plugins must be loaded manually with `:packadd name` (where
`name` is the name of the directory it's in under `opt`), or in your vimrc with
`:packadd! name` (note the addition of a `!`).

---

For more about all these methods of loading plugins, see `:h packages` in Vim.


