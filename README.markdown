Installation
------------

First clone this repo:

    git clone git://github.com/joem/dotfiles.git ~/.dotfiles

Where possible, Vim plugins are installed as git repos into vim/bundle via
simple `git clone` commands. See vimbundles.txt for a list of which repos I'm
using. You'll have to add them manually yourself.

Create symlinks:

    ln -s ~/.dotfiles/bashrc        ~/.bashrc
    ln -s ~/.dotfiles/bash_profile  ~/.bash_profile
    ln -s ~/.dotfiles/vimrc         ~/.vimrc
    ln -s ~/.dotfiles/gvimrc        ~/.gvimrc
    ln -s ~/.dotfiles/vim           ~/.vim
    ln -s ~/.dotfiles/gitconfig     ~/.gitconfig
    ln -s ~/.dotfiles/gitignore     ~/.gitignore
    ln -s ~/.dotfiles/nethackrc     ~/.nethackrc


I put Vim's backup and swap files in `~/.backup`, so that directory must exist. To
be sure, run: 

    mkdir ~/.backup

Also, if you want to speed up a terminal's start time, add a hushlogin file to your
home dir to skip checking the last login:

    touch ~/.hushlogin

VIM
---

My preferences for Vim are stored in `.dotfiles/vimrc` and `.dotfiles/gvimrc`
respectively. All plugins and scripts are stored in the `.dotfiles/vim`
directory. As per above, these are all symlinked into my home directory.

### Adding a plugin bundle from a git repo

Be sure to `git clone` the plugin into vim/bundle and be sure to update
vimbundles.txt so you can keep track of what came from where and what it is.
The vim/bundle directory is untracked, so cloning things there is not a
problem.

### Adding a plugin bundle that isn't from a git repo

If you want to install a non-git bundle and you don't want to check the bundle
itself into this dotfiles repo, then just put the bundle into vim/bundle and
write a note in vimbundles.txt.

Otherwise, if you do want to check the non-git bundle in, you'll need to put it
in another path (I suggest vim/bundle-checkin). Then you'll need to adjust your
vimrc to have a line like
`execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')`

### Undating  a plugin bundle from a git repo

To update, `cd` into the bundle's directory and then `git pull`. If you'd
prefer to see what's going to change before doing the pull, use `git fetch &&
git log ..origin/master`, and after you're happy, you can then do `git pull` to
make the update happen.

### Updating a plugin bundle that isn't from a git repo

Simply replace the file(s) or directory with the newer version.

### Removing a bundle

Easy... Just delete the bundle's directory from the appropriate bundly folder,
and you're done. You might want to note it in vimbundles.txt too.


HOMEBREW
--------

I use [homebrew][homebrew] to install all kinds of programs and things. Go to
that page and install it using their instructions, as it really is simple and
it works so much better if installed the way they want.


RUBY
----

I use [rbenv][rbenv]/[ruby-build][rubybuild] (installed via homebrew) to manage
different ruby environments. The configuration for this is already in the
appropriate dotfiles here.


CREDITS
-------

When I decided to put my repo on GitHub, I wanted to clean it up.  While my
.dotfiles directory was originally already pretty close to how it is now, I
ended up making everything fit even more closely with [Drew Neil's dotfiles
repo][nelstromdotfiles] (including borrowing this README almost verbatim),
since his was a nice example. After a while, though, I dropped the submodule
feature for vim bundles. It always felt weird to me, I could never remember the
proper way to update them, and I'd mess some things up from time to time. Sure
my current method isn't as automated, but I have a lot fewer bundles (and plan
to keep it that way!), so it's all good for me.

Like most good vimrc's/bashrc's, mine are cobbled together from bits and pieces
I've found all over, with a smattering of my own stuff shoved in between.
Whenever I felt something was particularly awesome, or if I felt I may need to
reference it again one day, I added credits and/or links in the dotfiles
themselves.

[nelstromdotfiles]: https://github.com/nelstrom/dotfiles
[homebrew]: http://mxcl.github.com/homebrew/
[rbenv]: https://github.com/sstephenson/rbenv
[rubybuild]: https://github.com/sstephenson/ruby-build

