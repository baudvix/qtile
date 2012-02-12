Installation
============

Qtile relies on some cutting-edge features in PyCairo, XCB, and xpyb. Until the
latest versions of these projects make it into distros, it's best to use recent
checkouts from their repositories. Here's a brief step-by-step guide:


libxcb
~~~~~~

::

    git clone git://anongit.freedesktop.org/git/xcb/libxcb
    cd libxcb
    ./autogen.sh
    make
    sudo make install


xpyb-ng
~~~~~~~

::

    git clone https://github.com/dequis/xpyb-ng.git
    python setup.py install


cairo
~~~~~

The latest cairo release works, but recompiling with xcb support is needed.

::

    wget http://cairographics.org/releases/cairo-1.10.0.tar.gz
    tar xvzf cairo-1.10.0.tar.gz
    cd cairo-1.10.0
    ./autogen.sh --enable-xcb
    make
    sudo make install


py2cairo
~~~~~~~~

::

    git clone git://git.cairographics.org/git/py2cairo
    cd py2cairo
    ./autogen.sh --enable-xcb

Check the configure output to make sure that XPYB is correctly detected.

::

    make
    sudo make install


PyGTK
~~~~~

We also require a reasonably recent version of the Python GTK bindings, in
particular, the pango module. You should just be able to install this using
your chosen distribution's package manager.

If you plan to run the test suite, you will also need `the Pry unit testing
framework <https://github.com/cortesi/pry>`_, and the `Python X Library
<http://python-xlib.sourceforge.net/>`_.
