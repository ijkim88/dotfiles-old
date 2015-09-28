Linux Tricks
============

Grep multiple words
-------------------

In this example, search warning, error, and critical words in a text log file called ``var/log/messages``, enter::

   $ grep 'warning\|error\|critical' /var/log/messages

To just match words add ``-w`` with::

   $ grep -w 'warning\|error\|critical' /var/log/messages

egrep command can skip the above syntax and use the following syntax::

   $ egrep -w 'warning|error|critical' /var/log/messages

I recommend that you pass the ``-i`` (ignore case) and ``--color`` options as follows::

   $ egrep -wi --color 'warning|error|critical' /var/log/messages
