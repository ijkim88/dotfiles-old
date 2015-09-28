SSH
===

Cheatsheet
----------

* ``~`` followed by ``.`` closes the SSH connection
* ``~`` followed by ``CTRL-Z`` suspends the SSH process
* ``~`` followed by ``~`` sends a literal ~


7 Default OpenSSH Security Options You Should Change
----------------------------------------------------

#. Disable Root Login (PermitRootLogin)::

    PermitRootLogin no

#. Allow Only Specific Users or Groups (AllowUsers AllowGroups)::

    AllowUsers ramesh john jason
    AllowGroups sysadmin dba

#. Deny Sepcific Users or Groups (DenyUsers DenyGroups)::

    DenyUsers cvs apache jane
    DenyGroups developers qa

.. note:: You can use a combination of all the Allow and Deny directives. It is processed in this order: DenyUsers, AllowUsers, DenyGroups, and AllowGroups.

#. Change SSHD Port Number (Port)::

    Port 222

#. Change Login Grace Time (LoginGraceTime)::

    LoginGraceTime 1m

#. Restrict the Interface (IP Address) to Login (ListenAddress)::

    ListenAddress 192.168.10.200     # Ex: This is eth0
    ListenAddress 192.168.10.202     # Ex: This is eth2

#. Disconnect SSH when no activity (ClientAliveInterval), the following timeout automatically after 10 minutes::

    ClientAliveInterval 600      # This indicates the timoue in seconds. After x number of seconds, ssh server will send a message to the client asking for response. Default is 0 (server will not send message to client to check).      
    ClientAliveCountMax 0        # This indicates the total number of checkalive messages sent by the server without getting any response from the ssh client. Default is 3.

