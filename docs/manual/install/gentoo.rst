Installing on Gentoo
====================

__Howto install Qtile on Gentoo.__


Dependencies
============

libxcb
------

I took libxcb-1.8.1 from portage.
    emerge -av libxcb

You need to unmask it by keyword. So for amd64
    echo "x11-libs/libxcb ~amd64" >> /etc/portage/package.keywords


xpyb
----
    git clone git://anongit.freedesktop.org/git/xcb/xpyb
    cd xpyb
    ./configure --prefix=/usr
    make
    sudo make install


cairo
-----

I took cairo-1.10.2-r2 from portage
    emerge -av x11-libs/cairo

You need to unmask it, too.
    echo "x11-libs/cairo ~amd64" >> /etc/portage/package.keywords

I had X, glib, opengl, svg and xcb set as USE-Flag
    echo "x11-libs/cairo X glib opengl svg xcb" >> /etc/portage/package.use


py2cairo
--------

    git clone git://git.cairographics.org/git/py2cairo
    cd py2cairo
    ./configure --prefix=/usr
    make
    sudo make install


pygtk
-----

I took pygtk-2.24.0-r2 from portage
    emerge -av pygtk


Annotation
==========

* xpyb in portage is quiet old, maybe updated soon since 1.3.1 is out.
* xpyb-ng from https://github.com/qtile/xpyb-ng installs with setup.py.
  I had to put the xpyb.h and xpyb.pc manualy to /usr/include/python2.7
  and /usr/lib64/pkgconfig/. You also have to edit xpyb.pc for the right
  prefix.
* pycairo in portage gets installed without xpyb support. Maybe, cause
  they use waf for intallation. But i'm quiet new to python so i can't
  say.
  

Install Qtile
=============

    git clone git://github.com/qtile/qtile
    cd qtile
    sudo python setup.py install --record files_uninstall.txt

Don't forget the config.py

    mkdir ~/.config/qtile
    cp build/lib/libqtile/resources/default-config.py ~/.config/qtile/config.py

Test Installation
=================

You can test your installation in Xephyr.
If you don't have Xephyr you need to set the kdrive USE-Flag for
xorg-server
    echo "x11-base/xorg-server kdrive" >> /etc/portage/package.use

You can run Xephyr with
    Xephyr :1 -screen 800x600 -av -noreset

In another term you set DISPLAY to :1
    DISPLAY=:1

You can check it with
    echo $DISPLAY

You start qtile simply with:
    qtile

Created by Jonathan Sielhorst

TODO: An ebuild package is available from the Funtoo project. We need testers to verify that this works.

https://github.com/funtoo/portage/blob/75b2dd1755081c7dc09bca275e93426c886d0f75/x11-wm/qtile/qtile-9999.ebuild
