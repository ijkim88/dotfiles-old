CentOS
======

Setup Wireless on Centos 7 Minimal
----------------------------------

Install NetworkManager-wifi by mounting the USB ISO and install from Packages directory

.. code-block:: shell

   $ rpm -i NetworkManager-wifi

   $ chkconfig NetworkManager on
   $ service NetworkManager start
   $ chkconfig network off
   $ chkconfig wpa_supplicant off

   $ service NetworkManager restart


Install Centos 7 and MATE
-------------------------

First install Centos 7 Minimal

.. code-block:: shell

   $ yum install epel-release
   $ yum groupinstall "X Window System"
   $ yum groupinstall "MATE Desktop"

To start the graphical interface

.. code-block:: shell

   $ systemctl isolate graphical.target

To have MATE boot as default desktop environment

.. code-block:: shell

   $ systemctl set-default graphical.target

which is the equivalent of

.. code-block:: shell

   $ rm '/etc/systemd/system/default.target'
   $ ln -s '/usr/lib/systemd/system/graphical.target' '/etc/systemd/system/default.target'

Remove Old Kernels on Fedora/CentOS/RHEL
----------------------------------------

Check Installed Kernels

.. code-block:: shell

   $ rpm -q kernel
   kernel-3.10.0-229.el7.x86_64
   kernel-3.10.0-229.11.1.el7.x86_64
   kernel-3.10.0-327.4.4.el7.x86_64

Delete/Remove Old Kernels

.. code-block:: shell

   $ yum install yum-utils
   $ package-cleanup --oldkernels --count=2

Make Amount of Install Kernels Permanent by editing ``/etc/yum.conf`` and set::

   installonly_limit=2
