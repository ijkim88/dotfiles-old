Vim
===

Open all files in a directory
-----------------------------

Open all files in a directory using::

   :args [path]/*


Open all files in a directory (recursively)
-------------------------------------------

The extension ``**`` makes it recursive::

   :args [path]/**/*.[extension]


Create a new buffer
-------------------

Create a new buffer using::

   :enew


Ack Shortcuts
-------------

Enter Ack with ``<leader>a`` or ``<leader>A``::

   o    to open (same as enter)
   O    to open and close quickfix window
   go   to preview file (open but maintain focus on ack.vim results)
   t    to open in new tab
   T    to open in new tab silently
   h    to open in horizontal split
   H    to open in horizontal split silently
   v    to open in vertical split
   gv   to open in vertical split silently
   q    to close the quickfix window


Get current filename
--------------------

Get current filename using::

   :echo @%
