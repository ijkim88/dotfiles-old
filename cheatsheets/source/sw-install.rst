Software Install
================

Python
------

Install pre-requisites

.. code-block:: shell

   $ yum install \
   $ gcc \
   $ libxml2 \
   $ libxml2-devel \
   $ libxslt \
   $ libxslt-devel \
   $ ncurses-devel \
   $ openssl \
   $ openssl-devel \
   $ sqlite \
   $ sqlite-devel \
   $ zlib \
   $ zlib-devel

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


RPMForge Respository
--------------------

**RPMForge** repository is a utility used to install third party softwre packages under **RHEL** and **CentOS**. It provides more than 5000 software packages in the **rpm** format for these Linux distributions.

The complete list can be found in the GitHub repository: https://github.com/repoforge/rpms

First verify whether the system is 32-bit or 64-bit using ``uname -r``:

.. code-block:: shell

   i686 i686 i386 GNU/Linux         # 32-bit
   x86_64 x86_64 x86_64 GNU/Linux   # 64-bit

Download and install the **RPMForge** repository:

.. code-block:: shell

   $ wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
   $ rpm -Uvh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

Import the RPMForge respository key:

.. code-block:: shell

   $ wget http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
   $ rpm --import RPM-GPG-KEY.dag.txt


.. note:: The imported **GPG** key stored under **/etc/pki/rpm-gpg** directory as a file **RPM-GPG-KEY-rpmforge-dag**.

To install packages::

   $ yum --enablerepo=rpmforge install aria2

To disable **RPMForge** repository simply open the **/etc/yum.repos.d/rpmforge.repo**::

   $ vi /etc/yum.repos.d/rpmforge.repo

Change "**enabled=1**" to "**enabled=0**":

.. code-block:: shell

   ### Name: RPMforge RPM Repository for RHEL 6 - dag
   ### URL: http://rpmforge.net/
   [rpmforge]
   name = RHEL $releasever - RPMforge.net - dag
   baseurl = http://apt.sw.be/redhat/el6/en/$basearch/rpmforge
   mirrorlist = http://apt.sw.be/redhat/el6/en/mirrors-rpmforge
   enabled = 0
   protect = 0
   gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
   gpgcheck = 1


Install Rar/Unrar
~~~~~~~~~~~~~~~~~

Follow the instructions the previous sections and then install with yum::

   $ yum install unrar rar


Install Google Chrome
---------------------

First download and install the key from the Google Linux Repository: http://www.google.com/linuxrepositories/

.. code-block:: shell

   $ wget https://dl.google.com/linux/linux_signing_key.pub
   $ sudo rpm --import linux_signing_key.pub

You can verify the key installation by running::

   $ rpm -qi gpg-pubkey-7fac5591-*

After installing the key, create a repo file in ``/etc/yum.repos.d/google-chrome.repo``

.. code-block:: shell

   # For 32-bit
   [google-chrome]
   name=Google Chrome 32-bit
   baseurl=http://dl.google.com/linux/chrome/rpm/stable/i386

   # For 64-bit
   [google-chrome]
   name=Google Chrome 64-bit
   baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64

Now install the Chrome browser using yum::

   $ sudo yum install google-chrome-stable


Uninstall all the installed Homebrew/Linuxbrew Packages
-------------------------------------------------------

Use the following command to remove all brew packages::

   $ brew remove --force $(brew list)
