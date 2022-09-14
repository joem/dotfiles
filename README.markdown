Installation
------------

First clone this repo:

    git clone git://github.com/joem/dotfiles.git ~/.dotfiles

Where possible, Vim plugins are installed using Vim's packages feature. In my
case, I'm installing them all into `~/.vim/pack/plugins/start`. Check
[vim/pack/plugins/README-VIM-PLUGINS.markdown](vim/pack/plugins/README-VIM-PLUGINS.markdown)
for the list of plugins and more details about how to install them. In general,
you can simply `git clone` any plugin you want into its own subdirectory in
`~/.vim/pack/plugins/start`. (Be sure to run `:helptags ALL` in Vim afterwards.)
You'll need to do this all manually yourself.

Create symlinks:

    ln -s ~/.dotfiles/zshrc         ~/.zshrc
    ln -s ~/.dotfiles/zprofile      ~/.zprofile
    ln -s ~/.dotfiles/vimrc         ~/.vimrc
    ln -s ~/.dotfiles/gvimrc        ~/.gvimrc
    ln -s ~/.dotfiles/vim           ~/.vim
    ln -s ~/.dotfiles/gitconfig     ~/.gitconfig
    ln -s ~/.dotfiles/gitignore     ~/.gitignore
    ln -s ~/.dotfiles/nethackrc     ~/.nethackrc


I set the settings for Vim's backup and swap files such a way so that by
default, it puts them in `.` (the working directory). If you don't want them
cluttering up a particular working directory, you can make a `.vimbackup`
directory there and it'll be used. And if you don't want to deal with it on a
directory by directory basis, you can make a `~/.vimbackup` which will then be
used. To make that directory, run:

    mkdir ~/.vimbackup

You can also create the following symlinks for bash settings, though I don't
use them anymore so they're likely out of date:

    ln -s ~/.dotfiles/bashrc        ~/.bashrc
    ln -s ~/.dotfiles/bash_profile  ~/.bash_profile

Also, if you want to speed up a terminal's start time, add a hushlogin file to your
home dir to skip checking the last login:

    touch ~/.hushlogin

The colorschemes I use in Vim also have Terminal colorschemes (among others).
While there's not actually dotfiles, I'll put links here so you can install
them if you want:

- [solarized](https://github.com/altercation/solarized/tree/master/osx-terminal.app-colors-solarized)
- [srcery](https://github.com/srcery-colors/srcery-terminal/tree/master/terminal_app)


VIM
---

My preferences for Vim are stored in `.dotfiles/vimrc` and `.dotfiles/gvimrc`
respectively. All plugins and scripts are stored in the `.dotfiles/vim`
directory. As per above, these are all symlinked into my home directory.

### Adding a plugin from a git repo

Be sure to `git clone` the plugin into its own folder in
`~/.vim/pack/plugins/start` and be sure to update
`~/.vim/pack/plugins/README-VIM-PLUGINS.markdown` so you can keep track of what
came from where and what it is.  All subdirectories in `~/.vim/pack/plugins/start`
are untracked, so cloning things there is not a problem.

(Be sure to run `:helptags ALL` in Vim afterwards.)

### Adding a plugin that isn't from a git repo

If you want to install a non-git plugin and you don't want to check the plugin
itself into this dotfiles repo, then just put the plugin into its own directory
in `~/.vim/pack/plugins/start` and write a note in
`~/.vim/pack/plugins/README-VIM-PLUGINS.markdown`.

(Be sure to run `:helptags ALL` in Vim afterwards.)

### Undating a plugin from a git repo

To update, `cd` into the plugin's directory and then `git pull`. If you'd
prefer to see what's going to change before doing the pull, use `git fetch &&
git log ..origin/master`, and after you're happy, you can then do `git pull` to
make the update happen.

(Be sure to run `:helptags ALL` in Vim afterwards.)

### Updating a plugin that isn't from a git repo

Simply replace the file(s) or directory with the newer version.

(Be sure to run `:helptags ALL` in Vim afterwards.)

### Removing a plugin

Easy... Just delete the plugin's directory from the appropriate bundly folder,
and you're done. You might want to note it in
`~/.vim/pack/plugins/README-VIM-PLUGINS.markdown` too.


HOMEBREW
--------

I use [homebrew][homebrew] to install some programs. Go to that page and
install it using their instructions, as it is fairly simple. (I'm not super
happy with how it's changed over the years, so I'm using it less and less these
days, and considering looking into macports.)


RUBY
----

I use [rbenv][rbenv]/[ruby-build][rubybuild] (installed via homebrew) to manage
different ruby environments. The configuration for this is already in the
appropriate dotfiles here.


MISC NOTES
----------

I switched computers recently (March 2021) and decided it was a good time to
re-evaluate my configs. This caused me to cut out A LOT of stuff, and I tried
to credit/explain as much stuff that was left as possible that I had forgotten
to credit/explain the first time around. I also switched to using Zsh instead
of Bash for my terminal, so my Bash configs are no longer maintained or used,
just included for historical purposes (or if I ever switch back). Being new to
Zsh, my Zsh config may be somewhat rough and messy so far, but it seems to be
working well for me. (And I really like not relying on any zsh plugins or
frameworks!)

I realized that I had commited many plugins in the past to my dotfiles repo
which not only meant my repo's git history was much bigger and messier than it
needed to be, but also I was unsure of the legality/properness of having other
people's repos checked into mine. Because of this, and because of the vast
changes I had made to my own configs, I decided to start fresh with a new repo,
which is this very repo.

CREDITS
-------

When I decided to put my repo on GitHub, I wanted to clean it up.  While my
.dotfiles directory was originally already pretty close to how it was when I
commited it, I ended up making everything fit even more closely with [Drew
Neil's dotfiles repo][nelstromdotfiles] (including borrowing this README almost
verbatim), since his was a nice example. After a while, though, I dropped the
submodule feature for vim bundles. It always felt weird to me, I could never
remember the proper way to update them, and I'd mess some things up from time
to time. Sure my current method isn't as automated, but I have a lot fewer
plugins (and plan to keep it that way!), so it's all good for me. As of Vim 8,
I stopped using the Pathogen/bundles method of plugin loading in Vim, and
started using Vim's built in packages (which is pleasantly similar to
Pathogen).

Like most good vimrc's/bashrc's, mine are cobbled together from bits and pieces
I've found all over, with a smattering of my own stuff shoved in between.
Whenever I felt something was particularly awesome, or if I felt I may need to
reference it again one day, I've tried to add credits and/or links in the
dotfiles themselves.

[nelstromdotfiles]: https://github.com/nelstrom/dotfiles
[homebrew]: http://mxcl.github.com/homebrew/
[rbenv]: https://github.com/sstephenson/rbenv
[rubybuild]: https://github.com/sstephenson/ruby-build

