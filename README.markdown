Installation

    git clone git://github.com/joem/dotfiles.git

Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

    cd .dotfiles
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/.dotfiles/bashrc        ~/.bashrc
    ln -s ~/.dotfiles/bash_profile  ~/.bash_profile
    ln -s ~/.dotfiles/profile       ~/.profile
    ln -s ~/.dotfiles/vimrc         ~/.vimrc
    ln -s ~/.dotfiles/gvimrc        ~/.gvimrc
    ln -s ~/.dotfiles/vim           ~/.vim
    ln -s ~/.dotfiles/vim/bundle/vimhints/doc/vimhints.txt ~/vimhints.txt
    ln -s ~/.dotfiles/irbrc         ~/.irbrc
    ln -s ~/.dotfiles/gitconfig     ~/.gitconfig
    ln -s ~/.dotfiles/gitignore     ~/.gitignore
    ln -s ~/.dotfiles/nanorc        ~/.nanorc
    ln -s ~/.dotfiles/nethackrc     ~/.nethackrc
    ln -s ~/.dotfiles/screenrc      ~/.screenrc
    ln -s ~/.dotfiles/Xresources    ~/.Xresources
    ln -s ~/.dotfiles/xinitrc       ~/.xinitrc


I put Vim's backup and swap files in `~/.backup`, so that directory must exist. To
be sure, run: 

    mkdir ~/.backup

VIM
===

My preferences for Vim are stored in `.dotfiles/vimrc` and `.dotfiles/gvimrc`
respectively. All plugins and scripts are stored in the `.dotfiles/vim`
directory.

Adding Plugin Bundles
---------------------

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
    git ci -m "Added the javascript bundle"

### Command-t

The command-t extension require Vim with ruby support, and furthermore, the
ruby code depends on a C extension for extra speed. The usual pathogen
installation proceedure didn't work for me, but I followed these steps to make
it work:

    cd ~/dotfiles/vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make

That did the trick.

RUBY
====

My preferences for IRB customisations are stored in `.dotfiles/irbrc`. To get
the most from these, you should install the [interactive_editor][i_editor] and
[awesome_print][ap] gems, by running:

    gem install interactive_editor awesome_print


CREDITS
=======

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
[ap]: http://github.com/michaeldv/awesome_print
[i_editor]: http://github.com/jberkel/interactive_editor
[nelstromdotfiles]: https://github.com/nelstrom/dotfiles

