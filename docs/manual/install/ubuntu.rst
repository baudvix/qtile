Installing on Ubuntu
====================

Dependencies
------------

First, a few core dependencies that you must install if you haven't already:

::

    sudo apt-get install python-dev libtool autoconf git-core

xpyb
~~~~

::

    sudo apt-get install xcb-proto libxcb1-dev python-xcbgen

::

    cd ~
    git clone git://anongit.freedesktop.org/git/xcb/xpyb
    cd xpyb

Edit `configure.ac` and change the version from **1.2** to **1.3**.

::

    ./autogen.sh
    make
    sudo make install

pixman
~~~~~~

::

    cd ~
    git clone git://anongit.freedesktop.org/git/pixman.git
    cd pixman
    ./autogen.sh
    make
    sudo make install

cairo
~~~~~

::

    sudo apt-get install libxcb-render0-dev libpng12-dev libfontconfig1-dev libxrender-dev libx11-dev

::

    cd ~
    git clone git://anongit.freedesktop.org/git/cairo
    cd cairo
    ./autogen.sh --enable-xcb
    make
    sudo make install

py2cairo
~~~~~~~~

::

    cd ~
    git clone git://git.cairographics.org/git/py2cairo
    cd py2cairo
    ./autogen.sh

Check the configure output to make sure that XPYB is correctly detected.

::

    make
    sudo make install

Qtile
~~~~~

::

    cd ~
    git clone git://github.com/cortesi/qtile.git
    cd qtile
    sudo python setup.py install

Configuration
-------------

**~/.xsession:**

::

    #!/bin/sh
    ~/.config/qtile/session-startup &
    exec /usr/local/bin/qtile

**~/.config/qtile/session-startup:**

The session-startup script sets the screen’s background picture, sleeps for a
little bit to give Qtile a chance to start, then launches any applications you
want to run at startup.

::

    #!/bin/sh
    qiv -z ~/path/to/wallpaper.jpg
    sleep 3
    nm-applet &
    synapse -s &
    dropbox start

**/usr/share/xsessions/qtile.desktop:**

::

    [Desktop Entry]
    Name=Qtile
    Comment=This session logs you into Qtile
    Exec=/etc/X11/Xsession
    Icon=
    Type=XSession

References
----------

 - `Installing Qtile on Ubuntu 10.10`_
 - `qtile installation on Ubuntu 11.10 Oneiric Ocelot`_

.. _`Installing Qtile on Ubuntu 10.10`: http://kirkstr.tumblr.com/post/4135470494/installing-qtile-on-ubuntu-10-10
.. _`qtile installation on Ubuntu 11.10 Oneiric Ocelot`: http://groups.google.com/group/qtile-dev/browse_thread/thread/2e4038182d3a2d11
