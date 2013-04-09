Installation
------------

First clone this repo:

    git clone git://github.com/joem/dotfiles.git ~/.dotfiles

Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

    cd .dotfiles
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/.dotfiles/bashrc        ~/.bashrc
    ln -s ~/.dotfiles/bash_profile  ~/.bash_profile
    ln -s ~/.dotfiles/vimrc         ~/.vimrc
    ln -s ~/.dotfiles/gvimrc        ~/.gvimrc
    ln -s ~/.dotfiles/vim           ~/.vim
    ln -s ~/.dotfiles/vim/bundle/vimhints/doc/vimhints.txt ~/vimhints.txt
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
directory.

### Adding a plugin bundle via submodule

Plugins that are published on github can be installed as submodules. For
example, to install the [JavaScript bundle][jsbun], follow these steps:

    cd ~/.dotfiles
    git submodule add http://github.com/pangloss/vim-javascript.git vim/bundle/vim-javascript

This will update the `.gitmodules` file by appending something like:

    [submodule "vim/bundle/vim-javascript"]
        path = vim/bundle/vim-javascript
        url = http://github.com/pangloss/vim-javascript.git

As well as checkout out the git repo into the
`vim/bundle/vim-javascript` directory. You can then commit these changes
as follows:

    git add .
    git ci -m "Add the javascript bundle"

### Updating a submodule

Simple. Just `cd` to that submodule's directory and run `git pull` to update
it.

Now, when you're back in the parent repo, a `git status` will tell you there
are new commits in that bundle (and that those are uncommited). So all you need
to do is `git add` it like it's any other file, and then `git commit` and
you'll be all up to date.

### Removing a submodule [(source)][remove-submod]

1. Delete the relevant line from the .gitmodules file.
2. Delete the relevant section from .git/config.
3. Run git rm --cached path\_to\_submodule (no trailing slash).
4. Commit and delete the now untracked submodule files.

### Editing a submodule and pushing it [(source)][edit-submod]

(ie. for my vim snippets or a plugin I wrote)

1. $ cd your-submodule
2. $ git checkout master
3. hack, edit
4. $ git commit -a -m "commit in submodule"
5. $ git push
6. $ cd ..
7. $ git add your-submodule
8. $ git commit -m "Updated submodule"

HOMEBREW
--------

I use [homebrew][homebrew] to install all kinds of programs and things. Go to that page and install it using their instructions, as it really is simple and it works so much better if installed the way they want.


RUBY
----

I use [rbenv][rbenv]/[ruby-build][rubybuild] (installed via homebrew) to manage
different ruby environments. The configuration for this is already in the
appropriate dotfiles here.


CREDITS
-------

When I decided to put my repo on GitHub, I wanted to clean it up. While the
submodule feature is built into Git and my .dotfiles directory was originally
already pretty close to how it is now, I ended up making everything fit even
more closely with [Drew Neil's dotfiles repo][nelstromdotfiles] (including
borrowing this README almost verbatim), since his was a nice example.

Like most good vimrc's/bashrc's, mine are cobbled together from bits and pieces
I've found all over, with a smattering of my own stuff shoved in between.
Whenever I felt something was particularly awesome, or if I felt I may need to
reference it again one day, I added credits and/or links in the dotfiles
themselves.

[jsbun]: http://github.com/pangloss/vim-javascript.git
[nelstromdotfiles]: https://github.com/nelstrom/dotfiles
[edit-submod]: http://stackoverflow.com/questions/5814319/git-submodule-push/5814351#5814351
[remove-submod]: http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule/1260982#1260982
[homebrew]: http://mxcl.github.com/homebrew/
[rbenv]: https://github.com/sstephenson/rbenv
[rubybuild]: https://github.com/sstephenson/ruby-build

