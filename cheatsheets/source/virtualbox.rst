VirtualBox
==========

Install VirtualBox On CentOS 7 Headless Server
----------------------------------------------

This tutorial is from: http://www.unixmen.com/install-oracle-virtualbox-and-manage-it-using-phpvirtualbox-on-centos-7-headless-server/


Preparing CentOS Server
~~~~~~~~~~~~~~~~~~~~~~~

Before installing VirtualBox, we have to do a couple of tasks. First of all, update your server::

   $ yum update -y

Create a separate normal user (Ex. **sk_vuser**) for installing VirtualBox::

   $ useradd sk_vuser
   $ passwd sk_vuser

Log out, and log back into that user. Change to root user privileges, by using the following command::

   $ su

Now, install the following pre-requisites that are needed by VirtualBox::

   $ yum groupinstall 'Development Tools'
   $ yum install SDL kernel-devel kernel-headers dkms

**Reboot** your server once to take effect all the changes.


Installing VirtualBox
~~~~~~~~~~~~~~~~~~~~~

Go to the ``/etc/yum.repos.d/`` directory::

   $ cd /etc/yum.repos.d/

Add the latest VirtualBox repository to your CentOS server::

   $ wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo

Add the VirtualBox public key::

   $ wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
   $ rpm --import oracle_vbox.asc

Now, update the repository and install the latest VirtualBox version::

   $ yum update && yum install VirtualBox-4.3

After installing VirtualBox, add the virtualbox user **sk_vuser** to the **vboxusers** group::

   $ usermod -G vboxusers sk_vuser

Now, run the following command to check if VirtualBox kernel modules are loaded or not::

   $ systemctl status vboxdrv   # For CentOS 7.x
   $ /etc/init.d/vboxdrv status # For Centos 6.x

If not loaded, run the following command to load them::

   $ /etc/init.d/vboxdrv setup


Installing VirtualBox Extension Pack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Starting with VirtualBox 4.0, we should install Extension pack that will help us to manage and connect our remote guest consoles via web interface. This Extension pack provides the following functionalities to the VirtualBox guests.

* The virtual USB 2.0 (EHCI) device
* VirtualBox Remote Desktop Protocol (VRDP) support
* Host webcam passthrough
* Intel PXE boot ROM
* Experimental support for PCI passthrough on Linux hosts

VirtualBox Extension Pack should be the same version as the base package. Download the extension pack from http://download.virtualbox.org/virtualbox/::

   $ wget http://download.virtualbox.org/virtualbox/4.3.28/Oracle_VM_VirtualBox_Extension_Pack-4.3.28-100309.vbox-extpack

Then install the Extension Pack as shown below::

   $ sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.3.28-100309.vbox-extpack


Installing VirtualBox Guest Additions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

VirtualBox Guest Additions should be the same version as the base package. Download the guest additions iso from http://download.virtualbox.org/virtualbox/::

   $ wget http://download.virtualbox.org/virtualbox/5.0.4/VBoxGuestAdditions_5.0.4.iso

Make sure pre-requisites are installed::

   $ yum update
   $ yum install gcc
   $ yum install kernel-devel
   $ yum install bzip2

Then mount the iso as shown below::

   $ su
   $ mount /dev/sr0 /media/
   $ sh /media/VBoxLinuxAdditions.run


Create and Manage VMs from Command Line
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, let's create a Ubuntu 14.04 server VM with 512MB RAM and 8GB virtual HDD. To do that, run::

   $ VBoxManage createvm --name "Ubuntu 14.04" --register

Next, assign the RAM size and network card mode (Bridge or NAT)::

   $ VBoxManage modifyvm "Ubuntu 14.04" --memory 512 --acpi on --boot1 dvd --nic1 bridged --bridgeadapter1 eth0

Assign virtual hard drive size::

   $ VBoxManage createhd --filename Ubuntu_14_04.vdi --size 8000

Add storage controller::

   $ VBoxManage storagectl "Ubuntu 14.04" --name "IDE Controller" --add ide

Attach the Virtual HDD to the storage controller using the command::

   $ VBoxManage storageattach "Ubuntu 14.04" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium /home/sk/Ubuntu_14_04.vdi

Now, assign the Ubuntu ISO media using the command::

   $ VBoxManage storageattach "Ubuntu 14.04" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium /home/sk/ubuntu-14.04-server-i386.iso

Cheatsheet for managing VM states::

   $ VBoxManage list vms                                            # List VMs installed
   $ VBoxManage list runningvms                                     # List running VMs
   $ VBoxManage startvm --type headless "centos" &                  # Start VM in headless mode
   $ VBoxManage controlvm "ubuntu" poweroff                         # Power off a VM
   $ VBoxManage controlvm "ubuntu" pause                            # Pause a VM
   $ VBoxManage controlvm "ubuntu" reset                            # Restart a VM
   $ VBoxManage unregistervm "CentOS 7" --delete                    # Remove a VM and delete the files
   $ VBoxManage clonevm "centos" --name "centos backup" --mode all  # Clone a VM


Cheatsheet for Full VM Modification
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use one of the OS Types from the list in this output ``VBoxManage list ostypes | less``

.. code-block:: shell

   $ VBoxManage modifyvm "ubuntu"  \
   $ --ostype Ubuntu_64 \
   $ --cpus 1 \
   $ --cpuhotplug off \
   $ --hwvirtex on \
   $ --nestedpaging on \
   $ --vtxvpid on \
   $ --vtxux on \
   $ --pae on \
   $ --longmode on \
   $ --largepages on \
   $ --memory 512 \
   $ --hpet off \
   $ --chipset piix3 \
   $ --paravirtprovider default \
   $ --boot1 dvd \
   $ --boot2 disk \
   $ --boot3 none \
   $ --boot4 none \
   $ --vram 12 \
   $ --accelerate3d off \
   $ --accelerate2dvideo off \
   $ --videocap off \
   $ --vrde on \
   $ --vrdeextpack default \
   $ --vrdeport default \
   $ --vrdeaddress "0.0.0.0" \
   $ --vrdeauthtype null \
   $ --acpi on \
   $ --ioapic on \
   $ --bioslogofadein on \
   $ --bioslogofadeout on \
   $ --bioslogodisplaytime 0 \
   $ --biosbootmenu messageandmenu \
   $ --biossystemtimeoffset 0 \
   $ --biospxedebug off \
   $ --usb on \
   $ --nic1 nat \
   $ --nictype1 82540EM \
   $ --cableconnected1 on \
   $ --macaddress1 auto \
   $ --natpf1 ssh,tcp,,2222,,22 \
   $ --natdnspassdomain1 on \
   $ --natdnsproxy1 off \
   $ --natdnshostresolver1 off \
   $ --nataliasmode1 default \
   $ --nic2 none \
   $ --nic3 none \
   $ --nic4 none \
   $ --nic5 none \
   $ --nic6 none \
   $ --nic7 none \
   $ --nic8 none \
   $ --uart1 off \
   $ --uart2 off \
   $ --audio none \
   $ --clipboard disabled \
   $ --draganddrop disabled


Use Share Folder for VirtualBox
-------------------------------

Install Guest Additions, open the VM settings and go to the Shared Folders to define the folders. Then use the following command to mount the shared folder::

   $ sudo mount -t vboxsf -o rw,uid=1000,gid=1000 [name from VBox] [destination]
