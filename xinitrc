#!/bin/sh
# $Xorg: xinitrc.cpp,v 1.3 2000/08/17 19:54:30 cpqbld Exp $

###############################################################
# This is my local copy of xinitrc.
# The original is kept in /usr/X11/lib/X11/xinit/
# (Do not modify the original!)
###############################################################
#
# If you're having keyboard problems (in Gimp, for instance),
# then get rid of the .Xmodmap file, or change it around.
#
###############################################################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/X11/lib/X11/xinit/.Xresources
sysmodmap=/usr/X11/lib/X11/xinit/.Xmodmap

# set an alternate window manager, if you want:
#export USERWM=/usr/bin/quartz-wm   # Apple's default. No need to specify.
#export USERWM=/usr/X11/bin/twm
#export USERWM=/usr/local/bin/dwm   # totally awesome
#export USERWM=/usr/local/bin/ratpoison   # sort of like a better "screen"

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    if [ -x /usr/bin/cpp ] ; then
        xrdb -merge $sysresources
    else
        xrdb -nocpp -merge $sysresources
    fi



fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    if [ -x /usr/bin/cpp ] ; then
        xrdb -merge "$userresources"
    else
        xrdb -nocpp -merge "$userresources"
    fi



fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

source ~/.bash_profile


if [ -d /usr/X11/lib/X11/xinit/xinitrc.d ] ; then
	for f in /usr/X11/lib/X11/xinit/xinitrc.d/*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

