Software Install
================

Python
------

Install pre-requisites

.. code-block:: shell

   $ yum install gcc openssl openssl-devel zlib zlib-devel

Copy the download link of the Python source tar files and follow these steps

.. code-block:: shell

   $ wget [python stable source url]
   $ tar -xzvf python.tar.gz
   $ cd [unarchived python folder]
   $ ./configure --prefix=$HOME/local --enable-shared
   $ make && make altinstall

Be sure to export the ``PATH`` and ``LD_LIBRARY_PATH``. Best to add it to the ``.bashrc`` or ``.bash_profile`` file.

.. code-block:: shell

   $ export PATH=~/bin/:$PATH
   $ export LD_LIBRARY_PATH=~/local/lib


Ruby
----

Copy the download link of the Ruby source tar files and follow these steps

.. code-block:: shell

   $ wget [ruby stable source url]
   $ tar -xzvf ruby.tar.gz
   $ cd [unarchived ruby folder]
   $ ./configure --prefix=$HOME/local && make && make install

Be sure to export the ``PATH``. Best to add it to the ``.bashrc`` or ``.bash_profile`` file.

.. code-block:: shell

   $ export PATH=~/bin/:$PATH


Ruby Gems
---------

Download latest ruby gems using ``wget`` from https://rubygems.org

.. code-block:: shell

   $ tar -xzvf rubygems.tar.gz
   $ ruby setup.rb
   export GEM_HOME=~/local/gems
   export RUBYOPT=rubygems


VIM
---

Clone the vim repository from https://github.com/vim/vim

.. code-block:: shell

   $ ./configure \
   $ --enable-perlinterp \
   $ --enable-pythoninterp \
   $ --enable-rubyinterp \
   $ --enable-cscope \
   $ --enable-multibyte \
   $ --enable-gui=auto \        # Optional
   $ --enable-gtk2-check \      # Optional
   $ --enable-gnome-check \     # Optional
   $ --with-features=huge \
   $ --with-x \                 # Optional
   $ --disable-nls \
   $ --prefix=$HOME/local \
   $ --with-python-config-dir=$HOME/local/lib/python2.7/config \
   $ --with-python3-config-dir=$HOME/local/lib/python3.4/config \
   $ --with-compiledby="ijkim88@gmail.com"

Then install

.. code-block:: shell

   $ make install


ack
---

.. code-block:: shell

   $ curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack && chmod 0755 !#:3


pip2 and pip2.7
---------------

.. code-block:: shell

   $ wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
   $ python2.7 get-pip.py

tmux
----

First install libevent dependency

.. code-block:: shell

   $ tar -xzvf libevent-2.0.12-stable.tar.gz
   $ cd libevent-2.0.12-stable
   $ ./configure --prefix=$HOME/local
   $ make && make install

Then install tmux

.. code-block:: shell

   $ tar -xzvf tmux-1.5.tar.gz
   $ cd ../tmux-1.5
   $ DIR="$HOME/local"
   $ ./configure CFLAGS="-I$DIR/include" LDFLAGS="-L$DIR/lib"
   $ make
   $ cp tmux ~/local/bin

Be sure to export the ``PATH`` and ``LD_LIBRARY_PATH``. Best to add it to the ``.bashrc`` or ``.bash_profile`` file.

.. code-block:: shell

   $ export PATH=~/bin/:$PATH
   $ export LD_LIBRARY_PATH=~/local/lib

